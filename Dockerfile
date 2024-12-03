# Build stage
FROM golang:1.20-alpine AS builder

WORKDIR /app

# Copy go mod and sum files
COPY go.mod ./
# Uncomment if you have a go.sum file
# COPY go.sum ./

# Download dependencies
RUN go mod download

# Copy source code
COPY controller/ ./controller/

# Build the application from the controller directory
RUN CGO_ENABLED=0 GOOS=linux go build -o main ./controller

# Final stage
FROM alpine:latest

WORKDIR /app

# Copy the binary from builder
COPY --from=builder /app/main .

# Expose port (adjust if your app uses a different port)
EXPOSE 8080

# Run the binary
CMD ["./main"]