// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require popper
//= require bootstrap-sprockets
//= require bootstrap

$(document).ready(function(){
	$('.destroy').on('click',function(){
		    var blog_id =$(this).parents().parents().parents().attr("id");
		    var post_id = $(this).parents().parents().attr("id");
		    var comment_id = $(this).parents().attr("id");
		$.ajax({
			url: '/blogs/'+blog_id+'/posts/'+post_id+'/comments/'+comment_id,
			type: 'DELETE',
			success: function(r){
				// var u = '/blogs/'+blog_id+'/posts/'+post_id;
				alert("comment deleted successfully");
				// window.location.href = u;
			}
		});
	});
});
	