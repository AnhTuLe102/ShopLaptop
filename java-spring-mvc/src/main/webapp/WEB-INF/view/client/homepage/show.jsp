<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
          <meta charset="utf-8">
          <title>TL Gear - Shop Laptop và phụ kiện</title>
          <meta content="width=device-width, initial-scale=1.0" name="viewport">
          <meta content="" name="keywords">
          <meta content="" name="description">

          <!-- Google Web Fonts -->
          <link rel="preconnect" href="https://fonts.googleapis.com">
          <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
          <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
            rel="stylesheet">

          <!-- Icon Font Stylesheet -->
          <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
          <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
          <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&display=swap" rel="stylesheet">
          <style>
            .shop-title {
              font-family: 'Montserrat', sans-serif;
              font-weight: 800;
              /* Dày hơn */
              letter-spacing: 1px;
              /* Giãn chữ một chút */
            }
          </style>

          <!-- Libraries Stylesheet -->
          <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
          <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


          <!-- Customized Bootstrap Stylesheet -->
          <link href="/client/css/bootstrap.min.css" rel="stylesheet">

          <!-- Template Stylesheet -->
          <link href="/client/css/style.css" rel="stylesheet">
          <link rel="stylesheet" href="/client/css/custom.css">
          <link rel="stylesheet" href="/client/css/customshopname.css">
          <link rel="stylesheet" href="/client/css/customproductcard.css">
        </head>

        <body>

          <!-- Spinner Start -->
          <div id="spinner"
            class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
          </div>
          <!-- Spinner End -->


          <!-- Navbar start -->
          <jsp:include page="../layout/header.jsp" />
          <!-- Navbar End -->


          <!-- Modal Search Start -->
          <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
              <div class="modal-content rounded-0">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex align-items-center">
                  <div class="input-group w-75 mx-auto d-flex">
                    <input type="search" class="form-control p-3" placeholder="keywords"
                      aria-describedby="search-icon-1">
                    <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- Modal Search End -->

          <jsp:include page="../layout/banner.jsp" />






          <!-- Fruits Shop Start-->
          <div class="container-fluid fruite py-5">
            <div class="container py-5">
              <div class="tab-class text-center">
                <div class="row g-4">
                  <div class="col-lg-4 text-start">
                    <h1>Sản Phẩm Nổi Bật</h1>
                  </div>
                  <div class="col-lg-8 text-end">
                    <ul class="nav nav-pills d-inline-flex text-center mb-5">
                      <li class="nav-item">
                        <a class="d-flex m-2 py-2 bg-light rounded-pill active" href="/products">
                          <span class="text-dark" style="width: 130px;">Tất cả sản phẩm</span>
                        </a>
                      </li>
                      <!-- <li class="nav-item">
                        <a class="d-flex py-2 m-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-2">
                          <span class="text-dark" style="width: 130px;">Vegetables</span>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-3">
                          <span class="text-dark" style="width: 130px;">Fruits</span>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-4">
                          <span class="text-dark" style="width: 130px;">Bread</span>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-5">
                          <span class="text-dark" style="width: 130px;">Meat</span>
                        </a>
                      </li> -->
                    </ul>
                  </div>
                </div>
                <div class="tab-content">
                  <div id="tab-1" class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                      <div class="col-lg-12">
                        <div class="row g-4">
                          <c:forEach var="product" items="${products}">
                            <div class="col-md-6 col-lg-4 col-xl-3">
                              <div class="rounded position-relative fruite-item">
                                <div class="fruite-img p-4">
                                  <img src="/images/product/${product.image}" class="img-fluid w-100 rounded-top"
                                    alt="">
                                </div>
                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                  style="top: 10px; left: 10px;">Laptop</div>
                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                  <h4 style="font-size: 15px;"><a href="/product/${product.id}">${product.name}</a>
                                  </h4>
                                  <p style="font-size: 13px;">${product.shortDesc}
                                  </p>
                                  <div class="d-flex flex-lg-wrap justify-content-center flex-column">
                                    <p style="font-size: 15px; text-align: center; width: 100%;"
                                      class="text-dark fw-bold mb-3">
                                      <fmt:formatNumber type="number" value="${product.price}" />đ
                                    </p>
                                    <form action="/add-product-to-cart/${product.id}" method="post">
                                      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                      <button class="btn border border-secondary rounded-pill px-3 text-primary">
                                        <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                      </button>
                                    </form>
                                  </div>

                                </div>
                              </div>
                            </div>
                          </c:forEach>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div id="tab-2" class="tab-pane fade show p-0">
                    <div class="row g-4">
                      <div class="col-lg-12">
                        <div class="row g-4">
                          <div class="col-md-6 col-lg-4 col-xl-3">
                            <div class="rounded position-relative fruite-item">
                              <div class="fruite-img">
                                <img src="client/img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                              </div>
                              <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                style="top: 10px; left: 10px;">Fruits</div>
                              <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                <h4>Grapes</h4>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt
                                </p>
                                <div class="d-flex justify-content-between flex-lg-wrap">
                                  <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                  <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                      class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="col-md-6 col-lg-4 col-xl-3">
                            <div class="rounded position-relative fruite-item">
                              <div class="fruite-img">
                                <img src="client/img/fruite-item-2.jpg" class="img-fluid w-100 rounded-top" alt="">
                              </div>
                              <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                style="top: 10px; left: 10px;">Fruits</div>
                              <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                <h4>Raspberries</h4>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt
                                </p>
                                <div class="d-flex justify-content-between flex-lg-wrap">
                                  <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                  <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                      class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
          <!-- Fruits Shop End-->


          <!-- Feature2 with 3 unique product -->
          <jsp:include page="../layout/feature2.jsp" />
          <!-- Featurs End -->




          <!-- Banner Section Start-->
          <div class="container-fluid banner bg-secondary my-5">
            <div class="container py-5">
              <div class="row g-4 align-items-center">
                <div class="col-lg-6">
                  <div class="py-4">
                    <h1 class="display-3 text-white">Fresh Exotic Fruits</h1>
                    <p class="fw-normal display-3 text-dark mb-4">in Our Store</p>
                    <p class="mb-4 text-dark">The generated Lorem Ipsum is therefore always free from repetition
                      injected humour, or non-characteristic words etc.</p>
                    <a href="#" class="banner-btn btn border-2 border-white rounded-pill text-dark py-3 px-5">BUY</a>
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="position-relative">
                    <img src="client/img/baner-1.png" class="img-fluid w-100 rounded" alt="">
                    <div
                      class="d-flex align-items-center justify-content-center bg-white rounded-circle position-absolute"
                      style="width: 140px; height: 140px; top: 0; left: 0;">
                      <h1 style="font-size: 100px;">1</h1>
                      <div class="d-flex flex-column">
                        <span class="h2 mb-0">50$</span>
                        <span class="h4 text-muted mb-0">kg</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- Banner Section End -->
          <!-- feature 1( assurance) -->
          <jsp:include page="../layout/feature.jsp" />

          <!-- Footer Start -->
          <jsp:include page="../layout/footer.jsp" />
          <!-- Footer End -->




          <!-- Back to Top -->
          <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
              class="fa fa-arrow-up"></i></a>


          <!-- JavaScript Libraries -->
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
          <script src="/client/lib/easing/easing.min.js"></script>
          <script src="/client/lib/waypoints/waypoints.min.js"></script>
          <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
          <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

          <!-- Template Javascript -->
          <script src="/client/js/main.js"></script>
        </body>


        </html>