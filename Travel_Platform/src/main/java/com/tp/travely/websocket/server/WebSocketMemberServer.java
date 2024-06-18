package com.tp.travely.websocket.server;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.tp.travely.member.model.vo.Member;
import com.tp.travely.websocket.msg.model.service.MsgService;
import com.tp.travely.websocket.msg.model.vo.Msg;

// 로그인된 사용자만 접속하고 메세지를 보낼 수 있는 서버
public class WebSocketMemberServer extends TextWebSocketHandler {

	// 사용자 관리 저장소
	private Set<WebSocketSession> userList = new CopyOnWriteArraySet<>();

	// 1:1 채팅 또는 채팅방을 여러개 둬야 한다면
	// > userList 의 어느 누군가가 몇번 채팅방에 참여중인건지 매칭시키는 정보도 필요함
	//   필드에서 몇번 채팅방인지 구분을 줘야함 
	
	@Autowired
	private MsgService msgService;
	
	// 코드 자동완성으로 가져옴
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		userList.add(session);
		// 접속한 사용자를 userList로 담아줌
		System.out.println("접속됨 :" + session);
		
		// HttpSession 의 정보를 WebSocketSession 으로 가져오기 위한 빈을 등록
		// > HttpSession 의 속성들에 접근할 수 있다.
		System.out.println("세션의 속성들 : " + session.getAttributes());
		// > 참고로 여기서 session은 WebSocketSession에서 제공하는 session임
		
		// 로그인한 사용자의 정보가 현재 session 의 loginUser에 담겨있음!!
		// > 만약 로그인이 안되었다면 loginUser == null
		System.out.println("아이디 : " + session.getAttributes().get("loginUser"));
		
		Member loginUser = (Member) session.getAttributes().get("loginUser");

	    if (loginUser != null) {
	        Msg mg = new Msg();
	        mg.setNickName(loginUser.getNickName());
	        mg.setMsgContent(loginUser.getNickName() + "님이 입장하셨습니다.");
	        mg.setMsgTime(new SimpleDateFormat("a h:mm").format(new Date()));

	        String results = new Gson().toJson(mg);
	        TextMessage welcomeMessage = new TextMessage(results);
	        
	        // 모든 클라이언트에게 입장 메시지 전송
	        for (WebSocketSession ws : userList) {
	            ws.sendMessage(welcomeMessage);
	        }
	    }
		
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		// 받은 메세지를 이 단톡에 있는 모든 사용자에게 다시 뿌려주기
		// 누가, 어떤내용을, 언제 보냈는지 같이 보내버릴 것!!
		
		Member loginUser = (Member)session.getAttributes().get("loginUser") ; // 누가
		
		String msgContent = message.getPayload(); // 어떤 내용을
		
		
		// 로그인된 사용자가 보낸 메세지만 전송하겠다.
		if(loginUser != null) {
			
			// 메세지 내용만 보내는 것이 아닌
			// 보낸사람의 아이디, 내용, 보낸 시간을 모두 담아서 보낼 것임
			// TextMessage newMessage = new TextMessage(msgContent);
			
			// JSON 활용
			// Message 정보를 담을 수 있는 VO객체 > GSON을 이용해서 JSON으로 가공
			Msg mg = new Msg();
			mg.setUserNo(loginUser.getUserNo());
			mg.setMsgContent(msgContent);
			
			String currentTime = new SimpleDateFormat("a h:mm").format(new Date());
            mg.setMsgTime(currentTime);
            
            mg.setNickName(loginUser.getNickName());
            mg.setChangeName(loginUser.getChangeName());
            mg.setAge(loginUser.getAge());
            mg.setGender(loginUser.getGender());
			int result = msgService.insertMsg(mg);
			
			String results = new Gson().toJson(mg);
			System.out.println(results);
			TextMessage newMessage = new TextMessage(results);
			
			// System.out.println(m);
			for(WebSocketSession ws : userList) {
				ws.sendMessage(newMessage);
			}
		} 
				
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		// 사용자가 접속을 종료할 때 마다 userList 에서 해당 사용자 정보 제거
		    
		    userList.remove(session);
			   
	}
	
	
	
}
