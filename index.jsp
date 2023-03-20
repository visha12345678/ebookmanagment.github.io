<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.entity.*"%>
<%@page import="com.dao.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Index</title>
<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/b2.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover
}

.crd-ho:hover {
	background-color: #fceedc;
}
</style>
</head>
<body style="background-color: #e6e4e1;">
<%

   User u=(User)session.getAttribute("userobj"); %>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-danger">
			<i class="fas fa-book mr-1"></i>EBook Management System
		</h2>
	</div>


	<!-- start Recent book -->
	<div class="container">

		<h3 class="text-center">Recent Book</h3>
		<div class="row">
		<%
		BookDAOImpl dao2=new BookDAOImpl(DBConnect.getConn());
		List<BookDtls> list1=dao2.getRecentBook();
		for(BookDtls b:list1){%>
		
		
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName() %>" style="width: 200px; height: 200px"
							class="img-thumblin">
						<p><%=b.getBookname() %></p>
						<p><%=b.getAuthor() %></p>
						
						<P>
						<%
						if(b.getBookCategory().equals("Old")){%>
						Categories:<%=b.getBookCategory() %></P>
							<div class="row">
							
							 <a
								href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm mr-1 ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm"><i class="fas fa-rupee-sign"></i><%=b.getPrice() %></a>
						</div>
						<%}else{%>
							
							Categories:<%=b.getBookCategory() %></P>
						<div class="row">
						<%if(u==null) 
						{%>
							<a href="login.jsp" class="btn btn-danger btn-sm mr-1">Add Cart</a>
						<%}
						else{%>
							
							<a href="cart?bid=<%=b.getBookid() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm mr-1">Add Cart</a> 
						<% }
						%>
							 <a
								href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm mr-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm"><i class="fas fa-rupee-sign"></i><%=b.getPrice() %></a>
						</div>
							
						<% }
						
						%>
						
						
					</div>
				</div>
			</div>
		<%}
		%>
		
		</div>
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- End Recent book -->
	<hr>


	<!-- start new book -->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">
			
			<%
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list=dao.getNewBook();
			for(BookDtls b:list){%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName() %> " style="width: 200px; height: 200px"
							class="img-thumblin">
						<p><%=b.getBookname() %></p>
						<p><%=b.getAuthor() %></p>
						<P>Categories:<%=b.getBookCategory() %></P>
						<div class="row">
						<%if(u==null) 
						{%>
							<a href="login.jsp" class="btn btn-danger btn-sm mr-1">Add Cart</a>
						<%}
						else{%>
							
							<a href="cart?bid=<%=b.getBookid() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm mr-1">Add Cart</a> 
						<% }
						%>
							<a
								href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm mr-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm"><%=b.getPrice() %>
								<i class="fas fa-rupee-sign"></i></a>
						</div>
					</div>
				</div>
					</div>
			<% }
			
			%>
				
				
		</div>
		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>

	<!-- End New book -->
	<hr>
	<!-- start old book -->



	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
				<%
		BookDAOImpl dao3=new BookDAOImpl(DBConnect.getConn());
		List<BookDtls> list2=dao3.getOldBook();
		for(BookDtls b:list2){%>
		
		
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName() %>" style="width: 200px; height: 200px"
							class="img-thumblin">
						<p><%=b.getBookname() %></p>
						<p><%=b.getAuthor() %></p>
						
						<P>
						<%=b.getBookCategory() %></P>
					<div class="row">
							 <a
								href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %>
								<i class="fas fa-rupee-sign"></i></a>
						</div>
						
					
						
						
					</div>
				</div>
			</div>
		<%}
		%>
			
			
		</div>
		<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>

	<!-- End old book -->
	<%@include file="all_component/footer.jsp" %>
</body>
</html>


















