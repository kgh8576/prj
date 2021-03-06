package com.one.style.review.web;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.one.style.reply.service.ReplyService;
import com.one.style.review.service.ReviewService;
import com.one.style.review.vo.ReviewVO;

@Controller
public class ReviewController {
	
	@Autowired ReviewService reviewDao;
	@Autowired ReplyService replyDao;
	
	@RequestMapping("reviewList.do")
	public String reviewPage(Model model, @RequestParam(value="desId") String desId,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="pullValue", defaultValue="byDate") String pullValue,
			HttpServletRequest req){
		
		ReviewVO tvo = reviewDao.reviewPersonalTotal(desId);
		int rate = reviewDao.reviewRating(desId);
		model.addAttribute("total", tvo.getCount());
		//model.addAttribute("name", name);
		if (rate != 0) { // 
			model.addAttribute("rate", rate);	
		}
		model.addAttribute("desId", desId);
		// 리뷰 4건씩 페이징 처리
		ReviewVO pvo = new ReviewVO();
		pvo.setFirstCnt((page-1)*4+1);
		pvo.setLastCnt(page*4);
		pvo.setPullValue(pullValue);
		pvo.setDesId(desId);
	    Paging paging = new Paging();
	    paging.setPageNo(page);
	    paging.setPageSize(4);
	    paging.setTotalCount(tvo.getCount());
	    
	    List<ReviewVO> reviewListPaging = reviewDao.reviewPaging(pvo);
	    model.addAttribute("reviewListPaging", reviewListPaging);
	    model.addAttribute("paging", paging);
    	model.addAttribute("desName", reviewDao.getDesName(desId));	
	    
	    
		return "review/reviewList";
	}
	// 리뷰 상세보기
	@RequestMapping("reviewInfo.do")
	public String reviewInfo(ReviewVO vo, Model model){
		model.addAttribute("reviewInfo", reviewDao.getReviewWriter(vo));
		if(replyDao.getReply(vo) != null) { // 답장 있으면 답장도 같이 가져오기
			model.addAttribute("replyInfo", replyDao.getReply(vo));	
		}
		return "review/reviewInfo";
	}
	// 리뷰 수정 페이지
	@RequestMapping("reviewModify.do") // 리뷰 수정. 수정은 제한 X 
	public String reviewModify(ReviewVO vo, Model model) {
		model.addAttribute("conNo", vo.getConNo());
		model.addAttribute("reviewInfo", reviewDao.getHistoryForModify(vo));
		return "review/reviewModify";	
	}

	// 리뷰 작성 페이지
	@RequestMapping("reviewRegister.do") // 리뷰 작성

	public String reviewRegister(String id, int conNo, Model model,HttpServletResponse response) throws IOException {
		ReviewVO vo = new ReviewVO();
		vo.setMemId(id);
		vo.setConNo(conNo);
		if (reviewDao.canReviewRegCheckDate(vo) && reviewDao.canReviewRegCheckExist(vo) ) {  // 컨설팅 일자 이후 3일 이내이면서, 리뷰가 존재하지 않는 경우 등록 가능
			model.addAttribute("conNo", vo.getConNo());
			model.addAttribute("consultInfo", reviewDao.getHistoryForInsert(vo));
			return "review/reviewRegister";	
		}
		response.setContentType("text/html; charset=UTF-8");
		 
		PrintWriter out = response.getWriter();
		 
		out.println("<script>alert('3일이 지나 리뷰를 등록할수 없습니다.'); location.href='confinish.do';</script>");
		 
		out.flush();

		return null;
	}
	
	@RequestMapping("upload.do")
	@ResponseBody
	protected void upload(HttpServletRequest req,
						  HttpServletResponse resp, 
						  @RequestParam MultipartFile upload) throws ServletException, IOException {
		
		UUID uuid = UUID.randomUUID(); 
		String fileUUID = uuid.toString() + ".png";
		System.out.println(fileUUID);
		OutputStream out = null; 
		PrintWriter printWriter = null;

		resp.setCharacterEncoding("UTF-8");
		
		try { 
			// 업로드 경로 
			String path = req.getServletContext().getRealPath("/resources/img/"); //filename alias name으로저장
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
		json.addProperty("url", req.getContextPath() + "/resources/img/" + fileUUID);
		resp.getWriter().print(json);
	}
	
	
}
