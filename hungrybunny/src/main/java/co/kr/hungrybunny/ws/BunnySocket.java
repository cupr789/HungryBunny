package co.kr.hungrybunny.ws;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import co.kr.hungrybunny.vo.UserInfoVO;

@ServerEndpoint(value = "/alarm/{userId}")
public class BunnySocket {	
	
	private static final Logger log = LoggerFactory.getLogger(BunnySocket.class);
	private static Map<String,Session> sessionMap = Collections
			.synchronizedMap(new HashMap<String,Session>());

    private volatile String userId; 
	private ObjectMapper mapper = new ObjectMapper();
	
	@OnMessage
	public void onMessage(String text, Session session) throws IOException {

	    TypeReference<HashMap<String,Object>> typeRef 
	            = new TypeReference<HashMap<String,Object>>() {};

	    //// Object 의문점있음
	            
		Map<String,Object> map = mapper.readValue(text, typeRef);
		Object targetId = map.get("target");
		map.put("senderId", userId);
		System.out.println("버니 소켓 : "+map);
		log.info("버니 소켓 => {}", map);
		text = mapper.writeValueAsString(map);
		synchronized (sessionMap) {
			final Iterator<String> it = sessionMap.keySet().iterator();
			while(it.hasNext()) {
				final String key = it.next();
				if(key.equals(targetId)) {
					Session ss = sessionMap.get(key);
					log.info("key => {}", key);
					ss.getBasicRemote().sendText(text);
				}
			}
		}
	}
	
	private String getSessionKey(Session session) {
		final Iterator<String> it = sessionMap.keySet().iterator();
		while(it.hasNext()) {
			final String key = it.next();
			if(session.equals(sessionMap.get(key))){
				return key;
			}
		}
		return null;
	}
	@OnOpen
	public void onOpen(@PathParam("userId") String userId,Session session) {
		log.info("open httpSession key:{}",userId);
		this.userId = userId;
		sessionMap.put(userId, session);
		System.out.println("sessionMap : "+sessionMap);
	}

	@OnClose
	public void onClose(Session session) {
		String key = getSessionKey(session);
		log.info("close httpSession key:{}",key);
		if(key!=null) {
			sessionMap.remove(key);
		}
	}
}
