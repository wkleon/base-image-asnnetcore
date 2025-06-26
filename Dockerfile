# Dockerfile for building a .NET 8 ASP.NET Core application image
# Use the official .NET 8 ASP.NET Core runtime image based on Alpine Linux
# This image is lightweight and optimized for running ASP.NET Core applications
# Install necessary packages and update CA certificates

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS base

RUN apk add -u --no-cache ca-certificates \
    aspnetcore8-runtime
RUN apk update && apk upgrade && rm -rf /var/cache/apk/*

COPY resources/ca-certs /usr/local/share/ca-certificates/
RUN update-ca-certificates

