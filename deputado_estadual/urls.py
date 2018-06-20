from django.urls import path

from .views import list_candidatos, create_candidatos, update_candidatos, delete_candidatos

urlpatterns = [
    path('', list_candidatos, name='list_candidatos'),
    path('new', create_candidatos, name = 'create_candidatos'),
    path('update/<int:id>/', update_candidatos, name = 'update_candidatos'),
    path('delete/<int:id>/', delete_candidatos, name = 'delete_candidatos'),
]
