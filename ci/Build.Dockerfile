# Use an official Python image as the base image
FROM python:3.9.16-bullseye

# Set the working directory in the container
WORKDIR /app

# Install pip
RUN apt-get update
RUN apt-get install -y python3-pip git

# Copy the requirements file to the container
COPY src/requirements.txt .

# Install the dependencies
RUN pip3 install -r requirements.txt

# Install encodec
RUN pip3 install -U encodec
RUN pip3 install -U git+https://git@github.com/facebookresearch/encodec#egg=encodec
# RUN pip3 install .

COPY ./src .

# Set the environment variable for Flask
ENV FLASK_APP=app.py

# Expose the default Flask port
EXPOSE 5000

# Run the command to start the Flask app
CMD ["flask", "run", "--host=0.0.0.0"]