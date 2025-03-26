package vn.tusleeshop.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.tusleeshop.laptopshop.domain.Order;
import vn.tusleeshop.laptopshop.domain.OrderDetail;
import vn.tusleeshop.laptopshop.domain.User;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUser(User user);
}
