package PLT.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import PLT.service.TodoService;
import PLT.service.UserService;
import PLT.vo.TodoVO;

@Controller
@RequestMapping(value = "/PLT")
public class TodoController {

	/************************참고************************/
	private static Logger log = LoggerFactory.getLogger(UserController.class);

	@Resource(name = "todoService")
	private TodoService todoService;

	@Resource(name = "userService")
	private UserService userService;

	/****************************************************/

	/*Todo리스트 페이지*/
	@RequestMapping(value = "/todoPage.do")
	public String todoPage(TodoVO todoVO, Model model) throws Exception {
		log.debug("투두리스트 홈페이지");

		List<TodoVO> todo_list = todoService.todo_list();

		model.addAttribute("todo_list", todo_list);

		return "views/todo/todopage";
	}

	/*todo 입력 데이터 저장*/
	@RequestMapping(value = "/send_todo_data.do") // @RequestParam으로 변경
	@ResponseBody
	public Map<String, String> send_todo_data(HttpServletRequest request, TodoVO todoVO, @RequestParam(value = "due_date") String due_date, @RequestParam(value = "title") String title, @RequestParam(value = "description") String description, @RequestParam(value = "todo_categories_name") String todo_categories_name, @RequestParam(value = "priority") String priority) throws Exception {
		log.debug("마감일 : " + due_date);
		log.debug("제목 : " + title);
		log.debug("상세설명 : " + description);
		log.debug("카테고리 아이디 : " + todo_categories_name);
		log.debug("우선순위 : " + priority);
		Map<String, String> response = new HashMap<>();

		if (todo_categories_name.isEmpty() || todo_categories_name == null) {
			response.put("status", "invalid_todo_categories_name"); // 카테고리가 공백이거나 null이면 돌려보내
			return response;
		} else {
			todoVO.setDue_date(due_date);
			todoVO.setTitle(title);
			todoVO.setDescription(description);
			todoVO.setTodo_categories_id(Integer.parseInt(todo_categories_name));
			todoVO.setPriority(priority);

			/*String todo_category_name = todoService.todo_categories(todoVO.getTodo_categories_id());
			log.debug(todo_category_name);
			todoVO.setTodo_categories_name(todo_category_name);*/
			HttpSession session = request.getSession();
			String username_for_user_id = (String) session.getAttribute("username");
			int user_id = userService.getUser_id(username_for_user_id);
			if (user_id != 0) {
				todoVO.setUser_id(user_id);
				log.debug("사용자 테이블에서 가져온 사용자 ID : " + todoVO.getUser_id());

				// 데이터를 [todo]테이블에 저장. 
				todoService.insert_todo_data(todoVO);
			} else {
				// 뎨외처리
			}

		}
		return response;

	}
	/*
		@RequestMapping(value = "/todo_list.do", method = RequestMethod.POST, consumes = "application/json")
		@ResponseBody
		public Map<String, String> todo_list() throws Exception {
			Map<String, String> response = new HashMap<>();
			// (최근 데이터 입력의 최신순 기준으로)  todo data가져오기 
			TodoVO tv = todoService.select_todo_data();
			if (tv == null) {
				response.put("status", "invalid_todo_data");
				return response;
			} else {
				String format = new SimpleDateFormat("yyyy-MM-dd").format(d);
	
				log.debug("String을 Date타입으로 변환 : " + format);
				가져온 todo데이터 표시
				log.debug("가져온 todo_id : " + tv.getTodo_id());
				log.debug("가져온 title : " + tv.getTitle());
				log.debug("가져온 description : " + tv.getDescription());
				log.debug("가져온 due_date : " + tv.getDue_date());
				log.debug("가져온 due_date(형식 및 타입 변환) : " + format);
				log.debug("가져온 priority : " + tv.getPriority());
				log.debug("가져온 completed : " + tv.isCompleted());
				log.debug("가져온 user_id : " + tv.getUser_id());
				log.debug("가져온 todo_categories_id : " + tv.getTodo_categories_id());
				log.debug("가져온 created_at : " + tv.getCreated_at());
				log.debug("가져온 updated_at : " + tv.getUpdated_at());
				 !가져온 todo데이터 표시
	
				response.put("title", tv.getTitle());
				response.put("description", tv.getDescription());
				response.put("due_date", format);
				response.put("priority", tv.getPriority());
				response.put("updated_at", tv.getUpdated_at());
				return response;
			}
		}*/

	@RequestMapping(value = "/todo_update.do")
	@ResponseBody
	public String todo_update(TodoVO todoVO, @RequestParam(value = "todo_id") int todo_id, @RequestParam(value = "due_date") String due_date, @RequestParam(value = "title") String title, @RequestParam(value = "category") int category, @RequestParam(value = "description") String description, @RequestParam(value = "priority") String priority) throws Exception {
		log.debug("값 데이터 확인 : " + todo_id);
		log.debug("값 데이터 확인 : " + due_date);
		log.debug("값 데이터 확인 : " + category);
		log.debug("값 데이터 확인 : " + description);
		log.debug("값 데이터 확인 : " + priority);
		log.debug("값 데이터 확인 : " + title);

		// 전반적인 유효성 검사
		if (due_date == null || due_date.isEmpty() || priority == null || priority.isEmpty() || title == null || title.isEmpty()) {
			return "invalid_data";
		}

		todoVO.setTodo_id(todo_id);
		todoVO.setDue_date(due_date);
		todoVO.setTodo_categories_id(category);
		todoVO.setDescription(description);
		todoVO.setPriority(priority);
		todoVO.setTitle(title);

		// 할일수정
		int update_result = todoService.todo_update(todoVO);
		if (update_result == 1) {
			// 수정 성공
			return "ok";
		} else {
			// 수정 실패
			return "fail";
		}

	}

	/*할일 삭제*/
	@RequestMapping(value = "/todo_delete.do")
	@ResponseBody
	public String todo_delete(@RequestParam(value = "todo_id") int todo_id) throws Exception {
		int result = todoService.todo_delete(todo_id);
		if (result == 1) {
			return "ok";
		} else {
			return "fail";
		}

	}

	// todo 리다이렉션 용
	@RequestMapping(value = "/plt_redirect.do")
	public String plt_redirect() throws Exception {
		return "redirect:/PLT/todoPage.do";
	}

	// 홈페이지리다이렉션 용
	@RequestMapping(value = "/plt_home_redirect.do")
	public String plt_home_redirect() throws Exception {
		return "redirect:/PLT/plt_homepage.do";
	}

}
