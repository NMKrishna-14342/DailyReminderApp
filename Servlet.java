package com.remainder.servlets;


import java.io.IOException;
import java.time.LocalTime;
import java.util.Timer;
import java.util.TimerTask;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SetReminderServlet")
public class Servlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String day = request.getParameter("day");
        String time = request.getParameter("time");
        String activity = request.getParameter("activity");

        // Parse the selected time
        LocalTime selectedTime = LocalTime.parse(time);

        // Schedule the reminder
        scheduleReminder(selectedTime, activity);

        // Respond back to the user
        response.setContentType("text/html");
        response.getWriter().println("<html><body>");
        response.getWriter().println("<h3>Reminder set for " + activity + " at " + time + " on " + day + ".</h3>");
        response.getWriter().println("<a href='index.jsp'>Set another reminder</a>");
        response.getWriter().println("</body></html>");
    }

    private void scheduleReminder(LocalTime selectedTime, String activity) {
        Timer timer = new Timer();
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                // Logic to trigger a sound or display a message
                System.out.println("Reminder: " + activity);
                playSound();
            }
        }, getDelay(selectedTime));
    }

    private long getDelay(LocalTime selectedTime) {
        LocalTime now = LocalTime.now();
        long delay = now.until(selectedTime, java.time.temporal.ChronoUnit.MILLIS);
        if (delay < 0) delay += 24 * 60 * 60 * 1000; // Add 24 hours if the time has already passed for today
        return delay;
    }

    private void playSound() {
        try {
            // Get the real path of the sound file relative to the webapp directory
            String soundFilePath = getServletContext().getRealPath("/resources/sounds/chime.wav");
            
            // Create an AudioClip using the file path
            java.applet.AudioClip clip = java.applet.Applet.newAudioClip(new java.net.URL("file", null, soundFilePath));
            clip.play();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
