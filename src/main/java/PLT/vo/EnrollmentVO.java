package PLT.vo;

public class EnrollmentVO {
	private int registration_id;
	private int enrollment_id; // 수강신청 테이블의 고유 아이디
	private int enrollment_num;
	private int user_id; // 수강신청한 사람의 유저아이디
	private int course_id; // 수강신청한 해당 코스의 아이디
	private String enrolled_at; // 수강신청한 날짜
	private String status; // 수강 상태 ( 기본은 미수강, 옵션- 미수강, 수강)
	private int instructor_id;
	private String username;
	private String title; // 제목
	private String department; // 학부(과) 
	private Integer semester; // 학기
	private Integer credit; // 학점
	private String classification; // 전공
	private String professor; // 교수명
	private String enroll_start_time; // 강의 시작 시간
	private String enroll_end_time; // 강의 종료 시간

	private int viewPage = 1;
	private int startIndex; // 페이지 시작 번호
	private String search; // 입력검색

	private String searchText;

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
	 * @searchText@ getter
	 * @return	searchText
	 */
	public String getSearchText() {
		return searchText;
	}

	/**
	 * @searchText@ setter
	 * @param	searchText
	 */
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	/**
	 * @enrollment_num@ getter
	 * @return	enrollment_num
	 */
	public int getEnrollment_num() {
		return enrollment_num;
	}

	/**
	 * @enrollment_num@ setter
	 * @param	enrollment_num
	 */
	public void setEnrollment_num(int enrollment_num) {
		this.enrollment_num = enrollment_num;
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
	 * @search@ getter
	 * @return	search
	 */
	public String getSearch() {
		return search;
	}

	/**
	 * @search@ setter
	 * @param	search
	 */
	public void setSearch(String search) {
		this.search = search;
	}

	/**
	 * @startIndex@ getter
	 * @return	startIndex
	 */
	public int getStartIndex() {
		return startIndex;
	}

	/**
	 * @startIndex@ setter
	 * @param	startIndex
	 */
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	/**
	 * @viewPage@ getter
	 * @return	viewPage
	 */
	public int getViewPage() {
		return viewPage;
	}

	/**
	 * @viewPage@ setter
	 * @param	viewPage
	 */
	public void setViewPage(int viewPage) {
		this.viewPage = viewPage;
	}

	/**
	 * @enrollment_id@ getter
	 * @return	enrollment_id
	 */
	public int getEnrollment_id() {
		return enrollment_id;
	}

	/**
	 * @enrollment_id@ setter
	 * @param	enrollment_id
	 */
	public void setEnrollment_id(int enrollment_id) {
		this.enrollment_id = enrollment_id;
	}

	/**
	 * @user_id@ getter
	 * @return	user_id
	 */
	public int getUser_id() {
		return user_id;
	}

	/**
	 * @user_id@ setter
	 * @param	user_id
	 */
	public void setUser_id(int user_id) {
		this.user_id = user_id;
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
	 * @enrolled_at@ getter
	 * @return	enrolled_at
	 */
	public String getEnrolled_at() {
		return enrolled_at;
	}

	/**
	 * @enrolled_at@ setter
	 * @param	enrolled_at
	 */
	public void setEnrolled_at(String enrolled_at) {
		this.enrolled_at = enrolled_at;
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
	 * @enroll_start_time@ getter
	 * @return	enroll_start_time
	 */
	public String getEnroll_start_time() {
		return enroll_start_time;
	}

	/**
	 * @enroll_start_time@ setter
	 * @param	enroll_start_time
	 */
	public void setEnroll_start_time(String enroll_start_time) {
		this.enroll_start_time = enroll_start_time;
	}

	/**
	 * @enroll_end_time@ getter
	 * @return	enroll_end_time
	 */
	public String getEnroll_end_time() {
		return enroll_end_time;
	}

	/**
	 * @enroll_end_time@ setter
	 * @param	enroll_end_time
	 */
	public void setEnroll_end_time(String enroll_end_time) {
		this.enroll_end_time = enroll_end_time;
	}

}
