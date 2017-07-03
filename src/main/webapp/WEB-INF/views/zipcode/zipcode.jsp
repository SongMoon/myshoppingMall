<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal fade" id="zip_codeModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h3 class="modal-title" id="myModalLabel">우편번호</h3>
            </div>    
            <div class="modal-body text-center">
                 <form id = "zip_codeForm">
                         <div class = "input-group">
                            <span class = "input-group-addon">동 입력</span>
                            <input type="text" class = "form-control" name="query" id="query">
                            <span class = "input-group-btn">                                                
                                <input type="submit" class = "btn btn-warning" value="검색" id="searchBtn" onkeydown="javascript:if(event.keyCode==13)">                                            
                            </span>
                        </div>
                </form>
                <p>
                </p>
                <div>
                <div style="width:100%; height:200px; overflow:auto">
                       <table class = "table text-center">
                        <thead>
                            <tr>
                                <th style="width:150px;">우편번호</th>
                                <th style="width:600px;">주소</th>
                                </tr>
                        </thead>
                        <tbody id="zip_codeList"></tbody>
                    </table>
                </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script>
	$(function() {
		$('#searchBtn').click(function(e) {
			e.preventDefault();

			$.ajax({
				url : '<c:url value="/zipcode/list"/>',
				data : $('form').serialize(),
				type : 'POST',
				dataType : 'json',
				success : function(result) {

					$("#zipcodeList").empty();

					var html = '';

					if (result.errorCode != null && result.errorCode != '') {
						html += '<tr>';
						html += '   <td colspan="2">';
						html += result.errorMessage;
						html += '   <td>';
						html += '</tr>';

					} else {
						var list = result.list;

						for (var i = 0; i < list.length; i++) {
							html += '<tr>';
							html += '   <td>';

							var zipcode = list[i].zipcode;

							if (zipcode != null && zipcode.length > 5) {
								var preZipcode = zipcode.substring(0, 3);
								var afterZipcode = zipcode.substring(3, 6);

								zipcode = preZipcode + '-' + afterZipcode;
							}

							html += zipcode;
							html += '   </td>';
							html += '   <td>';

							if (list[i].lnmAddress != null && list[i].lnmAddress != '') {
								html += list[i].lnmAddress;
								html += '   <br/>';
							}

							html += list[i].address;
							html += '   </td>';
							html += '</tr>';
						}
					}

					$("#zipcodeList").append(html);
				}
			});
		});
	});
</script>