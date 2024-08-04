from django.db import models


class User(models.Model):
    username = models.CharField(primary_key=True,max_length=30)
    password = models.CharField(max_length=30,null=False,blank=False)
    email = models.EmailField(max_length=30,null=False,blank=False)
    last_login = models.DateTimeField(auto_now=True)

class Agency(models.Model):
    agency_name  = models.CharField(primary_key=True,max_length=30)
    username = models.CharField(max_length=30,unique=True,null=False,blank=False)
    password = models.CharField(max_length=30,null=False,blank=False)
    email = models.EmailField(max_length=30,null=False,blank=False)
    gst_no = models.CharField(max_length=30,null=False,blank=False)
    upi_id = models.CharField(max_length=30,null=False,blank=False)
    agency_logo = models.ImageField(upload_to='agency_logo/')
    about_us = models.TextField()
    last_login = models.DateTimeField(auto_now=True)