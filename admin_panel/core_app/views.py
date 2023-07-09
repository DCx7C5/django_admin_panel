from django.shortcuts import render
from django.views.generic import TemplateView


class HomeView(TemplateView):
    title = 'Home'
    template_name = 'core/index.html'


def index(request):
    return render(request, 'core/index.html')
