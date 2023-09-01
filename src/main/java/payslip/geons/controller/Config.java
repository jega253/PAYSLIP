package payslip.geons.controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import payslip.geons.service.Loginmodel;

@WebListener
public class Config implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent event) {
        ServletContext servletContext = event.getServletContext(); 
        Loginmodel loginmodel = new Loginmodel();
        System.out.println("login model created");
        servletContext.setAttribute("loginmodel",  loginmodel);
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
       
    }

}