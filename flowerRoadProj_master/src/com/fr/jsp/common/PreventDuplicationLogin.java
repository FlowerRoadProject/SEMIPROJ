package com.fr.jsp.common;

import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Iterator;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class PreventDuplicationLogin implements HttpSessionBindingListener, HttpSessionAttributeListener {

	

	
	private static PreventDuplicationLogin preventDuplicationLogin = null;
	private static Hashtable memberNums = new Hashtable();
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5636163291205506365L;

	
	public static synchronized PreventDuplicationLogin getInstance(){
		if(preventDuplicationLogin==null){
			preventDuplicationLogin = new PreventDuplicationLogin();
		}else{
			
		}
		return preventDuplicationLogin ;
	}
	
	

	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		memberNums.put(event.getSession(), (String)event.getSession().getAttribute("memberNum"));
		System.out.println("valueBound 에 들어옴");
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		memberNums.remove(event.getSession());	
		System.out.println("valueUnBound 에 들어옴");
	}

	
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
		memberNums.put(event.getSession(), (String)event.getSession().getAttribute("memberNum"));
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		memberNums.remove(event.getSession());	
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		
	}

	public boolean isUsing(String userNum){
		return memberNums.containsValue(userNum);
		
	}
	
	public void printLoginedID(){
		
		Enumeration<HttpSession> e = memberNums.keys();
		
		while(e.hasMoreElements()){
			HttpSession key =e.nextElement();
			String value = (String) memberNums.get(key);
			System.out.println("key : "+ key + "  value : "+value);
		}
	}
	
	


}
