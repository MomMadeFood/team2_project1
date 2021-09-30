<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css" />

<div class="container-fluid mt-5">
  <div class="row" style="height: 408px">
    <div class="col-sm-2"></div>
    <div class="col-sm-8">
      <div class="row">
        <div class="col-2">
          <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <h4 class="title">신상품</h4>
            <a class="home-content-txt" id="v-pills-new-woman-tab" data-toggle="pill" href="#v-pills-new-woman" role="tab" aria-controls="v-pills-new-woman" aria-selected="true">여성</a>
            <a class="home-content-txt" id="v-pills-new-man-tab" data-toggle="pill" href="#v-pills-new-man" role="tab" aria-controls="v-pills-new-man" aria-selected="false">남성</a>
          </div>
        </div>
        <div class="col-10">
          <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade show active" id="v-pills-new-woman" role="tabpanel" aria-labelledby="v-pills-new-woman-tab">
              <div class="swiper new_women_swiper">
                <div class="swiper-wrapper">
                  <div class="swiper-slide">
                    <div class="item_box">
                      <a href="${pageContext.request.contextPath}/product/productDetail">
                        <img src="http://newmedia.thehandsome.com/CM/2B/SS/CM2B0KCD230W_PK_W01.jpg/dims/resize/234x353" />
                      </a>
                      <a href="${pageContext.request.contextPath}/product/productDetail">
                        <span class="brand">the CASHMERE</span>
                        <span class="price">₩495,000</span>
                      </a>
                    </div>
                  </div>
                  <div class="swiper-slide">
                   <div class="item_box">
                      <a href="${pageContext.request.contextPath}/product/productDetail">
                        <img src="http://newmedia.thehandsome.com/CN/2B/SS/CN2B0FOT300W_BK_W01.jpg/dims/resize/234x353" />
                      </a>
                      <a href="${pageContext.request.contextPath}/product/productDetail">
                        <span class="brand">FOURM STUDIO</span>
                        <span class="price">₩1,365,000</span>
                      </a>
                    </div>
                  </div>
                  <div class="swiper-slide">
                    <div class="item_box">
                      <a href="${pageContext.request.contextPath}/product/productDetail">
                        <img src="http://newmedia.thehandsome.com/IL/2B/SS/IL2B0KCD921W_LV_W01.jpg/dims/resize/234x353" />
                      </a>
                      <a href="${pageContext.request.contextPath}/product/productDetail">
                        <span class="brand">LÄTT</span>
                        <span class="price">₩895,000</span>
                      </a>
                    </div>
                  </div>
                  <div class="swiper-slide">
                    <div class="item_box">
                      <a href="${pageContext.request.contextPath}/product/productDetail">
                        <img src="http://newmedia.thehandsome.com/LC/2B/SS/LC2B0KCD903W_CM_W01.jpg/dims/resize/234x353" />
                      </a>
                      <a href="${pageContext.request.contextPath}/product/productDetail">
                        <span class="brand">LANVIN COLLECTION</span>
                        <span class="price">₩615,000</span>
                      </a>
                    </div>
                  </div>
                  <div class="swiper-slide">
                    <div class="item_box">
                      <a href="${pageContext.request.contextPath}/product/productDetail">
                        <img src="http://newmedia.thehandsome.com/LV/2B/SS/LV2B1KTO003W_RD_W01.jpg/dims/resize/234x353" />
                      </a>
                      <a href="{pageContext.request.contextPath}/product/productDetail">
                        <span class="brand">LANVIN PARIS</span>
                        <span class="price">₩763,000</span>
                      </a>
                    </div>
                  </div>
                  <div class="swiper-slide">
                    <div class="item_box">
                      <a href="${pageContext.request.contextPath}/product/productDetail">
                        <img src="http://newmedia.thehandsome.com/PL/2B/FW/PL2B7WJC001W_YL_W01.jpg/dims/resize/684x1032/" />
                      </a>
                      <a href="${pageContext.request.contextPath}/product/productDetail">
                        <span class="brand">3.1 Phillip Lim</span>
                        <span class="price">₩1,250,000</span>
                      </a>
                    </div>
                  </div>
                  <div class="swiper-slide">
                    <div class="item_box">
                      <a href="${pageContext.request.contextPath}/product/productDetail">
                        <img src="http://newmedia.thehandsome.com/MN/2B/SS/MN2B0KCD701W_IV_W01.jpg/dims/resize/684x1032/" />
                      </a>
                      <a href="${pageContext.request.contextPath}/product/productDetail">
                        <span class="brand">MINE</span>
                        <span class="price">₩545,000</span>
                      </a>
                    </div>
                  </div>
                  <div class="swiper-slide">
                    <div class="item_box">
                      <a href="${pageContext.request.contextPath}/product/productDetail">
                        <img src="http://newmedia.thehandsome.com/MU/2B/SS/MU2B1KCD001W4C_IV_W01.jpg/dims/resize/684x1032/" />
                      </a>
                      <a href="${pageContext.request.contextPath}/product/productDetail">
                        <span class="brand">MUE</span>
                        <span class="price">₩1,338,000</span>
                      </a>
                    </div>
                  </div>
                  <div class="swiper-slide">
                    <div class="item_box">
                      <a href="${pageContext.request.contextPath}/product/productDetail">
                        <img src="http://newmedia.thehandsome.com/O2/2B/SS/O22B1KTO120W_CR_W01.jpg/dims/resize/684x1032/" />
                      </a>
                      <a href="${pageContext.request.contextPath}/product/productDetail">
                        <span class="brand">O'2nd</span>
                        <span class="price">₩250,600</span>
                      </a>
                    </div>
                  </div>
                  <div class="swiper-slide">
                    <div class="item_box">
                      <a href="${pageContext.request.contextPath}/product/productDetail">
                        <img src="http://newmedia.thehandsome.com/OB/2B/SS/OB2B1KTO717WM1_LG_W01.jpg/dims/resize/684x1032/" />
                      </a>
                      <a href="${pageContext.request.contextPath}/product/productDetail">
                        <span class="brand">OBZEE</span>
                        <span class="price">₩395,000</span>
                      </a>
                    </div>
                  </div>
                </div>
                <div class="swiper-button-next disableButton" style="color:#8f8f8f;" id="new-women-swiper-button-next"></div>
                <div class="swiper-button-prev disableButton" style="color:#8f8f8f;" id="new-women-swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
              </div>
            </div>
            <div class="tab-pane fade" id="v-pills-new-man" role="tabpanel" aria-labelledby="v-pills-new-man-tab">
            	2
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-sm-2"></div>
  </div>
