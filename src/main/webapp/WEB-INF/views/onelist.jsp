<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>방명록 - ${vo.name}</title>
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
	function update_go(f) {
		f.action = "update.do";
		f.submit();
	}
	function delete_go(f) {
		f.action = "delete.do";
		f.submit();
	}
</script>
</head>

<body>
	<div align="center">
		<h2>방명록 : 상세화면</h2>
		<hr>
		<p>
			[<a href="list.do">목록으로 이동</a>]
		</p>
		<form method="post">
			<table>
				<tr align="center">
					<td bgcolor="#99ccff">작성자</td>
					<td>${vo.name}</td>
					</tr>
				<tr align="center">
					<td bgcolor="#99ccff">제목</td>
					<td>${vo.subject}</td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">이메일</td>
					<td>${vo.email}</td>
				</tr>
				<tr align="center">
					<td colspan="2"><pre>${vo.content}</pre></td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="2">
							<input type="button" value="수정" onclick="update_go(this.form)"> &nbsp; 
							<input type="reset" value="삭제" onclick="delete_go(this.form)">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>	
					
					