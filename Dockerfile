# Use the official Python image as base
FROM python:3

# Install python3 and pip (if not already present)
RUN apt-get update && apt-get install -y python3 python3-pip

# Install the latest flake8
RUN pip install --upgrade flake8

# Set up a working directory
WORKDIR /app

# Copy your project files into the Docker image
# COPY . /app

# Copy all files, including Python files, into the Docker image
COPY . .

# Ensure that all files are copied
RUN find . -type f -exec ls -l {} \;

# Add the Python and pip executable paths to the PATH
ENV PATH="/usr/local/bin:/usr/bin:${PATH}"
