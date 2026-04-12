<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart"%>

<jsp:useBean id="BookDAO" class="dao.BookRepository" scope="session" />

<%
	request.setCharacterEncoding("UTF-8");

	String filename="";
	String realFolder="C:\\Users\\user\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\JSPBook\\resources\\images";
	int maxSize=5 * 1024 * 1024;
	String encType="utf-8";

	MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	
	String bookId=multi.getParameter("bookId");
	String name=multi.getParameter("name");
	String unitPrice=multi.getParameter("unitPrice");
	String author=multi.getParameter("author");
	String publisher=multi.getParameter("publisher");
	String releaseDate=multi.getParameter("releaseDate");
	String description=multi.getParameter("description");
	String category=multi.getParameter("category");
	String unitsInStock=multi.getParameter("unitsInStock");
	String condition=multi.getParameter("condition");
	
	Enumeration files=multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName=multi.getFilesystemName(fname);

	Integer price;
	if(unitPrice.isEmpty()){
		price=0;
	}else{
		price=Integer.valueOf(unitPrice);
	}
	
	long stock = 0;
	if(unitsInStock.isEmpty()) {
		stock = 0;
	} else {
		stock = Long.valueOf(unitsInStock);
	}
	
	Book newBook=new Book();
	newBook.setBookId(bookId);
	newBook.setName(name);
	newBook.setUnitPrice(price);
	newBook.setAuthor(author);
	newBook.setPublisher(publisher);
	newBook.setReleaseDate(releaseDate);
	newBook.setDescription(description);
	newBook.setCategory(category);
	newBook.setUnitsInStock(stock);
	newBook.setCondition(condition);
	newBook.setFilename(fileName);

	BookDAO.addBook(newBook);
	
	response.sendRedirect("books.jsp");
%>