<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
    <span onclick="javascript:goPageForEntirePage(${param.firstPageNo})" class="first">first</span>
    <span onclick="javascript:goPageForEntirePage(${param.prevPageNo})" class="prev">prev</span>
        <c:forEach var="i" begin="${param.startPageNo}" end="${param.endPageNo}" step="1">
            <c:choose>
                <c:when test="${i eq param.pageNo}"><span onclick="javascript:goPageForEntirePage(${i})" class="active">${i}</span></c:when>
                <c:otherwise><span onclick="javascript:goPageForEntirePage(${i})">${i}</span></c:otherwise>
            </c:choose>
        </c:forEach>
    <span onclick="javascript:goPageForEntirePage(${param.nextPageNo})" class="next">next</span>
    <span onclick="javascript:goPageForEntirePage(${param.finalPageNo})" class="last">last</span>