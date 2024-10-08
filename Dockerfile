FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ./BlazingPizza/BlazingPizza.csproj . 
RUN dotnet restore
COPY ./BlazingPizza .
COPY ./files .
RUN dotnet publish -c release -o /app


FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app .
EXPOSE 80
ENTRYPOINT ["dotnet", "BlazingPizza.dll"]