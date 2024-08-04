from django.urls import path
from django.conf.urls.static import static
from django.conf import settings
from . import views

urlpatterns = [
    path('booking/<str:trip_name>',views.booking,name='booking'),
    path('view_booking',views.view_booking,name='view_booking'),
    
    path('add_passenger',views.add_passenger,name='add_passenger'),
    path('edit_passenger/<int:pass_id>',views.edit_passenger,name='edit_passenger'),
    path('del_passenger/<int:pass_id>',views.del_passenger,name='del_passenger'),
    
    path('payment',views.payment,name='payment'),
    path('success',views.success,name='success'),
    path('view_ticket',views.view_ticket,name='view_ticket'),
    path('download',views.download_ticket,name='download_ticket')
]


urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)