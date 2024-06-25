package com.tp.travely.event.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.tp.travely.event.model.vo.Festival;

public class EventApi {

    public static final String SERVICEKEY = "uy4Lr3HDr0MPwhRTBUlWKz3ZzGamwWuChA5xsr8%2B3xBlFj%2Fvadc7tEt3hq3lxecV9JIheJ4l5EFdMM8Ul7lOlw%3D%3D";

    public ArrayList<Festival> eventCall(int currentPage, String day) {
        int pageNo = currentPage;
        ArrayList<Festival> list = new ArrayList<>();

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
            StringBuilder responseText = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                responseText.append(line);
            }

            JSONParser parser = new JSONParser();
            JSONObject jb = (JSONObject) parser.parse(responseText.toString());
            JSONObject jbResponse = (JSONObject) jb.get("response");
            JSONObject jbBody = (JSONObject) jbResponse.get("body");
            int totalCount = Integer.parseInt(jbBody.get("totalCount").toString()); // 값 개수
            JSONObject jbItems = (JSONObject) jbBody.get("items");
            JSONArray jbItem = (JSONArray) jbItems.get("item");

            System.out.println("Total count: " + totalCount);
            System.out.println("JSONArray size: " + jbItem.size());

            // JSONArray가 비어있는지 확인
            if (jbItem.isEmpty()) {
                System.out.println("No items found.");
                return list; // 빈 리스트 반환
            }

            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
            SimpleDateFormat outputFormatter = new SimpleDateFormat("yyyy.MM.dd");

            for (int i = 0; i < jbItem.size(); i++) {
                JSONObject jbTest = (JSONObject) jbItem.get(i);
                Festival fv = new Festival();

                // 날짜형식 추가
                String startDateStr = (String) jbTest.get("eventstartdate");
                String endDateStr = (String) jbTest.get("eventenddate");
                Date startDate = formatter.parse(startDateStr);
                Date endDate = formatter.parse(endDateStr);
                String eventstartdate = outputFormatter.format(startDate);
                String eventenddate = outputFormatter.format(endDate);

                fv.setAreacode((String) jbTest.get("areacode"));
                fv.setAddr1((String) jbTest.get("addr1"));
                fv.setTitle((String) jbTest.get("title"));
                fv.setEventstartdate(eventstartdate);
                fv.setEventenddate(eventenddate);
                fv.setFirstimage((String) jbTest.get("firstimage"));
                fv.setFirstimage2((String) jbTest.get("firstimage2"));
                fv.setTotalCount(totalCount);
                list.add(fv);
            }
            br.close();
            urlConnection.disconnect();

        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (org.json.simple.parser.ParseException e) {
            e.printStackTrace();
        }

        return list;
    }
}
