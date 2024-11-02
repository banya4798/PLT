package PLT.vo;

public class UserVO {
	private int user_id;
	private String username;
	private String email;
	private String password;
	private String hash_pw; // SHA-256으로 암호화된 비번
	private String salt; // 회원가입 시, 최초의 해시값 저장. (이거 아니면 최초의 해시결과값에 도달 x)
	private Integer role_id;
	private String created_at;
	private String updated_at;
	private String role_name; // 학생 or 강사

	private String confirmPassword; // 비밀번호 인증
	private String verificationCode; // 인증번호

	/**
	 * @salt@ getter
	 * @return	salt
	 */
	public String getSalt() {
		return salt;
	}

	/**
	 * @salt@ setter
	 * @param	salt
	 */
	public void setSalt(String salt) {
		this.salt = salt;
	}

	/**
	 * @hash_pw@ getter
	 * @return	hash_pw
	 */
	public String getHash_pw() {
		return hash_pw;
	}

	/**
	 * @hash_pw@ setter
	 * @param	hash_pw
	 */
	public void setHash_pw(String hash_pw) {
		this.hash_pw = hash_pw;
	}

	/**
	 * @confirmPassword@ getter
	 * @return	confirmPassword
	 */
	public String getConfirmPassword() {
		return confirmPassword;
	}

	/**
	 * @confirmPassword@ setter
	 * @param	confirmPassword
	 */
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	/**
	 * @verificationCode@ getter
	 * @return	verificationCode
	 */
	public String getVerificationCode() {
		return verificationCode;
	}

	/**
	 * @verificationCode@ setter
	 * @param	verificationCode
	 */
	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}

	/**
	 * @role_name@ getter
	 * @return	role_name
	 */
	public String getRole_name() {
		return role_name;
	}

	/**
	 * @role_name@ setter
	 * @param	role_name
	 */
	public void setRole_name(String role_name) {
		this.role_name = role_name;
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
	 * @email@ getter
	 * @return	email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @email@ setter
	 * @param	email
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @password@ getter
	 * @return	password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @password@ setter
	 * @param	password
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @role_id@ getter
	 * @return	role_id
	 */
	public Integer getRole_id() {
		return role_id;
	}

	/**
	 * @role_id@ setter
	 * @param	role_id
	 */
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
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

	/*Getter / Setter*/

}
