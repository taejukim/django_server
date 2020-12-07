from django.shortcuts import render
from django.contrib.auth import login, authenticate

def signin(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username = username, password = password)
        if user is not None:
            login(request, user)
            return render(request, 'ok.html')
        else:
            return render(request, 'ng.html')
    else:
        return render(request, 'login.html')
