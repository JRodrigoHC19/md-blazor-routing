#!/bin/bash

# Variables
ID_IMAGE=img-pizza

# Repository
git clone https://github.com/MicrosoftDocs/mslearn-blazor-navigation.git BlazingPizza

# Preparation
cp ./Dockerfile ./files ./BlazingPizza
cd ./BlazingPizz

# Execution
docker build -t $ID_IMAGE .
docker run -it --rm -p 8080:80 $ID_IMAGE
docker rmi $ID_IMAGE