 $(document).ready(function() {
	$("#animation").hide();
	$('#fileinput').css({
		'opacity': 0,
		'visibility': 'visible'
	});
	
	$('#form_file').css({
		'opacity': 0,
		'visibility': 'visible'
	});
	$('#vidswitch a').click(function(){
		
		x=0
		if($(this).index == 0)
			x=1;
		$("#vidswitch a.active_menu").removeClass("active_menu");
		$(this).addClass("active_menu");$(this).addClass("active_menu");
		});
	$('.leader_thumb_link').click(function(){
		par = $(this).parent().attr('class')
		if(par == 'leader_thumb'){
			x = $(this).parent().index();
		}

		else{
			x = $(this).parent().parent().index();
  		}
	  
		$.ajax({
		  type    : 'POST',
		  url     : "http://localhost:3000/select_user", 
		  data    : { number : x },
		 
		});
	});
	
	$('.leader #overlay_view_profile').click(function(){
		x = $(this).parent().index();
	
  		
	  	
		$.ajax({
		  type    : 'POST',
		  url     : "http://localhost:3000/select_user", 
		  data    : { number : x },
		  success : function() {
		     $("#overlay_view_profile").overlay().load();           
		            },  
		});
	});
	$('#leaderboard_all').click(function(){
		$('.leader').fadeOut(function(){
			$('#leader_all').fadeIn();
		});
	});
	$('#leaderboard_title').click(function(){
		$('#leader_all').fadeOut(function(){
			$('.leader').fadeIn();
		});
	});
	$('#leaderboard').waypoint(function() {
   		$('#backtotop').fadeToggle('fast');
	});
	$(".tip_logo[title]").tooltip({
		offset: [170, 2],
		direction: 'down',
		effect: 'slide'
	});
	$(".tip[title]").tooltip({
		offset: [136, 2],
		direction: 'down',
		effect: 'slide'
	});
	$('#profile').hover(function(){
		$('#profile_back').fadeIn('fast');
		},
		function() {
		$('#profile_back').fadeOut('fast');
	});

    	

	$('#fileinput').change( function() {
		$('#filename').text(this.value);
	});
	$('#fileinput').mouseenter(function() {
		$('#browse').css({'background-image': 'url(upload_button_hover.gif)'});
	});
	$('#fileinput').mouseleave(function() {
		$('#browse').css({'background-image': 'url(upload_button.gif)'});
	});
	
	
	$('#form_file').change( function() {
		$('#filename2').text(this.value);
	});
	$('#form_file').mouseenter(function() {
		$('#browse2').css({'background-image': 'url(upload_button_hover.gif)'});
	});
	$('#form_file').mouseleave(function() {
		$('#browse2').css({'background-image': 'url(upload_button.gif)'});
	});
	$('.notice').click(function(){
		$(this).fadeOut();
	});
	$("#overlay_view_profile").overlay();
	$("a[rel^='#']").overlay(); 
 });
 		
		 $(".items_inner div img").css('opacity','.8');
 		 $(".items_inner div img").mouseenter(function(){
		 $(this).fadeTo(200, 1);
 		 }).mouseleave(function(){
		 $(this).fadeTo(200, .8);
		 });


  		
		$(".scrollable").scrollable();
		$(".scroll").click(function(event){		
		event.preventDefault();
		$('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
		});
		
		//CAPTION CAPTION!!!    
		$('div.items_description').each(function(){  
        $(this).css('opacity', 0);    
        $(this).css('display', 'block');  
    });  
  
    $('.items div').hover(function(){  
        $(this).children('.items_description').stop().fadeTo(500, 0.7);  
    },function(){  
        $(this).children('.items_description').stop().fadeTo(500, 0);  
    });  
    
