package PLT.service;

import java.util.List;

import PLT.vo.TodoVO;

public interface TodoService {

	/*todo 리스트 표출*/
	List<TodoVO> todo_list() throws Exception;

	// todo 데이터 저장
	void insert_todo_data(TodoVO todoVO) throws Exception;

	// todo 카테고리 이름 가져오기 (개인, 학습, 과제)
	String todo_categories(Integer todo_categories_id) throws Exception;

	// (최근 데이터 입력의 최신순 기준으로)  todo data가져오기 
	TodoVO select_todo_data() throws Exception;

	// 할일수정
	int todo_update(TodoVO todoVO) throws Exception;

	/*할일 삭제*/
	int todo_delete(int todo_id) throws Exception;

}
