package PLT;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("fileManager")
public class FileManager {
	// 파일 업로드 메소드
	public String saveFile(MultipartFile multipartFile, String path) throws Exception {
		// 1. 중복되지 않는 파일명 생성
		String fileName = UUID.randomUUID().toString();

		// 2. 원본 파일명과 확장자를 포함한 새 파일명 생성
		String originalFileName = multipartFile.getOriginalFilename();

		StringBuffer buffer = new StringBuffer();
		buffer.append(fileName);
		buffer.append("_");
		buffer.append(originalFileName);

		// 3. 파일 저장
		File file = new File(path, buffer.toString());
		multipartFile.transferTo(file);

		// 생성된 파일명 반환
		return buffer.toString();
	}

	// 파일 확장자 및 파일 사이즈 유효성 검사
	public boolean validateFile(MultipartFile file) {
		String[] allowedExtensions = { "jpg", "png", "hwp", "pdf" };
		long maxSize = 10 * 1024 * 1024; //10MB

		// 파일 크기 검사
		if (file.getSize() > maxSize) {
			return false; // 크기 초과
		}

		// 파일 확장자 검사
		String fileName = file.getOriginalFilename();
		String fileExtension = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();

		for (String extension : allowedExtensions) {
			if (extension.equals(fileExtension)) {
				return true; // 유효한 파일
			}
		}
		return false; // 허용되지 않는 파일 형식
	}
}
