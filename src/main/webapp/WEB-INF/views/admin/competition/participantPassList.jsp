<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="list_field">
						<div class="list_menu">
							</span>
								<button id="checkPass">선택변경</button>
							</span>
						</div>
						<table class="list_table">
							<colgroup>
								<col width="40">
								<col width="45">
								<col width="220">
								<col width="100">
								<col width="220">
								<col width="80">
								<col width="80">
								<col width="120">
							</colgroup>
							<thead>
							<tr>
								<th>
									<label>
										<input type="checkbox" name="all_chk">
									</label>
								</th>
								<th>No</th>
								<th>ID</th>
								<th>이름</th>
								<th>연락처</th>
								<th>성별</th>
								<th>상태</th>
								<th>내용</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${passList}" var="pl">
							<tr>
								<td>
									<label>
										<input type="checkbox" class="checkPassList" name="passName" value="${pl.participantNo}">
									</label>
								</td>
								<td>${pl.participantNo}</td>
								<td>${pl.id}</td>
								<td>${pl.name}</td>
								<td>${pl.phone}</td>
								<td>
									${pl.gender}
								</td>
								<td>
									${pl.participantPass}
								</td>
								<td>
									${pl.participantContent}
								</td>
							</tr>
							</c:forEach>
							</tbody>  
						</table>
					</div>