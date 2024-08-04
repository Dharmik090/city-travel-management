from django.shortcuts import render,redirect
from django.contrib import messages
from django.contrib.auth import login, authenticate 
from django.contrib.sessions.models import Session

from .forms import UserForm,AgencyForm,UserLoginForm,AgencyLoginForm
from .models import Agency,User



def register_login(request):
    return render(request,'register_login.html')


def user_registration(request):
    
    if request.method == 'POST':
        form = UserForm(request.POST or None)
        
        if form.is_valid():
            form.save()
            
            context = {'form':form}
            return render(request,'index.html',context)
        else:
            errors = {}
            
            for field,error in form.errors.items():
                errors[field] = error
                
            messages.error(request,{'errors':errors})  
            print(errors)
            return redirect(request.META.get('HTTP_REFERER','/'))
    else:
        form = UserForm()
        
        context = {'form':form}
        return render(request,'user_registration.html',context)
    

    
def agency_registration(request):
    
    if request.method == 'POST':
        form = AgencyForm(request.POST,request.FILES)

        print(form.errors)
        if form.is_valid():
            form.save()
            
            context = {'form':form}
            return render(request,'index.html',context)
        else:
            messages.error(request,'')
            messages.error(request,"some unique constrain vioalate")
            return redirect(request.META.get('HTTP_REFERER','/'))
    else:
        form = AgencyForm()
        
        context = {'form':form}
        return render(request,'agency_registration.html',{'form':form})
    
    
    
def user_login(request):
    
    if request.method == 'POST':
        form = UserLoginForm(request.POST)

        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')

            user = authenticate(request, username=username, password=password)

            if user is not None:    
                request.session['username'] = username
                request.session['user_email'] = User.objects.get(pk=username).email
                
                login(request, user)
                return redirect('index')
        
        messages.error(request, '')
        messages.error(request,"Invalid username or password.")
        return redirect(request.META.get('HTTP_REFERER','/'))
    else:
        form = UserLoginForm()
        
        context = {'form':form}
        return render(request, 'user_login.html', context)


def agency_login(request):
    
    if request.method == 'POST':
        form = AgencyLoginForm(request.POST)

        if form.is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']

            agency = authenticate(request, username=username, password=password)
            
            if agency is not None:
                name = Agency.objects.get(username=username).agency_name
                request.session['agency_name'] = name
                request.session['agency_username'] = username
                
                login(request, agency)
                return redirect('index')
        
        messages.error(request,'')
        messages.error(request,"Invalid username or password.")
        return redirect(request.META.get('HTTP_REFERER','/'))
    else:
        form = AgencyLoginForm()
        
        context = {'form':form}
        return render(request, 'agency_login.html', context)

       
def log_out(request):
    session_key = request.session.session_key
    Session.objects.filter(session_key=session_key).delete()
    
    return redirect('index')
