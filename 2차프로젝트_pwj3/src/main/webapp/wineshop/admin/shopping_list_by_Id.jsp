<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="top.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <h5 class="card-header">주문 내역 조회</h5>
                <div class="card-body">
                    <form action="adminOrderList.jsp" method="get">
                        <div class="form-group">
                            <label for="customerId">고객 ID 입력:</label><br>
                            <input type="text" class="form-control" id="customerId" name="customerId" required><br>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary btn-block">조회하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="bottom.jsp" %>
