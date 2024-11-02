package PLT.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

public class TodoVO {
	private int todo_id;  // 할일 고유 ID

	@JsonProperty("title")
	private String title; 	// 할일 제목

	@JsonProperty("description")
	private String description;	// 할일 상세 설명

	@JsonProperty("due_date")
	private String due_date; 	// 할일 마감일

	@JsonProperty("priority")
	private String priority;		// 할일 우선순위('낮음','중간','높음')

	@JsonProperty("completed")
	private String completed; 	// 할일 완료 여부

	@JsonProperty("user_id")
	private Integer user_id;		// 할일 생성한 사용자 ID

	@JsonProperty("todo_categories_id")
	private Integer todo_categories_id;	// 할일 카테고리(외래키)

	@JsonProperty("todo_categories_name")
	private String todo_categories_name;

	private String created_at;	// 할일 생성일자
	private String updated_at;	// 할일 마지막 수정일자

	/**
	 * @todo_categories_name@ getter
	 * @return	todo_categories_name
	 */
	public String getTodo_categories_name() {
		return todo_categories_name;
	}

	/**
	 * @todo_categories_name@ setter
	 * @param	todo_categories_name
	 */
	public void setTodo_categories_name(String todo_categories_name) {
		this.todo_categories_name = todo_categories_name;
	}

	/**
	 * @todo_id@ getter
	 * @return	todo_id
	 */
	public int getTodo_id() {
		return todo_id;
	}

	/**
	 * @todo_id@ setter
	 * @param	todo_id
	 */
	public void setTodo_id(int todo_id) {
		this.todo_id = todo_id;
	}

	/**
	 * @title@ getter
	 * @return	title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @title@ setter
	 * @param	title
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @description@ getter
	 * @return	description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @description@ setter
	 * @param	description
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @due_date@ getter
	 * @return	due_date
	 */
	public String getDue_date() {
		return due_date;
	}

	/**
	 * @due_date@ setter
	 * @param	due_date
	 */
	public void setDue_date(String due_date) {
		this.due_date = due_date;
	}

	/**
	 * @priority@ getter
	 * @return	priority
	 */
	public String getPriority() {
		return priority;
	}

	/**
	 * @priority@ setter
	 * @param	priority
	 */
	public void setPriority(String priority) {
		this.priority = priority;
	}

	/**
	 * @completed@ getter
	 * @return	completed
	 */
	public String getCompleted() {
		return completed;
	}

	/**
	 * @completed@ setter
	 * @param	completed
	 */
	public void setCompleted(String completed) {
		this.completed = completed;
	}

	/**
	 * @user_id@ getter
	 * @return	user_id
	 */
	public Integer getUser_id() {
		return user_id;
	}

	/**
	 * @user_id@ setter
	 * @param	user_id
	 */
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	/**
	 * @todo_categories_id@ getter
	 * @return	todo_categories_id
	 */
	public Integer getTodo_categories_id() {
		return todo_categories_id;
	}

	/**
	 * @todo_categories_id@ setter
	 * @param	todo_categories_id
	 */
	public void setTodo_categories_id(Integer todo_categories_id) {
		this.todo_categories_id = todo_categories_id;
	}

	/**
	 * @created_at@ getter
	 * @return	created_at
	 */
	public String getCreated_at() {
		return created_at;
	}

	/**
	 * @created_at@ setter
	 * @param	created_at
	 */
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	/**
	 * @updated_at@ getter
	 * @return	updated_at
	 */
	public String getUpdated_at() {
		return updated_at;
	}

	/**
	 * @updated_at@ setter
	 * @param	updated_at
	 */
	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}

}
