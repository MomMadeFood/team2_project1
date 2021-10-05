<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/coupon.css" />

<body>
    <div>
      <div style="border-bottom: 1px solid #E5E5E5; height:100px; vertical-align:center;margin-bottom:40px;">
        <div style="margin:auto; padding-top:30px; width:300px; text-align:center; vertical-align:middle;">
          <p style="font-size: 28px;">쿠폰 이벤트</p>
        </div>
        
      </div>
      <div class="container-fluid" style="margin:0px auto; width:990px;">
      	<div>
  		  <ul class="nav nav-tabs coupon-tab" id="myTab" role="tablist" >
		    <li class="nav-item coupon-tab-item" role="presentation">
		      <a class="nav-link active" id="brand-tab" data-toggle="tab" href="#brand" role="tab" aria-controls="home" aria-selected="true"><span>브랜드 쿠폰</span></a>
		    </li>
		    <li class="nav-item coupon-tab-item" role="presentation">
		      <a class="nav-link" id="welcome-tab" data-toggle="tab" href="#welcome" role="tab" aria-controls="profile" aria-selected="false"><span>웰컴 쿠폰</span></a>
		    </li>
		    <li class="nav-item coupon-tab-item" role="presentation">
		      <a class="nav-link" id="event-tab" data-toggle="tab" href="#event" role="tab" aria-controls="event" aria-selected="false"><span>선착순 쿠폰</span></a>
		    </li>
		  </ul>
		  <div class="tab-content mt-5 d-flex" id="myTabContent">
		      <div class="tab-pane fade show active" id="brand" role="tabpanel" aria-labelledby="brand-coupon-tab" style="width:100%">
		     	<div class="card ml-2 mr-2 coupon-item">
			  	  <img height="142px" src="http://www.thehandsome.com/medias/systemhomme.jpg?context=bWFzdGVyfGltYWdlc3wxNjkzNjR8aW1hZ2UvanBlZ3xpbWFnZXMvaDgwL2gwNi84OTcwMDY3NDQzNzQyLmpwZ3wzNGIzMDI2YjNlNDc5MTk4OGJhYzMxYzZkMTJiYjhmOTQ1ZDQyM2ZlNmY4ODcxZmRiYTc0M2VmMmM0ZThkNTE5" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h5 class="card-title">SYSTEM HOMME</h5>
				    <p class="card-text">
				    	<b>15% 할인 쿠폰</b> <br/>
				    	30만원 제품 이상
				    </p>
				    <a href="#" class="btn btn-dark" style="color:white;">다운받기 <i class="fas fa-download" style="color:white;"></i></a>
				  </div>
				</div>
				<div class="card mr-2 coupon-item">
				  <img src="http://www.thehandsome.com/medias/1111111111pc-TOP-fourm-the-store0915.jpg?context=bWFzdGVyfGltYWdlc3wxNTgzNzV8aW1hZ2UvanBlZ3xpbWFnZXMvaGUwL2hmZS85MjM3MDI1NTg3MjMwLmpwZ3xkN2U1YWJlN2JhOTQ0YjFiMjFiYmFjM2NkYmFiMmQ4NzFiOGU5MjFiM2UyYzg5ZDdkZThjYjM0MmE0NTZmYzhm" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h5 class="card-title">FOURM STUDIO</h5>
					 <p class="card-text">
				    	<b>3만원 할인 쿠폰</b><br/>
				    	40만원 제품 이상
				    </p>				    
				    <a href="#" class="btn btn-dark" style="color:white;">다운받기 <i class="fas fa-download" style="color:white;"></i></a>
				  </div>
				</div>
				<div class="card coupon-item">
				  <img src="http://www.thehandsome.com/medias/-.jpg?context=bWFzdGVyfGltYWdlc3w0ODQwMjh8aW1hZ2UvanBlZ3xpbWFnZXMvaDllL2gzYy85MjM5Nzg3MjQxNTAyLmpwZ3xmMmEzZWFiYzcwMzNhODdhNzA0ZDYwODkxN2I4ZTE0NDc4ZDFhMzYwYjllMmJlZWNiMGFmNTIzMzJiNjc0Njc5" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h5 class="card-title">the CASHMERE</h5>
				    <p>
				      <b>10% 할인 쿠폰</b><br/>
				      20만원 제품 이상
			   		 </p>
				    <a href="#" class="btn btn-dark" style="color:white;">다운받기 <i class="fas fa-download" style="color:white;"></i></a>
				  </div>
				</div>
			  </div>
		      <div class="tab-pane fade" id="welcome" role="tabpanel" aria-labelledby="welcome-coupon-tab">
			  </div>
		      <div class="tab-pane fade" id="event" role="tabpanel" aria-labelledby="event-coupon-tab">
				<div class="d-flex" style="margin:0px auto; width:990px;">
		       	  <div style="width:33%;">
		            <div id="c1" class="coupon">
		       		  <div style="margin: 0px auto;">
	       			    <p style="font-size: 30px;">15:30 OPEN</p>
	       		      </div>
	       		    </div>
		       	    <div style="margin-top: 20px;">
		       	      <div style="margin: 0px auto; width:100px">
	       		        <button type="button" class="btn btn-secondary" disabled>준비중</button>
	       		      </div>
	       		    </div>
	       		  </div>
		          <div style="width:33%;">
		            <div id="c2" class="coupon">
		        	  <div style="margin: 0px auto;">	
		        		<span id="my-time1" style=" color:blue;font-size: 30px; font-weight: bold;"></span> 
		        		<span  id ="my-time3" style="color:blue; font-size: 30px;">:</span> 
		        		<span id="my-time2" style="color:blue; font-size: 30px; font-weight: bold;" ></span>
		        	  </div>
		        	</div>
		        	<div style="margin-top: 20px;">
		        	  <div style="margin: 0px auto; width:100px">
		        	    <button type="button" id="my-btn" class="btn btn-secondary" onClick="clickBtn()"  disabled>준비중</button>
		              </div>
		            </div>
		          </div>
		          <div style="width:33%;">
		            <div id="c3" class="coupon">
		              <div style="margin: 0px auto;">
		        	    <p style="font-size: 30px;">17:30 OPEN</p>
	     		      </div>
	       		    </div>
	       		    <div style="margin-top: 20px;">
	        	      <div style="margin: 0px auto; width:100px">
		                <button type="button" class="btn btn-secondary" disabled>준비중</button>
		              </div>
		            </div>
		          </div>
		        </div>
			  </div>
		  </div>
  	    </div>
    </div>
  </div>
