# tech515-java-project6

## Brief

🥅 implement the 2-tier deployment of a Java Spring Boot app using various methods, including virtualisation and containerisation

- 6 days max
- do everything in 5 days and tie up on 6th day

**Project Components:**
- Public GitHub repo containing everything needed for the above, and a README file with
  - Sections for each stage of the project
  - Steps to follow to get that stage working, along with appropriate explanations and notes about important learning
  - Diagrams showing your architecture of each stage
  - Blockers – Suggestion: what was the issue, reason for the issue, solution
  - What you learnt
  - Benefits you saw personally from the project
- Project Management: Maintain a project board (e.g., Trello, Jira or GitHub Project) to manage tasks

**Deliverables:**

1. A 5-minute video which explains what you did and what you learned in this project. The target audience is a non-technical stakeholder. The focus of your video should be the last stage of the project you got up to.

Your video should include:
- Project board – how did you conduct this project?
- Discussion of the components
- Demonstration of the working system


2. Documentation/Code Package:

- PDF copy of the README
- Link/invitation to project repo

3. End of Project Feedback Form:

- After completing the project and handing in the above deliverables, spend 2-5 min to fill-in the feedback form
- Give as much detail as possible in the last box · Follow this link: https://forms.office.com/e/M5QdiKKrK4


---

## Stage 1: Create GitHub repo

