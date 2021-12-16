<%--
  Created by IntelliJ IDEA.
  User: oleksii
  Date: 11.12.2019
  Time: 11:49 пп
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Hotels</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            outline: 0;
            box-sizing: border-box;
        }
        body {
            /*background-image: url(https://images.unsplash.com/photo-1500021804447-2ca2eaaaabeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80);*/
            background-color: #edf3fd;
            -webkit-background-size:cover;
            background-size:cover;
            background-position: center center;
            height: 100vh;
        }
        .menu-area li a {
            text-decoration: none;
        }

        .menu-area li {
            list-style-type: none;
        }

        .custom-padding{
            padding-top: 25px;
        }

        nav {
            position: relative;
            width: calc(100% - 60px);
            margin: 0 auto;
            padding: 10px 0;
            background: #333;
            z-index: 1;
            text-align: right;
            padding-right: 2%;
        }

        .logo {
            width: 15%;
            float: left;
            text-transform: uppercase;
            color: #fff;
            font-size: 25px;
            text-align: left;
            padding-left: 2%;
        }

        .menu-area li {
            display: inline-block;
        }

        .menu-area a {
            color: #fff;
            font-weight: 300;
            letter-spacing: 1px;
            text-transform: uppercase;
            display: block;
            padding: 0 25px;
            font-size: 14px;
            line-height: 30px;
            position: relative;
            z-index: 1;
        }
        .menu-area a:hover {
            background: cornflowerblue;
            color: #fff;
        }

        .menu-area a:hover:after {
            transform: translateY(-50%) rotate(-35deg);
        }

        nav:before {
            position: absolute;
            content: '';
            border-top: 10px solid #333;
            border-right: 10px solid #333;
            border-left: 10px solid transparent;
            border-bottom: 10px solid transparent;
            top: 100%;
            left: 0;
        }

        nav:after {
            position: absolute;
            content: '';
            border-top: 10px solid #333;
            border-left: 10px solid #333;
            border-right: 10px solid transparent;
            border-bottom: 10px solid transparent;
            top: 100%;
            right: 0;
        }

        /*sub menu*/
        li ul {
            position: absolute;
            min-width: 150px;
            display: none;
        }

        li > ul li {
            border: 1px solid #333333;
        }

        li > ul li a {
            padding: 10px;
            text-transform: none;
            background: #333333;
        }

        li > ul li ul {
            position: absolute;
            right: -150px;
            top: 0;
        }

        li:hover > ul {
            display: block;
        }

        .footer {
            background-color: #333333;
            color: #fff;
            display: block;
            flex: 0 0 auto;
            margin-top: 5px;
        }

        .filter{
            margin-left: 10%;
            margin-top: 15px;
            position: center;
        }
        .table-Hotel{
            color: black;
            background: white;
            border: black;
            position: center;
            padding-left: 70px;
            padding-top: 26px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {

            text-align: left;
            padding: 8px;
        }
        tr:hover {background-color: oldlace;}
        .create_button{
            height: 25px;
            width: 80px;
            border-radius: 10px;
        }


    </style>
</head>
<body>
<div class="custom-padding">
    <nav>
        <div class="logo">TourFirm</div>

        <ul class="menu-area">

            <c:if test="${session.equals('true')}">
                <li><a href="index?session=true">Home</a></li>
                <li><a href="profile?session=true">Cabinet</a></li>
                <li><a href="logout">Logout</a></li>
                <c:if test="${sessionScope.user.isAdmin.equals('true')}">
                    <li><a href="statistics">Statistics</a></li>
                </c:if>
                <li><a href="hotels?id=all">Country</a>
                    <ul class="listG">
                        <li><a href="hotels?id=Germany">Germany</a></li>
                        <li><a href="hotels?id=Iceland">Iceland</a></li>
                        <li><a href="hotels?id=Poland">Poland</a></li>
                        <li><a href="hotels?id=Canada">Canada</a></li>
                        <li><a href="hotels?id=Japan">Japan</a></li>
                        <li><a href="hotels?id=North Korea">North Korea</a></li>
                        <li><a href="hotels?id=USA">USA</a></li>
                        <li><a href="hotels?id=Belgium">Belgium</a></li>
                        <li><a href="hotels?id=Ukraine">Ukraine</a></li>
                    </ul>
                </li>
                <li><a href="hotels?id=all">Hotel</a></li>
            </c:if>
            <c:if test="${!session.equals('true')}">
                <li><a href="index?session=true">Home</a></li>
                <li><a href="login">Sign in</a></li>
                <li><a href="register">Sign up</a></li>
            </c:if>

        </ul>
    </nav>
</div>
<div class="filter">
    <form method="post">
        <label for="inputDateStart">Start Date</label>
        <input type="date" id="inputDateStart" class="form-control" name="dateStart" placeholder="Start">

        <label for="inputDateEnd">End Date</label>
        <input type="date" id="inputDateEnd" class="form-control" name="dateEnd" placeholder="End">

        <label for="inputPriceFrom">Price From</label>
        <input type="number" id="inputPriceFrom" class="form-control" name="priceFrom" placeholder="From">

        <label for="inputPriceTo">Price To</label>
        <input type="number" id="inputPriceTo" class="form-control" name="priceTo" placeholder="To">
        <button type="submit" class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2 create_trip_button">Search</button>
    </form>
    <div class="errorMessage">
        <h3>${requestScope.get("error")}</h3>
    </div>
</div>
<div>
    <div class="table-Hotel" style="overflow-x:auto;">
        <table>
            <thead>
            <tr>
                <th>Photo</th>
                <th>Hotel</th>
                <th>City</th>
                <th>Rooms</th>
                <th>Price</th>
                <th></th>
                <c:forEach var="hotel" items="${hot}">
            <tr href = "${pageContext.request.contextPath}/hotel?id=${hotel.id}">
                <td><img src="${pageContext.request.contextPath}/images/${hotel.id}.png" alt="image" width="300"
                         height="300"></td>
                <td><a href="${pageContext.request.contextPath}/booking?hotelId=${hotel.id}">${hotel.name}</a></td>
                <td>${hotel.city.name}</td>
                <td>${hotel.numberRoom}</td>
                <td>${hotel.priceNight} UAH</td>
                <td>${hotel.discription}</td>
            </tr>
            </c:forEach>
            </tr>

            </thead>
            <tbody class="trip__table_body"></tbody>

        </table>

</div>


<div class="footer">
    <h5 style="text-align: center;padding: 0;margin: 0"> All rights reserved. &copy; 2021 by DiNO </h5>
</div>
</div>
</body>
</html>
