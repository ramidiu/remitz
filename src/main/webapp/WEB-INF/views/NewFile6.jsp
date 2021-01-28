<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
<title>Insert title here</title>
</head>
<script>
$(function() {
    $('.mySelect').on('change', function() {
        $.cookie('mySelect', this.value);
    });
    $('.mySelect').val( $.cookie('mySelect') || 1 );
});
</script>
<body>

<select class="mySelect">
  <option value="1">Date</option>
  <option value="2">Helpfulness</option>
</select>
</body>
</html>