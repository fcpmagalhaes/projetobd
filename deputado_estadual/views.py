from django.shortcuts import render, redirect
from .models import Deputadoestadual
from .forms import DeputadoestadualForm

# Create your views here.
def list_candidatos(request):
    candidatos = Deputadoestadual.objects.all()
    return render(request,'dep_estaduais.html', {'candidatos':candidatos})

def create_candidatos(request):
    form = DeputadoestadualForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('list_candidatos')

    return render(request, 'deputadoestadualForm.html', {'form':form})


def update_candidatos(request, id):
    candidato = Deputadoestadual.objects.get(id=id)
    form = DeputadoestadualForm(request.POST or None, instance=candidato)
    if form.is_valid():
        form.save()
        return redirect('list_candidatos')

    return render(request, 'deputadoestadualForm.html', {'form':form, 'candidato':candidato})



def delete_candidatos(request, id):
    candidato = Deputadoestadual.objects.get(id=id)

    if request.method == 'POST':
        candidato.delete()
        return redirect('lista_candidatos')

    return render(request,'deputadoestadual-delete-confirm.html', {'candidato':candidato})