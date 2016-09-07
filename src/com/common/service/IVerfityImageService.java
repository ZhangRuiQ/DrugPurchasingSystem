package com.common.service;

import java.io.IOException;
import java.io.InputStream;

public interface IVerfityImageService {
	public  InputStream getImage() throws IOException;

	public String getText();

}
