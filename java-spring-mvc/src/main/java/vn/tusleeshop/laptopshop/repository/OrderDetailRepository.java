package vn.tusleeshop.laptopshop.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.tusleeshop.laptopshop.domain.OrderDetail;
import vn.tusleeshop.laptopshop.domain.User;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {

    Optional<OrderDetail> findById(long id);
}
