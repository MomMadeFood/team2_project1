<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container-fluid">
      <div class="row" style="height: 408px">
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
          <div class="row">
            <div class="col-2">
              <div
                class="nav flex-column nav-pills"
                id="v-pills-tab"
                role="tablist"
                aria-orientation="vertical"
              >
                <h4 class="title">신상품</h4>
                <a
                  class="nav-link active"
                  id="v-pills-new-woman-tab"
                  data-toggle="pill"
                  href="#v-pills-new-woman"
                  role="tab"
                  aria-controls="v-pills-new-woman"
                  aria-selected="true"
                  >여성</a
                >
                <a
                  class="nav-link"
                  id="v-pills-new-man-tab"
                  data-toggle="pill"
                  href="#v-pills-new-man"
                  role="tab"
                  aria-controls="v-pills-new-man"
                  aria-selected="false"
                  >남성</a
                >
                <a
                  class="nav-link"
                  id="v-pills-new-selected-tab"
                  data-toggle="pill"
                  href="#v-pills-new-selected"
                  role="tab"
                  aria-controls="v-pills-new-selected"
                  aria-selected="false"
                  >셀렉티드</a
                >
              </div>
            </div>
            <div class="col-10">
              <div class="tab-content" id="v-pills-tabContent">
                <div
                  class="tab-pane fade show active"
                  id="v-pills-new-woman"
                  role="tabpanel"
                  aria-labelledby="v-pills-new-woman-tab"
                >
                  <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                      <div class="swiper-slide">
                        <div class="item_box">
                          <a href="#">
                            <img src="${pageContext.request.contextPath}/resources/images/iu.jpg" />
                          </a>
                          <a href="#">
                            <span class="brand">가나다라</span>
                            <span class="price">100000</span>
                          </a>
                        </div>
                      </div>
                      <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/resources/images/iu2.jpg" />
                      </div>
                      <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/resources/images/iu3.jpg" />
                      </div>
                      <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/resources/images/iu4.jpg" />
                      </div>
                      <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/resources/images/iu5.jpg" />
                      </div>
                      <div class="swiper-slide">
                        <div class="item_box">
                          <a href="#">
                            <img src="${pageContext.request.contextPath}/resources/images/iu6.jpg" />
                          </a>
                          <a href="#">
                            <span class="brand">여섯번째</span>
                            <span class="price">1400000</span>
                          </a>
                        </div>
                      </div>
                      <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/resources/images/iu.jpg" />
                      </div>
                      <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/resources/images/iu2.jpg" />
                      </div>
                      <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/resources/images/iu3.jpg" />
                      </div>
                      <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/resources/images/iu4.jpg" />
                      </div>
                      <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/resources/images/iu5.jpg" />
                      </div>
                      <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/resources/images/iu6.jpg" />
                      </div>
                    </div>
                    <div class="swiper-button-next disableButton" style="color:#8f8f8f;"></div>
                    <div class="swiper-button-prev disableButton" style="color:#8f8f8f;"></div>
                    <div class="swiper-pagination"></div>
                  </div>
                </div>
                <div
                  class="tab-pane fade"
                  id="v-pills-new-man"
                  role="tabpanel"
                  aria-labelledby="v-pills-new-man-tab"
                >
                  2
                </div>
                <div
                  class="tab-pane fade"
                  id="v-pills-new-selected"
                  role="tabpanel"
                  aria-labelledby="v-pills-new-selected-tab"
                >
                  3
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-2"></div>
      </div>
    </div>
    <div class="container-fluid"">
      <div class="row" style="height: 408px">
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
          <div class="row">
            <div class="col-2">
              <div
                class="nav flex-column nav-pills"
                id="v-pills-tab2"
                role="tablist"
                aria-orientation="vertical"
              >
                <h4 class="title">베스트</h4>
                <a
                  class="nav-link active"
                  id="v-pills-best-woman-tab"
                  data-toggle="pill"
                  href="#v-pills-best-woman"
                  role="tab"
                  aria-controls="v-pills-best-woman"
                  aria-selected="true"
                  >여성</a
                >
                <a
                  class="nav-link"
                  id="v-pills-best-man-tab"
                  data-toggle="pill"
                  href="#v-pills-best-man"
                  role="tab"
                  aria-controls="v-pills-best-man"
                  aria-selected="false"
                  >남성</a
                >
              </div>
            </div>
            <div class="col-10">
              <div class="tab-content" id="v-pills-tabContent">
                <div
                  class="tab-pane fade show active"
                  id="v-pills-best-woman"
                  role="tabpanel"
                  aria-labelledby="v-pills-best-woman-tab"
                >
                  11
                </div>
                <div
                  class="tab-pane fade"
                  id="v-pills-best-man"
                  role="tabpanel"
                  aria-labelledby="v-pills-best-man-tab"
                >
                  22
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-2"></div>
      </div>
      <script>
        var swiper = new Swiper(".mySwiper", {
          slidesPerView: 4,
          spaceBetween: 15,
          slidesPerGroup: 1,
          loopFillGroupWithBlank: false,
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
          allowTouchMove: false,
        });
      </script>

      <script>
        $(document).ready(function () {
          if (swiper.isBeginning) {
            $(".swiper-button-prev").hide();
          }
          $(".disableButton").on("click", function () {
            if (swiper.isBeginning) {
              $(".swiper-button-prev").hide();
            } else if (swiper.isEnd) {
              $(".swiper-button-next").hide();
            } else {
              $(".swiper-button-prev").show();
              $(".swiper-button-next").show();
            }
          });
        });
      </script>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
