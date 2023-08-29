<%

         
		//request.getSession().removeAttribute( "email");
		//request.getSession(true).invalidate(); 
		
		session.removeAttribute("email");
        response.sendRedirect("index.jsp") ;

%>

