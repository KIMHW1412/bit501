<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jspf" %>

<style>
 textarea { resize:none; height:200px;}
</style>

<div class="container">

	<form class="form-horizontal" id="form1">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="text-center">
					에러페이지
				</h3>
			</div>
			<div class="panel-body">
				<div class="form-group">
					<label class="control-label col-sm-2">에러코드</label>
					<div class="col-sm-10">
						<textarea class="form-control" name="common/errorParam" rows="10" readonly>
						    HTTP상태코드 : 500에러결과
							권한이 없습니다
							로그인후 서비스를 이용하세요 	
						</textarea>
						<div align="center"> <img src="common/error2.gif"> </div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>