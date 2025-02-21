# My Node.js Kubernetes App

## 📌 Overview

This is a simple Node.js application deployed on Kubernetes. It runs on **localhost:3000** and can be accessed without an Ingress controller.

## 🚀 Features

- Node.js Express server
- Dockerized application
- Kubernetes deployment with **Pods, Services**
- CI/CD pipeline with **Jenkins**

---

## 📂 Project Structure

```
├── Dockerfile       # Docker build configuration
├── deployment.yaml  # Kubernetes Deployment configuration
├── service.yaml     # Kubernetes Service configuration
├── Jenkinsfile      # CI/CD pipeline configuration
├── server.js        # Application source code
├── package.json     # Node.js dependencies
├── README.md        # Project documentation
```

---

## 🛠️ Prerequisites

Make sure you have the following installed:

- [Node.js](https://nodejs.org/en/download/)
- [Docker](https://www.docker.com/get-started/)
- [Kubernetes (kubectl & Minikube)](https://kubernetes.io/docs/tasks/tools/)
- [Jenkins](https://www.jenkins.io/download/)

---

## 📦 Setup & Installation

### **1️⃣ Clone the repository**

```sh
git clone https://github.com/YOUR_USERNAME/my-node-app.git
cd my-node-app
```

### **2️⃣ Install Dependencies**

```sh
npm install
```

### **3️⃣ Run the App Locally**

```sh
node server.js
```

Access the app at **[http://localhost:3000](http://localhost:3000)**

---

## 🐳 Running with Docker

### **1️⃣ Build the Docker Image**

```sh
docker build -t my-node-app .
```

### **2️⃣ Run the Container**

```sh
docker run -p 3000:3000 my-node-app
```

Now, visit **[http://localhost:3000](http://localhost:3000)**

---

## ☸️ Deploying to Kubernetes

### **1️⃣ Start Minikube**

```sh
minikube start
```

### **2️⃣ Deploy the Application**

```sh
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

### **3️⃣ Check the Running Services**

```sh
kubectl get pods
kubectl get svc
```

Find the service IP and access it via:

```sh
curl http://<service-ip>:30008
```

---

## 🔄 CI/CD Pipeline with Jenkins

### **1️⃣ Add Jenkins Credentials**

- Go to **Jenkins → Manage Credentials**
- Add Docker Hub credentials as **docker-hub**

### **2️⃣ Setup Webhook in GitHub**

- Go to **GitHub → Repo → Settings → Webhooks**
- Add Webhook URL: `http://your-jenkins-url/github-webhook/`
- Select **Push Events**

### **3️⃣ Run the Jenkins Pipeline**

Create a new **Pipeline job** in Jenkins and add a **Jenkinsfile** with the following stages:

```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t my-node-app .'
            }
        }
        stage('Push') {
            steps {
                sh 'docker push my-node-app'
            }
        }
        stage('Deploy') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}
```

Now, every **git push** triggers a deployment!

