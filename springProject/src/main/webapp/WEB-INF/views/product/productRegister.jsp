<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<style>
	.ck-editor__editable_inline{
		min-height:250px;
		width: 400px;
	}
	
	textarea {
	width: 400px;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/uploadAdapter.js"></script>
<script>
	$(function(){
		function getSubCategory(c_top_no){
			$.ajax({
				url:'getSubCate.do',
				type:'post',
				data:{c_top_no:c_top_no},
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					var output =''
					$(param.list).each(function(index,item){
						output+= '<option value="'+ item.c_sub_no +'">' + item.c_sub_name + '</option>';
					});
					$('#c_sub_no').html(output);
				},
				error:function(){
					checkId = 0;
					alert('네트워크 오류 발생');
				}
			}); //end if ajax
		}
		
		$('#c_top_no').change(function(){
			getSubCategory($(this).val());
		});
		
		
		getSubCategory($('#c_top_no').children().first().val());
	})
</script>
<!-- 중앙 내용 시작 -->
<div class="page-main">
	<h2>상품 등록 페이지</h2>
	<form:form id="register_form" action="productRegister.do" modelAttribute="productVO"
	           enctype="multipart/form-data">
	    <form:errors element="div" cssClass="error-color"/>       
		<ul>
			<li>
				<label for="p_name">상품명</label>
				<form:input path="p_name"/>
				<form:errors path="p_name" cssClass="error-color"/>
			</li>
			<li>
				<label for="p_amount">재고 수량</label>
				<form:input path="p_amount"/>
				<form:errors path="p_amount" cssClass="error-color"/>
			</li>
			<li><b>상품 설명</b></li>
			<li>
				<form:textarea path="p_sub_text"/>
				<form:errors path="p_sub_text" cssClass="error-color"/>
				<script>
					function MyCustomUploadAdapterPlugin(editor){
						editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
							return new UploadAdapter(loader);
						}
					}
					
					ClassicEditor.create(document.querySelector('#p_sub_text'),{
						extraPlugins:[MyCustomUploadAdapterPlugin]
					}).then(editor => {
						window.editor = editor;
					}).catch(error => {
						console.error(error);
					});
				</script>
			</li>
			<li>
				<label for="upload">상품 대표 이미지</label>
				<input type="file" name="upload" id="upload" accept="image/gif,image/png,image/jpeg">
			</li>
			<li>
				<label for="p_price">상품 가격</label>
				<form:input path="p_price"/>
				<form:errors path="p_price" cssClass="error-color"/>
			</li>
			<li>
				<label for="p_discount">할인율</label>
				<form:input path="p_discount"/>
				<form:errors path="p_discount" cssClass="error-color"/>
			</li>
			<li>
				<label for="c_top_no">상위카테고리 번호</label>
				<form:select path="c_top_no">
				<c:forEach var="top" items="${topList}">
					<option value="${top.c_top_no}">${top.c_top_name}</option>
				</c:forEach>
				</form:select>
				<form:errors path="c_top_no" cssClass="error-color"/>
			</li>
			<li>
				<label for="c_sub_no">하위카테고리 번호</label>
				<form:select path="c_sub_no">
				</form:select>
				<form:errors path="c_sub_no" cssClass="error-color"/>
			</li>
			
		</ul>
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="목록" onclick="location.href='list.do'">
		</div>	
	</form:form>
</div>
<!-- 중앙 내용 끝 -->