from django.forms import ModelForm
from .models import Deputadoestadual

class CandidatoForm(ModelForm):
    class Meta:
        model = Deputadoestadual
        fields = ['nome','localnasc','sexo','escolaridade','cpf','estado_codigo','partido_sigla']
