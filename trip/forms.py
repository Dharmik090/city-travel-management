from django import forms
from .models import Attraction,TripPlan

class AttractionForm(forms.ModelForm):
    trip_name = forms.HiddenInput()
    att_name = forms.CharField(max_length=30,widget=forms.TextInput(attrs={'class': 'form-control bg-transparent', 'placeholder': 'Attraction Name'}))
    att_imgs = forms.ImageField()

    class Meta:
        model = Attraction
        fields = '__all__'

class TripPlanForm(forms.ModelForm):
    agency_name = forms.HiddenInput()
    trip_name  = forms.CharField(max_length=30,widget=forms.TextInput(attrs={'class': 'form-control bg-transparent', 'placeholder': 'Enter Trip Name'}))
    city = forms.CharField(max_length=30,widget=forms.TextInput(attrs={'class': 'form-control bg-transparent custom-placeholder', 'placeholder': 'Enter City'}))
    price = forms.FloatField(widget=forms.TextInput(attrs={'class': 'form-control bg-transparent', 'placeholder': 'Enter Price'}))
    capacity = forms.IntegerField(widget=forms.TextInput(attrs={'class': 'form-control bg-transparent', 'placeholder': 'Capacity'}))
    departure_date = forms.DateField(widget=forms.DateInput(attrs={'class': 'form-control bg-transparent w-50', 'type': 'date'}))
    departure_time = forms.TimeField(widget=forms.TimeInput(attrs={'class': 'form-control bg-transparent w-50', 'type':'time'}))
    departure_place = forms.CharField(max_length=30,widget=forms.TextInput(attrs={'class': 'form-control bg-transparent custom-placeholder', 'placeholder': 'Departure Place'}))
    return_date = forms.DateField(widget=forms.DateInput(attrs={'class': 'form-control bg-transparent w-50', 'type': 'date'}))
    return_time = forms.TimeField(widget=forms.TimeInput(attrs={'class': 'form-control bg-transparent w-50', 'type': 'time'}))
    return_place = forms.CharField(max_length=30,widget=forms.TextInput(attrs={'class': 'form-control bg-transparent custom-placeholder', 'placeholder': 'Return Place'}))
    extra_info = forms.CharField(widget=forms.Textarea(attrs={'class': 'form-control bg-transparent custom-placeholder', 'placeholder': 'Extra information'}))
    duration = forms.IntegerField()
    thumbnail = forms.ImageField()

    class Meta:
        model = TripPlan
        fields = '__all__'
