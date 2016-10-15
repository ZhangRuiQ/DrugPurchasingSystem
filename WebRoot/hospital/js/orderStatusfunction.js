	//解析订单状态函数
	function parseOrderStatus(e){
	var str="";
		switch (e) {
		case "0":str="未提交";
		
		break;
		case "10":str="未审批";
		
		break;
		case "50":str="审批不通过";
		
		break;
		case "2":str="未发货/全部";
		
		break;
		case "3":str="发货中/全部";
		
		break;
		case "4":str="订单完成/全部";
	
		break;
		case "20":str="未发货/未付款";
		
		break;
		case "30":str="发货中/未付款";
		
		break;
		case "40":str="订单完成/未付款";
	
		break;
		case "21":str="未发货/已付款";
		
		break;
		case "31":str="发货中/已付款";
		
		break;
		case "41":str="订单完成/已付款";
	
		break;
		case "60":str="申请退货";
		
		break;
		case "70":str="退货审批";
		
		break;
		case "81":str="退货中/未退款";
	
		break;
		case "91":str="退货成功/未付款";
		
		break;
		case "80":str="退货中/已退款";
		
		break;
		case "90":str="退货成功/已付款";
		
		break;

		default:
			str="全部";
			break;
		}
		return str;
	
	}
	
	
	//格式化订单状态函数
	function formatOrderStatus(e){
	var str="";
		switch (e) {
		case "未提交":str="0";
		
		break;
		case "未审批":str="10";
		
		break;
		case "审批不通过":str="50";
		
		break;
		case "未发货/全部":str="2";
		
		break;
		case "发货中/全部":str="3";
		
		break;
		case "订单完成/全部":str="4";
	
		break;
		case "未发货/未付款":str="20";
		
		break;
		case "发货中/未付款":str="30";
		
		break;
		case "订单完成/未付款":str="40";
	
		break;
		case "未发货/已付款":str="21";
		
		break;
		case "发货中/已付款":str="31";
		
		break;
		case "订单完成/已付款":str="41";
	
		break;
		case "申请退货":str="60";
		
		break;
		case "退货审批":str="70";
		
		break;
		case "退货中/未退款":str="81";
	
		break;
		case "退货成功/未付款":str="91";
		
		break;
		case "退货中/已退款":str="80";
		
		break;
		case "退货成功/已付款":str="90";
		
		break;

		default:
			str="-1";
			break;
		}
		return str;
	
	}