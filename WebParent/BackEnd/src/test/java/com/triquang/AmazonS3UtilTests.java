package com.triquang;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import org.junit.jupiter.api.Test;

import com.triquang.admin.AmazonS3Util;

public class AmazonS3UtilTests {
	
	@Test
	public void testUploadFile() throws FileNotFoundException{
		String folderName = "Test-upload";
		String fileName = "female-296990_1280.png";
		String filePath = "C:\\Developer\\" + fileName;
		
		InputStream inputStream = new FileInputStream(filePath);
		
		AmazonS3Util.uploadFile(folderName, fileName, inputStream);
	}
}
