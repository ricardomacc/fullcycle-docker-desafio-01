FROM golang:alpine AS builder

WORKDIR /build
COPY . .
RUN go build code.go

FROM scratch
COPY --from=builder /build/ .
CMD [ "./code" ]