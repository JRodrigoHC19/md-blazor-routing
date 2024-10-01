# RUN dotnet new razorcomponent -n OrderDetail -o Pages
# RUN dotnet new razorcomponent -n MainLayout -o Shared

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ./BlazingPizza.csproj . 
RUN dotnet restore
COPY . .
RUN dotnet publish -c release -o /app


FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app .
EXPOSE 80
ENTRYPOINT ["dotnet", "BlazingPizza.dll"]