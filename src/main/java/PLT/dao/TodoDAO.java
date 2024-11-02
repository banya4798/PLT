package PLT.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import PLT.vo.TodoVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("todoDAO")
public class TodoDAO extends EgovAbstractDAO {

	/*todo리스트 표출*/
	public List<TodoVO> todo_list() {
		return (List<TodoVO>) list("todo_list");
	}

	// todo 데이터 저장
	public void insert_todo_data(TodoVO todoVO) {
		insert("insert_todo_data", todoVO);
	}

	/*todo 카테고리 이름 가져오기(개인,학습,과제)*/
	public String todo_categories(Integer todo_categories_id) {
		return (String) select("todo_categories", todo_categories_id);
	}

	// (최근 데이터 입력의 최신순 기준으로)  todo data가져오기 
	public TodoVO select_todo_data() {
		return (TodoVO) select("select_todo_data");
	}

	/*할일 수정*/
	public int todo_update(TodoVO todoVO) {
		return update("todo_update", todoVO);
	}

	/*할일 삭제*/
	public int todo_delete(int todo_id) {
		return delete("todo_delete", todo_id);
	}

}
