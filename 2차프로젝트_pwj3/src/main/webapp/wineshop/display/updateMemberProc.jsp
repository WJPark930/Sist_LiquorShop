<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="wine.member.MemberDao" %>
<%@ page import="wine.member.MemberDTO" %>

<%
    // 한글 문자열 처리를 위해 인코딩 설정
    request.setCharacterEncoding("UTF-8");

    // 세션에서 회원 ID 가져오기
    String id = (String) session.getAttribute("memid");
    Integer no = (Integer) session.getAttribute("memno");

    // 회원 정보가 없으면 실패 처리
    if (id == null) {
        String msg = "수정 실패 - 회원 정보를 찾을 수 없습니다.";
        String url = "mypage.jsp"; // 회원 정보를 찾을 수 없는 경우 마이페이지로 이동하거나 다른 페이지로 이동시킬 수 있음
%>
        <script>
            alert("<%=msg%>");
            location.href="<%=url%>";
        </script>
<%
        return; // 회원 정보가 없으므로 종료
    }

    // DAO 객체 생성
    MemberDao mdao = MemberDao.getInstance();

    // 회원 정보 DTO 생성 및 설정
    MemberDTO mb = new MemberDTO();
    mb.setId(id); 
    mb.setNo(no);
    mb.setName(request.getParameter("name"));
    mb.setPassword(request.getParameter("password"));
    mb.setEmail(request.getParameter("email"));
    mb.setCard(request.getParameter("card"));
    mb.setAddr(request.getParameter("addr"));
    mb.setSubaddr(request.getParameter("subaddr"));
    mb.setJoindate(request.getParameter("joindate"));
    mb.setHp1(request.getParameter("hp1"));
    mb.setHp2(request.getParameter("hp2"));
    mb.setHp3(request.getParameter("hp3"));

    // 회원 정보 업데이트
    int cnt = mdao.updateMember(mb);

    // 업데이트 결과에 따라 메시지 및 페이지 이동
    String msg, url;
    if (cnt > 0) {
        msg = "수정 성공";
        url = "mall.jsp";
    } else {
        msg = "수정 실패";
        url = "mypage.jsp";
    }
%>
<script>
    alert("<%=msg%>");
    location.href="<%=url%>";
</script>
