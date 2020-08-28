<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>방명록 - 작성하기</title>
<style type="text/css">
	h2 { text-align: center; }
	div { text-align: center; margin: 20px auto; }
	table { width: 550px; margin: 0px auto; border-collapse: collapse; }
	table, tr, th, td { border: 1px solid black; padding: 10px; }
	thead { background-color: #55aaff; }
	fieldset { width: 300px; }
	.link { text-align: center; }
	.content { margin: 10px; }
	.pre { text-align: justify; }
</style>
<script type="text/javascript">
	function update_ok(f) {
		// 비밀번호 검사
		if("${vo.pwd}" == f.pwd.value) {
			f.action="update_ok.do";
			f.submit();
		} else {
			alert("비밀번호가 틀렸습니다. 다시 입력해주세요");
			f.pwd.value="";
			f.pwd.focus();
			return;
		}
	}
</script>
</head>

<body>
	<div align="center">
		<h2>방명록 : 작성화면</h2>
		<hr />
		<p>
			[<a href="list.do">목록으로 이동</a>]
		</p>
		<form method="post">
			<table>
				<tr align="center">
					<td bgcolor="#99ccff">작성자</td>
					<td><input type="text" name="name" size="20" value="${vo.name}" disabled="disabled"/></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">제 목</td>
					<td><input type="text" name="subject" size="20" value="${vo.subject}" /></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">이메일</td>
					<td><input type="text" name="email" size="20" value="${vo.email}" /></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">비밀번호</td>
					<td><input type="password" name="pwd" size="20" /></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<textarea rows="10" cols="60" name="content">${vo.content}</textarea>
					</td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="2">
							<input type="button" value="저장" onclick="update_ok(this.form)"> &nbsp; 
							<input type="reset" value="취소">
							<input type="hidden" name="idx" value="${vo.idx}">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>