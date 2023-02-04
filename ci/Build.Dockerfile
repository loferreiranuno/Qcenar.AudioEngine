# Use an official Python image as the base image
FROM python:3.9-slim-buster

# Set the working directory in the container
WORKDIR /app

# Install pip
RUN apt-get update && apt-get install -y python3-pip

# Copy the requirements file to the container
COPY ./ci/requirements.txt .

# Install the dependencies
RUN pip3 install -r requirements.txt

# Install encodec
RUN pip3 install -U encodec
RUN pip3 install -U git+https://git@github.com/facebookresearch/encodec#egg=encodec
RUN pip3 install .

# Copy the application code to the container
COPY . .

# Set the environment variable for Flask
ENV FLASK_APP=app.py

# Expose the default Flask port
EXPOSE 5000

# Run the command to start the Flask app
CMD ["flask", "run", "--host=0.0.0.0"]