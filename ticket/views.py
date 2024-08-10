import razorpay,random,string
from django.contrib import messages

from django.shortcuts import render,redirect
from django.views.decorators.csrf import csrf_exempt

from .models import Ticket,Passenger
from .forms import PassengerForm
from trip.models import TripPlan
from users.models import User,Agency



def booking(request,trip_name):
    trip = TripPlan.objects.get(pk=trip_name)
    
    if 'username' not in request.session:
        return redirect('user_login')
    
    username = request.session['username']
    user = User.objects.get(username=username)
    
    tid = ''.join(random.choices(string.ascii_uppercase + string.digits, k=10))
    
    ticket = Ticket.objects.create(trip_name=trip,username=user,total_price=trip.price,transaction_id=tid)
    request.session['ticket_id'] = ticket.id
    request.session['trip_name'] = trip.trip_name
    
    return redirect('add_passenger')



def add_passenger(request):
    ticket_id = request.session['ticket_id']
    ticket = Ticket.objects.get(pk=ticket_id)
    
    trip_price = TripPlan.objects.get(pk=request.session['trip_name']).price
    
    if request.method == 'POST':
        form = PassengerForm(request.POST,initial={'ticket_id':ticket})
        
        if form.is_valid():
            form.save()
            
            return redirect('add_passenger')
    else:
        passengers = Passenger.objects.filter(ticket_id=ticket_id)
        
        ticket.total_price = trip_price * len(passengers)
        Ticket.objects.filter(pk=ticket_id).update(total_price=trip_price * len(passengers))

        form = PassengerForm(initial={'ticket_id':ticket})
        return render(request, 'add_passenger.html', {'form':form,'passengers':passengers,'ticket':ticket,'trip_price':trip_price})
    
    
    
def edit_passenger(request,pass_id):
    passenger = Passenger.objects.get(pk=pass_id)
    
    if request.method == 'POST':
        form = PassengerForm(request.POST, instance=passenger)
      
        if form.is_valid():
            form.save()
            
            return redirect('add_passenger')
    else:
        passengers = Passenger.objects.filter(ticket_id=request.session['ticket_id'])
        form = PassengerForm(instance=passenger)
        
        context = {'form':form, 'passengers':passengers, 'is_edit':1}
        return render(request, 'add_passenger.html', context)
        
    
    
def del_passenger(request,pass_id):
    Passenger.objects.get(pk=pass_id).delete()
    return redirect(request.META.get('HTTP_REFERER','/'))
    
    
    
def payment(request):
    
    trip = TripPlan.objects.get(pk=request.session['trip_name'])
    ticket = Ticket.objects.get(pk=request.session['ticket_id'])
    passengers = Passenger.objects.filter(ticket_id=ticket.id)
    
    if passengers.__len__() == 0:
        messages.error(request,'Add valid passengers')
        return redirect('add_passenger')

    client = razorpay.Client(auth=('rzp_test_6dq9f5n25OyVzT', 'YWdWCxu9BKgiZ97OqqTYo5Dg'))
    payment = client.order.create({'amount':ticket.total_price*100,'currency':'INR','payment_capture':'1'})
    
    context = {'pack':trip,'passengers':passengers,'ticket':ticket,'payment':payment}
    return render(request, 'payment.html', context)



@csrf_exempt
def success(request):
    return redirect('view_ticket')



def view_booking(request):
    
    if 'username' not in request.session:
        return redirect('user_login')
    
    tickets = Ticket.objects.filter(username=request.session['username'])
    
    context = {'tickets':tickets}
    return render(request, 'view_booking.html', context)



def view_ticket(request):

    if request.method == 'POST':
        ticket_id = request.POST['ticket_id']
    else:    
        ticket_id = request.session['ticket_id']

    ticket = Ticket.objects.get(pk=ticket_id)
    
    trip = TripPlan.objects.get(pk=ticket.trip_name.trip_name)
    user = User.objects.get(pk=ticket.username.username)
            
    passengers = Passenger.objects.filter(ticket_id=ticket_id)
    agency = Agency.objects.get(pk=trip.agency_name.agency_name)
    
    context = {'ticket':ticket,'pack':trip,'user':user,'agency':agency,'passenger':passengers}
    return render(request, 'view_ticket.html', context)



def download_ticket(request):
    
    ticket_id = request.session['ticket_id']
    ticket = Ticket.objects.get(pk=ticket_id)
    
    trip = TripPlan.objects.get(pk=ticket.trip_name.trip_name)
    user = User.objects.get(pk=ticket.username.username)
    
    context = {'ticket':ticket,'pack':trip,'user':user}
    return render(request, 'download_ticket.html', context)