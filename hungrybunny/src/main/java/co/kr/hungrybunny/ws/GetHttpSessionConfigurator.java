package co.kr.hungrybunny.ws;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;

public class GetHttpSessionConfigurator extends ServerEndpointConfig.Configurator{
    @Override
    public void modifyHandshake(ServerEndpointConfig config, 
                                HandshakeRequest request, 
                                HandshakeResponse response){
        HttpSession httpSession = (HttpSession)request.getHttpSession();
        System.out.println(HttpSession.class.getName());
        config.getUserProperties().put(HttpSession.class.getName(),httpSession);
    }
}
