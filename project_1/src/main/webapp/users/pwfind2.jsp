<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
    $(function() {
    	$('#pw-find-btn').click(function() {
    		let id = $('#id').val();
    		let answer = $('#answer').val();
            if (answer.trim() == "") {
                $('#answer').focus();
                return;
            }
            
            $.ajax({
                type : 'post',
                url : '../users/pwfind2_result.do',
                data : {
                    "id" : id,
                    "answer" : answer
                },
                success : function(result) {
                    let res = result.trim();
                    if (res == 'no') {
                        $('#pwdfind').html('<div class="m-top-120">질문과 정답이 일치하지 않습니다</div>');
                        $('#ok').show();
                    } else {
                    	$('#pwdfind').html('<div class="m-top-120">가입하신 이메일로 임시 비밀번호를 발급해드렸습니다.<br>이메일을 확인해주세요.<div>');
                        $('#ok').show();
                    }
                }
            })
    	})
    });
</script>

<div class=""><h4><b>질문 답변</b></h4></div>
<input type=hidden id="id" value="${id }">
<div class=roomy-10><b>질문:</b> ${question }</div>
<div class=roomy-10><b>정답:</b> <input type=text size=20 id="answer" placeholder="정답"></div>
<div class=roomy-20><input type="submit" class="btn btn-primary" id="pw-find-btn" value="제  출"></div>
    