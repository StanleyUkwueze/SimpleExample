#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443
<<<<<<< HEAD:Dockerfile

=======
>>>>>>> f1a8073e4dd55c001133c6cf27cd457179ab8c5e:simpleexample/Dockerfile
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["simpleexample/simpleexample.csproj", "simpleexample/"]
RUN dotnet restore "simpleexample/simpleexample.csproj"
COPY . .
WORKDIR "/src/simpleexample"
RUN dotnet build "simpleexample.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "simpleexample.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "simpleexample.dll"]