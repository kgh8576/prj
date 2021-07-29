package com.one.style.files.web;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.one.style.files.service.FilesService;

@Controller
public class FilesController {
	
	@Autowired FilesService filesDao;

	@RequestMapping("upload.do")
	@ResponseBody
	protected void Upload(HttpServletRequest req,
						  HttpServletResponse resp, 
						  @RequestParam MultipartFile upload) throws ServletException, IOException {
		
		UUID uuid = UUID.randomUUID(); 
		String fileUUID = uuid.toString() + ".png";
		OutputStream out = null; 
		PrintWriter printWriter = null;

		resp.setCharacterEncoding("UTF-8");
		
		try { 
			// 업로드 경로 
			String path = req.getServletContext().getRealPath("/resources/upload/"); //filename alias name으로저장
			upload.transferTo(new File(path, fileUUID));
		
		} catch (IOException e) { 
			e.printStackTrace(); 
		} finally { 
			try { 
				if(out != null) { 
					out.close(); 
				} if(printWriter != null) { 
					printWriter.close(); } 
				} catch(IOException e) { 
					e.printStackTrace(); } 
		} 
		JsonObject json = new JsonObject();
		json.addProperty("uploaded", 1);
		json.addProperty("fileName", fileUUID);
		json.addProperty("url", req.getContextPath() + "/resources/upload/" + fileUUID);
		
		resp.getWriter().print(json);
		
		
	}
	
}
