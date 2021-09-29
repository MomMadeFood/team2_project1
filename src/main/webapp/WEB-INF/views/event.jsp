<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

  <style>
    *{
      margin:0px;
      padding:0px;
    }
    .coupon{
      margin:0px auto; 
      width:300px; 
      height:200px; 
      
      border-radius: 10px;
      border: 1px solid black;
      
      display: flex;

      align-items: center;
    }
    #c1{
      background-image: url("${pageContext.request.contextPath}/resources/images/coupon1.png");
      opacity: 0.4;
      background-size: 100% 100%;
    }

    #c2{
      background: url("${pageContext.request.contextPath}/resources/images/coupon2.png");
      background-color: white;
      background-blend-mode: multiply;
      background-size: 100% 100%;
    }

    #c3{
      background-image: url("${pageContext.request.contextPath}/resources/images/coupon3.png");
      opacity: 0.4;
      background-size: 100% 100%;
    }
  </style>

  <body>
    <div>
      <div style="border-bottom: 1px solid #E5E5E5; height:100px; vertical-align:center;margin-bottom:40px;">
        <div style="margin:auto; padding-top:30px; width:300px; text-align:center; vertical-align:middle;">
          <p style="font-size: 28px;">쿠폰 이벤트 목록</p>
        </div>
      </div>
      <div class="d-flex" style="margin:0px auto; width:990px; height:350px ">
        <div style="width:33%;"><div id="c1" class="coupon"><div style="margin: 0px auto;"><p style="font-size: 30px;">15:30 OPEN</p></div></div><div style="margin-top: 20px;"><div style="margin: 0px auto; width:100px"><button type="button" class="btn btn-secondary" disabled>준비중</button></div></div></div>
        
        <div style="width:33%;"><div id="c2" class="coupon"><div style="margin: 0px auto;"><span id="my-time1" style=" color:blue;font-size: 30px; font-weight: bold;"></span> <span  id ="my-time3" style="color:blue; font-size: 30px;">:</span> <span id="my-time2" style="color:blue; font-size: 30px; font-weight: bold;" ></span></div></div><div style="margin-top: 20px;"><div style="margin: 0px auto; width:100px"><button type="button" id="my-btn" class="btn btn-secondary" onClick="clickBtn()"  disabled>준비중</button></div></div></div>

        <div style="width:33%;"><div id="c3" class="coupon"><div style="margin: 0px auto;"><p style="font-size: 30px;">17:30 OPEN</p></div></div><div style="margin-top: 20px;"><div style="margin: 0px auto; width:100px"><button type="button" class="btn btn-secondary" disabled>준비중</button></div></div></div>
      
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
