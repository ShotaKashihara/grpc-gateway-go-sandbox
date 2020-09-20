# Build stage
FROM golang AS build-env
ADD . /src/grpc-gateway-go-sandbox
ENV CGO_ENABLED=0
RUN cd /src/grpc-gateway-go-sandbox && go build -o /app

# Production stage
FROM scratch
COPY --from=build-env /app /

ENTRYPOINT ["/app"]
