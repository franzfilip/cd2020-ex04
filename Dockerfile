FROM golang:1.11-alpine

# Set maintainer label: maintainer=[YOUR-EMAIL]
LABEL maintainer="[s2210455001@fhooe.at]"

# Set working directory: `/src`
WORKDIR /src

# Copy local file `main.go` to the working directory
COPY *.go go.* ./

# List items in the working directory (ls)
RUN ls

# Execute mod init
# RUN go mod init ex04

# Execute tests
RUN CGO_ENABLED=0 go test -v

# Build the GO app as myapp binary and move it to /usr/
RUN CGO_ENABLED=0 go build -o /usr/myapp
# Expose port 8888
EXPOSE 8888

# Run the service myapp when a container of this image is launched
CMD ["/usr/myapp"]
