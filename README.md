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


---

## Stage 2: Deploy the app and database

🥅 Deploy the app and database on your local machine (½ day)

REMEMBER TO INCLUDE:

- Steps to follow to get that stage working, along with appropriate explanations and notes about important learnings

- Diagrams showing your architecture of each stage

- Blockers – Suggestion: what was the issue, reason for the issue, solution

- What you learnt


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

![alt text](image.png)