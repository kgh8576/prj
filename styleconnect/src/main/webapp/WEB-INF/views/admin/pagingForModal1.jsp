<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<div class="pagination">
    <a href="javascript:goPageForModal1(${param.firstPageNo})" class="first">first</a>
    <a href="javascript:goPageForModal1(${param.prevPageNo})" class="prev">prev</a>
    <span>
        <c:forEach var="i" begin="${param.startPageNo}" end="${param.endPageNo}" step="1">
            <c:choose>
                <c:when test="${i eq param.pageNo}"><a href="javascript:goPageForModal1(${i})" class="active">${i}</a></c:when>
                <c:otherwise><a href="javascript:goPageForModal1(${i})">${i}</a></c:otherwise>
            </c:choose>
        </c:forEach>
    </span>
    <a href="javascript:goPageForModal1(${param.nextPageNo})" class="next">next</a>
    <a href="javascript:goPageForModal1(${param.finalPageNo})" class="last">last</a>
</div>