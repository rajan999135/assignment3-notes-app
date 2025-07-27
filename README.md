# 📓 Assignment 3 – Notes App

A simple web-based note-taking application built with **PHP**, **MySQL**, **HTML**, **CSS (Tailwind)**, and **JavaScript** for CS 215: Web & Database Programming.

## 🚀 Live Demo
👉 [Click here to view the live site](https://rn.infinityfreeapp.com)

## 📂 Features

- 🔐 User login using Gmail (Google Authentication)
- 📋 Create topics and write notes under each
- 🧾 Word count and timestamps for every note
- 🖼️ User avatars and screen names shown on each note
- 🧠 AJAX-based real-time note posting (no page reload)
- 📤 Access control: grant/revoke access to other users
- 🎨 Fully responsive layout using Tailwind CSS

## 🗂️ Project Structure

```bash
assignment3-notes-app/
├── index.php                  # Main dashboard showing all topics
├── login.php                  # Login system
├── createtopic.php            # Create a new topic
├── Notesview.php              # View & add notes for a topic
├── addnote.php                # Backend for saving notes
├── access.php                 # Grant/revoke access
├── code2.js                   # JavaScript for DOM updates
├── uploads/                   # User avatars
└── includes/                  # Database connection (config)
````

## 🛠️ Technologies Used

* PHP 8.x
* MySQL
* JavaScript (DOM + Fetch API)
* Tailwind CSS
* HTML5
* Git & GitHub

## 🧑‍💻 How to Run Locally

1. Clone the repo

   ```bash
   git clone https://github.com/rajan999135/assignment3-notes-app.git
   ```

2. ## 📦 Database file 

A full MySQL backup of this project is available here: [`Database/notes_app.sql`](./Database/notes_app.sql)

To use this:
1. Open **phpMyAdmin** or any MySQL tool.
2. Create a new database (e.g., `notes_db`).
3. Import the `notes_app.sql` file into your database.
4. Update your `.env` or `db_connection.php` file with the correct database name and credentials.

This file contains all necessary tables like `notes`, `topics`, `users_info`, `access_control`, etc., as used in the live version of this app hosted on InfinityFree.


3. Launch on local server (e.g., MAMP/XAMPP)

💡 Purpose
This project was developed as part of the CS 215: Web & Database Programming course at the University of Regina.
It showcases my practical skills in:

PHP and MySQL for backend development
JavaScript and AJAX for dynamic client-side interaction
Tailwind CSS for modern, responsive UI
Git and GitHub for version control and collaboration
This project is intended for educational purposes only and demonstrates my ability to build a full-stack web application from scratch.
