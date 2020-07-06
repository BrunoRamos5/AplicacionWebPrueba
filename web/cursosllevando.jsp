<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Llevando Cursos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <%! 
        String consulta;
        Connection cn;
        PreparedStatement pst;
        ResultSet rs;
        String s_accion;
        String s_idpersona;
      
        %>
    </head>
    <body class="col row col-12 justify-content-center">
        <table border="1" cellspacing="0" cellpadding="" align="center" class="table text-center col-7" style="font-size: 12px; margin-top:30px !important"  >
            <thead class="thead-dark">
                <th class="thead-dark">CODIGO</th>
                <th class="thead-dark">NOMBRE</th>
                <th class="thead-dark">APELLIDOS</th>
                <th class="thead-dark">CURSO</th>
                <th class="thead-dark">HORAS</th>
                <th class="thead-dark">CREDITOS</th>
            </thead>   
        <%
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                consulta = "SELECT a.codigo, a.nombre, a.apellido, c.nombre, c.horas, c.creditos" 
                           + " FROM alumno a, curso c, estudiante_curso ac"
                           + " where a.idestudiante = ac.idestudiante"
                           + " and    c.idcurso = ac.idcurso";

                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
               
                while (rs.next()){
        %>         
        <tr>
            <td><%out.print(rs.getString(1));%></td> 
            <td><%out.print(rs.getString(2));%></td> 
            <td><%out.print(rs.getString(3));%></td> 
            <td><%out.print(rs.getString(4));%></td> 
            <td><%out.print(rs.getInt(5));%></td> 
            <td><%out.print(rs.getInt(6));%></td> 
           
        </tr>
                    
        <% 
                }
            
         %>
    </table>
    </body>
</html>
