from django import forms
from .models import Deputadoestadual

class DeputadoestadualForm(forms.ModelForm):
    class Meta:
        model = Deputadoestadual
        fields = ['nome','localnasc','sexo','escolaridade','cpf','estado_codigo','partido_sigla']

