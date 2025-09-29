# Use lightweight Debian base
FROM debian:bullseye-slim

# Install dependencies: fortune-mod, cowsay, netcat
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy wisecow script into container
COPY wisecow.sh .

# Make it executable
RUN chmod +x wisecow.sh

# Expose default port
EXPOSE 4499

# Run the server
CMD ["./wisecow.sh"]
