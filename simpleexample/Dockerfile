FROM mcr.microsoft.com/dotnet/core/sdk:5.0 AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY . ./
RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:5.0
WORKDIR /app
RUN apt-get update && apt-get install -y libgdiplus 
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "simpleexample.dll"]