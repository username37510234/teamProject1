package today.whatdo.festival.controller;


import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import today.whatdo.festival.service.FileInfoService;
import today.whatdo.festival.vo.FileInfoVO;

@RestController
public class FileController {

	@Autowired
	private FileInfoService fileInfoService;
	
	@PostMapping("/file-infos")
	public int fileUpload(@ModelAttribute FileInfoVO fileInfo) throws IllegalStateException, IOException {
		
		return fileInfoService.insertFileInfo(fileInfo);
	}
//	public static void main(String[] args) {
//		long fileName= UUID.randomUUID().toString();
//	}
}
