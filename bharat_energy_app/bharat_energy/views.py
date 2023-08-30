from django.shortcuts import render

# Create your views here.
def homepage(request):
  return render(request, 'index.html', context={})

def login(request):
  return render(request, 'login.html', context={})

def signup(request):
  return render(request, 'signup.html', context={})
