package PLT.vo;

public class SubmissionsVO {
	private int submissions_id;
	private String title;
	private String content;
	private int assignment_id;
	private int student_id;
	private String grade;
	private String f_origin_name;
	private String submitted_at;
	private String updated_at;
	private String status;
	private String username;
	private int instructor_id;

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
	 * @submissions_id@ getter
	 * @return	submissions_id
	 */
	public int getSubmissions_id() {
		return submissions_id;
	}

	/**
	 * @submissions_id@ setter
	 * @param	submissions_id
	 */
	public void setSubmissions_id(int submissions_id) {
		this.submissions_id = submissions_id;
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
	 * @content@ getter
	 * @return	content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @content@ setter
	 * @param	content
	 */
	public void setContent(String content) {
		this.content = content;
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
	 * @student_id@ getter
	 * @return	student_id
	 */
	public int getStudent_id() {
		return student_id;
	}

	/**
	 * @student_id@ setter
	 * @param	student_id
	 */
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}

	/**
	 * @grade@ getter
	 * @return	grade
	 */
	public String getGrade() {
		return grade;
	}

	/**
	 * @grade@ setter
	 * @param	grade
	 */
	public void setGrade(String grade) {
		this.grade = grade;
	}

	/**
	 * @f_origin_name@ getter
	 * @return	f_origin_name
	 */
	public String getF_origin_name() {
		return f_origin_name;
	}

	/**
	 * @f_origin_name@ setter
	 * @param	f_origin_name
	 */
	public void setF_origin_name(String f_origin_name) {
		this.f_origin_name = f_origin_name;
	}

	/**
	 * @submitted_at@ getter
	 * @return	submitted_at
	 */
	public String getSubmitted_at() {
		return submitted_at;
	}

	/**
	 * @submitted_at@ setter
	 * @param	submitted_at
	 */
	public void setSubmitted_at(String submitted_at) {
		this.submitted_at = submitted_at;
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

	/**
	 * @status@ getter
	 * @return	status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @status@ setter
	 * @param	status
	 */
	public void setStatus(String status) {
		this.status = status;
	}

}
