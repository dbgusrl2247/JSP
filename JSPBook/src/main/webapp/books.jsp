<!DOCTYPE html>

<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Book" %>
<jsp:useBean id="BookDAO" class="dao.BookRepository" scope="session" />
<html>
<head>

<meta charset="UTF-8">
<title>도서 목록</title>
</head>
<body>
<div class="container py-4">
	<%@ include file="menu.jsp" %>
	
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">도서 목록</h1>
			<p class="col-md-8 fs-4">BookList</p>
		</div>
	</div>
	<%
		ArrayList<Book> listOfBooks = BookDAO.getAllBooks();
	%>
	
	<div class="row align-items-md-stretch    text-center">
		<%
			for(int i=0; i<listOfBooks.size(); i++) {
				Book book = listOfBooks.get(i);
		%>
		<div class="col-md-4">
			<div class="h-100 p-2">
			    <h5><b><%= book.getName() %></b></h5>
                <p><%= book.getAuthor() %></p>66
                <p><%= book.getPublisher() %> | <%= book.getReleaseDate() %></p>
                <p>
                    <%= (book.getDescription() != null ? (book.getDescription().length() > 60 ? book.getDescription().substring(0,60) + "..." : book.getDescription()) : "") %>
                </p>
                <p><%= book.getUnitPrice() %>원</p>
                <p><a href="./book.jsp?id=<%=book.getBookId() %>" class ="btn btn-secondary" role="button"> 상세 정보 &raquo;></a>
         	</div>
		</div>
		<%
			}
		%>
	</div>
	<%@ include file="footer.jsp" %>
</div>
</body>
</html>