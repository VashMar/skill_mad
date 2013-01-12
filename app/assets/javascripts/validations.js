		function increment()
		{
			var container = document.getElementById("vote_counter");
			var vote=1;
			if($("#vote_bad").hasClass("pressed") && container.innerHTML!="0"){vote++}
			if(!($("#vote_mad").hasClass("pressed"))){
				container.innerHTML = parseInt(container.innerHTML)+vote;
				$("#vote_bad").removeClass("pressed");
				$("#vote_mad").addClass("pressed");
			}
			
		}
    	function decrement()
		{
	
			
			var vote=1;
			if($("#vote_mad").hasClass("pressed")){vote++}
			if(!($("#vote_bad").hasClass("pressed"))){
				var container = document.getElementById("vote_counter");
				container.innerHTML = parseInt(container.innerHTML)-vote;
				if(container.innerHTML=="-1"){
					container.innerHTML=0;
				} 
			$("#vote_mad").removeClass("pressed");
			$("#vote_bad").addClass("pressed");
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
  		 	var loading = ["pregaming for midterms...", "spotting tunnel bob...", "bonging a beer with the cops...", "chasing piccalo pete...", "throwing up in mendota...", "writing in grout...", "teaching the gophers how to bucky...", "teaching the spartans how to bucky..", "pretending not to look at those people holding clipboards by east campus mall..", "trying to find a table at college library on a sunday...", "trying to find a table with an outlet on any night...", "being told that the tests will look just like what we covered in class...", "not going to miffin...", "setting the curve...for sleeping..." ];
			var n=1;
			var txt=document.getElementById("txt");
			var load = "pregaming for midterms...";
			txt.innerHTML=load;
  		 	setInterval(function(){
				var load = loading[n];
				txt.innerHTML=load;
				if(n<5){
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
  			"video[title]": {required: true}
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


  	
  	$('#login').validate({
  		onkeyup: false,
  		rules: {
  			"session[email]": {required: true, email:true},
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
		          remote: "You drunk bro? Password and email don't match." 	
		         } 	

			}			
  	});
  });
