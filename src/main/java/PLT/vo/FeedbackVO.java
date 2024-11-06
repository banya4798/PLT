package PLT.vo;

public class FeedbackVO {
	private int feedback_id;
	private int submissions_id;
	private int instructor_id;
	private String common;
	private String created_at;
	private String updated_at;
	private int rating;
	private String username;
	private int student_id;
	private int assignment_id;

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
	 * @feedback_id@ getter
	 * @return	feedback_id
	 */
	public int getFeedback_id() {
		return feedback_id;
	}

	/**
	 * @feedback_id@ setter
	 * @param	feedback_id
	 */
	public void setFeedback_id(int feedback_id) {
		this.feedback_id = feedback_id;
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
	 * @common@ getter
	 * @return	common
	 */
	public String getCommon() {
		return common;
	}

	/**
	 * @common@ setter
	 * @param	common
	 */
	public void setCommon(String common) {
		this.common = common;
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

	/**
	 * @rating@ getter
	 * @return	rating
	 */
	public int getRating() {
		return rating;
	}

	/**
	 * @rating@ setter
	 * @param	rating
	 */
	public void setRating(int rating) {
		this.rating = rating;
	}

}
