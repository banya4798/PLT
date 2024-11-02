package PLT;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSendService {

	@Autowired
	JavaMailSenderImpl mailSender;

	// 이메일 인증 메소드
	public String certificationCode(String email) {
		System.out.println("전달받은 이메일 주소 : " + email);

		// 이메일 인증번호 난수로 ㅅㅇ성
		Random random = new Random();
		int ran_num = random.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + ran_num);

		// 이메일 보낼 양식
		String setFrom = "banya4798gmail.com";
		String toMail = email;
		String title = "인증요청 이메일 입니다.";
		String content = "인증코드는 [" + ran_num + "] 입니다" + "<br>" + "해당 인증 번호를 인증번호 코드 확인란에 기입해주세요,";
		mailSend(setFrom, toMail, title, content);
		System.out.println("인증코드 발송 성공");
		return Integer.toString(ran_num);
	}

	public void mailSend(String setFrom, String toMail, String title, String content) {
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능, 문자 인코딩 설정도 가능.
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true); // true 전달 -> html형식으로 전송
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("인증번호 발송 실패했습니다.");
		}
	}
}
