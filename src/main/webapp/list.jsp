<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,org.bson.Document"%>
<%@ page import="com.mongodb.MongoClient,com.mongodb.client.*,com.mongodb.client.model.Filters" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border="1" cellpadding="10" cellspacing="0" width="80%">
<thead>
	<tr>
		<th>Id</th><th>Name</th><th>Cost</th><th>Desc</th><th>Delete</th>
	</tr>
</thead>
<tbody>
<%
MongoClient mongo = new MongoClient( "localhost" , 27017 ); 
MongoDatabase database = mongo.getDatabase("productdb");
MongoCollection<Document> collection = database.getCollection("products"); 

FindIterable<Document> iterDoc = collection.find();//Filters.eq("name", "mobile")

// Getting the iterator
Iterator it = iterDoc.iterator();

while (it.hasNext()) {
	Document document = (Document) it.next();
	%>
	<tr>
		<td><%= document.getObjectId("_id")%></td>
		<td><%= document.getString("name")%></td>
		<td><%= document.getDouble("cost")%></td>
		<td><%= document.getString("desc")%></td>
		<td><a href="delete.jsp?name=<%= document.getString("name")%>">Delete</a></td>
	</tr>
	<%
	
}

%>
</tbody>
</table>
</body>
</html>