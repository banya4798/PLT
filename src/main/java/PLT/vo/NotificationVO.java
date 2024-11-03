package PLT.vo;

public class NotificationVO {
	private int notification_id;
	private int student_id;
	private String message;
	private String created_at;
	private String username;
	private String read;

	/**
	 * @read@ getter
	 * @return	read
	 */
	public String getRead() {
		return read;
	}

	/**
	 * @read@ setter
	 * @param	read
	 */
	public void setRead(String read) {
		this.read = read;
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
	 * @notification_id@ getter
	 * @return	notification_id
	 */
	public int getNotification_id() {
		return notification_id;
	}

	/**
	 * @notification_id@ setter
	 * @param	notification_id
	 */
	public void setNotification_id(int notification_id) {
		this.notification_id = notification_id;
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
	 * @message@ getter
	 * @return	message
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @message@ setter
	 * @param	message
	 */
	public void setMessage(String message) {
		this.message = message;
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

}
