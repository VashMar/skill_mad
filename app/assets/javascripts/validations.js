       function increment(varID)
		{							var vote=1;

			if(varID=="vote_mad"){
				var container = document.getElementById("vote_counter");
				if($("#vote_bad").hasClass("pressed") && container.innerHTML!="0"){vote++}
				if(!($("#vote_mad").hasClass("pressed"))){
					container.innerHTML = parseInt(container.innerHTML)+vote;
					$("#vote_bad").removeClass("pressed");
					$("#vote_mad").addClass("pressed");
				}else{
					$("#vote_mad").removeClass("pressed");
					container.innerHTML = parseInt(container.innerHTML)-1;
				}
			}else{
					mad = $("#leaders_container").children().eq(varID).find(".mad_small");
					container = mad.next();
					bad = container.next();
					if(bad.hasClass("bad_clicked") && container.innerHTML!="0"){vote++}
					if(!(mad.hasClass("mad_clicked"))){
					container.html(parseInt(container.html())+vote);
					bad.removeClass("nad_clicked");
					mad.addClass("mad_clicked");
					}else{
						mad.removeClass("mad_clicked");
						container.html(parseInt(container.html())-1) ;
					}
				}
			
		}
    	function decrement(varID)
		{
			var vote=1;
				if(varID=="vote_bad"){
					var container = document.getElementById("vote_counter");
					if($("#vote_mad").hasClass("pressed")){vote++}
					if(!($("#vote_bad").hasClass("pressed"))){
						container.innerHTML = parseInt(container.innerHTML)-vote;
						if(container.innerHTML=="-1"){
							container.innerHTML=0;
						} 
					$("#vote_mad").removeClass("pressed");
					$("#vote_bad").addClass("pressed");
					}else{
						$("#vote_bad").removeClass("pressed");
						container.innerHTML = parseInt(container.innerHTML)+1;
					}
				}else{
					mad = $("#leaders_container").children().eq(varID).find(".mad_small");
					container = mad.next();
					bad = container.next();
					if(mad.hasClass("mad_clicked")){vote++}
					if(!(bad.hasClass("bad_clicked"))){
						container.html(parseInt(container.html())-vote);
						if(container.html()=="-1"){
							container.html(0);
						} 
					mad.removeClass("mad_clicked");
					bad.addClass("bad_clicked");
					}else{
						bad.removeClass("bad_clicked");
						container.html(parseInt(container.html())+1) ;
					}
				}
		}


  $(document).ready(function(){
  	  $.validator.addMethod("isImage", function(value,element){
  		
  		var filetype = $("#form_file").val();
  		filetype = filetype.split('.').pop();
  		filetype = filetype.toLowerCase();
  		switch(filetype)
  		{
  			case "jpg":
  			case "jpeg":
  			case "gif":
  			case "png":
  			case "bmp":
  				return true;
  				break;
  			default:
  				return false;
  		}	
  	}, "Wrong file type");
  	  	$.validator.addMethod("isImage", function(value,element){
  		
  		var filetype = $("#form_file").val();
  		filetype = filetype.split('.').pop();
  		filetype = filetype.toLowerCase();
  		switch(filetype)
  		{
  			case "jpg":
  			case "jpeg":
  			case "gif":
  			case "png":
  			case "bmp":
  				return true;
  				break;
  			default:
  				return false;
  		}	
  	}, "Wrong file type");
  	$.validator.addMethod("isWisc", function(value,element){
  		var email = $("#user_email").val();
  		if(email.substring(email.length-8) == "wisc.edu"){
  			return true;
  		}else return false;
  		
  	}, "Must be your wiscmail");
  	  
  	  $.validator.addMethod("isVideo", function(value,element){
  		
  		var filetype = $("#fileinput").val();
  		filetype = filetype.split('.').pop();
  		filetype = filetype.toLowerCase();
  		switch(filetype)
  		{
  			case "mov":
  			case "mpg":
  			case "mpeg":
  			case "flv":
  			case "wmv":
  			case "avi":
			case "mp4":
  				return true;
  				break;
  			default:
  				return false;
  		}	
  	}, "Wrong file type");
  	
  	
	$('#join').validate({
 		rules: {
  			"user[name]": {required: true, remote:"/check_name"},
  			"user[email]": {required: true, email:true, isWisc:true, remote:"/check_email"},
  			"user[password]": {required: true, minlength: 6},	
  			"user[password_confirmation]": {required: true, equalTo:"#user_password"}
			},
  		messages: {
  			"user[name]":{
  				remote: "This name is already taken"
  			},
  			"user[email]":{
  				remote: "This email is already in use"
  			}
  		}		
  	});
  	$('#form_pic').validate({
 		rules: {
  			"user[avatar]": {required: true, isImage:true}
			},
  		messages: {
  			"user[avatar]":{
  				required:"Please select a file",
  				accepts:"Wrong file type"
  			}
  		}
  		});
  	$('#upload_youtube').validate({
 		rules: {
  			"file": {required: true, isVideo:true}
			},
  		messages: {
  			"file":{
  				required:"Please select a file",
  				accepts:"Wrong file type"
  			},
  		},
  				
  		 submitHandler: function(form) {
  		 	var loading = [
  		 	"pregaming for midterms...", 
  		 	"spotting tunnel bob...", 
  		 	"bonging a beer with the cops...", 
  		 	"chasing piccalo pete...", 
  		 	"throwing up in mendota...",  
  		 	"teaching the gophers how to bucky...", 
  			"teaching the spartans how to bucky..", 
  			"pretending not to look at those people holding clipboards by east campus mall..", 
  			"trying to find a table at college library on a sunday...", 
  			"trying to find a table with an outlet on any night...", 
  			"being told that the tests will look just like what we covered in class...", 
  			"not going to miffin...", 
  			"setting the curve...for sleeping...", 
  			"Getting a cramp on Bascon Hill", 
  			"Only taking a few shots because you have a final tomorrow"];
  			loading = loading.sort(function() { return 0.5 - Math.random();});
			var n=1;
			var txt=document.getElementById("txt");
			var load = "pregaming for midterms...";
			txt.innerHTML=load;
  		 	setInterval(function(){
				var load = loading[n];
				txt.innerHTML=load;
				if(n<loading.length){
				n++;
				}
			},3000);
	  		$("#animation").animate({
				height: 216
			}, function(){
				$("#animation").fadeIn("slow");
			});
			
	   		form.submit();
 		}
 	
 	
  	});
  	$('#upload').validate({
 		rules: {
  			"video[title]": {required: true},
  			"video[description]": {required: true},
  			"leaderboard": {required: true},
  			"new_board[leaderboard_name]": {required: true},
  			"new_board[leaderboard_description]":{required:true}
			},
  		messages: {
  			"video[title]":{
  				required:"Please enter a title"
  			},
  	
  		}		
  	});


	 $("#form_info").validate({
 	rules: {
 	"user[name]": {required: true, remote:"/check_name"},
	 },
 	messages: {
 	"user[name]":{
 	remote: "This name is already taken"
	 }
	 }
	 });
	 
	 $("#form_business").validate({
	 	rules: {
		 	"business_name": {required: true},
		 	"contact": {
		 		  required: function(element) {
                        return $('#phone').val() == '';
                  }
		 	},
		 	"phone": {
		 		  required: function(element) {
                        return $('#contact').val() == '';
                  }
             },
		 	"description": {required: true},
		 },
	 	messages: {
			 "contact": {
                  required: 'Enter at least one contact'
            },
            "phone": {
                  required: 'Enter at least one contact'
            },
            
		 }
	 });


  	
  	$('#login').validate({
  		onkeyup: false,
  		rules: {
  			"session[password]": {required: true, 	
  				remote:{
  					url: "/verify",
  					type: "get",
  				data: {
  					"session[email]": function(){
  					return $("#session_email").val();
  				      }
  				}
  		        }, // end remote 
  			}		
  		}, // end rules
  		messages:{
			 "session[password]": {
		          remote: "You drunk? Password and email don't match." 	
		         } 	

			},
  	});
  });
