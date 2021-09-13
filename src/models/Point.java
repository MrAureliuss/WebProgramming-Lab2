package models;

public class Point {
    private int x;
    private double y;
    private double r;
    private boolean isHit;
    private long startTime;

    public Point(int x, double y, double r, boolean isHit, long startTime) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.isHit = isHit;
        this.startTime = startTime;
    }

    public int getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double getR() {
        return r;
    }

    public boolean isHit() {
        return isHit;
    }

    public long getStartTime() {
        return startTime;
    }
}
