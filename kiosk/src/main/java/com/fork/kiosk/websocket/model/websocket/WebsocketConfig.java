package com.fork.kiosk.websocket.model.websocket;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocket
@EnableWebSocketMessageBroker
public class WebsocketConfig implements WebSocketMessageBrokerConfigurer {

    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        config.enableSimpleBroker("/kiosk"); // 메시지 브로커 설정
        config.setApplicationDestinationPrefixes("/user"); // 클라이언트로부터 메시지를 수신할 엔드포인트를 설정 이걸로 url주소 끝나야함
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/user").setAllowedOrigins("http://localhost:8082/user").withSockJS(); // WebSocket 연결을 위한 엔드포인트를 설정합니다.
    }
    
}
