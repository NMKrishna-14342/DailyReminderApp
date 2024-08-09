<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Daily Reminder</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        select, input[type="time"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #36BA98;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #2a967b;
        }

        input[type="submit"]:active {
            background-color: #217960;
        }

        @media (max-width: 500px) {
            form {
                padding: 15px;
            }

            label, select, input[type="time"], input[type="submit"] {
                font-size: 14px;
            }
        }
    </style>
</head>

<body>
    <h2>Set Your Daily Reminder</h2>
    <form action="SetReminderServlet" method="post">
        <label for="day">Day of the Week:</label>
        <select name="day" id="day">
            <option value="Monday">Monday</option>
            <option value="Tuesday">Tuesday</option>
            <option value="Wednesday">Wednesday</option>
            <option value="Thursday">Thursday</option>
            <option value="Friday">Friday</option>
            <option value="Saturday">Saturday</option>
            <option value="Sunday">Sunday</option>
        </select>
        <br><br>

        <label for="time">Time:</label>
        <input type="time" id="time" name="time">
        <br><br>

        <label for="activity">Activity:</label>
        <select name="activity" id="activity">
            <option value="Wake up">Wake up</option>
            <option value="Go to gym">Go to gym</option>
            <option value="Breakfast">Breakfast</option>
            <option value="Meetings">Meetings</option>
            <option value="Lunch">Lunch</option>
            <option value="Quick nap">Quick nap</option>
            <option value="Go to library">Go to library</option>
            <option value="Dinner">Dinner</option>
            <option value="Go to sleep">Go to sleep</option>
        </select>
        <br><br>

        <input type="submit" value="Set Reminder">
    </form>
</body>
</html>
