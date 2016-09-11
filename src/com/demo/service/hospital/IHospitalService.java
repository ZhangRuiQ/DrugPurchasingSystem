package com.demo.service.hospital;

import java.util.List;

import com.common.domain.Medicine;

public interface IHospitalService {
	public String modifyPasswd(String id,String newPasswd);
	//操作手册下载
	public String help();
		//药品目录加载
	public List<Medicine> loadMedicines();
		//退货单创建
		//退货单列表
		//采购单修改
		//采购单创建
		//采购单入库
		//采购单列表
}
