### README for the Docker-Based System Administration Project

---

#### **Project Overview**
This project focuses on system administration using Docker, where you will virtualize multiple Docker images within your personal virtual machine. The goal is to create a small infrastructure composed of different services that follow specific rules.

---

#### **Project Structure**

- **Preamble:** Brief introduction and overview of the project.
- **Introduction:** Expands on the project's objective to enhance your system administration skills via Docker.
- **General Guidelines:** Key requirements and setup instructions.
- **Mandatory Part:** Detailed tasks and configurations required for the core infrastructure.
- **Bonus Part:** Additional tasks for enhancing the project (only evaluated if the mandatory part is perfect).
- **Submission and Peer-Evaluation:** Instructions on how to submit your project for evaluation.

---

#### **General Guidelines**

1. **Virtual Machine:** The entire project must be completed in a VM.
2. **Folder Structure:**
   - All necessary configuration files should be placed in a `srcs` folder.
   - A `Makefile` must be at the root of your directory to set up the entire application.
3. **Docker Usage:**
   - You must create Docker images manually (no pulling ready-made images, except for Alpine/Debian).
   - Services must run in dedicated containers.
   - Containers should restart automatically in case of crashes.

---

#### **Mandatory Part**

1. **Infrastructure Setup:**
   - Use Docker Compose to manage the containers.
   - Create containers for NGINX (with TLSv1.2 or TLSv1.3 only), WordPress with php-fpm, and MariaDB.
   - Set up two volumes: one for the WordPress database and one for the website files.
   - Ensure containers communicate via a dedicated Docker network.
   - Configure a domain name that points to your local IP (e.g., `yourlogin.42.fr`).

2. **Security & Best Practices:**
   - No hard-coded passwords in Dockerfiles; use environment variables and .env files.
   - Follow best practices for writing Dockerfiles (no infinite loops, proper usage of PID 1, etc.).
   - The NGINX container should be the only entry point via port 443.

---

#### **Bonus Part**

Additional tasks include setting up Redis cache, an FTP server, a static website, Adminer, or any other useful service. These will be evaluated only if the mandatory part is perfect.

---

#### **Submission Guidelines**

Submit your project via your Git repository. Ensure that all files are correctly named and placed as required.

---

This README provides a comprehensive guide to your project. Ensure all steps are followed to meet the project's requirements. Good luck!
