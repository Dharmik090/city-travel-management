from django import forms

from .models import Passenger

class PassengerForm(forms.ModelForm):
    ticket_id = forms.HiddenInput()
    name = forms.CharField(max_length=30,widget=forms.TextInput(attrs={'class': 'form-control bg-transparent', 'placeholder': 'Name'}))
    age = forms.IntegerField(widget=forms.TextInput(attrs={'class': 'form-control bg-transparent', 'placeholder': 'Age'}))
    
    class Meta:
        model = Passenger
        fields = '__all__'