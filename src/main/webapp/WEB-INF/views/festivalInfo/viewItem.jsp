<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=82febca4b29e4327a47c30d8e9856913"></script>

			<script src="https://code.jquery.com/jquery-3.6.3.slim.js"
				integrity="sha256-DKU1CmJ8kBuEwumaLuh9Tl/6ZB6jzGOBV/5YpNE2BWc=" crossorigin="anonymous"></script>
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
			<link rel="stylesheet" href="/resources/css/common.css">
			<style>
				.like_btn {
					width: 40px;
					height: 40px;

					background-color: transparent;
				}

				.like_btn.active svg {
					fill: red
				}
			</style>
		</head>

		<body>

			<!-- HEADER -->
			<%@ include file="/WEB-INF/views/common/header.jsp" %>
				<main>
					<div id="mainContent">
						<div class="float-start" style="width: 65%;">
							<div id="readyState" class="text-center"></div>
							<div id="mainContent" class="container text-center">
								<!-- 축제 정보 파트 -->
								<table class="table-borderless"
									style="margin-top: 100px; width: 80%; margin-left: 15%;">
									<tbody id="festivalInfo"></tbody>
								</table>
								<br>
								<!-- 썸네일 이미지 파트 -->
								<div id="thumbImgs"></div>
								<!-- 카카오 맵 파트 -->
								<div id="map" class="container" style="width:500px;height:400px;">
								</div>
							</div>
							<div>

								<button id="like" class="like_btn">
									<svg aria-label="좋아요" class="love" color="#262626" fill="#262626" height="24"
										role="img" viewBox="0 0 24 24" width="24">
										<path
											d="M16.792 3.904A4.989 4.989 0 0121.5 9.122c0 3.072-2.652 4.959-5.197 7.222-2.512 2.243-3.865 3.469-4.303 3.752-.477-.309-2.143-1.823-4.303-3.752C5.141 14.072 2.5 12.167 2.5 9.122a4.989 4.989 0 014.708-5.218 4.21 4.21 0 013.675 1.941c.84 1.175.98 1.763 1.12 1.763s.278-.588 1.11-1.766a4.17 4.17 0 013.679-1.938m0-2a6.04 6.04 0 00-4.797 2.127 6.052 6.052 0 00-4.787-2.127A6.985 6.985 0 00.5 9.122c0 3.61 2.55 5.827 5.015 7.97.283.246.569.494.853.747l1.027.918a44.998 44.998 0 003.518 3.018 2 2 0 002.174 0 45.263 45.263 0 003.626-3.115l.922-.824c.293-.26.59-.519.885-.774 2.334-2.025 4.98-4.32 4.98-7.94a6.985 6.985 0 00-6.708-7.218z">
										</path>
									</svg>
								</button>

								<span id="like_cnt">
									0
								</span>

							</div>

							<!-- 마이리스트 추가 -->
							<c:if test="${userInfo eq null}">
								<div>
									<!-- 비로그인 상태에서는 로그인 화면으로 이동 -->
									<button onclick="location.href='/views/my-list/'">마이리스트 추가</button>
								</div>
							</c:if>
							<c:if test="${userInfo ne null}">
								<div>
									<button onclick="insertMyList()" id="insertMyList">마이리스트 추가</button>
								</div>
							</c:if>

						</div>
						<!-- 관광지 파트 -->
						<div id="location" class="float-end container" style="width: 35%; margin-top:100px">
							<h2> 추천 주변 관광지</h2>
							<div id="readyStateLoc" class="text-center"></div>
						</div>
						<!-- float clear -->
						<div style="clear: both;"></div>
					</div>
					<!-- 댓글 시작 -->
					<hr />

					<div class="comment_subject">
						<h2>리뷰</h2>
					</div>

					<button onclick="showPopup();">리뷰 쓰기</button>

					<!-- 댓글 끝 -->
				</main>
				<!-- FOOTER -->
				<%@ include file="/WEB-INF/views/common/footer.jsp" %>
					<script src="/resources/js/common.js"></script>
					<script>
						/* 마이리스트 추가 */
						function insertMyList() {
							const param = {};
							param.uiNum = ${ userInfo.uiNum }
							param.fiNum = ${ param.fiNum }
							fetch('/my-lists', {
								method: 'POST',
								headers: {
									'Content-Type': 'application/json'
								},
								body: JSON.stringify(param)
							})
								.then(function (res) {
									return res.json();
								})
								.then(function (data) {
									console.log(data);
									if (data === 1) {
										alert('등록 완료');
									} else {
										alert('등록 취소');
										deleteMyList();
									}
								})
						}

						/* 마이리스트 삭제 */
						function deleteMyList() {
							fetch('/my-lists/${param.fiNum}', {
								method: 'DELETE'
							})
								.then(function (res) {
									console.log(res);
									return res.json();
								})
								.then(function (data) {
									if (data === 1) {
									} else {
										alert('취소 실패!');
									}
								});
						}

						function getLikeCount() {
							fetch("/festival/like/count/${param.fiNum}")
								.then((response) => {

									if (!response.ok) {
										// create error object and reject if not a 2xx response code
										let err = new Error("HTTP status code: " + response.status)
										err.response = response
										err.status = response.status
										throw err
									}

									console.log("response", response);
									return response.text();

								})
								.then((res) => { // 좋아요 개수 가져오기
									document.getElementById('like_cnt').innerHTML = res;
								})
								.catch((err) => {
									console.log("좋아요 개수 가져오기 에러", err);
								})

						}


						fetch("/festival/like/state/${param.fiNum}")
							.then((response) => {

								if (!response.ok) {
									// create error object and reject if not a 2xx response code
									let err = new Error("HTTP status code: " + response.status)
									err.response = response
									err.status = response.status
									throw err
								}

								return response.text();

							})
							.then((result) => {
								console.log("result", result);

								const likeBtn = $("#like");

								if (result === "ACTIVE") likeBtn.addClass("active");

								if (result === "UN_ACTIVE") likeBtn.removeClass("active");

								getLikeCount();
								// 좋아요 개수 가져오기


							})
							.catch((error) => {

								console.error('실패:', error);
								alert("좋아요 상태 가져오지 못함");
							});


						document.getElementById("like").addEventListener('click', function () {
							console.log("handle like button");
							// 좋아요 로직 구현

							fetch("/festival/like/${param.fiNum}", {
								method: "PUT",
							})
								.then((response) => {

									if (!response.ok) {
										// create error object and reject if not a 2xx response code
										let err = new Error("HTTP status code: " + response.status)
										err.response = response
										err.status = response.status
										throw err
									}

									return response.text();

								})
								.then((result) => {

									const likeBtn = $("#like");

									if (result === "INSERT") likeBtn.addClass("active");

									if (result === "DELETE") likeBtn.removeClass("active");

									getLikeCount(); // 좋아요 개수 가져오기


								})
								.catch((error) => {
									alert("로그인을 해주시길 바랍니다");
								});

						})

						window.onload = function () {
							const ready = document.querySelector('#readyState');
							ready.innerHTML = '<div class="spinner-border text-primary" role="status"><span class="visually-hidden">Loading...</span></div>';
							fe("/festival-info/${param.fiNum}")
								.then(jsonData => {
									console.log(jsonData)
									if (jsonData.status === 500) {
										alert('잘못된 요청입니다.');
										location.replace("/");
										return;
									}
									let html = '';
									const fest = jsonData;
									if (!fest) {
										ready.insertAdjacentHTML("afterbegin", '<div class="alert alert-danger" role="alert" onclick="location.reload()">페이지를 불러오는 데 실패하였습니다. 접속한 페이지의 주소가 맞다면, <b>새로고침</b> 해주세요.</div>');
										return;
									}
									if (fest.firstimage) {
										html += '<tr><td colspan=2><img src="' + fest.firstimage + '" class="img-fluid"></td></tr>';
									}
									html += '<tr><td width="200px">축제명</td><td>' + fest.title + '</td></tr>';
									html += '<tr><td>위치</td><td>' + fest.addr1;
									if (fest.addr2) {
										html += ' ' + fest.addr2;
									}
									html += '</td></tr>';
									html += '<tr><td>시작일</td><td>' + fest.eventstartdate.substr(0, 4) + '년 ' + fest.eventstartdate.substr(4, 2) + '월 ' + fest.eventstartdate.substr(6, 2) + '일' + '</td></tr>';
									html += '<tr><td>종료일</td><td>' + fest.eventenddate.substr(0, 4) + '년 ' + fest.eventenddate.substr(4, 2) + '월 ' + fest.eventenddate.substr(6, 2) + '일' + '</td></tr>';
									html += '<tr><td>전화번호</td><td>' + fest.tel + '</td></tr>';

									document.querySelector('#festivalInfo').innerHTML = html;
									document.querySelector('title').insertAdjacentText("beforeend", ' - ' + fest.title);
									ready.remove();
									const readyLoc = document.querySelector('#readyStateLoc');

									//상세정보 불러오기
									readyLoc.innerHTML = '<div class="spinner-border text-primary" role="status"><span class="visually-hidden">Loading...</span></div>';
									let url = "contentid=" + fest.contentid + "&mapx=" + fest.mapx + "&mapy=" + fest.mapy
									fe("/festival-details?" + url)
										.then(detailData => {
											const deatilFest = detailData.festivalInfo;
											html = '';
											if (deatilFest) {
												if (deatilFest.telname) {
													html += '<tr><td>받는 이</td><td>' + deatilFest.telname + '</td></tr>';
												}
												if (deatilFest.homepage) {
													html += '<tr><td>홈페이지</td><td>' + deatilFest.homepage + '</td></tr>';
												}
												if (deatilFest.overview) {
													html += '<tr><td colspan=2>' + deatilFest.overview + '</td></tr>';
												}
												document.querySelector('#festivalInfo').insertAdjacentHTML("beforeend", html);
											}
											if (detailData.festivalImages != null && detailData.festivalImages.length !== 0) {
												const fesPictures = detailData.festivalImages;
												let imghtml = '';
												if (fesPictures.length >= 1) {
													for (let fesPicture of fesPictures) {
														imghtml += '<img src="' + fesPicture.originimgurl + '" width="180px" height="180px" title="' + fesPicture.imgname + '" class="img-thumbnail">';
													}
												}
												document.querySelector('#thumbImgs').insertAdjacentHTML('beforeend', imghtml);
											}
											if (detailData.locationInfo) {
												html = '<ul class="list-group">';
												const locations = detailData.locationInfo;
												for (let location of locations) {
													html += '<li class="list-group-item"><img src="'
													if (location.firstimage2) {
														html += location.firstimage2;
													} else {
														html += '/resources/images/noimg.jpg'
													}
													html += '" width="100px"><br>' + location.title + '<br><a href="https://map.kakao.com/link/to/' + location.title + ',' + location.mapy + ',' + location.mapx + '" target="_blank"> 위치 :' + location.addr1 + '</a></li>';
												}
												html += '</ul>';
											} else {
												html = '<br><h3>해당하는 관광지를 찾을 수 없습니다.</h3>';
											}
											document.querySelector('#location').insertAdjacentHTML('beforeend', html);
											readyLoc.remove();
										})
									var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
									if (fest.mapx != 0) {
										if (fest.mlevel != "") {
											mlevel = fest.mlevel;
										} else {
											mlevel = 4;
										}
										var options = { //지도를 생성할 때 필요한 기본 옵션
											center: new kakao.maps.LatLng(fest.mapy, fest.mapx), //지도의 중심좌표.
											level: mlevel //지도의 레벨(확대, 축소 정도)
										};

										var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

										// 마커가 표시될 위치입니다 
										var markerPosition = new kakao.maps.LatLng(fest.mapy, fest.mapx);

										// 마커를 생성합니다
										var marker = new kakao.maps.Marker({
											position: markerPosition
										});

										// 마커가 지도 위에 표시되도록 설정합니다
										marker.setMap(map);
										var iwContent = '<div style="padding:5px;">' + fest.title + ' <br><a href="https://map.kakao.com/link/to/' + fest.title + ',' + fest.mapy + ',' + fest.mapx + '" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
											iwPosition = new kakao.maps.LatLng(fest.mapy, fest.mapx); //인포윈도우 표시 위치입니다

										// 인포윈도우를 생성합니다
										var infowindow = new kakao.maps.InfoWindow({
											position: iwPosition,
											content: iwContent
										});

										// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
										infowindow.open(map, marker);
									} else {
										document.querySelector('#map').remove();
									}
								});

						}

						//리뷰쓰기 
						function showPopup() { window.open("commentRegist", "a", "width=600, height=700, left=300, top=300, scrollbars=yes"); }

					</script>
		</body>

		</html>