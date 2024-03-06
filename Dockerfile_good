# Use the official Python image as base
FROM python:3

# Install flake8
RUN pip install flake8

# Set up a working directory (optional)
WORKDIR /app

# Copy your Jenkinsfile or any other necessary files
COPY Jenkinsfile /app

# If you have other dependencies, you can copy and install them as well
# COPY requirements.txt /app
# RUN pip install -r requirements.txt

# Specify any additional configurations or commands here as needed
