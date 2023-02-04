# Use an official Python image as the base image
FROM python:alpine3.17

# Set the working directory in the container
WORKDIR /app

# Install pip
RUN apt-get update && apt-get install -y python3-pip  git

# Copy the requirements file to the container
COPY ./src/requirements.txt .

# Install the dependencies
RUN pip3 install -r requirements.txt

# Install encodec
RUN pip3 install -U encodec
RUN pip3 install -U git+https://git@github.com/facebookresearch/encodec#egg=encodec
RUN pip3 install .

# Copy the application code to the container
COPY ./src .

# Set the environment variable for Flask
ENV FLASK_APP=run.py

# Expose the default Flask port
EXPOSE 5000

# Run the command to start the Flask app
CMD ["flask", "run", "--host=0.0.0.0"]