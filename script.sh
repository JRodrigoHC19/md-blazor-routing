#!/bin/bash

# Variables
ID_IMAGE=img-pizza

# Repository
git clone https://github.com/MicrosoftDocs/mslearn-blazor-navigation.git BlazingPizza

# Preparation
rm ./BlazingPizza/OrderState.cs
rm ./BlazingPizza/PizzaStoreContext.cs
rm ./BlazingPizza/App.razor
rm ./BlazingPizza/Pages/_Host.cshtml
rm ./BlazingPizza/Pages/Index.razor
rm ./BlazingPizza/Pages/Checkout.razor
rm ./BlazingPizza/Pages/OrderDetail.razor
rm ./BlazingPizza/Pages/MyOrders.razor
cp files/* ./BlazingPizza/
cd BlazingPizza

# Execution
docker build -t $ID_IMAGE .
docker run -it --rm -p 8080:80 $ID_IMAGE
docker rmi $ID_IMAGE