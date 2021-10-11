package com.mycompany.webapp.service;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mycompany.webapp.controller.HomeController;

@Service
public class RequestService {
	private static final Logger logger = LoggerFactory.getLogger(RequestService.class);
	public JsonNode requestHttpJson(String couponNo, String memberId) {
		HttpClient client = HttpClientBuilder.create().build(); // HttpClient 생성
		HttpPost httpPost = new HttpPost("http://192.168.1.251:8080//testForJson"); // POST 메소드 URL 새성
		try {
			httpPost.setHeader("Accept", "application/json");
			httpPost.setHeader("Connection", "keep-alive");
			httpPost.setHeader("Content-Type", "application/json");

			// json 메시지 입력
			httpPost.setEntity(new StringEntity("{\"couponNo\":\"" + couponNo + "\",\"memberId\":\"" + memberId + "\"}"));

			HttpResponse response = client.execute(httpPost);
			// Response 출력
			if (response.getStatusLine().getStatusCode() == 200) {
				ResponseHandler<String> handler = new BasicResponseHandler();
				String body = handler.handleResponse(response);
				System.out.println("[RESPONSE] requestHttpJson() " + body);

				ObjectMapper objectMapper = new ObjectMapper();
				JsonNode node = objectMapper.readTree(body);

				return node;
			} else {
				System.out.println("response is error : " + response.getStatusLine().getStatusCode());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
}
