package PLT;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import org.springframework.stereotype.Component;

@Component
public class SHA256 {

	// 무작위 문자열 Salt 생성
	public String getSalt() {
		SecureRandom sr = new SecureRandom();
		byte[] salt = new byte[20];

		// 난수 생성
		sr.nextBytes(salt);

		//byte To String (10진수 문자열로 변경)
		StringBuffer sb = new StringBuffer();
		for (byte b : salt) {
			sb.append(String.format("%02x", b));
		}
		return sb.toString();
	}

	// SHA-256 알고리즘 적용
	public String getEncrypt(String pw, String salt) {
		String result = "";
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");

			System.out.println("비밀번호와 Salt값 적용 전 : " + pw + salt);
			md.update((pw + salt).getBytes());
			byte[] pwdSalt = md.digest();

			StringBuffer sb = new StringBuffer();
			for (byte b : pwdSalt) {
				sb.append(String.format("%02x", b));
			}

			result = sb.toString();
			System.out.println("비밀번호와 Salt 적용 후 : " + result);

		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}

		return result;
	}

	/*	public static void main(String[] args) {
			SHA256 s = new SHA256();
			String pwd = "1234";
			String salt = s.getSalt();
			s.getEncrypt(pwd, salt);
	
		}*/

}
