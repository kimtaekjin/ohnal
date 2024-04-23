
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- header -->
    <header>
        <div class="inner-header">
            <h1 class="logo">
                <a href="/index">
                    <img src="/assets/img/navbar-logo.svg" alt="로고이미지">
                </a>
            </h1>
            <div class="profile-wrapper">
                <!-- 프로필 사진과 nickname 노출-->
                <c:if test="${login != null}"> <!--로그인이 되어 있고 -->
                    <c:choose>
                        <c:when test="${login.profile != null}"> <!--프로필 사진이 있는데 -->
                            <c:if test="${login.loginMethod eq 'KAKAO'}"> <!--1. 카카오 로그인이면-->
                                <div class="profile-box">
                                    <img src="${login.profile}" alt="프사">
                                </div>
                            </c:if>
                            <c:if test="${login.loginMethod != 'KAKAO'}"> <!-- 2. 카카오 로그인이 아니면-->
                                <div class="profile-box">
                                    <img src="/display${login.profile}" alt="프사">
                                </div>
                            </c:if>
                            <p class="intro-text">${login.nickname}님, 안녕하세요!</p>
                        </c:when>
                        <c:otherwise> <!--프로필 사진이 없으면-->
                            <div class="profile-box">
                                <img src="/assets/img/anonymous-image.png" alt="프사">
                            </div>
                            <p class="intro-text">${login.nickname}님, 안녕하세요!</p>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </div>

            <%-- 햄버거 버튼을 감싸고 있는 --%>
            <a href="#" class="menu-open">
                <%-- 햄버거 버튼 --%>
                <span class="lnr lnr-menu"></span>
            </a>
        </div>

        <%-- 햄버거 버튼 클릭시 우측에서 나타나는 메뉴 슬라이드 --%>
        <nav class="gnb">
            <a href="#" class="close">
                <span class="lnr lnr-cross"></span>
            </a>
            <ul>
                <li><a href="/board/list">OOTD 게시판</a></li>

                <c:if test="${empty login}"> <!-- el 문법임. login이 null이라면 ${login == null}-->
                    <li><a href="/members/sign-up">Sign Up</a></li>
                    <li><a href="/members/sign-in">Sign In</a></li>
                </c:if>

                <c:if test="${not empty login}">
                    <li><a href="/members/my-info">My Info</a></li>
                    <li><a href="/members/my-history">My History</a></li>
                    <li><a href="/members/sign-out">Sign Out</a></li>
                </c:if>
            </ul>
        </nav>

    </header>
    <!-- //header -->