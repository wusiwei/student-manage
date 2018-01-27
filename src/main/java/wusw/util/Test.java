package wusw.util;

import java.util.Scanner;

public class Test {
	public static void main(String[] args){
		Scanner sc =new Scanner(System.in);
		if(sc.hasNext()){
			String a=sc.next();
			System.out.println(getAllDifferentString(a));
		}
	}
	
	public static String getAllDifferentString(String oldString){
		
		String firstString=oldString.substring(0, 1);
		String indexString="";
		String lString=oldString.replaceAll(firstString, "");
		if(lString.length()>1){
			indexString=getAllDifferentString(lString);
		}else{
			indexString=lString;
		}
		return firstString+indexString;
	}
}
