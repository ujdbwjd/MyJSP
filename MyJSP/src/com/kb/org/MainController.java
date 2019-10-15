package com.kb.org;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MainController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = null;
		
		request.setCharacterEncoding("UTF-8");
		String reqURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = reqURI.substring(contextPath.length());
		
		System.out.println("reqURI = " + reqURI);
		System.out.println("contextPath = " + contextPath);
		System.out.println("cmd = " + cmd);
		
		
//    	tomcat 서버실행 시
//    	server.xml
//    	web.xml
//    	context.xml
//    	어노테이션
		
		if(cmd.equals("/index.do")) {
			/*
			 * 최신 회원가입한 목록 5개 select
			 * 최신 글 목록 5개 select
			 * List 2개
			 */
			rd = request.getRequestDispatcher("index.jsp");
		} else if(cmd.equals("/member.do")) {
			
			rd = request.getRequestDispatcher("member.jsp");
		} else if(cmd.equals("/freeboard.do")) { 
			rd = request.getRequestDispatcher("freeboard.jsp");
		}
		
		rd.forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
