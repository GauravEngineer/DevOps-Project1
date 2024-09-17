# Use the official Python image
FROM python  AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .


FROM python:3.11-alpine

WORKDIR /app 

COPY --from=builder /app .
# Expose port 8080 to the outside world
EXPOSE 8080

# Run the Python HTTP server to serve files from /app
CMD ["python3", "-m", "http.server", "8080"]
