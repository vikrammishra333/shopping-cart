// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


function changeFile(){
    //alert("bhak saaala");
}

$(document).ready(function () {
	/*$("#new_user").validate({
		debug: true,
		rules: {
		"user[email]": {required: true, email: true},//, remote:"/users/check_email" },  //added this
		"user[password]": {required: true, minlength: 6},
		"user[password_confirmation]": {required: true, equalTo: "#user_password"}
		},
		messages:
		{
			"user[email]": {
                required: "Please provide your Email.",
				email: "Not a valid email address.",
				remote: "Email already exists."
            },
            "user[password]": {
				required: "Please provide your password.",
				minlength: "Minimum password length is 6 characters."
            },
			"user[password_confirmation]": {
				required: "Please retype your password.",
				equalTo: "Password does not match."
            }
		}
	});
	*/
	// validate contact form on keyup and submit
    $("#login_form").validate({
 
        //set the rules for the fild names
        rules: {
           "session[email]": {
                required: true,
            },
            "session[password]": {
                required: true,
            },
        },
 
        //set error messages
        messages: {
 
            "session[email]": {
                required: "Please provide your Email.",
            },
            "session[password]": {
            required: "Please provide your password.",
            }
        },
 
        //our custom error placement
        errorElement: "span",
        errorPlacement: function(error, element) {
                error.appendTo(element.parent());
            }
 
    });
    //ajaxifyPagination();
    $('#product_pic').change(function(e){
        alert("bhak saaala");
    });
});

function ajaxifyPagination() {
    $(".pagination a").click(function() {
        $.ajax({
          type: "GET",
          url: $(this).attr("href"),
          dataType: "script"
        });
        return false;
    });
}
