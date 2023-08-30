from django.urls import path
from . import views  #importing our view file 

urlpatterns = [
    path("", views.homepage, name="home"), #mapping the homepage function
    path("login/", views.login, name="login"),
    path("signup/", views.signup, name="signup"),
]
