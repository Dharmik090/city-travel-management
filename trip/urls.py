from django.urls import path
from django.conf.urls.static import static
from django.conf import settings
from . import views

urlpatterns = [
    path('search', views.search,name='search'),
    path('packages',views.packages,name='packages'),
    path('view_package/<str:trip_name>',views.view_package,name='view_package'),
    
    path('add',views.add_package,name='add_package'),
    path('add_attraction',views.add_attraction,name='add_attraction'),
    path('edit_attraction/<int:id>',views.edit_attraction,name='edit_attraction'),
    path('del_attraction/<int:id>',views.del_attraction,name='del_attraction'),
    
    # path('trip_details/<int:pack_id>',views.view_trip_details,name='view_trip_details'),

    path('agency_pack/<str:agency_name>',views.agency_packages,name='agency_packages'),
    path('edit/<str:trip_name>',views.edit_package,name='edit_package'),
    path('delete/<str:trip_name>',views.del_package,name='del_package'),    
]

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)