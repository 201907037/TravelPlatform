<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- 온라인 방식 -->
    <style>

        .msg-wrap{
            margin: 50px;
        }
 
        div {
            /* border: 1px solid red; */
        }

        #webSocket {
            width: 100%;
            display: flex;
            justify-content: space-between;
        }

        /* 가이드라인 영역 */
        #webSocketContent1{
            width: 20%;
            height: 100%;
            border: 0.5px solid lightgray;
            padding: 30px;
            border-radius: 10px;
            
        }

        /* 채팅방 영역 */
        #webSocketContent2{
            width: 80%;
            height: 100%;
        }

        
        #message_wrap {
            height: 900px;
            box-sizing: border-box;
        }

        /* 모달시 사용 */
        #profile_img {
            width: 250px;
            height: 250px;
            margin: auto;
        }

        #profile_name {
            font-size: large; font-weight: 600;
        }

        /* 채팅방 테두리 영역 */
        #message_text {
            width: 50%;
            height: 90%;
            margin: auto;
            
        }
        
        /* 메세지가 보이는 영역 */
        .msg_view {
            width: 100%;
            height: 85%;
            box-sizing: border-box;
            border-top-left-radius : 30px;
            border-top-right-radius : 30px;
            overflow-y: auto; /* 세로 스크롤 추가 */
            background-image: url(https://search.pstatic.net/common/?src=http%3A%2F%2Fpost.phinf.naver.net%2FMjAyMDA3MTRfOCAg%2FMDAxNTk0NzAyMDg3ODMy.zhsHqXOolG3axCwoGy4vxQvE8d3jzXd7LLQpJBNsUwEg.KyGvipiDYvZGdXF8vn6n69pXaFT3jsd7gyZtUE7xFskg.PNG%2FIhLmKCQTubpq_hjMWOh2ZN8XiQBM.jpg&type=sc960_832);
        }

        #msg_send {
            width: 100%;
            height: 15%;
            box-sizing: border-box;
            border-bottom-left-radius : 30px;
            border-bottom-right-radius : 30px;
        }

        #msg_send {
            display: flex;
            justify-content: space-between;
        }
        
        /* 전송버튼 */
        #msg_input_input{
            border-bottom-left-radius : 30px;
        }
        #msg_button_input {
            border-bottom-right-radius : 30px;
        }

        
        /* 이미지 원형모양 스타일 */
        .circle-image {
            width: 50px; /* 원하는 크기로 설정하세요 */
            height: 50px; /* 원하는 크기로 설정하세요 */
            border-radius: 50%;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 0;
        }
        
        .circle-image img {
            width: 100%;
            height: 100%;
        }

        /* 이미지 td 상단에 배치 */
        .msg_view td {
            vertical-align: top; /* Ensure the td content aligns to the top */
        }

        /* 말풍선 스타일 */
       .message {
            position: relative;
            background-color: #f6f6f6;
            border-radius: 10px;
            padding: 10px;
            margin-top: 4px;
            display: inline-block;
            margin-left: 10px;
            max-width: 300px;
            word-wrap: break-word;
            min-height: 20px;
        }
        .message::before {
            content: '';
            position: absolute;
            top: 6px; /* 말풍선 꼬리의 세로 위치 */
            left: -11px; /* 말풍선 꼬리의 가로 위치 */
            width: 0;
            height: 0;
            border-style: solid;
            border-width: 0px 20px 10px 0;
            border-color: transparent #f6f6f6 transparent transparent; /* 꼬리의 색상 설정 */
        }

        .my_msg {
            display: flex;
            justify-content: flex-end;
            align-items: flex-start;
            margin-bottom: 10px;
        }
        
        /* --------my Msg-------- */
        .chat-container {
            display: flex;
            justify-content: flex-end;
            align-items: flex-start;
            margin-bottom: 10px;
        }

        .profile-section {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-left: 10px;
        }

        .profile-image {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            overflow: hidden;
        }

        .profile-image img {
            width: 100%;
            height: 100%;
        }

        .chat-message {
            position: relative;
            background-color: #F9EB54;
            border-radius: 10px;
            padding: 10px;
            margin-top: 4px;
            display: inline-block;
            max-width: 300px;
            word-wrap: break-word;
            margin-right: 10px;
            
        }

        .chat-message::before {
            content: '';
            position: absolute;
            top: 6px; /* 말풍선 꼬리의 세로 위치 */
            right: -11px; /* 말풍선 꼬리의 가로 위치 */
            width: 0;
            height: 0;
            border-style: solid;
            border-width: 0px 0 10px 20px;
            border-color: transparent transparent transparent #F9EB54; /* 꼬리의 색상 설정 */
        }

        .name-section {
            font-weight: bold;
            margin-bottom: 5px;
            padding-right: 10px;
        }

        /* 오른쪽 말풍선 부모요소 */
        .tdtd {
            display: flex;
            justify-content: flex-end;
        }

        /* 메시지 보낸시간 */
        .msg_time {
            vertical-align: bottom;
            font-size: small;
            font-weight: 100;
        }

        .myMsg_time {
            margin-top: auto;
            font-size: small;
            font-weight: 100;
            padding-right: 5px;
        }
    </style>

