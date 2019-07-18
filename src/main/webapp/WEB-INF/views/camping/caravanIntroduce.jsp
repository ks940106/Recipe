<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../resources/css/import.css" rel="stylesheet" />
<link href="../resources/css/campingImport.css" rel="stylesheet" />
<link href="../resources/css/caravanIntroduce.css" rel="stylesheet"/>
<link href="../resources/css/campingContents.css" rel="stylesheet"/>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/singsingCampingheader.jsp"></jsp:include>
	<div class="ab_cover"></div>
	<section>
		<div class="section_content">
		<h1 class="contTitle">
		<span>카라반</span>
		싱싱캠핑장에서 <br>휴식과 여유를 경험해보세요.</h1>
		<h2>캠핑장A</h2>
		<p class="caravan_text">심플하고 모던한 카라반A</p>
		<div class="sliderWrap">
			 <div class="slider-wrap">
				          <ul id="slider">
				       <%--    <c:forTokens items="" delims="," var="sliderimg">  --%>
				             <li data-color="#1abc9c">				                          
									<img src="../resources/img/camping/hotel01.jpg" width="745px;">
				             </li>	 
				              <li data-color="#1abc9c">				                          
									<img src="../resources/img/camping/hotel02.jpg" width="745px;">
				             </li>
				              <li data-color="#1abc9c">				                          
									<img src="../resources/img/camping/hotel03.jpg" width="745px;">
				             </li>  
				   <%--         </c:forTokens>       --%>    		             
				          </ul>				          
				           <!--controls-->
				          <div class="btns" id="next"><img src="../resources/img/right_arrow.png"></div>
				          <div class="btns" id="previous"><img src="../resources/img/left_arrow.png"></div>
				          <div id="counter"></div>
				          
				          <div id="pagination-wrap">
				            <ul>
				            </ul>
				          </div>
				          <!--controls-->  				                 
			</div>
			<div class="textBox">								
				<div class="text on">
					<p class="title"><span>캠핑장A</span>특별한 추억을 쌓을 수 있는 공간</p>
					<div class="info">
						<p><span>평수</span>13평</p>
						<p><span>기준인원</span>성인2인</p>
						<p><span>1인당 추가 금액</span>10,000원</p>
						<p><span>금액</span>40,000원</p>
						<p><span>입실</span>15시</p>
						<p><span>퇴실</span>11시</p>
						<p><span>주차</span>1팀당 1대</p>
						<p><span>바베큐(2인 기준)</span>15,000원</p>
						<p><span>바베큐 추가 금액(1인)</span>5,000원</p>
						<p><span>구비시설</span>노래방, 화장실, 샤워실 등</p>
					</div>
				</div>
			</div>
			</div>
			<h2>캠핑장B</h2>
		<p class="caravan_text">심플하고 모던한 카라반B</p>
		<div class="sliderWrap">
			 <div class="slider-wrap1">
				          <ul id="slider1">
				       <%--    <c:forTokens items="" delims="," var="sliderimg">  --%>
				             <li data-color="#1abc9c">				                          
									<img src="../resources/img/camping/hotel01.jpg" width="745px;">
				             </li>	 
				              <li data-color="#1abc9c">				                          
									<img src="../resources/img/camping/hotel02.jpg" width="745px;">
				             </li>
				              <li data-color="#1abc9c">				                          
									<img src="../resources/img/camping/hotel03.jpg" width="745px;">
				             </li>  
				   <%--         </c:forTokens>       --%>    		             
				          </ul>				          
				           <!--controls-->
				          <div class="btns" id="next1"><img src="../resources/img/right_arrow.png"></div>
				          <div class="btns" id="previous1"><img src="../resources/img/left_arrow.png"></div>
				          <div id="counter1"></div>
				          
				          <div id="pagination-wrap1">
				            <ul>
				            </ul>
				          </div>
				          <!--controls-->  				                 
			</div>
			<div class="textBox">								
				<div class="text on">
					<p class="title"><span>캠핑장B</span>특별한 추억을 쌓을 수 있는 공간</p>
					<div class="info">
						<p><span>평수</span>13평</p>
						<p><span>기준인원</span>성인2인</p>
						<p><span>1인당 추가 금액</span>10,000원</p>
						<p><span>금액</span>40,000원</p>
						<p><span>입실</span>15시</p>
						<p><span>퇴실</span>11시</p>
						<p><span>주차</span>1팀당 1대</p>
						<p><span>바베큐(2인 기준)</span>15,000원</p>
						<p><span>바베큐 추가 금액(1인)</span>5,000원</p>
						<p><span>구비시설</span>노래방, 화장실, 샤워실 등</p>
					</div>
				</div>
			</div>
			</div>
			<%-- <h2>캠핑장A</h2>
		<p class="caravan_text">심플하고 모던한 카라반A</p>
		<div class="sliderWrap">
			 <div class="slider-wrap2">
				          <ul id="slider2">
				          <c:forTokens items="" delims="," var="sliderimg"> 
				             <li data-color="#1abc9c">				                          
									<img src="../resources/img/camping/hotel01.jpg" width="745px;">
				             </li>	 
				              <li data-color="#1abc9c">				                          
									<img src="../resources/img/camping/hotel02.jpg" width="745px;">
				             </li>
				              <li data-color="#1abc9c">				                          
									<img src="../resources/img/camping/hotel03.jpg" width="745px;">
				             </li>  
				           </c:forTokens>          		             
				          </ul>				          
				           <!--controls-->
				          <div class="btns" id="next2"><img src="../resources/img/right_arrow.png"></div>
				          <div class="btns" id="previous2"><img src="../resources/img/left_arrow.png"></div>
				          <div id="counter2"></div>
				          
				          <div id="pagination-wrap2">
				            <ul>
				            </ul>
				          </div>
				          <!--controls-->  				                 
			</div>
			<div class="textBox">								
				<div class="text on">
					<p class="title"><span>캠핑장A</span>특별한 추억을 쌓을 수 있는 공간</p>
					<div class="info">
						<p><span>평수</span>13평</p>
						<p><span>기준인원</span>성인2인</p>
						<p><span>1인당 추가 금액</span>10,000원</p>
						<p><span>금액</span>40,000원</p>
						<p><span>입실</span>15시</p>
						<p><span>퇴실</span>11시</p>
						<p><span>주차</span>1팀당 1대</p>
						<p><span>바베큐(2인 기준)</span>15,000원</p>
						<p><span>바베큐 추가 금액(1인)</span>5,000원</p>
						<p><span>구비시설</span>노래방, 화장실, 샤워실 등</p>
					</div>
				</div>
			</div>
			</div> --%>
		</div>
	</section>
	<script>
	 //current position
    var pos = 0;
    //number of slides
    var totalSlides = $('.slider-wrap ul li').length;
    //get the slide width
    var sliderWidth = $('.slider-wrap').width();
        
        /*****************
         BUILD THE SLIDER
        *****************/
        //set width to be 'x' times the number of slides
        $('.slider-wrap ul#slider').width(sliderWidth*totalSlides);
        
        //next slide    
        $('#next').click(function(){
            slideRight();
        });
        
        //previous slide
        $('#previous').click(function(){
            slideLeft();
        });

        /*************************
         //*> OPTIONAL SETTINGS
        ************************/
       /*  //automatic slider
        var autoSlider = setInterval(slideRight, 3000); */
        
        //for each slide 
        $.each($('.slider-wrap ul li'), function() { 

           //create a pagination
           var li = document.createElement('li');
           $('#pagination-wrap1 ul').append(li);    
        });
        
        //counter
        countSlides();
        
        //pagination
        pagination();
        
        //hide/show controls/btns when hover
        //pause automatic slide when hover
      /*   $('.slider-wrap').hover(
        /*   function(){ $(this).addClass('active'); clearInterval(autoSlider); },  */
        /*   function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); } 
        ); */
    /***********
     SLIDE LEFT
    ************/
    function slideLeft(){
        pos--;
        if(pos==-1){ pos = totalSlides-1; }
        $('.slider-wrap ul#slider').css('left', -(sliderWidth*pos));    
        
        //*> optional
        countSlides();
        pagination();
    }
    /************
     SLIDE RIGHT
    *************/
    function slideRight(){
        pos++;
        if(pos==totalSlides){ pos = 0; }
        $('.slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
        
        //*> optional 
        countSlides();
        pagination();
    }
    /************************
     //*> OPTIONAL SETTINGS
    ************************/
    function countSlides(){
        $('#counter').html(pos+1 + ' / ' + totalSlides);
    }

    function pagination(){
        $('#pagination-wrap ul li').removeClass('active');
        $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
    }
    
    
    
    
    /*카라반B*/
     var pos1 = 0;
    //number of slides
    var totalSlides1 = $('.slider-wrap1 ul li').length;
    //get the slide width
    var sliderWidth1 = $('.slider-wrap1').width();
        
        /*****************
         BUILD THE SLIDER
        *****************/
        //set width to be 'x' times the number of slides
        $('.slider-wrap1 ul#slider1').width(sliderWidth1*totalSlides1);
        
        //next slide    
        $('#next1').click(function(){
            slideRight1();
        });
        
        //previous slide
        $('#previous1').click(function(){
            slideLeft1();
        });

        /*************************
         //*> OPTIONAL SETTINGS
        ************************/
       /*  //automatic slider
        var autoSlider = setInterval(slideRight, 3000); */
        
        //for each slide 
        $.each($('.slider-wrap1 ul li'), function() { 

           //create a pagination
           var li1 = document.createElement('li');
           $('#pagination-wrap1 ul').append(li1);    
        });
        
        //counter
        countSlides1();
        
        //pagination
        pagination1();
        
        //hide/show controls/btns when hover
        //pause automatic slide when hover
      /*   $('.slider-wrap').hover(
        /*   function(){ $(this).addClass('active'); clearInterval(autoSlider); },  */
        /*   function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); } 
        ); */
    /***********
     SLIDE LEFT
    ************/
    function slideLeft1(){
        pos1--;
        if(pos1==-1){ pos1 = totalSlides1-1; }
        $('.slider-wrap1 ul#slider1').css('left', -(sliderWidth1*pos1));    
        
        //*> optional
        countSlides1();
        pagination1();
    }
    /************
     SLIDE RIGHT
    *************/
    function slideRight1(){
        pos1++;
        if(pos1==totalSlides1){ pos1 = 0; }
        $('.slider-wrap1 ul#slider1').css('left', -(sliderWidth1*pos1)); 
        
        //*> optional 
        countSlides1();
        pagination1();
    }
    /************************
     //*> OPTIONAL SETTINGS
    ************************/
    function countSlides1(){
        $('#counter1').html(pos1+1 + ' / ' + totalSlides1);
    }

    function pagination1(){
        $('#pagination-wrap1 ul li').removeClass('active');
        $('#pagination-wrap1 ul li:eq('+pos1+')').addClass('active');
    }
    
	</script>
	<jsp:include page="/WEB-INF/views/common/singsingCampingfooter.jsp"></jsp:include>
	
</body>
</html>