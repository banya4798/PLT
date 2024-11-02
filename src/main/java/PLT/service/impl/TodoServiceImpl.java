package PLT.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import PLT.dao.TodoDAO;
import PLT.service.TodoService;
import PLT.vo.TodoVO;

@Service("todoService")
public class TodoServiceImpl implements TodoService {

	@Resource(name = "todoDAO")
	private TodoDAO todoDAO;

	/*todo리스트 표출*/
	@Override
	public List<TodoVO> todo_list() throws Exception {
		return todoDAO.todo_list();
	}

	// todo 데이터 저장
	@Override
	public void insert_todo_data(TodoVO todoVO) throws Exception {
		todoDAO.insert_todo_data(todoVO);
	}

	/*todo 카테고리 이름 가져오기(개인,학습,과제)*/
	@Override
	public String todo_categories(Integer todo_categories_id) throws Exception {
		return todoDAO.todo_categories(todo_categories_id);
	}

	// (최근 데이터 입력의 최신순 기준으로)  todo data가져오기 
	@Override
	public TodoVO select_todo_data() throws Exception {
		return todoDAO.select_todo_data();
	}

	/*할일 수정*/
	@Override
	public int todo_update(TodoVO todoVO) throws Exception {
		return todoDAO.todo_update(todoVO);
	}

	@Override
	public int todo_delete(int todo_id) throws Exception {
		return todoDAO.todo_delete(todo_id);
	}

}
