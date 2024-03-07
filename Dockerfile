FROM python:3

# Install PyLint
RUN pip install pylint

# Echo the path of PyLint (for debugging)
RUN which pylint || echo "PyLint not found"

WORKDIR /app
COPY . /app
