package PLT.vo;

public class Submission_FileVO {
	private int f_id;
	private int student_id;
	private int submissions_id;
	private String f_name;
	private String f_origin_name;
	private String f_path;
	private Long f_size;
	private String f_regdate;
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
