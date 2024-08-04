from django import forms
from .models import User,Agency


class UserForm(forms.ModelForm):
    username = forms.CharField(max_length=30,widget=forms.TextInput(attrs={'class': 'form-control bg-transparent ', 'placeholder': 'Enter Username'})) 
    password = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control bg-transparent', 'placeholder': 'Enter password'}))
    email = forms.EmailField(widget=forms.TextInput(attrs={'class': 'form-control bg-transparent', 'placeholder': 'Enter email'}))

    class Meta:
        model = User
        fields = ['username','password','email']

class AgencyForm(forms.ModelForm):
    agency_name  = forms.CharField(max_length=30,widget=forms.TextInput(attrs={'class': 'form-control bg-transparent', 'placeholder': 'Enter Agency Name'}))
    username = forms.CharField(max_length=30,widget=forms.TextInput(attrs={'class': 'form-control bg-transparent custom-placeholder', 'placeholder': 'Enter Username'}))
    password = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control bg-transparent', 'placeholder': 'Create password'}))
    email = forms.EmailField(widget=forms.TextInput(attrs={'class': 'form-control bg-transparent', 'placeholder': 'Enter Email'}))
    gst_no = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control bg-transparent', 'placeholder': 'Enter correct GST number'}))
    upi_id = forms.CharField(max_length=30,widget=forms.TextInput(attrs={'class': 'form-control bg-transparent', 'placeholder': 'Enter UPI ID'}))
    agency_logo = forms.ImageField()
    about_us = forms.CharField(widget=forms.Textarea(attrs={'class': 'form-control bg-transparent', 'placeholder': 'Tell something about your agency'}))

    class Meta:
        model = Agency
        fields = ['agency_name','username','password','email','gst_no','upi_id','agency_logo','about_us']        

class UserLoginForm(forms.Form):
    username = forms.CharField(max_length=30,widget=forms.TextInput(attrs={'class': 'form-control bg-transparent ', 'placeholder': 'Enter Username'}))
    password = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control bg-transparent', 'placeholder': 'Enter password'}))

class AgencyLoginForm(forms.Form):
    username = forms.CharField(max_length=30,widget=forms.TextInput(attrs={'class': 'form-control bg-transparent ', 'placeholder': 'Enter Username'}))
    password = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control bg-transparent', 'placeholder': 'Enter password'}))
