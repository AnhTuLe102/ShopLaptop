package vn.tusleeshop.laptopshop.config;

import com.google.common.util.concurrent.RateLimiter;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Component
@Order(1)
public class RateLimitFilter implements Filter {

    private final RateLimiter rateLimiter = RateLimiter.create(20.0); // 7 req/s
    private static final Logger logger = LoggerFactory.getLogger(RateLimitFilter.class);

    // Lưu IP bị chặn và thời điểm hết hạn
    private final Map<String, Long> blockedIps = new ConcurrentHashMap<>();
    private static final long BLOCK_DURATION_MS = 10 * 1000; // 10 giây

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String ip = req.getRemoteAddr();
        long now = System.currentTimeMillis();

        // Kiểm tra IP đang bị chặn
        if (blockedIps.containsKey(ip)) {
            long expireTime = blockedIps.get(ip);
            if (now < expireTime) {
                logger.warn("🚫 [BLOCKED] {} - IP {} đang bị chặn đến {}", LocalDateTime.now(), ip, expireTime);
                res.setStatus(429);
                res.getWriter().write("IP temporarily blocked. Please try again later.");
                return;
            } else {
                blockedIps.remove(ip); // Hết hạn, bỏ chặn
            }
        }

        // Kiểm tra rate limit
        if (rateLimiter.tryAcquire()) {
            chain.doFilter(request, response);
        } else {
            logger.warn("⚠️ [RATE LIMIT] {} - Too many requests from IP: {}", LocalDateTime.now(), ip);

            // Chặn IP trong 60 giây
            blockedIps.put(ip, now + BLOCK_DURATION_MS);

            res.setStatus(429);
            res.getWriter().write("Too many requests. IP temporarily blocked for 10 seconds.");
        }
    }
}