</body>
  
  
  <script>

    function colorChange(){
      if(document.querySelector("#c2").style.backgroundColor == "white"){
        document.querySelector("#c2").style.backgroundColor = "red";
      }else{
        document.querySelector("#c2").style.backgroundColor = "white";
      }
    }

   
    
    function clickBtn(){
    	alert("쿠폰 획득에 성공했습니다!");
    	let myBtn = document.querySelector("#my-btn");
    	myBtn.className = 'btn btn-primary';
    	myBtn.innerHTML = "성공";
    	$("#my-btn").attr("disabled", true);
    	
    }
    
    $("document").ready(function(){

      let myBtn = document.querySelector("#my-btn");
      var timer = setInterval(colorChange,200);
      var time = 1000;
      let myTime1 = document.querySelector("#my-time1");
      let myTime2 = document.querySelector("#my-time2");
      let myTime3 = document.querySelector("#my-time3");
      let clickBtn = document.querySelector("#cick-btn");
      var stopWatch = setInterval(function(){
        let sec = parseInt(time/100);
        let psec = time%100;
        myTime1.innerHTML = sec;
        myTime2.innerHTML = psec;
        time--;
      },10)
      setTimeout(function(){
    	clearInterval(stopWatch);
        clearInterval(timer);
        myBtn.className = 'btn btn-success';
        myBtn.innerHTML = "Click!!"
        document.querySelector("#c2").style.backgroundColor = "white";
        myTime1.innerHTML = "";
        myTime2.innerHTML = "";
        myTime3.innerHTML = "";
        $("#my-btn").attr("disabled", false);
      },10000);
    })

    


  </script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
