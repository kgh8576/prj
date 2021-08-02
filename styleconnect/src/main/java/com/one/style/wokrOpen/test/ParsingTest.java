package com.one.style.wokrOpen.test;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.DataNode;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
 
public class ParsingTest {
 
    public static void main(String[] args) {
        String url ="https://www.instagram.com/coffee1st_korea/";  //인스타그램 url
        String userAgent = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36";
        System.setProperty("sun.net.http.allowRestrictedHeaders", "false");
//        String url = "https://www.instagram.com/p/CFS-pm3j3JK/";
        try {
            Connection.Response nvDocument = Jsoup.connect(url).userAgent(userAgent)
                    .method(Connection.Method.GET)
                    .execute();
 
            Document doc = nvDocument.parse();
 
            Elements datas = doc.select("script");
 
            for (Element data : datas) {
                for (DataNode node : data.dataNodes()) {
                    if (node.getWholeData().contains("window._sharedData =")) {
 
                        String nodeData = node.getWholeData();
                        nodeData = nodeData.replace("window._sharedData = ", "");
                        nodeData = nodeData.replace(nodeData.substring(nodeData.length() - 1), "");
 
                        JSONParser parser = new JSONParser();
                        JSONObject instaObj = (JSONObject) parser.parse(nodeData);
 
                        JSONObject entry_data = (JSONObject) instaObj.get("entry_data");
                        JSONArray profilePage = (JSONArray) entry_data.get("ProfilePage");
                        JSONObject profileData = (JSONObject) profilePage.get(0);
                        JSONObject graphql = (JSONObject) profileData.get("graphql");
                        JSONObject user2 = (JSONObject) graphql.get("user");
                        String biography = (String) user2.get("biography");
                        String proFileImg = (String) user2.get("profile_pic_url");
                        System.out.println("Biografia :" + biography);
                        System.out.println("proFileImg :" + proFileImg);
 
 
                        JSONObject edge_followed_by = (JSONObject) user2.get("edge_followed_by");
 
                        Long count = (Long) edge_followed_by.get("count");
                        System.out.println("follow --->:" + Long.toString(count));
 
                        JSONObject edge_follow = (JSONObject) user2.get("edge_follow");
                        Long count_edge_follow = (Long) edge_follow.get("count");
                        System.out.println("follower --->:" + Long.toString(count_edge_follow));
 
                        JSONObject edge_owner_to_timeline_media = (JSONObject) user2.get("edge_owner_to_timeline_media");
                        Long count_edge_owner_to_timeline_media = (Long) edge_owner_to_timeline_media.get("count");
                        System.out.println("게시물수 --->:" + Long.toString(count_edge_owner_to_timeline_media));
 
                        JSONArray edges = (JSONArray) edge_owner_to_timeline_media.get("edges");
 
                        edges.forEach(item -> {
                            JSONObject edge = (JSONObject) item;
                            JSONObject edgeNode = (JSONObject) edge.get("node");
                            String __typename = (String) edgeNode.get("__typename");
                            System.out.println("게시물 타입 --->:" + __typename);
 
                            String contents = "";
                            String contentsUrl = "";
 
                            if (__typename.equals("GraphVideo")) {
                                contents = (String) edgeNode.get("thumbnail_src");
                                System.out.println("이미지 URL --->:" + contents);
                            } else {
                                JSONArray contentsArray = (JSONArray) edgeNode.get("thumbnail_resources");
                                JSONObject contentsImg = (JSONObject) contentsArray.get(3);
                                contentsUrl = (String) contentsImg.get("src");
                                System.out.println("이미지 URL --->:" + contentsUrl);
                            }
 
                            JSONObject postLike = (JSONObject) edgeNode.get("edge_liked_by");
                            Long postLikeCnt = (Long) postLike.get("count");
 
                            System.out.println("좋아요 Count --->:" + postLikeCnt);
 
                            String postUrl = "https://www.instagram.com/p/" + (String) edgeNode.get("shortcode");
                            System.out.println("post 링크 --->:" + postUrl);
 
 
                            JSONObject contentsTextObj = (JSONObject) edgeNode.get("edge_media_to_caption");
                            JSONArray contextsTextArr = (JSONArray) contentsTextObj.get("edges");
                            if (contextsTextArr.size() > 0) {
                                JSONObject contentsTxtNode = (JSONObject) contextsTextArr.get(0);
                                contentsTxtNode = (JSONObject) contentsTxtNode.get("node");
                                String contentsStr = (String) contentsTxtNode.get("text");
 
                                System.out.println("내용 --->:" + contentsStr);
                            }
 
                        });
                        break;
                    }
                }
            }
        }catch (Exception e){
            System.out.println(e.toString());
        }
 
    }
}


