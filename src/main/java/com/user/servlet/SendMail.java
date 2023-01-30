package com.user.servlet;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;

@WebServlet("/sendmail")
public class SendMail extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name");
		String message = req.getParameter("msg");
		String toMail = req.getParameter("email");

		int bid=Integer.parseInt(req.getParameter("bid"));
		
		HttpSession session = req.getSession();
		User u = (User) session.getAttribute("userobj");
		message = "Hi,\n \nI am " + name + ".\n\n" + message + "\n\n My Email : " + u.getEmail() + "\n\n Thank you";

		SendEmail(message, "Ebook Store", toMail, "techlife246@gmail.com");
		
		session.setAttribute("succMsg", "Email sent sucessfully..");
		resp.sendRedirect("messages.jsp?bid="+bid);

	}

	private static void SendEmail(String msg, String subject, String to, String from) {
		String host = "smtp.gmail.com";

		Properties properties = System.getProperties();

		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");

		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {

				return new PasswordAuthentication("****@gmail.com", "*****");
			}
		});
		session.setDebug(true);

		MimeMessage m = new MimeMessage(session);
		try {

			m.setFrom(from);

			m.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			m.setSubject(subject);
			m.setText(msg);

			Transport.send(m);

		} catch (MessagingException e) {
			e.printStackTrace();
		}

	}

}
