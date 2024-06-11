from django.db import models
from users.models import Agency

class TripPlan(models.Model):
    agency_name = models.ForeignKey(Agency,on_delete=models.CASCADE,to_field='agency_name')
    trip_name = models.CharField(primary_key=True,max_length=30)
    city = models.CharField(max_length=30,null=False,blank=False)
    price = models.FloatField(null=False,blank=False)
    capacity = models.IntegerField(null=False,blank=False)
    departure_date = models.DateField(null=False,blank=False)
    departure_time = models.TimeField(null=False,blank=False)
    departure_place = models.CharField(max_length=30,null=False,blank=False)
    return_date = models.DateField(null=False,blank=False)
    return_time = models.TimeField(null=False,blank=False)
    return_place = models.CharField(max_length=30,null=False,blank=False)
    duration = models.IntegerField(default=0)
    extra_info = models.TextField()     
    thumbnail = models.ImageField(upload_to='trip_thumbnail/')
   
class Attraction(models.Model):
    id = models.AutoField(primary_key=True)
    trip_name = models.ForeignKey(TripPlan,on_delete=models.CASCADE,to_field='trip_name') 
    att_name = models.CharField(max_length=30,null=False,blank=False,unique=True)
    att_imgs =  models.ImageField(upload_to='attraction/')
