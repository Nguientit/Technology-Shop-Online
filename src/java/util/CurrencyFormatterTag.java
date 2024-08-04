/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/TagHandler.java to edit this template
 */
package util;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.tagext.JspFragment;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author Admin
 */
public class CurrencyFormatterTag extends SimpleTagSupport {
    private float value;

    public void setValue(float value) {
        this.value = value;
    }

    @Override
    public void doTag() throws JspException, IOException {
        String formattedValue = CurrencyFormatter.formatCurrency(value);
        getJspContext().getOut().write(formattedValue);
    }
}