</head>
<body>

<jsp:include page="../common/header1.jsp"></jsp:include>
    <br><br><br><br><br><br><br><br><br>
    
    
    <div class="msg-wrap">
        <div id="webSocket">
            <div id="webSocketContent1" style="text-align: center; margin-top: 100px;">
                <h2>채팅방 가이드 라인 </h2>
                <br>
                <h5><b>오픈채팅방 운영 시간 : 오전 9시~오후 8시</b> <br><br>
                    • 부득이한 경우가 아니라면 이른 아침 시간, 저녁 늦은 시간 대화는 지양해주세요.
                    <br><br>
                    • 참여자들 사이에 자유로이 의견을 나눌 수 있지만, 타인의 의견을 존중하고 예의를 지켜주세요.
                    <br><br>
                    • 논쟁과 토론을 위한 방이 아니므로 자신의 의견을 반복해서 올리는 것은 삼가주세요.   
                    <br><br>
                    • 동의없이 오픈카톡방의 대화를 캡쳐하여 다른 곳에 가져가는 일은 삼가주세요.
                    <br><br>
                    • 차별 및 혐오에 기반한 발언, 타인을 조롱하거나 모욕하는 언행을 하는 경우에는 관리자에 의해 제지 및 퇴장조치 될 수 있습니다.
                    <br><br> 
                    • 기본적으로 관리자들이 오픈채팅방을 운영하지만, 다른 참여자들도 오픈카톡방의 활성화와 안정적인 운영을 위해 함께 참여해주시면 고맙겠습니다 🙂 
                </h5>
                
            </div>
            <div id="webSocketContent2" >
            	<div align="center" style="padding-right: 300px;">
	            	<button onclick="connect();">접속</button>	
					<button onclick="disconnect();">종료</button>
				</div>
                <div id="message_wrap">
                    <br><br>
                    <div id="message_text" style="margin-left: 200px;">
                        <div class="msg_view">

                            <br>
                            <div class="chat-container2">
                                <div style="text-align: center;">
                                <span>&nbsp;-뚱이님이 입장하셨습니다.-</span>
                                </div>
                                <br><br>
                                
                                
                                <table>
                                    <tr>
                                        <td rowspan="2" style="padding-left: 20px;">
                                            <div class="circle-image" data-toggle="modal" data-target="#profile">
                                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSirGOkvAvFHbOyiPbnwrcOqo0z1V2jQnIDxg&s">
                                        </div>
                                        </td>
                                        <td class="name-section">
                                            &nbsp;뚱이
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="message">
                                                안녕 난 뚱이야
                                            </div>
                                        <span class="msg_time">오후 6:13</span>
                                        </td>
                                    </tr>
                                    
                                </table>
                            </div>

                            <div class="chat-container">
                                <table>
                                    <tr>
                                        <td class="name-section" align="right">
                                            스폰지밥
                                        </td>
                                        <td rowspan="2" style="padding-right: 20px;">
                                            <div class="profile-image" data-toggle="modal" data-target="#profile">
                                                <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAxMTFfMjgz%2FMDAxNjEwMzM1OTQ0MzY3.RrSNHO5Dsg_GzmFrvvSrfjy89rsWNfi493yjXfMj1qcg.FWfE7pbHa-oz2Ns02MgLIdkCkERE95We1bxltzYN1Y0g.JPEG.wowmj95%2Foutput_3923337412.jpg&type=sc960_832" alt="Profile Image">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td class="tdtd">
                                            <span class="myMsg_time">오후 7:13</span>
                                            <div class="chat-message">
                                                안녕하세요 뜨뽄디밥이에요~ ㅎㅎㅎ
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <div class="chat-container2">
                                <table >
                                    <tr>
                                        <td rowspan="2" style="padding-left: 20px;">
                                            <div class="circle-image" data-toggle="modal" data-target="#profile">
                                            <img src="https://i.namu.wiki/i/LcDH2U_aJZzFaTNE6pNoRsSFZ-DgCc0C0fnh-9OQ5sIZ2raVrp5kcxr4D4zaW91sIXrIzZe4MZ8v74qMUEsloA.webp">
                                        </div>
                                        </td>
                                        <td class="name-section">
                                            &nbsp;마징징
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="message">
                                                하하하하하하하하하하하하하하하하하하하하하하하하하하하하하하하하하하하하
                                            </div>
                                            <span class="msg_time">오후 8:20</span>
                                        </td>
                                    </tr>
                                </table>
                            </div>


                            
                        </div>
                        <div id="msg_send">
                            
                            <div id="msg_input" style="width: 80%; height: 100%; display: inline-block;">
                                <input id="msg_input_input" type="text" value="" style="width: 100%; height: 100%; box-sizing: border-box; border: 2px solid rgb(233, 233, 233);">
                            </div>
                            <div id="msg_button" style="width: 20%; height: 100%;">
                                <input id="msg_button_input" type="submit" style="width: 100%; height: 100%; background-color: rgb(233, 233, 233);; border: 1px solid rgb(233, 233, 233);" value="보내기">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<script>
			
		let socket; // 웹소켓 객체 생성
		
	
		// 웹소켓 서버 접속 함수
		function connect() {
		    // 접속할 웹소켓의 주소를 넘기면서 자바스크립트의 WebSocket 객체 생성
		    let url = "ws://localhost:8006/travely/ws/msgPage.mg";
		    socket = new WebSocket(url); // Connection Established
	
		    console.log(socket);
		    // 이벤트 핸들러 함수 정의
		    // onopen : 소켓 연결 성공 시 실행할 함수
		    socket.onopen = function() {
		        console.log("서버와 연결 되었습니다.");
		    };
	
		    // onclose : 소켓 연결 종료 시 실행할 함수
		    socket.onclose = function() {
		        console.log("서버와 연결이 종료되었습니다.");
		    };
	
		    // onerror : 소켓 연결 실패 (연결 오류 발생)시 실행할 함수
		    socket.onerror = function() {
		        console.log("서버 연결 과정에서 오류가 발생했습니다.");
		    };
	
		    // onmessage : 메세지 수신 시 실행할 함수
		    socket.onmessage = function(e) {
		        // console.log(e.data);
		       
		        let uno = "${sessionScope.loginUser.userNo}"
		        
		        console.log(uno);
		        
		        let obj = JSON.parse(e.data);
		        
		        let data = '';
				// console.log(obj);
		        if (obj.msgContent.includes("님이 입장하셨습니다.")) {
		        	data += '<br>';
		            data += '<div style="text-align: center;">';
		            data += '<span>&nbsp;-' + obj.msgContent + '-'+ obj.msgTime +'</span>';
		            data += '</div>';
		            data += '<br>';
		        } else if(obj.userNo == uno) { 
		        		 data += '<div class="chat-container">';
				         data += '    <table>';
				         data += '        <tr>';
				         data += '            <td class="name-section" align="right">';
				         data += '                '+ obj.nickName +'';
				         data += '            </td>';
				         data += '            <td rowspan="2" style="padding-right: 20px;">';
				         data += '                <div class="profile-image" data-toggle="modal" data-target="#profile">';
				         data += '                    <img src="'+ obj.changeName +'" alt="Profile Image">';
				         data += '                </div>';
				         data += '            </td>';
				         data += '        </tr>';
				         data += '        <tr>'; 
				         data += '            <td class="tdtd">';
				         data += '                <span class="myMsg_time">'+obj.msgTime+'</span>';
				         data += '                <div class="chat-message">';
				         data += '                    '+obj.msgContent+'';
				         data += '                </div>';
				         data += '            </td>';
				         data += '        </tr>';
				         data += '    </table>';
				         data += '</div>';
		        } else {

		        	data += '<div class="chat-container2">';
		        	data += '    <table>';
		        	data += '        <tr>';
		        	data += '            <td rowspan="2" style="padding-left: 20px;">';
		        	data += '                <div class="circle-image" data-toggle="modal" data-target="#profile">';
		        	data += '                    <img src="'+ obj.changeName +'">';
		        	data += '                </div>';
		        	data += '            </td>';
		        	data += '            <td class="name-section">';
		        	data += '                &nbsp;'+obj.nickName+'';
		        	data += '            </td>';
		        	data += '        </tr>';
		        	data += '        <tr>';
		        	data += '            <td>';
		        	data += '                <div class="message">';
		        	data += '                    '+obj.msgContent+'';
		        	data += '                </div>';
		        	data += '                <span class="msg_time">'+obj.msgTime+'</span>';
		        	data += '            </td>';
		        	data += '        </tr>';
		        	data += '    </table>';
		        	data += '</div>';
		        	data += '<br>';
		        	
		        	
		        	
		        	
		        }
		        // > css 를 적용하면 카톡처럼 내가보낸 메세지는 오른쪽에 붙여서,
		        //   남이 보내준 메세지는 왼쪽에 붙여서 요소 배치
		        
		        // console.log(data);
		        
		        // 문자를 연이어서 출력
		        $(".msg_view").append(data);
		        
		        /*
		        if (socket == null) {
			        let nickName = "${sessionScope.loginUser.nickName}"
			        
			        let str ='' 
			        
			        str += '<br>';
			        str += '<div style="text-align: center;">';
			        str += '<span>&nbsp;-' + nickName + '님이 채팅방을 나가셨습니다.-</span>';
			        str += '</div>';
			        str += '<br>';
			        
			        $(".msg_view").append(str);
			        
			    }
		        */
		    };
		}
	
		// 웹소켓 서버 접속 종료 함수
		function disconnect() {
		    
		        socket.close();
		}
	
		// 메세지 전송 함수
		function send() {
		    let text = document.getElementById("msg_input_input").value;
		    if (text != "") {
		        socket.send(text); // handleTextMessage 메소드 호출
		        // 메세지 입력창 초기화 효과
		        document.getElementById("msg_input_input").value = "";
		    }
		}
	
		// 연결 버튼에 이벤트 리스너 추가
		document.getElementById("msg_button_input").addEventListener("click", send);
	</script>
   


    





</body>
</html>