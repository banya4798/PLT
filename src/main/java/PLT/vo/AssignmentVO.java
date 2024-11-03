package PLT.vo;

public class AssignmentVO {
	private int assignment_id;
	private String title;
	private String description;
	private int instructor_id;
	private int max_grade;
	private String created_at;
	private String updated_at;
	private String due_date;
	private String username;

	/**
	 * @username@ getter
	 * @return	username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @username@ setter
	 * @param	username
	 */
	public void setUsername(String username) {
		this.username = username;
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
	 * @param	dueDate
	 */
	public void setDue_date(String dueDate) {
		this.due_date = dueDate;
	}

	/**
	 * @assignment_id@ getter
	 * @return	assignment_id
	 */
	public int getAssignment_id() {
		return assignment_id;
	}

	/**
	 * @assignment_id@ setter
	 * @param	assignment_id
	 */
	public void setAssignment_id(int assignment_id) {
		this.assignment_id = assignment_id;
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
	 * @instructor_id@ getter
	 * @return	instructor_id
	 */
	public int getInstructor_id() {
		return instructor_id;
	}

	/**
	 * @instructor_id@ setter
	 * @param	instructor_id
	 */
	public void setInstructor_id(int instructor_id) {
		this.instructor_id = instructor_id;
	}

	/**
	 * @max_grade@ getter
	 * @return	max_grade
	 */
	public int getMax_grade() {
		return max_grade;
	}

	/**
	 * @max_grade@ setter
	 * @param	max_grade
	 */
	public void setMax_grade(int max_grade) {
		this.max_grade = max_grade;
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
