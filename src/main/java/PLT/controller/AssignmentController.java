package PLT.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import PLT.service.AssignmentService;
import PLT.vo.AssignmentVO;

@Controller
@RequestMapping(value = "/PLT")
public class AssignmentController {
	private static Logger log = LoggerFactory.getLogger(AssignmentController.class);

	@Resource(name = "assignmentService")
	private AssignmentService assignmentService;

	/*과제 등록 페이지*/
	@RequestMapping(value = "/assginmentPage.do")
	public String assignmentPage() throws Exception {

		return "views/assignment/과제등록";
	}

	/*과제 등록*/
	@RequestMapping(value = "/assignmentRegistration.do")
	@ResponseBody
	public String assignmentRegistration(HttpServletRequest request, AssignmentVO avo, @RequestParam(value = "title") String title, @RequestParam(value = "description") String description, @RequestParam(value = "due_date") String due_date, @RequestParam(value = "maxGrade") int max_grade) throws Exception {

		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		log.debug("과제 제목 : " + title);
		log.debug("과제 설명 : " + description);
		log.debug("과제 마감일 : " + due_date);
		log.debug("최대 점수 : " + max_grade);

		avo.setTitle(title);
		avo.setDescription(description);
		avo.setDue_date(due_date);
		avo.setMax_grade(max_grade);
		avo.setUsername(username);

		String result = assignmentService.assignmentRegistration(avo);
		if (result == null) {
			return "ok";
		} else {
			return "fail";
		}
	}
}
