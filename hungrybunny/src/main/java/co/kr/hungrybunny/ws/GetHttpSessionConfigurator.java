package co.kr.hungrybunny.ws;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class GetHttpSessionConfigurator extends ServerEndpointConfig.Configurator{
	private static final Logger log = LoggerFactory.getLogger(GetHttpSessionConfigurator.class);
    @Override
    public void modifyHandshake(ServerEndpointConfig config, 
                                HandshakeRequest request, 
                                HandshakeResponse response){
        HttpSession httpSession = (HttpSession)request.getHttpSession();
        log.info("modifyHandshake() -> httpsession => {}", httpSession); 
        System.out.println(HttpSession.class.getName());
        config.getUserProperties().put(HttpSession.class.getName(),httpSession);
    }
}
