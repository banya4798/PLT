package PLT.vo;

public class FileVO {

	private int f_id;
	private int registration_id;
	private Integer user_id;
	private String username;
	private String f_name;
	private String f_origin_name;
	private String f_path;
	private Long f_size;
	private String f_regdate;
	private int course_id;
	private String instruct_title;

	/** 
	 * @username@ getter
	 * @return	username
	 */
	public String getUsername() {
		return username;
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

}
