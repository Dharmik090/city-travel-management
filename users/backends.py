from django.contrib.auth.backends import ModelBackend
from .models import User,Agency

class UserAuth(ModelBackend):
    def authenticate(self, request, username=None, password=None):
        try:
            user = User.objects.get(username=username)
            
            if password == user.password:  # Compare passwords using check_password
                return user
        except User.DoesNotExist:
            return None
        

class AgencyAuth(ModelBackend):
    def authenticate(self, request, username=None, password=None):
        try:
            agency = Agency.objects.get(username=username)
            
            if password == agency.password:  # Compare passwords using check_password
                return agency
        except Agency.DoesNotExist:
            return None
