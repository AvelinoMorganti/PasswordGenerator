<%-- 
    Document   : index
    Created on : 11/11/2015, 16:51:10
    Author     : Avelino
--%>
<%@page import="classes.passwordGenerator"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Generator</title>
    </head>
    <body>
        <%
            //Definir balanceamento de numeros, letras e caracteres
            //Definir método para download do arquivo encriptado com uma senha inserida previamente
            passwordGenerator p = new passwordGenerator();
            String passwordType = "NUMBERS";
            int passwordLenght = 16;

            passwordType = request.getParameter("passwordType");
            String _passwordLenght = request.getParameter("passwordLenght");

            if (_passwordLenght != null && (!_passwordLenght.isEmpty())) {
                passwordLenght = Integer.parseInt(_passwordLenght);
            }

            if (passwordLenght <= 0 || passwordLenght > 99) {
                passwordLenght = 16;
            }
        %>


        <table>
            <form name="formPassword" action="index.jsp" method="POST"  >
                <tr>
                    <td>
                        Senha numérica <input type="radio" name="passwordType" id="passwordType" value="NUMBERS" checked="true">
                        Senha alfanumérica <input type="radio" name="passwordType" id="passwordType" value="ALPHANUMERIC">
                        Senha com símbolos <input type="radio" name="passwordType" id="passwordType" value="STRONG" >
                    </td>
                </tr>
                <tr>
                    <td>
                        Tamanho: <input type="text" name="passwordLenght" id="passwordLenght" value="16" size="2" maxlength="2">
                        <input type="submit" name="Generate" id="Generate" value="Gerar Passwords" />
                    </td>
                </tr>
            </form>
            <tr>
                <td>
                    <%                            if (passwordType == null) {
                            out.print("Senha gerada: <pre><b>");
                            out.print(p.passwordGenerator(16, "NUMBERS"));
                            out.print("</b></pre>");
                        } else {
                            out.print("Senha gerada: <pre><b>");
                            out.print(p.passwordGenerator(passwordLenght, passwordType));
                            out.print("</b></pre>");
                        }
                    %>
                </td>
            </tr>
            <form name="formPassword" action="index.jsp" method="POST"  >
                <tr>
                    <td>
                        Porcentagem de números <input type="text" name="numbers_qnt" id="numbers_qnt" value="0.11" size="3" maxlength="3">
                    </td>
                <tr>
                    <td>
                        Porcentagem de letras <input type="text" name="letters_qnt" id="letters_qnt" value="0.57" size="3" maxlength="3">
                    </td>
                </tr>
                <tr>
                    <td>
                        Porcentagem de símbolos <input type="text" name="symbols_qnt" id="symbols_qnt" value="0.32" size="3" maxlength="3">
                    </td>
                </tr>
                <tr>
                    <td>
                        Tamanho: <input type="text" name="passwordLenght" id="passwordLenght" value="16" size="2" maxlength="2">
                        <input type="submit" name="Generate" id="Generate" value="Gerar Passwords" />
                    </td>                    
                </tr>
            </form>
            <tr>
                <td>
                    <%
                        String numbers_ = request.getParameter("numbers_qnt");
                        String letters_ = request.getParameter("letters_qnt");
                        String symbols_ = request.getParameter("symbols_qnt");

                        double numbers_qnt = 0.11;
                        double letters_qnt = 0.57;
                        double symbols_qnt = 0.32;

                        if (numbers_ != null && letters_ != null && symbols_ != null) {
                            numbers_qnt = Double.parseDouble(numbers_);
                            letters_qnt = Double.parseDouble(letters_);
                            symbols_qnt = Double.parseDouble(symbols_);
                        }

                        String password_numerica = p.passwordGenerator((int) (Math.round(passwordLenght * numbers_qnt)), "NUMBERS");
                        String password_alfanumerica = p.passwordGenerator((int) (Math.round(passwordLenght * letters_qnt)), "RANDOM_CASE_LETTERS");
                        String password_simbolica = p.passwordGenerator((int) (Math.round(passwordLenght * symbols_qnt)), "SYMBOLS");
                        String password = password_numerica + password_alfanumerica + password_simbolica;

                        out.print("<br>Sua senha: <b><pre>" + p.shuffleString(password) + "</pre></b>");
                        out.print("Tamanho da password: " + password.length() + " caracteres");
                        out.print("<br>Outra combinação com os mesmos caracteres: <b><pre>" + p.shuffleString(password) + "</pre></b>");


                    %>
                <td>
            </tr>
            <tr> 
                <td>
                    <div>
                        <%                            out.print("<h5>Números + letras + símbolos</h5>");
                            for (int i = 4; i < 17; i += 2) {
                                out.print(i + " caracteres: <b><pre>");
                                out.print(p.passwordGenerator(i, "STRONG"));
                                out.print("</pre></b>");
                            }%>
                    </div>
                </td>
                <td>
                    <div>
                        <%
                            out.print("<h5>Números</h5>");
                            for (int i = 2; i < 15; i += 2) {
                                out.print(i + " caracteres: <b>");
                                out.print(p.passwordGenerator(i, "NUMBERS"));
                                out.print("</b><br/>");
                            }
                        %>
                    </div>
                    <div>
                        <%out.print("<h5>Números + letras </h5>");
                            for (int i = 4; i < 17; i += 2) {
                                out.print(i + " caracteres: <b>");
                                out.print(p.passwordGenerator(i, "ALPHANUMERIC"));
                                out.print("</b><br/>");
                            }
                        %>
                    </div>
                </td>

            </tr>
        </table>
        <p>Não use sequências de números, nem de letras</p>
        <p>Não use datas, nome, sobrenome, cidade, país ou palavras que podem estar em um dicionário</p>
        <p>Não use passwords cujas letras se encontrem próximas no teclado ex: qwert, asdfg, zxcvbnm, qazwsx, poiuy</p>
    </body>
</html>
