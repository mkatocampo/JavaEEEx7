/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.nbcc.date;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;



/**
 *
 * @author Chris.Cusack
 */
public class DateTime extends SimpleTagSupport {
   public void doTag() throws IOException {
       int year = Calendar.getInstance().get(Calendar.YEAR);
       
      JspWriter out = getJspContext().getOut();              
      out.println(year);
   }
}
