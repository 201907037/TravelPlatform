package com.tp.travely.event.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.tp.travely.event.model.vo.Festival;

public class EventApi {

	public static final String SERVICEKEY = "uy4Lr3HDr0MPwhRTBUlWKz3ZzGamwWuChA5xsr8%2B3xBlFj%2Fvadc7tEt3hq3lxecV9JIheJ4l5EFdMM8Ul7lOlw%3D%3D";

	public ArrayList<Festival> eventCall(int currentPage, String day) {
		int pageNo = currentPage;
		ArrayList<Festival> list = new ArrayList<>();

		boolean whileController = true;

//		while (whileController) {

		String url = "http://apis.data.go.kr/B551011/KorService1/searchFestival1";
		url += "?serviceKey=" + SERVICEKEY;
		url += "&numOfRows=12"; // 결과 갯수 (생략 시 기본값은 10)
		url += "&_type=json";
		url += "&pageNo=" + pageNo;
		url += "&MobileOS=ETC&MobileApp=AppTest&arrange=A&listYN=Y"; // 기본값
		url += "&eventStartDate=" + day;

		try {

			URL requestUrl = new URL(url);

			HttpURLConnection urlConnection = (HttpURLConnection) requestUrl.openConnection();

			urlConnection.setRequestMethod("GET");

			BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));

			String responseText = "";
			String line; // 기본적으로 null 값이 담겨있음
			while ((line = br.readLine()) != null) {

				responseText += line;
			}
			JSONParser parser = new JSONParser();
			JSONObject jb = (JSONObject) parser.parse(responseText);
			JSONObject jbResponse = (JSONObject) jb.get("response");
			JSONObject jbBody = (JSONObject) jbResponse.get("body");
			int totalCount = Integer.parseInt(jbBody.get("totalCount").toString()); // 값 개수
			JSONObject jbItems = (JSONObject) jbBody.get("items");
			JSONArray jbItem = (JSONArray) jbItems.get("item");

//		System.out.println(totalCount);
//		System.out.println(jbItem.get(0));

			for (int i = 0; i < jbItem.size(); i++) {
				JSONObject jbTest = (JSONObject) jbItem.get(i);
				Festival fv = new Festival();
				fv.setAreacode((jbTest.get("areacode")).toString());
				fv.setAddr1((jbTest.get("addr1")).toString());
				fv.setTitle((jbTest.get("title")).toString());
				fv.setEventstartdate((jbTest.get("eventstartdate")).toString());
				fv.setEventenddate((jbTest.get("eventenddate")).toString());
				fv.setFirstimage((jbTest.get("firstimage")).toString());
				fv.setFirstimage2((jbTest.get("firstimage2")).toString());
				fv.setTotalCount(totalCount);
				list.add(fv);
			}
			br.close();
			urlConnection.disconnect();

		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}

//			if(pageNo < Math.ceil(totalCount/50.0)) {
//				pageNo++;
//			}else {
//				whileController = false;
//			}
//		}
//		
//		System.out.println(list.size());

		return list;
	}
}