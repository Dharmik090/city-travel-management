from django.urls import path
from django.conf.urls.static import static
from django.conf import settings
from . import views

urlpatterns = [
    path('register_login',views.register_login,name='register_login'),
    path('uregistration',views.user_registration,name='user_registration'),
    path('aregistration',views.agency_registration,name='agency_registration'),
    path('ulogin',views.user_login,name='user_login'),
    path('alogin',views.agency_login,name='agency_login'),
    path('logout',views.log_out,name='log_out'),
]


urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)