</div>
<div class="container-fluid">
  <div class="row" style="height: 408px">
  <div class="col-sm-2"></div>
  <div class="col-sm-8">
    <div class="row">
      <div class="col-2">
        <div class="nav flex-column nav-pills" id="v-pills-tab2" role="tablist" aria-orientation="vertical">
          <h4 class="title">베스트</h4>
          <a class="home-content-txt" id="v-pills-best-man-tab" data-toggle="pill" href="#v-pills-best-man" role="tab" aria-controls="v-pills-best-man"aria-selected="false" >남성</a>
          <a class="home-content-txt" id="v-pills-best-woman-tab" data-toggle="pill" href="#v-pills-best-woman" role="tab" aria-controls="v-pills-best-woman" aria-selected="true">여성</a>
        </div>
      </div>
      <div class="col-10">
        <div class="tab-content" id="v-pills-tabContent">
          <div class="tab-pane fade" id="v-pills-best-woman" role="tabpanel" aria-labelledby="v-pills-best-woman-tab">
            22
          </div>
          <div class="tab-pane fade show active" id="v-pills-best-man" role="tabpanel" aria-labelledby="v-pills-best-man-tab">
            <div class="swiper best_men_swiper">
              <div class="swiper-wrapper">
                <div class="swiper-slide">
                 <div class="item_box">
                    <a href="${pageContext.request.contextPath}/product/productDetail">
                      <img src="http://newmedia.thehandsome.com/MM/2A/FW/MM2A9NPC021HNA_IN_W01.jpg/dims/resize/234x353" />
                    </a>
                    <a href="${pageContext.request.contextPath}/product/productDetail">
                      <span class="brand">CLUB MONACO</span>
                      <span class="price">₩218,000</span>
                    </a>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="item_box">
                    <a href="${pageContext.request.contextPath}/product/productDetail">
                      <img src="http://newmedia.thehandsome.com/TH/2A/FW/TH2ABKRN033N_GY_W01.jpg/dims/resize/234x353" />
                    </a>
                    <a href="${pageContext.request.contextPath}/product/productDetail">
                      <span class="brand">TIME HOMME</span>
                      <span class="price">₩295,000</span>
                    </a>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="item_box">
                    <a href="${pageContext.request.contextPath}/product/productDetail">
                      <img src="http://newmedia.thehandsome.com/MU/2B/SS/MU2B1KTO092MMY_BK_W01.jpg/dims/resize/234x353" />
                    </a>
                    <a href="${pageContext.request.contextPath}/product/productDetail">
                      <span class="brand">MUE</span>
                      <span class="price">₩668,500</span>
                    </a>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="item_box">
                    <a href="${pageContext.request.contextPath}/product/productDetail">
                      <img src="http://newmedia.thehandsome.com/SH/2B/SS/SH2B0KRN005M_BK_W01.jpg/dims/resize/234x353/" />
                    </a>
                    <a href="${pageContext.request.contextPath}/product/productDetail">
                      <span class="brand">SYSTEM HOMME</span>
                      <span class="price">₩206,500</span>
                    </a>
                  </div>
                </div>
                <div class="swiper-slide">
                 <div class="item_box">
                    <a href="${pageContext.request.contextPath}/product/productDetail">
                      <img src="http://newmedia.thehandsome.com/CM/2B/SS/CM2B1KTO052M_NL_W01.jpg/dims/resize/234x353" />
                    </a>
                    <a href="${pageContext.request.contextPath}/product/productDetail">
                      <span class="brand">the CASHMERE</span>
                      <span class="price">₩375,000</span>
                    </a>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="item_box">
                    <a href="${pageContext.request.contextPath}/product/productDetail">
                      <img src="http://newmedia.thehandsome.com/CM/2B/SS/CM2B1KOT032M_OW_W01.jpg/dims/resize/684x1032/" />
                    </a>
                    <a href="${pageContext.request.contextPath}/product/productDetail">
                      <span class="brand">the CASHMERE</span>
                      <span class="price">₩525,000</span>
                    </a>
                  </div>
                </div>
                <div class="swiper-slide">
                	<div class="item_box">
                    <a href="${pageContext.request.contextPath}/product/productDetail">
                      <img src="http://newmedia.thehandsome.com/TG/2B/SS/TG2B1TPC025M29_WN_W01.jpg/dims/resize/684x1032/" />
                    </a>
                    <a href="${pageContext.request.contextPath}/product/productDetail">
                      <span class="brand">TOM GREYHOUND</span>
                      <span class="price">₩132,300</span>
                    </a>
                  </div>
                </div>
                 <div class="swiper-slide">
                  <div class="item_box">
                    <a href="${pageContext.request.contextPath}/product/productDetail">
                      <img src="http://newmedia.thehandsome.com/HS/2B/SS/HS2B3NPC006MTP_BK_W01.jpg/dims/resize/684x1032/" />
                    </a>
                    <a href="${pageContext.request.contextPath}/product/productDetail">
                      <span class="brand">FOURM MEN'S LOUNGE</span>
                      <span class="price">₩222,500</span>
                    </a>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="item_box">
                    <a href="${pageContext.request.contextPath}/product/productDetail">
                      <img src="http://newmedia.thehandsome.com/LV/2B/SS/LV2B3WPC001M_NY_W01.jpg/dims/resize/684x1032/" />
                    </a>
                    <a href="${pageContext.request.contextPath}/product/productDetail">
                      <span class="brand">LANVIN PARIS</span>
                      <span class="price">₩582,000</span>
                    </a>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="item_box">
                    <a href="${pageContext.request.contextPath}/product/productDetail">
                      <img src="http://newmedia.thehandsome.com/TH/2B/SS/TH2B0WCT405M_GN_W01.jpg/dims/resize/684x1032/" />
                    </a>
                    <a href="${pageContext.request.contextPath}/product/productDetail">
                      <span class="brand">TIME HOMME</span>
                      <span class="price">₩890,000</span>
                    </a>
                  </div>
                </div>
              </div>
              <div class="swiper-button-next disableButton2" style="color:#8f8f8f;" id="best-men-swiper-button-next"></div>
              <div class="swiper-button-prev disableButton2" style="color:#8f8f8f;" id="best-men-swiper-button-prev"></div>
              <div class="swiper-pagination"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="col-sm-2"></div>
