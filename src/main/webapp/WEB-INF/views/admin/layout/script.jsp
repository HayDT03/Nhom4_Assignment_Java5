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
	const inputImg = document.getElementById('imgInput')
	const img = document.getElementById('img')

	function getImg(event){

	     const file = event.target.files[0]; // 0 = get the first file

	     // console.log(file);

	     let url = window.URL.createObjectURL(file);

	     // console.log(url)

	     img.src = url
	}

	inputImg?.addEventListener('change', getImg)
</script>
