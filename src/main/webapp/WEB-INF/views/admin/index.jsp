<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${tittle}</title>
<jsp:include page="layout/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>

	<article class="container-fluid">
		<jsp:include page="${url}.jsp"></jsp:include>
	</article>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
	<jsp:include page="layout/script.jsp"></jsp:include>
</body>

</html>