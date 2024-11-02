package PLT.vo;

public class CourseVO {
	private int course_num;
	private int course_id;
	private String title;
	private String description;
	private int instructor_id;
	private String created_at;
	private String updated_at;
	private String username;
	private String professor;
	private String status;
	private int registration_id;
	private Integer semester;
	private Integer credit;
	private String classification;
	private String department;

	/**
	 * @registration_id@ getter
	 * @return	registration_id
	 */
	public int getRegistration_id() {
		return registration_id;
	}

	/**
	 * @registration_id@ setter
	 * @param	registration_id
	 */
	public void setRegistration_id(int registration_id) {
		this.registration_id = registration_id;
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

	/**
	 * @semester@ getter
	 * @return	semester
	 */
	public Integer getSemester() {
		return semester;
	}

	/**
	 * @semester@ setter
	 * @param	semester
	 */
	public void setSemester(Integer semester) {
		this.semester = semester;
	}

	/**
	 * @credit@ getter
	 * @return	credit
	 */
	public Integer getCredit() {
		return credit;
	}

	/**
	 * @credit@ setter
	 * @param	credit
	 */
	public void setCredit(Integer credit) {
		this.credit = credit;
	}

	/**
	 * @classification@ getter
	 * @return	classification
	 */
	public String getClassification() {
		return classification;
	}

	/**
	 * @classification@ setter
	 * @param	classification
	 */
	public void setClassification(String classification) {
		this.classification = classification;
	}

	/**
	 * @department@ getter
	 * @return	department
	 */
	public String getDepartment() {
		return department;
	}

	/**
	 * @department@ setter
	 * @param	department
	 */
	public void setDepartment(String department) {
		this.department = department;
	}

	/**
	 * @professor@ getter
	 * @return	professor
	 */
	public String getProfessor() {
		return professor;
	}

	/**
	 * @professor@ setter
	 * @param	professor
	 */
	public void setProfessor(String professor) {
		this.professor = professor;
	}

	/**
	 * @course_id@ getter
	 * @return	course_id
	 */
	public int getCourse_id() {
		return course_id;
	}

	/**
	 * @course_id@ setter
	 * @param	course_id
	 */
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
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
	 * @course_id@ getter
	 * @return	course_id
	 */
	public int getCourse_num() {
		return course_num;
	}

	/**
	 * @course_id@ setter
	 * @param	course_id
	 */
	public void setCourse_num(int course_num) {
		this.course_num = course_num;
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
