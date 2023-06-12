<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="/js/jqueryadmin.min.js"></script>
<script src="/js/bootstrapadmin.min.js"></script>
<script>
	function myMessage() {
		  alert("${message}");
	}
</script>
<script>
		$(document).ready(function(){
			$("a[href='#cancelOD']").on("click", function(evt){
				let idOrder = $(this).data("id");
				if(confirm(`Bạn muốn hủy đơn hàng có id: "${"${"}idOrder}" phải không?`)){
					window.location.href="/admin/order/cancel?id="+idOrder;
				}
				evt.preventDefault();
			});
			$("a[href='#acceptOD']").on("click", function(evt){
				let idOrder = $(this).data("id");
				if(confirm(`Bạn muốn xử lý đơn hàng có id: "${"${"}idOrder}" phải không?`)){
					window.location.href="/admin/order/accept?id="+idOrder;
				}
				evt.preventDefault();
			});
		});
		
</script>