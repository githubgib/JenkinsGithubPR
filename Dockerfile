# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory in the container
WORKDIR /usr/src/app

# Install pylint
RUN pip install pylint

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Command to run on container start, this can be modified as per your need
CMD ["python", "app.py"]
