#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
# Set up config directory at /config
USER root
RUN mkdir -p /config
RUN chown -Rv app:app /config
RUN chmod -Rv 0755 /config
USER app
WORKDIR /app
EXPOSE 9117

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["src/Jackett.Server/Jackett.Server.csproj", "src/Jackett.Server/"]
RUN dotnet restore "./src/Jackett.Server/Jackett.Server.csproj"
COPY . .
WORKDIR "./src/Jackett.Server"
RUN dotnet build "./Jackett.Server.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./Jackett.Server.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
ENV XDG_CONFIG_HOME=/config
WORKDIR /app
COPY --from=publish /app/publish .

ENTRYPOINT ["dotnet", "jackett.dll"]
