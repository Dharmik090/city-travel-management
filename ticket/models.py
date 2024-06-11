from django.db import models
from users.models import User
from trip.models import TripPlan

class Ticket(models.Model):
    id = models.AutoField(primary_key=True)
    trip_name = models.ForeignKey(TripPlan,on_delete=models.CASCADE,to_field='trip_name')
    username = models.ForeignKey(User,on_delete=models.CASCADE,to_field='username')
    total_price = models.FloatField(null=False,blank=False)
    transaction_id = models.CharField(max_length=30,null=False,blank=False,unique=True)

class Passenger(models.Model):
    id = models.AutoField(primary_key=True)
    ticket_id = models.ForeignKey(Ticket,on_delete=models.CASCADE,to_field='id')
    name = models.CharField(max_length=30,null=False,blank=False)
    age = models.IntegerField(null=False,blank=False)
