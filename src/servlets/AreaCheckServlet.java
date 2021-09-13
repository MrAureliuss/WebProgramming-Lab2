package servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;

import models.Point;

public class AreaCheckServlet extends HttpServlet {
    private final Integer[] validXValues = {-5, -4, -3, -2, -1, 0, 1, 2, 3};
    private final Double[] validRValues = {1.0, 1.5, 2.0, 2.5, 3.0};

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        try {
            int x = Integer.parseInt(req.getParameter("x"));
            double y = Double.parseDouble(req.getParameter("y"));
            double r = Double.parseDouble(req.getParameter("select"));

            if (Arrays.asList(validXValues).contains(x) && Arrays.asList(validRValues).contains(r) && (y > -5.0) && (y < 5.0)) {
                Point point = new Point(x, y, r, checkArea(x, y, r), System.nanoTime());
                putPointToUserList(session, point);

                req.getRequestDispatcher("result.jsp").forward(req, resp);
            } else throw new NumberFormatException();

        } catch (NumberFormatException | NullPointerException exception) {
            PrintWriter writer = resp.getWriter();
            writer.write("bad data");
            writer.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    private boolean checkArea(int x, double y, double r) {
        return ((x <= r/2 && x >= 0 && y <= r && y >= 0) ||
                (y <= (x + r/2) && y >= 0 && x <= 0) ||
                ((x*x + y*y) <= r*r/4 && x <= 0 && y <= 0));
    }

    private void putPointToUserList(HttpSession session, Point point) {
        if (session.getAttribute("userPoints") == null) {
            session.setAttribute("userPoints", new ArrayList<Point>());
        }

        ArrayList<Point> userPoints = (ArrayList<Point>) session.getAttribute("userPoints");
        userPoints.add(point);
        session.setAttribute("userPoints", userPoints);
    }
}
