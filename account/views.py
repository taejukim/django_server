from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.contrib.auth import login, authenticate
from django.urls import reverse
from account.models import User

def signin(request):
    user_info = User.objects.get(username="toast")
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username = username, password = password)
        if user is not None:
            login(request, user)
            return render(request, 'ok.html')
        else:
            return HttpResponseRedirect(reverse('signin')+'?status=false', pw=user_info.pw)
    else:
        status = True
        if request.GET.get('status') == 'false':
                status = False
        return render(request, 'login.html', context={'status':status, 'pw':user_info.pw})


def modify(request):
    if request.method == "POST":
        pw = request.POST['pw']
        user = User.objects.get(username="toast")
        user.set_password(pw)
        user.pw = pw
        user.save()
        return HttpResponseRedirect(reverse('signin'))
    else:
        user = User.objects.get(username="toast")
        return render(request, 'modify.html', context={'pw':user.pw })
