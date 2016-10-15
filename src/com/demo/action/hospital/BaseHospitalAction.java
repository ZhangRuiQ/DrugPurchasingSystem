package com.demo.action.hospital;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.common.dto.MedicineDto;
import com.common.dto.OrderDto;
import com.common.dto.OrderItemDto;
import com.demo.dto.hospital.DownloadInformation;
import com.demo.dto.hospital.MedicineSearchCondition;
import com.demo.dto.hospital.OrderSearchCondition;
import com.demo.service.hospital.IHospitalService;
import com.opensymphony.xwork2.ActionSupport;

public class BaseHospitalAction extends ActionSupport implements ServletRequestAware, ServletResponseAware {
	private IHospitalService hospitalService;
	private String oldPasswd;
	private String newPasswd;
	private String newPasswdAgain;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private HttpSession session;
	private ServletContext application;
	private OrderSearchCondition orderSearchCondition;
	private List<MedicineDto> medicineDtoList;
	private MedicineSearchCondition	condition;
	private DownloadInformation downloadInformation;
	private String medicineIdStr;
	private OrderDto orderDto;
	private List<OrderDto> orderDtoList;
	private List<OrderItemDto> orderItemDtoList;
	private String purchase_maintain_jsp_information;
	
	private int page;
	private	String purchase_new_jsp_information;
	private	String purchase_put_jsp_information;
	public String getOldPasswd() {
		return oldPasswd;
	}
	public String getPurchase_maintain_jsp_information() {
		return purchase_maintain_jsp_information;
	}
	public void setPurchase_maintain_jsp_information(
			String purchase_maintain_jsp_information) {
		this.purchase_maintain_jsp_information = purchase_maintain_jsp_information;
	}
	public void setOldPasswd(String oldPasswd) {
		this.oldPasswd = oldPasswd;
	}
	public List<OrderDto> getOrderDtoList() {
		return orderDtoList;
	}
	public void setOrderDtoList(List<OrderDto> orderDtoList) {
		this.orderDtoList = orderDtoList;
	}
	public String getPurchase_put_jsp_information() {
		return purchase_put_jsp_information;
	}
	public void setPurchase_put_jsp_information(String purchase_put_jsp_information) {
		this.purchase_put_jsp_information = purchase_put_jsp_information;
	}
	public String getNewPasswd() {
		return newPasswd;
	}
	public void setNewPasswd(String newPasswd) {
		this.newPasswd = newPasswd;
	}
	
	public IHospitalService getHospitalService() {
		return hospitalService;
	}
	public OrderSearchCondition getOrderSearchCondition() {
		return orderSearchCondition;
	}
	public void setOrderSearchCondition(OrderSearchCondition orderSearchCondition) {
		this.orderSearchCondition = orderSearchCondition;
	}
	public void setHospitalService(IHospitalService hospitalService) {
		this.hospitalService = hospitalService;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		
		this.request=request;
		this.session=request.getSession();
		this.application=request.getServletContext();
		// TODO Auto-generated method stub
		
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public HttpServletResponse getResponse() {
		return response;
	}
	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}
	public HttpSession getSession() {
		return session;
	}
	public void setSession(HttpSession session) {
		this.session = session;
	}
	public ServletContext getApplication() {
		return application;
	}
	public void setApplication(ServletContext application) {
		this.application = application;
	}
	public String getNewPasswdAgain() {
		return newPasswdAgain;
	}
	public void setNewPasswdAgain(String newPasswdAgain) {
		this.newPasswdAgain = newPasswdAgain;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public MedicineSearchCondition getCondition() {
		return condition;
	}
	public void setCondition(MedicineSearchCondition condition) {
		this.condition = condition;
	}
	public List<MedicineDto> getMedicineDtoList() {
		return medicineDtoList;
	}
	public void setMedicineDtoList(List<MedicineDto> medicineDtoList) {
		this.medicineDtoList = medicineDtoList;
	}
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.response=arg0;
		
	}
	public DownloadInformation getDownloadInformation() {
		return downloadInformation;
	}
	public void setDownloadInformation(DownloadInformation downloadInformation) {
		this.downloadInformation = downloadInformation;
	}
	public String getMedicineIdStr() {
		return medicineIdStr;
	}
	public void setMedicineIdStr(String medicineIdStr) {
		this.medicineIdStr = medicineIdStr;
	}
	public OrderDto getOrderDto() {
		return orderDto;
	}
	public void setOrderDto(OrderDto orderDto) {
		this.orderDto = orderDto;
	}
	public List<OrderItemDto> getOrderItemDtoList() {
		return orderItemDtoList;
	}
	public void setOrderItemDtoList(List<OrderItemDto> orderItemDtoList) {
		this.orderItemDtoList = orderItemDtoList;
	}
	public String getPurchase_new_jsp_information() {
		return purchase_new_jsp_information;
	}
	public void setPurchase_new_jsp_information(String purchase_new_jsp_information) {
		this.purchase_new_jsp_information = purchase_new_jsp_information;
	}
}
