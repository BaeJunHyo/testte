<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<!-- </div>//sub_cont	 -->
<!-- </div>//inner	 -->	

<!-- <div class="btn_top"></div> -->

<script>
      $( document ).ready( function() {
        $( window ).scroll( function() {
          if ( $( this ).scrollTop() > 200 ) {
            $( '.btn_top' ).addClass("on");
          } else {
            $( '.btn_top' ).removeClass("on");
          }
        } );
        $( '.btn_top' ).click( function() {
          $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
          return false;
        } );
      } );
</script>


	<div id="footer">
			<div class=footer_link>
			<span><a href="#">협회소개</a></span>&nbsp;|
			<span><a href="#">시.도회별 홈페이지</a></span>&nbsp;|
			<span><a href="#">이용안내</a></span>&nbsp;|
			<span><a href="#">개인정보보호방침</a></span>&nbsp;
			</div>
		<div class="inner">
			<div class="footer_logo"><a href="main.do">
				<img src="<%=request.getContextPath()%>/image/logo_footer.jpg" alt="logo" />
			</a></div>
			<div class=copyrigt>	
				
			
			<address>
			한국전기안전협회 &nbsp;서울 영등포구 문래동 2가 35 남성아파트상가 204호
			</address>
			
			<p class="copyright">
			대표 전화  : 02-2671-2861~2<span>팩스  : 02-2671-2893</span>
			</p>
			<p class="copyright">COPYRIGHT(c) 2020 한국전기안전협회  RIGHTS RESERVED. | E-MAIL: bjlee0318@empal.com
			
			</p>
			</div>
			
		</div><!-- //inner -->
	</div><!-- //footer -->
</div><!-- //wrap -->

