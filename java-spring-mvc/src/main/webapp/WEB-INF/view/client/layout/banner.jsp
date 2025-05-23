<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!-- Hero Start -->
    <div class="container-fluid py-5 mb-5 hero-header" style="background: linear-gradient(rgba(248, 223, 173, 0.1), rgba(248, 223, 173, 0.1)), url(../client/img/hero-img.png);
    background-position: center center;
    background-repeat: no-repeat;
    background-size: cover;">
      <div class="container py-5">
        <div class="row g-5 align-items-center">
          <div class="col-md-12 col-lg-7">
            <h4 class="mb-3 text-secondary">Cam kết sản phẩm chính hãng giá rẻ nhất</h4>
            <h1 class="mb-5 display-3 text-primary"
              style="font-weight: 700; font-family: Verdana, Geneva, Tahoma, sans-serif">
              Hàng hiệu xịn<br>Giá cực mịn</h1>
          </div>
          <div class="col-md-12 col-lg-5">
            <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
              <div class="carousel-inner" role="listbox">
                <div class="carousel-item active rounded">
                  <img src="client/img/gaminglaptop.jpg" class="img-fluid w-100 h-100 bg-secondary rounded"
                    alt="First slide">
                  <a href="#" class="btn px-4 py-2 text-white rounded">Laptop Gaming</a>
                </div>
                <div class="carousel-item rounded">
                  <img src="client/img/macbookpro.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                  <a href="#" class="btn px-4 py-2 text-white rounded">Macbook</a>
                </div>
                <div class="carousel-item rounded">
                  <img src="client/img/laptop_van_phong.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                  <a href="#" class="btn px-4 py-2 text-white rounded">Laptop Văn Phòng</a>
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Hero End -->