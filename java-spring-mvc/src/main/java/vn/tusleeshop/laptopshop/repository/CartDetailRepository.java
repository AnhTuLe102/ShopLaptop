package vn.tusleeshop.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.tusleeshop.laptopshop.domain.Cart;
import vn.tusleeshop.laptopshop.domain.CartDetail;
import vn.tusleeshop.laptopshop.domain.Product;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {

    boolean existsByProductAndCart(Cart cart, Product product);

    CartDetail findByCartAndProduct(Cart cart, Product product);

}
