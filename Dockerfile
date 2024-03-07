# Use the official Python image as base
FROM python:3

# Install PyLint
RUN pip install pylint

# Verify PyLint installation
RUN pylint --version

# Set up a working directory
WORKDIR /app

# Copy your project files into the Docker image
COPY . /app
