ARG BASE
ARG BUILD_NUMBER

FROM ${BASE} as build

# Run the command to start the Flask app
CMD ["flask", "run", "--host=0.0.0.0"]