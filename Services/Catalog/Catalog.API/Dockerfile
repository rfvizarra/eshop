FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER app
WORKDIR /App
EXPOSE 8080
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["Services/Catalog/Catalog.API/Catalog.API.csproj", "Services/Catalog/Catalog.API/"]
RUN dotnet restore "./Services/Catalog/Catalog.API/Catalog.API.csproj"
COPY . .
WORKDIR "/src/Services/Catalog/Catalog.API"
RUN dotnet build "./Catalog.API.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./Catalog.API.csproj" -c $BUILD_CONFIGURATION -o /app/publish

FROM base AS final
WORKDIR /app
copy --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Catalog.API.dll"]
