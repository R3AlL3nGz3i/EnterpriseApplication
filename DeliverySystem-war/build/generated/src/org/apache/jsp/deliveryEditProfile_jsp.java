package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.DeliveryStaff;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;

public final class deliveryEditProfile_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
 Class.forName("org.apache.derby.jdbc.ClientDriver");

      out.write("\n");
      out.write("<style>\n");
      out.write("    .register a:link, .register a:visited   {\n");
      out.write("        background-color: #ADD8E6; /* Green background */\n");
      out.write("        border: 1px solid blue; /* Green border */\n");
      out.write("        color: white; /* White text */\n");
      out.write("        padding: 30px 30px; /* Some padding */\n");
      out.write("        cursor: pointer; /* Pointer/hand icon */\n");
      out.write("        width: 100%; /* Set a width if needed */\n");
      out.write("        display: inline; /* Make the buttons appear below each other */\n");
      out.write("        margin: 0 auto;\n");
      out.write("        font-size: 100%;\n");
      out.write("    }\n");
      out.write("    #search{\n");
      out.write("        background-position: 10px 12px; /* Position the search icon */\n");
      out.write("        background-repeat: no-repeat; /* Do not repeat the icon image */\n");
      out.write("        width: 30%; /* Full-width */\n");
      out.write("        font-size: 16px; /* Increase font-size */\n");
      out.write("        padding: 12px 20px 12px 40px; /* Add some padding */\n");
      out.write("        border: 1px solid #ddd; /* Add a grey border */\n");
      out.write("        margin-bottom: 12px; /* Add some space below the input */\n");
      out.write("    }\n");
      out.write("    /* Add a background color on hover */\n");
      out.write("    .p:hover, .p:active {\n");
      out.write("        background-color: #add8e6;\n");
      out.write("        cursor:auto\n");
      out.write("    }\n");
      out.write("    .tableCart {\n");
      out.write("        margin-left: auto;\n");
      out.write("        margin-right: auto;\n");
      out.write("        border-collapse: collapse; /* Collapse borders */\n");
      out.write("        background-color: #99ccff; \n");
      out.write("       \n");
      out.write("        overflow:scroll;\n");
      out.write("    }\n");
      out.write("    p>input, p>button {\n");
      out.write("        font-size: 23px;\n");
      out.write("    }\n");
      out.write("    .tableCart th, #tableCart td {\n");
      out.write("        text-align: left; /* Left-align text */\n");
      out.write("        padding: 12px; /* Add padding */\n");
      out.write("    }\n");
      out.write("    .tableCart tr {\n");
      out.write("        /* Add a bottom border to all table rows */\n");
      out.write("        border-bottom: 1px solid #ddd;\n");
      out.write("    }\n");
      out.write("    .tableCart tr.header{\n");
      out.write("        /* Add a grey background color to the table header and on hover */\n");
      out.write("        background-color: #F1C40F;\n");
      out.write("    }\n");
      out.write("    #tableCart tr:hover {\n");
      out.write("\n");
      out.write("    }\n");
      out.write("\n");
      out.write("</style>\n");
      out.write("\n");

    HttpSession s = request.getSession();
    DeliveryStaff user_id = (DeliveryStaff) s.getAttribute("login");

    String url = "jdbc:derby://localhost:1527/sample";
    Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
    Connection conn = DriverManager.getConnection(url, "app", "app");

    Statement statement = conn.createStatement();
    ResultSet resultSet = statement.executeQuery("select * from APP.DELIVERYSTAFF WHERE ID = '" + user_id.getId() + "' ");

    while (resultSet.next()) {


      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Edit Profile</title>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("    <center>\n");
      out.write("\n");
      out.write("        <form action=\"DeliveryEditProfile\" method=\"POST\">             \n");
      out.write("            <table>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Username:</td>\n");
      out.write("                    <td><input type=\"text\" name=\"id\" size=\"20\"  value=\"");
      out.print(resultSet.getString("ID"));
      out.write("\" readonly></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Identification Number: </td>\n");
      out.write("                    <td><input type=\"text\" name=\"ic\" size=\"20\"  value=\"");
      out.print(resultSet.getString("IC"));
      out.write("\" readonly></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Full Name: </td>\n");
      out.write("                    <td><input type=\"text\" name=\"name\" size=\"20\"  value=\"");
      out.print(resultSet.getString("NAME"));
      out.write("\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Password:</td>\n");
      out.write("                    <td><input type=\"text\" name=\"pass\" size=\"20\"  value=\"");
      out.print(resultSet.getString("PASSWORD"));
      out.write("\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Gender:</td>\n");
      out.write("                    <td><input type=\"text\" name=\"pass\" size=\"20\"  value=\"");
      out.print(resultSet.getString("GENDER"));
      out.write("\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Contact:</td>\n");
      out.write("                    <td><input type=\"text\" name=\"contact\" size=\"20\"  value=\"");
      out.print(resultSet.getString("PHONE"));
      out.write("\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Address:</td>\n");
      out.write("                    <td><input type=\"text\" name=\"address\" size=\"20\"  value=\"");
      out.print(resultSet.getString("ADDRESS"));
      out.write("\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Email:</td>\n");
      out.write("                    <td><input type=\"text\" name=\"email\" size=\"20\"  value=\"");
      out.print(resultSet.getString("EMAIL"));
      out.write("\"></td>\n");
      out.write("                </tr>\n");
      out.write("            </table>    \n");
      out.write("            ");

                }
            
      out.write("\n");
      out.write("            <p>\n");
      out.write("                <input type=\"reset\" value=\"Clear\"> \n");
      out.write("                <input type=\"submit\" value=\"Update\">\n");
      out.write("            </p>        \n");
      out.write("        </form>   \n");
      out.write("    </center>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
