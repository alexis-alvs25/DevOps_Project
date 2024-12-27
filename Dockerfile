# Step 1: Build the application
FROM golang:latest AS builder

# Set the working directory in the container
WORKDIR /app

# Download Go modules
COPY go.mod go.sum ./
RUN go mod download && go mod verify

# Copy all the source code into the container
COPY . . 

# Build (disable dynamic C libraries for a static binary)
RUN CGO_ENABLED=0 go build -o go_app ./cmd/main.go




# Step 2: Create a minimal image with Alpine
FROM alpine:latest

# Set the working directory in the container
WORKDIR /root/

# Copy the executable from the build stage
COPY --from=builder /app/go_app .

# Expose the listening port
EXPOSE 8000




# Run
CMD ["./go_app"]