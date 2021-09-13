<%@ page import="models.Point" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css" rel="stylesheet">
        <link rel="stylesheet" href="static/css/result_styles.css">
        <script src="static/js/scripts.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <meta charset="UTF-8">
        <title>Вторая лабораторная работа по вебу | Результат</title>
    </head>
    <body>
    <section>
        <table>
            <tr>
                <td>
                    <main class="contentRect animated zoomIn">
                        <a class='photo cross' href='index.jsp'></a>
                        <a class='photo tableButton' id="tableButton" onclick="showTable()"></a>

                        <div id="infoContent">
                            <div class="baseInsideRect actionTimeRect">
                                <span>Время выполнения(нс)</span>
                                <p id="actionTime"></p>
                            </div>

                            <div class="baseInsideRect currentTimeRect">
                                <span>Текущее время</span>
                                <p id="currentTime"></p>
                                <script type="text/javascript">
                                    function setTime() {
                                        document.getElementById("currentTime").innerHTML = new Date().toLocaleTimeString();
                                    }

                                    setInterval(setTime, 1000);
                                    setTime();
                                </script>

                                <script type="text/javascript">
                                    function setTime() {
                                        let audio = new Audio('');
                                        <%
                                        ArrayList<Point> userPoints = (ArrayList<Point>) session.getAttribute("userPoints");
                                        Point lastPoint = userPoints.get(userPoints.size() - 1); // Последняя точка.
                                        long endTime = System.nanoTime() - lastPoint.getStartTime();
                                        %>
                                        let inArea = <%=lastPoint.isHit()%>;
                                        document.getElementById("pX").innerHTML = <%=lastPoint.getX()%>;
                                        document.getElementById("pY").innerHTML = <%=lastPoint.getY()%>;
                                        document.getElementById("pR").innerHTML = <%=lastPoint.getR()%>;
                                        document.getElementById("actionTime").innerHTML = <%=Long.toString(endTime)%>;
                                        if (inArea) {
                                            document.getElementById("pResult").innerHTML = "Есть пробитие!"
                                            document.getElementById("pResult").style.color = "green"
                                            audio = new Audio('./static/audio/prob.mp3')
                                        } else {
                                            document.getElementById("pResult").innerHTML = "Рикошет!"
                                            document.getElementById("pResult").style.color = "red"
                                            audio = new Audio('./static/audio/ric.mp3')
                                        }

                                        // Зачем я сюда пихаю музыку?
                                        audio.volume = 0.1;
                                        audio.play();
                                    }

                                    setTimeout(setTime, 1);
                                </script>
                            </div>

                            <div class="baseInsideRect xRect">
                                <span>X</span>
                                <p id="pX"></p>
                            </div>

                            <div class="baseInsideRect yRect">
                                <span>Y</span>
                                <p id="pY"></p>
                            </div>

                            <div class="baseInsideRect rRect">
                                <span>R</span>
                                <p id="pR"></p>
                            </div>

                            <div class="baseInsideRect resultRect">
                                <span>Результат</span>
                                <p id="pResult"></p>
                            </div>
                        </div>

                        <div class="tableHead" id="table" style="visibility: hidden">
                            <table id="dataTable" style="text-align: center;" class="hide" width="100%">
                                <thead align="center">
                                <tr>
                                    <th width="20%">X</th>
                                    <th width="20%">Y</th>
                                    <th width="20%">R</th>
                                    <th width="40%">Результат</th>
                                </tr>
                                </thead>
                                <tbody id="tableBody">
                                <%for (Point point : userPoints) { %>
                                <tr>
                                    <td><%=point.getX()%></td>
                                    <td><%=point.getY()%></td>
                                    <td><%=point.getR()%></td>
                                    <%if (point.isHit()) {
                                        out.print("<td style='color:green;'>Есть пробитие!</td>");
                                    } else {
                                        out.print("<td style='color:red;'>Рикошет!</td>");
                                    }
                                    %>
                                </tr>
                                <% } %>
                                </tbody>
                            </table>
                        </div>
                    </main>
                </td>
            </tr>
            <tr>
                <td class="text-align:center;">
                    <main class="footerRect animated rollIn">
                        2021
                        <br>
                        Какие у меня могут быть права?
                    </main>
                </td>
            </tr>
        </table>
    </section>
    </body>
</html>
