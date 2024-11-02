package PLT.vo;

import java.util.List;

public class Enrollment_registrationVO {
	private int registration_id;
	private int registration_num;
	private int user_id;
	private String username;
	private int course_id;
	private String instructor_name;
	private String instruct_title;
	private String i_description;
	private String enroll_start_time;
	private String enroll_end_time;
	private int instructor_id;
	private int f_id;
	private String f_name;
	private String f_origin_name;
	private String f_path;
	private Long f_size;
	private String f_regdate;
	private List<FileVO> files;

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
	 * @files@ getter
	 * @return	files
	 */
	public List<FileVO> getFiles() {
		return files;
	}

	/**
	 * @files@ setter
	 * @param	files
	 */
	public void setFiles(List<FileVO> files) {
		this.files = files;
	}

	/**
	 * @f_id@ getter
	 * @return	f_id
	 */
	public int getF_id() {
		return f_id;
	}

	/**
	 * @f_id@ setter
	 * @param	f_id
	 */
	public void setF_id(int f_id) {
		this.f_id = f_id;
	}

	/**
	 * @f_name@ getter
	 * @return	f_name
	 */
	public String getF_name() {
		return f_name;
	}

	/**
	 * @f_name@ setter
	 * @param	f_name
	 */
	public void setF_name(String f_name) {
		this.f_name = f_name;
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
	 * @f_path@ getter
	 * @return	f_path
	 */
	public String getF_path() {
		return f_path;
	}

	/**
	 * @f_path@ setter
	 * @param	f_path
	 */
	public void setF_path(String f_path) {
		this.f_path = f_path;
	}

	/**
	 * @f_size@ getter
	 * @return	f_size
	 */
	public Long getF_size() {
		return f_size;
	}

	/**
	 * @f_size@ setter
	 * @param	f_size
	 */
	public void setF_size(Long f_size) {
		this.f_size = f_size;
	}

	/**
	 * @f_regdate@ getter
	 * @return	f_regdate
	 */
	public String getF_regdate() {
		return f_regdate;
	}

	/**
	 * @f_regdate@ setter
	 * @param	f_regdate
	 */
	public void setF_regdate(String f_regdate) {
		this.f_regdate = f_regdate;
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
	 * @registration_num@ getter
	 * @return	registration_num
	 */
	public int getRegistration_num() {
		return registration_num;
	}

	/**
	 * @registration_num@ setter
	 * @param	registration_num
	 */
	public void setRegistration_num(int registration_num) {
		this.registration_num = registration_num;
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
	 * @instructor_name@ getter
	 * @return	instructor_name
	 */
	public String getInstructor_name() {
		return instructor_name;
	}

	/**
	 * @instructor_name@ setter
	 * @param	instructor_name
	 */
	public void setInstructor_name(String instructor_name) {
		this.instructor_name = instructor_name;
	}

	/**
	 * @instruct_title@ getter
	 * @return	instruct_title
	 */
	public String getInstruct_title() {
		return instruct_title;
	}

	/**
	 * @instruct_title@ setter
	 * @param	instruct_title
	 */
	public void setInstruct_title(String instruct_title) {
		this.instruct_title = instruct_title;
	}

	/**
	 * @i_description@ getter
	 * @return	i_description
	 */
	public String getI_description() {
		return i_description;
	}

	/**
	 * @i_description@ setter
	 * @param	i_description
	 */
	public void setI_description(String i_description) {
		this.i_description = i_description;
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