</div>
      <script>
        var newWomenSwiper = new Swiper(".new_women_swiper", {
          slidesPerView: 4,
          slidesPerGroup: 1,
          loopFillGroupWithBlank: false,
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
          allowTouchMove: false,
        });
        
        var bestMenSwiper= new Swiper(".best_men_swiper", {
          slidesPerView: 4,
          slidesPerGroup: 1,
          loopFillGroupWithBlank: false,
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
          allowTouchMove: false,
        });
        
        $(document).ready(function () {
          if (newWomenSwiper.isBeginning) {
            $("#new-women-swiper-button-prev").hide();
          }
          $(".disableButton").on("click", function () {
            if (newWomenSwiper.isBeginning) {
              $("#new-women-swiper-button-prev").hide();
            } else if (newWomenSwiper.isEnd) {
              $("#new-women-swiper-button-next").hide();
            } else {
              $("#new-women-swiper-button-prev").show();
              $("#new-women-swiper-button-next").show();
            }
          });
          
          if (bestMenSwiper.isBeginning) {
          	$("#best-men-swiper-button-prev").hide();
          }
          $(".disableButton2").on("click", function () {
            if (bestMenSwiper.isBeginning) {
              $("#best-men-swiper-button-prev").hide();
            } else if (bestMenSwiper.isEnd) {
              $("#best-men-swiper-button-next").hide();
            } else {
              $("#best-men-swiper-button-prev").show();
              $("#best-men-swiper-button-next").show();
            }
          });
        });
        
      </script>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
