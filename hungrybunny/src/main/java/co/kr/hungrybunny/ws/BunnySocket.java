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
import javax.websocket.server.ServerEndpoint;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import co.kr.hungrybunny.controller.UrlController;
import co.kr.hungrybunny.vo.UserInfoVO;

@ServerEndpoint(value = "/alarm", 
        configurator = GetHttpSessionConfigurator.class)
public class BunnySocket {	

	private static final Logger log = LoggerFactory.getLogger(BunnySocket.class);
	private static Map<String,Session> sessionMap = Collections
			.synchronizedMap(new HashMap<String,Session>());
	
	private ObjectMapper mapper = new ObjectMapper();
	
	@OnMessage
	public void onMessage(String text, Session session) throws IOException {

	    TypeReference<HashMap<String,Object>> typeRef 
	            = new TypeReference<HashMap<String,Object>>() {};

		Map<String,String> map = mapper.readValue(text, typeRef);
		log.info("text = >{}",map);
		String targetId = map.get("target");
		
		synchronized (sessionMap) {
			final Iterator<String> it = sessionMap.keySet().iterator();
			while(it.hasNext()) {
				final String key = it.next();
				if(key.equals(targetId)) {
					Session ss = sessionMap.get(key);
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
	public void onOpen(Session session, EndpointConfig config) {
		System.out.println(session);
		final HttpSession hs = (HttpSession) config.getUserProperties()
                .get(HttpSession.class.getName());
		final UserInfoVO uiv = (UserInfoVO)hs.getAttribute("userInfo");
		final String userId = uiv.getUiId();
		sessionMap.put(userId, session);
	}

	@OnClose
	public void onClose(Session session) {
		String key = getSessionKey(session);
		if(key!=null) {
			sessionMap.remove(key);
		}
	}
}
