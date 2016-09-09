package com.common.service;

import java.io.IOException;
import java.io.InputStream;

public interface IUserService {
	public  InputStream getImage() throws IOException;

	public String getText();
}
