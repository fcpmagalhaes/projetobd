from django.http import HttpResponse
from django.shortcuts import render, redirect
from .forms import CandidatoForm
from .models import Deputadoestadual
import datetime

def contas(request):
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % now
    return HttpResponse(html)


def home(request):
    data = {}
    data['transacoes'] = ['t1', 't2', 't3']

    data['now'] = datetime.datetime.now()
    return render(request, 'candidatos/home.html', data)


def listagem(request):
    data = {}
    data['transacoes'] = Deputadoestadual.objects.all()
    return render(request, 'candidatos/listagem.html', data)


def nova_transacao(request):
    data = {}
    form = CandidatoForm(request.POST or None)

    if form.is_valid():
        form.save()
        return redirect('url_listagem')
    data['form'] = form
    return render(request, 'candidatos/form.html', data)

def update(request, pk):
    data = {}
    transacao = Deputadoestadual.objects.get(pk=pk)
    form = CandidatoForm(request.POST or None, instance = transacao)
    if form.is_valid():
        form.save()
        return redirect('url_listagem')
    data['form'] = form
    data['transacao'] = transacao
    return render(request, 'candidatos/form.html', data)

def delete(request, pk):
    transacao = Deputadoestadual.objects.get(pk=pk)
    transacao.delete()
    return redirect('url_listagem')
from django.shortcuts import render

# Create your views here.
