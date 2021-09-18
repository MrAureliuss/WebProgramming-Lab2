<%@ page import="models.Point" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css" rel="stylesheet">
    <link rel="stylesheet" href="static/css/styles.css">
    <script src="static/js/scripts.js" type="text/javascript"></script>
    <script src="static/js/button_x_regulator.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="static/js/interactiveCanvas.js" type="text/javascript"></script>
    <meta charset="UTF-8">
    <title>Вторая лабораторная работа по вебу</title>
  </head>
  <body onload="changeXValue('0'); draw(); redrawWithNewR()">
    <section>
      <table>
        <tr>
          <td style="text-align: center;">
            <main class="headerRect animated rotateIn">
              <div class="avatarRect">
                <img src="static/img/avatar.png">
              </div>
              <div class="aboutMeRect">
                Симонян Эрик Самвелович
                <br>
                Вариант: 15123
                <br>
                Группа: P3215
                <br>
                <div class="photoLinksRect">
                  <div class="grow">
                    <a class='photo vk' target="_blank" href='https://vk.com/eriksimohyan'></a>
                    <a class='photo github' target="_blank" href='https://github.com/MrAureliuss'></a>
                    <a class='photo telegram' target="_blank" href='https://teleg.run/MrAurelius'></a>
                  </div>
                </div>
              </div>
            </main>
          </td>
        </tr>
        <tr>
          <td style="text-align:center;">
            <main class="contentRect animated zoomIn">
              <form action="${pageContext.request.contextPath}/controllerServlet" method="POST" id="valueForm" onsubmit="return extraValidate()">
                <div class="baseInsideRect taskRect">
                  Введите данные для определения вхождения точки в представленную область
                </div>

                <div class="baseInsideRect xRect">
                  <input autocomplete="off" id="x" name="x" type="hidden" value="">
                  <span class="baseLetter xLetter">X</span>
                  <table id="tableButton" onclick="regularTableX()">

                    <tr>
                      <td>
                        <button class="xButton" id="x--5" name="x" onclick="setCurrentX(-5); update();" type="button">-5
                        </button>
                      </td>
                      <td>
                        <button class="xButton" id="x--4" name="x" onclick="setCurrentX(-4); update();" type="button">-4
                        </button>
                      </td>
                      <td>
                        <button class="xButton" id="x--3" name="x" onclick="setCurrentX(-3); update();" type="button">-3
                        </button>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <button class="xButton" id="x--2" name="x" onclick="setCurrentX(-2); update();" type="button">-2
                        </button>
                      </td>
                      <td>
                        <button class="xButton" id="x--1" name="x" onclick="setCurrentX(-1); update();" type="button">-1
                        </button>
                      </td>
                      <td>
                        <button class="xButton selected" id="x-0" name="x" onclick="setCurrentX(0); update();" type="button">0
                        </button>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <button class="xButton" id="x-1" name="x" onclick="setCurrentX(1); update();" type="button">1
                        </button>
                      </td>
                      <td>
                        <button class="xButton" id="x-2" name="x" onclick="setCurrentX(2); update();" type="button">2
                        </button>
                      </td>
                      <td>
                        <button class="xButton" id="x-3" name="x" onclick="setCurrentX(3); update();" type="button">3
                        </button>
                      </td>
                    </tr>
                  </table>
                </div>

                <div class="baseInsideRect yRect">
                  <span class="baseLetter yLetter">Y</span>
                  <input autocomplete="off" autofocus required
                         class="input" id="y" onchange="checkYData(); update()" onkeyup="checkYData(); update()" maxlength="8" name="y" placeholder="Введите число от -5 до 5"
                         title="Введите число" type="text">
                </div>

                <div class="baseInsideRect rRect">
                  <span class="baseLetter rLetter">R</span>
                  <div class="selectContainer">
                    <select id="select" name="select" onchange="clearCanvas(); redrawWithNewR(); update()">
                      <option value="1" selected="selected">1</option>
                      <option value="1.5">1.5</option>
                      <option value="2">2</option>
                      <option value="2.5">2.5</option>
                      <option value="3">3</option>
                    </select>
                  </div>
                </div>

                <div class="baseInsideRect taskPhoto" style="text-align: center">
                  <canvas width="220px" height="220px" id="canvas" style="background-image: url('static/img/taskPhoto.png')"></canvas>
                </div>

                <script>
                  function redrawWithNewR() {
                    let e = document.getElementById("select");
                    let r = e.options[e.selectedIndex].value;

                    <% if (session.getAttribute("userPoints") != null) { %>
                      <% ArrayList<Point> userPoints = (ArrayList<Point>) session.getAttribute("userPoints"); %>
                      <% for(Point p: userPoints) { %>
                        pointOldArc(
                                <%=p.getX()%>,
                                <%=p.getY()%>,
                                r
                        );
                      <% } %>
                    <% } %>
                  }
                </script>

                <button class="checkButton buttonLetter" type="submit">
                  Выполнить проверОЧКУ
                </button>
              </form>
            </main>
          </td>
        </tr>
        <tr>
          <td class="text-align:center;">
            <main class="footerRect animated rollIn">
              2021
              <br>
              Все права не защищены!
            </main>
          </td>
        </tr>
      </table>
    </section>
  </body>
</html>