🥅 Create a private GitHub repository to store the Java app and SQL script to seed the database (check your course’s Teams channel’s file section for it or ask your trainer for the ‘library-java17-mysql-app' zip file of the app code). Use the README.md file included with the app code to understand the app

**Stage Components:**
- Private GitHub repo for the storage of the app code and SQL script to seed the database. You will need this to do your `git clone` from

- I created a GitHub repository named 'tech515-Java-Spring-Boot-App' and stored the ‘library-java17-mysql-app' file it it
- I created a GitHub repository named 'tech515-java-project6' to store all notes in for this project

---

## Stage 2: Deploy the app and database

🥅 Deploy the app and database on your local machine (½ day)

REMEMBER TO INCLUDE:

- Steps to follow to get that stage working, along with appropriate explanations and notes about important learnings

- Diagrams showing your architecture of each stage

- Blockers – Suggestion: what was the issue, reason for the issue, solution

- What you learnt

### App Overview

"Library" Java-Springboot app

- Uses a MySQL database in the backend
- Includes a...
    - GUI and
    - API

### Set up app VM

Requirements:
- Hardware
  - AWS t3.small memory
- Software
  - Ubuntu 22.04 LTS (Can run on Windows 10/11 also)
  - Maven
  - Java 17
  - ProjectLibrary2 is the app folder

Environment Variables:
- Variable name: DB_HOST
    - Description: Acts like a connection string
    - Value: jdbc:mysql://$DATABASE_IP:3306/library
- Variable name: DB_USER
  - Description: The username setup in your MySQL database
  - Value: Can be whatever what you want to setup
- Variable name: DB_PASS
  - Description: The password setup in your MySQL database
  - Value: Can be whatever what you want to setup

Security Groups:

![alt text](image.png)

### Set up MySQL VM

Requirements:
- Hardware
  - AWS t3.small memory
- Software
  - Ubuntu 22.04 LTS (Can run on Windows 10/11 also)
  - MySQL database
  - Database must be seeded via an SQL script library.sql

Security Groups:

![alt text](image-1.png)

| Type         | Port | Source                 |
| ------------ | ---- | ---------------------- |
| MySQL/Aurora | 3306 | **App Security Group** |

⚠️ Do NOT use 0.0.0.0/0 for MySQL.

In AWS console:

Source → Security group

Select your app security group

This allows:

App VM → DB VM
But blocks everyone else 🚫

### Run DB code

### Run app code

1. go into app folder 'ProjectLibrary2'
2. run app in the background

`mvn spring-boot:start`

3. stop app running

`mvn spring-boot:stop`

1. Install dependencies
On your Ubuntu VM:
sudo apt update && sudo apt install -y nodejs npm
If your app needs a specific Node version (e.g., Node 20):
curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs
________________________________________
2. Clone the Sparta app
git clone https://github.com/<your-repo>/tech515-sparta-app.git
Then:
cd tech515-sparta-app/app
This folder contains app.js.
________________________________________
3. Install app packages
Inside the app folder:
npm install
This installs:
•	Express
•	Mocha
•	Supertest
•	Mongoose
•	Any other dependencies from package.json
________________________________________
4. Set the MongoDB connection environment variable
Your backend needs DB_HOST so it knows where MongoDB is.
Example:
export DB_HOST="mongodb://<DB_PRIVATE_IP>:27017/posts"
Example using your real value:
export DB_HOST="mongodb://172.31.17.218:27017/posts"
Check it:
echo $DB_HOST
________________________________________
5. Start the backend app
Option A — Run directly (manual)
node app.js
or:
npm start
You will see:
App is running on port 3000 Node.js / Express apps often run on localhost:3000
Keep this window open — or use tmux if needed.
________________________________________
Option B — Run with PM2 (recommended for production)
Install PM2:
sudo npm install -g pm2
Start the app:
pm2 start app.js --name sparta-app --update-env
Save the process list so PM2 restarts it after reboot:
pm2 save
Check PM2 status:
pm2 status
________________________________________
6. Optional — Set up Nginx reverse proxy
If you want to expose the app on port 80:
Edit /etc/nginx/sites-available/default and change:
try_files $uri $uri/ =404;
to:
proxy_pass http://127.0.0.1:3000;
Then restart nginx:
sudo systemctl restart nginx
Your app will now be available at:


### Test the app is running

ℹ️ If you have a reverse proxy working, you won't need to include the port number in the address. For example: http://34.245.124.148:5000/authors would become http://34.245.124.148/authors

Otherwise, go to <ip-address>:5000

There is no explicit mapping for the base URL (base path), so you should get an error like this: java-mysql-app-whitelabel-error-page


---

## Stage 3: Deploy the app and database on AWS using VMs

🥅 Deploy the app and database on AWS or Azure using Virtual Machines. Automate it via Bash provision scripts that work in user data. (1 day)

**Stage Components:**
- Bash provision scripts for app and database VMs that runs in user data


REMEMBER TO INCLUDE:

- Steps to follow to get that stage working, along with appropriate explanations and notes about important learnings

- Diagrams showing your architecture of each stage

- Blockers – Suggestion: what was the issue, reason for the issue, solution

- What you learnt

---

## Stage 4: Deploy the app and database on AWS using containers running on VM

🥅 Deploy the app and database on AWS or Azure using containers running on a Virtual Machine (Docker Compose). Automate it via Bash provision scripts that work in user data. (1-2 days)

**Stage Components:**
- **Bash provision script** for a single VM that runs in user data but deploys the app and database using containers on the one machine. The containers run by the script should use Docker images already uploaded to Docker Hub.

- **Docker-related files**
  - Dockerfile files
  - Docker-compose YAML file
  - Dockerised application images built and ready for deployment



REMEMBER TO INCLUDE:

- Steps to follow to get that stage working, along with appropriate explanations and notes about important learnings

- Diagrams showing your architecture of each stage

- Blockers – Suggestion: what was the issue, reason for the issue, solution

- What you learnt


---

## Stage 5: Deploy the app and database on AWS using Kubernetes 

🥅 Deploy the app and database on AWS or Azure using Kubernetes (Minikube) running on a Virtual Machine. Automate it via Bash provision scripts that work in user data. The Bash scripts could deploy on Kubernetes via applying YAML definition files or (optional) using a Helm chart. (1-2 days)


**Stage Components:**
- **Bash provision script** for a single VM that runs in user data, but provisions and deploys the app and database using Kubernetes (and optionally Helm) on the one machine

- **Kubernetes-related files**
  - YAML definition/configuration files
  - (Optional) Helm chart and values YAML files

REMEMBER TO INCLUDE:

- Steps to follow to get that stage working, along with appropriate explanations and notes about important learnings

- Diagrams showing your architecture of each stage

- Blockers – Suggestion: what was the issue, reason for the issue, solution

- What you learnt

## Benefits I saw personally from the project


## Deliverable Help

Trello board at the start:
![Trello Board Initial Setup](images/trello_board_setup.png)