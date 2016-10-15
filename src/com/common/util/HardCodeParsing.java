package com.common.util;

public class HardCodeParsing {
	public static String parseOrderStatus(int status){
	String str="";
		switch (status) {
		case 0:str="未提交";
		
		break;
		case 10:str="未审批";
		
		break;
		case 50:str="审批不通过";
		
		break;
		case 2:str="未发货/全部";
		
		break;
		case 3:str="发货中/全部";
		
		break;
		case 4:str="订单完成/全部";
	
		break;
		case 20:str="未发货/未付款";
		
		break;
		case 30:str="发货中/未付款";
		
		break;
		case 40:str="订单完成/未付款";
	
		break;
		case 21:str="未发货/已付款";
		
		break;
		case 31:str="发货中/已付款";
		
		break;
		case 41:str="订单完成/已付款";
	
		break;
		case 60:str="申请退货";
		
		break;
		case 70:str="退货审批";
		
		break;
		case 81:str="退货中/未退款";
	
		break;
		case 91:str="退货成功/未付款";
		
		break;
		case 80:str="退货中/已退款";
		
		break;
		case 90:str="退货成功/已付款";
		
		break;

		default:
			str="全部";
			break;
		}
		return str;
	}
	
	public static String parseMedicineStatus(int status){
		String str="";
		switch (status) {
		case 1:
			str="暂停交易";
			break;
		case 2:
			str="接受预定";
			break;
		default:
			str="正常交易";
			break;
		}
		return str;
		
	}

}
