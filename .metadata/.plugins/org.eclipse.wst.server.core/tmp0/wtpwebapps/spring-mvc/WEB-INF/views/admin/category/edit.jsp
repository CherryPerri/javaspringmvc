<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="categoryURL" value="/quan-tri/the-loai/danh-sach"></c:url>
<c:url var="editCategoryURL" value="/quan-tri/the-loai/chinh-sua"></c:url>
<c:url var="categoryAPI" value="/api/category"></c:url>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chỉnh sửa bài viết</title>
</head>

<body>
<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try {
					ace.settings.check('breadcrumbs', 'fixed')
				} catch (e) {
				}
			</script>

			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
				</li>

				<li><a href="#">Forms</a></li>
				<li class="active">Form Elements</li>
			</ul>
			<!-- /.breadcrumb -->
		</div>
		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<c:if test="${not empty message}">
						<div class="alert alert-${alert}">
							${message}
						</div>
					</c:if>
					
					<form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="model">						
					
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right"	for="form-field-1"> Code thể loại (vd: abc-xyz) </label>
							<div class="col-sm-9">
								<form:input path="code" cssClass="col-xs-10 col-sm-5"/>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right"	for="form-field-1"> Tên thể loại </label>
							<div class="col-sm-9">
								<form:input path="code" cssClass="col-xs-10 col-sm-5"/>
							</div>
						</div>
						
						<form:hidden path="id" id="categoryId"/>
						<div class="clearfix form-actions">
							<div class="col-md-offset-3 col-md-9">
								<c:if test="${not empty model.id}">
									<button class="btn btn-info" type="button" id="btnAddOrUpdateCategory">
										<i class="ace-icon fa fa-check bigger-110"></i>
										Cập nhật thể loại
									</button>
								</c:if>
								<c:if test="${empty model.id}">
									<button class="btn btn-info" type="button" id="btnAddOrUpdateCategory">
										<i class="ace-icon fa fa-check bigger-110"></i>
										Thêm thể loại
									</button>
								</c:if>
								

								&nbsp; &nbsp; &nbsp;
								<button class="btn" type="reset">
									<i class="ace-icon fa fa-undo bigger-110"></i>
									Hủy
								</button>
							</div>
						</div>						
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$('#btnAddOrUpdateCategory').click(function (e) {
    e.preventDefault();
    var data = {};
    var formData = $('#formSubmit').serializeArray();
    $.each(formData, function (i, v) {
        data[""+v.name+""] = v.value;
    });
    var id = $('#categoryId').val();
    if (id == "") {
    	addCategory(data);
    } else {
    	updateCategory(data);
    }
});

function addNew(data) {
	$.ajax({
        url: '${categoryAPI}',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(data),
        dataType: 'json',
        success: function (result) {
        	window.location.href = "${editCategoryURL}?id="+result.id+"&message=insert_success";
        },
        error: function (error) {
        	window.location.href = "${categoryURL}?page=1&limit=2&message=error_system";
        }
    });
}

function updateNew(data) {
	$.ajax({
        url: '${categoryAPI}',
        type: 'PUT',
        contentType: 'application/json',
        data: JSON.stringify(data),
        dataType: 'json',
        success: function (result) {
        	window.location.href = "${editCategoryURL}?id="+result.id+"&message=update_success";
        },
        error: function (error) {
        	window.location.href = "${editCategoryURL}?id="+result.id+"&message=error_system";
        }
    });
}
	
</script>
</body>

</html>