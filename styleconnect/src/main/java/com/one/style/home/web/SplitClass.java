package com.one.style.home.web;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

public class SplitClass {

	public void splitTest(String crawlText){
		String planeText = crawlText;
		
		String sliced = planeText.replaceAll("\\r\\n", "");
		String[] sliced2 = sliced.split(" ");
		List<String> hashTags = new ArrayList<String>();
		for(String s : sliced2) {
			if(s.contains("#") && !s.contains("#남자") && !s.contains("#여자") && s.length() < 11){
				if(s.endsWith("펌") || s.endsWith("컷")) {
					hashTags.add(s);
				}
			}
		}
		HashMap<String, Integer> tier = new HashMap<String, Integer>();
		
		Set<String> set = new HashSet<String>(hashTags);
		for (String str : set) {
			tier.put(str.replace("#", ""), Collections.frequency(hashTags, str));
		}
		
		// Map.Entry 리스트 작성
		List<Entry<String, Integer>> list_entries = new ArrayList<Entry<String, Integer>>(tier.entrySet());

		// 비교함수 Comparator를 사용하여 내림 차순으로 정렬
		Collections.sort(list_entries, new Comparator<Entry<String, Integer>>() {
			// compare로 값을 비교
			public int compare(Entry<String, Integer> obj1, Entry<String, Integer> obj2)
			{
				// 내림 차순으로 정렬
				return obj2.getValue().compareTo(obj1.getValue());
			}
		});

		System.out.println("내림 차순 정렬");
		for(int i = 0; i <= 4; i++) {
			System.out.println(list_entries.get(i).getKey() + " : " + list_entries.get(i).getValue());
		}
		
	}
}
