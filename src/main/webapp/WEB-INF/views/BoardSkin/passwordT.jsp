<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./commons/header.jsp" %>
<body> 
<script type="text/javascript">
function checkValidate(f){
	if(f.pass.value==""){
		alert("패스워드를 입력하세요");
		f.pass.focus();
		return false;
	}
}
</script>
<div class="container">
	<span style="color:red; font-size:1.8em;">
		${isCorrMsg }
	</span>	
    <!-- Top영역 -->
    <%@ include file="./commons/top.jsp" %>
    <!-- Body영역 -->
    <div class="row">
        <!-- Left메뉴영역 -->
        <%@ include file="./commons/left.jsp" %>
        <!-- Contents영역 -->
        <div class="col-9 pt-3">
            <h3>게시판 작성 - <small>자유게시판</small></h3>
            
            <form name="writeFrm" method="post" 
				action="./passwordAction.do"
				onsubmit="return checkValidate(this);">
			<input type="hid den" name="idx" value="${idx }" />
			<input type="hid den" name="mode" value="${param.mode }" />
			<input type="hid den" name="nowPage" value="${param.nowPage }" />	
            <table class="table table-bordered">
            <colgroup>
                <col width="20%"/>
                <col width="*"/>
            </colgroup>
            <tbody>
                <tr>
                    <th class="text-center" 
                        style="vertical-align:middle;">패스워드</th>
                    <td>
                        <input type="password" name="pass" class="form-control" 
                            style="width:200px;" />
                    </td>
                </tr>
            </tbody>
            </table>

            <!-- 각종버튼 -->
            <div class="row mb-3">
                <div class="col d-flex justify-content-end">
                    <button type="button" class="btn btn-warning" onclick="location.href='listT.jsp';">목록보기</button>
                    <button type="submit" class="btn btn-danger">전송하기</button>
                    <button type="reset" class="btn btn-dark">다시쓰기</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- Copyright영역 -->
<%@ include file="./commons/copyright.jsp" %>
</div>
</body>
</html>