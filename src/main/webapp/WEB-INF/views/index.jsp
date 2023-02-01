<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html lang="ko">

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
				crossorigin="anonymous">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
				crossorigin="anonymous"></script>
		</head>

		<body>
			<!-- HEADER -->
			<%@ include file="/WEB-INF/views/common/header.jsp" %>

				<!-- MAIN -->
				<main>
					<div>
						<div id="carouselFestivalCaptions" class="carousel slide" data-bs-ride="carousel"
							style="width: 600px;height:600px;">
							<div class="carousel-indicators">
							</div>
							<div class="carousel-inner">
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselFestivalCaptions" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselFestivalCaptions" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>
				</main>

				<!-- FOOTER -->
				<%@ include file="/WEB-INF/views/common/footer.jsp" %>

					<script>
						<%@include file = "/WEB-INF/resources/js/common.js" %>
							window.onload = function () {
								getReadCountFesInfoImg();
							}
						function getReadCountFesInfoImg() {
							fe('/festival-infos/readcount')
								.then(function (list) {
									let indicatorshtml = '';
									let innerhtml = '';
									let i = 0;
									for (let value of list) {
										if (i == 0) {
											indicatorshtml += '<button type="button" data-bs-target="#carouselFestivalCaptions"  class="active" aria-current="true" data-bs-interval="2000" data-bs-slide-to="' + i + '" aria-label="Slide ' + (i + 1) + '"></button>';
											innerhtml += '<div class="carousel-item active"><img src="' + value.firstimage + '" class="d-block w-100" alt="' + value.title + '" style="height:600px;"><div class="carousel-caption d-none d-md-block"><h4 style="text-shadow:1px 1px black;color:skyblue;">' + value.title + '</h4></div></div>';

											document.querySelector('.carousel-indicators').innerHTML = indicatorshtml;
											document.querySelector('.carousel-inner').innerHTML = innerhtml;
											i++;
										} else {
											indicatorshtml += '<button type="button" data-bs-target="#carouselFestivalCaptions" data-bs-slide-to="' + i + '"  data-bs-interval="2000" aria-label="Slide ' + (i + 1) + '"></button>';
											innerhtml += '<div class="carousel-item"><img src="' + value.firstimage + '" class="d-block w-100" alt="' + value.title + '" style="height:600px;"><div class="carousel-caption d-none d-md-block"><h4 style="text-shadow:1px 1px black;color:skyblue;">' + value.title + '</h4></div></div>';
											document.querySelector('.carousel-indicators').innerHTML = indicatorshtml;
											document.querySelector('.carousel-inner').innerHTML = innerhtml;
											i++;
										}
									}

								})
						}
					</script>
		</body>

		</html>