 $(document).ready(function() {
	$("#animation").hide();
	$('#fileinput').css({
		'opacity': 0,
		'visibility': 'visible'
	});
	$(".select_style").customSelect();

	
	window.setTimeout(function() {
	  window.addEventListener('popstate', function() {
	    $.cookie("zomg","zomg");
		location.reload(); 
	  });
	}, 1000);

  
	$('#form_file').css({
		'opacity': 0,
		'visibility': 'visible'
	});
	$('#header_leaders a').click(function(){
		window.history.pushState({state:2}, "Leaders Of Madison", "/"+this.hash);
	});
	$('#backtotop a').click(function(){
		window.history.pushState({state:2}, "Home", "/"+this.hash);
		return event.preventDefault();

	});
	
	
	$('#category_select').change(function(){
		x = $(this).val();
		$.ajax({
		  type    : 'POST',
		  url     : "/home", 
		  data    : { category : x},
		 
		});
	});

	$('#leaderboard_select').change(function(){
		leaderVal = $(this).val();
		categoryVal =$('#category_select').val();
		$.ajax({
		  type    : 'POST',
		  url     : "/home", 
		  data    : { leaderboard : leaderVal, category : categoryVal},
		 
		});
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
		  url     : "/select_user", 
		  data    : { number : x },
		 
		});
	});
	
	$('.leader #overlay_view_profile').click(function(){
		x = $(this).parent().index();
	
  		
	  	
		$.ajax({
		  type    : 'POST',
		  url     : "/select_user", 
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
	$('#profile').hover(function(){
		$('#profile_back').fadeIn('fast');
		},
		function() {
		$('#profile_back').fadeOut('fast');
	});

    $('.share_twitter').click(function(){
    x = $("#background_overlay iframe").attr("title");
    y = $("#video_info h1").html();
	window.open('https://twitter.com/intent/tweet?original_referer='+x+'&text='+y+'&tw_p=tweetbutton&url='+x, 'newwindow', 'width=500, height=400'); return false;
    });

	$('#fileinput').change( function() {
		$('#filename').text(this.value);
	});
	$('#fileinput').mouseenter(function() {
		
		$('#browse').css({'background-image': 'url(/assets/upload_button_hover.gif)'});
	});
	$('#fileinput').mouseleave(function() {
		$('#browse').css({'background-image': 'url(/assets/upload_button.gif)'});
	});
	
	
	$('#form_file').change( function() {
		$('#filename2').text(this.value);
	});
	$('#form_file').mouseenter(function() {
		$('#browse2').css({'background-image': 'url(/assets/upload_button_hover.gif)'});
	});
	$('#form_file').mouseleave(function() {
		$('#browse2').css({'background-image': 'url(/assets/upload_button.gif)'});
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
    

	

