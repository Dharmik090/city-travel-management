from django.shortcuts import render,redirect,get_object_or_404
from django.contrib import messages
from datetime import datetime

from .models import TripPlan,Attraction
from users.models import Agency
from .forms import TripPlanForm,AttractionForm
# Create your views here.



def search(request):
    if request.method == 'POST':
        search_name = request.POST['search_name']
        city = TripPlan.objects.filter(city=search_name)
        
        if len(city) == 0:
            agency = Agency.objects.filter(pk=search_name)
            if agency is not None:
                messages.error(request,"Agency or City doesn't exist")
                return redirect(request.META.get('HTTP_REFERER','/'))
            else :
                return redirect('agency_pack/'+search_name)
            
        context = {'packages':city}
        return render(request, 'package.html', context)


def packages(request):
    
    context = {'packages':TripPlan.objects.all(), 'agency_pack':0}
    return render(request,"package.html",context)


def view_package(request,trip_name):
    package = TripPlan.objects.get(pk=trip_name)
    attractions = Attraction.objects.filter(trip_name=trip_name)
    
    context = {'package':package, 'attractions':attractions}
    return render(request, "view_package.html",context)


def agency_packages(request,agency_name):
    
    trips = TripPlan.objects.filter(agency_name=agency_name)
     
    agency_pack = 0
    # a1 logged in => search a2
    if 'agency_name' in request.session and request.session['agency_name'].lower() == agency_name.lower():
        agency_pack = 1
    
    context = {'packages':trips, 'agency_pack':agency_pack}
    return render(request, 'package.html', context)



def add_package(request):
    agency_name = request.session['agency_name']
    agency = Agency.objects.get(agency_name=agency_name)
    
    if request.method=='POST':
        
        form = TripPlanForm(request.POST, request.FILES, initial={'agency_name':agency, 'duration':0})
        
        if form.is_valid():    
            departure_date = form.cleaned_data['departure_date']
            return_date = form.cleaned_data['return_date']
            
            sub_date = (return_date - departure_date)
            duration = sub_date.days+1
        
            if departure_date > return_date:
                messages.error(request,'')
                messages.error(request,"check departure and return date again")
                return redirect(request.META.get('HTTP_REFERER','/'))

            form.save()
            
            trip_name = form.cleaned_data['trip_name']
            request.session['trip_name'] = trip_name
            print(-2)
            TripPlan.objects.filter(pk=trip_name).update(duration=duration)
            print(-1)
            return redirect('add_attraction')
        else:
            return render(request,'my.html')
    else:
        form = TripPlanForm(initial={'agency_name':agency, 'duration':0})
        
        context = {'form':form, 'is_edit':0}
        return render(request,"add_package.html", context)
    



def edit_package(request,trip_name):
    tripplan = TripPlan.objects.get(pk=trip_name)
    
    if request.method == 'POST':
        
        form = TripPlanForm(request.POST, request.FILES, instance=tripplan)
        # request.session['trip_name'] = trip_name
        
        if tripplan.departure_date > tripplan.return_date:
            messages.error(request,'')
            messages.error(request,"check departure and return date again")
            return redirect(request.META.get('HTTP_REFERER','/'))
        
        if form.is_valid():
            form.save()
            
            trips = TripPlan.objects.all()
            return render(request, 'package.html', {'my_pack':1, 'dataset':trips})
    else:        
        form = TripPlanForm(instance=tripplan)
        
        context = {'form':form, 'is_edit':1}
        return render(request,'add_package.html',context)
    
    
def del_package(request,trip_name):
    TripPlan.objects.filter(pk=trip_name).delete()
    return redirect(request.META.get('HTTP_REFERER','/'))



def add_attraction(request):
    trip_name = request.session['trip_name']
    trip = TripPlan.objects.get(pk=trip_name)

    if request.method == 'POST':
        form = AttractionForm(request.POST, request.FILES, initial={'trip_name':trip})
        
        if form.is_valid():
            form.save()
            
            return redirect('add_attraction')
        else:
            return render(request,'my.html')
    else:
        attractions = Attraction.objects.filter(trip_name=trip_name)
        
        form = AttractionForm(initial={'trip_name':trip})
        
        context = {'form':form, 'attractions': attractions, 'is_edit':0}
        return render(request, 'add_attraction.html', context)
    

def edit_attraction(request,id):
    attraction = Attraction.objects.get(pk=id)
    
    if request.method == 'POST':
        form = AttractionForm(request.POST, request.FILES, instance=attraction)
        
        if form.is_valid():
            form.save()
            
            return redirect('add_attraction')
            
    else:
        form = AttractionForm(instance=attraction)
        
        attractions = Attraction.objects.filter(trip_name=request.session['trip_name'])
        
        context = {'form':form,'attractions':attractions, 'is_edit':1}
        return render(request, 'add_attraction.html', context)
    

def del_attraction(request,id):
    Attraction.objects.filter(pk=id).delete()
    return redirect(request.META.get('HTTP_REFERER','/'))
    
    
    



