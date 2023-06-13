<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="/js/jqueryadmin.min.js"></script>
<script src="/js/bootstrapadmin.min.js"></script>
<script>
	function myMessage() {
		alert("${message}");
	}
	$(window).on('load', function () {
        $(".loader").fadeOut();
        $("#preloder").delay(100).fadeOut("slow");
    });
</script>
