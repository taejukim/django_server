from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.contrib.auth import login, authenticate
from django.urls import reverse

def signin(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username = username, password = password)
        if user is not None:
            login(request, user)
            return render(request, 'ok.html')
        else:
            return HttpResponseRedirect(reverse('signin')+'?status=false')
    else:
        status = True
        if request.GET.get('status') == 'false':
                status = False
        return render(request, 'login.html', context={'status':status})
