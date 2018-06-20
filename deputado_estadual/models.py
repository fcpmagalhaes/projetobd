# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Deputadoestadual(models.Model):
    nome = models.CharField(db_column='Nome', max_length=25)  # Field name made lowercase.
    localnasc = models.CharField(db_column='LocalNasc', max_length=45)  # Field name made lowercase.
    sexo = models.CharField(db_column='Sexo', max_length=1)  # Field name made lowercase.
    escolaridade = models.CharField(db_column='Escolaridade', max_length=45)  # Field name made lowercase.
    cpf = models.IntegerField(db_column='CPF', primary_key=True)  # Field name made lowercase.
    estado_codigo = models.ForeignKey('Estado', models.DO_NOTHING, db_column='Estado_Codigo')  # Field name made lowercase.
    partido_sigla = models.ForeignKey('Partido', models.DO_NOTHING, db_column='Partido_Sigla')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'DeputadoEstadual'

    def __srt__(self):
        return self.nome


class DeputadoestadualHasProjetos(models.Model):
    deputadoestadual_cpf = models.ForeignKey(Deputadoestadual, models.DO_NOTHING, db_column='DeputadoEstadual_CPF', primary_key=True)  # Field name made lowercase.
    projetos_numero = models.ForeignKey('Projetos', models.DO_NOTHING, db_column='Projetos_Numero')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'DeputadoEstadual_has_Projetos'
        unique_together = (('deputadoestadual_cpf', 'projetos_numero'),)


class Deputadofederal(models.Model):
    nome = models.CharField(db_column='Nome', max_length=25)  # Field name made lowercase.
    localnasc = models.CharField(db_column='LocalNasc', max_length=45)  # Field name made lowercase.
    sexo = models.CharField(db_column='Sexo', max_length=1)  # Field name made lowercase.
    escolaridade = models.CharField(db_column='Escolaridade', max_length=45)  # Field name made lowercase.
    cpf = models.IntegerField(db_column='CPF', primary_key=True)  # Field name made lowercase.
    estado_codigo = models.ForeignKey('Estado', models.DO_NOTHING, db_column='Estado_Codigo')  # Field name made lowercase.
    partido_sigla = models.ForeignKey('Partido', models.DO_NOTHING, db_column='Partido_Sigla')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'DeputadoFederal'


class DeputadofederalHasProjetos(models.Model):
    deputadofederal_cpf = models.ForeignKey(Deputadofederal, models.DO_NOTHING, db_column='DeputadoFederal_CPF', primary_key=True)  # Field name made lowercase.
    projetos_numero = models.ForeignKey('Projetos', models.DO_NOTHING, db_column='Projetos_Numero')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'DeputadoFederal_has_Projetos'
        unique_together = (('deputadofederal_cpf', 'projetos_numero'),)


class Estado(models.Model):
    codigo = models.AutoField(db_column='Codigo', primary_key=True)  # Field name made lowercase.
    nome = models.CharField(db_column='Nome', max_length=45)  # Field name made lowercase.
    eleitores = models.IntegerField(db_column='Eleitores')  # Field name made lowercase.
    area = models.IntegerField(db_column='Area')  # Field name made lowercase.
    populacao = models.IntegerField(db_column='Populacao')  # Field name made lowercase.

    def __srt__(self):
        return self.nome

    class Meta:
        managed = False
        db_table = 'Estado'


    class Meta:
        managed = False
        db_table = 'Estado'




class Governador(models.Model):
    nome = models.CharField(db_column='Nome', max_length=25)  # Field name made lowercase.
    localnasc = models.CharField(db_column='LocalNasc', max_length=45)  # Field name made lowercase.
    sexo = models.CharField(db_column='Sexo', max_length=1)  # Field name made lowercase.
    escolaridade = models.CharField(db_column='Escolaridade', max_length=45)  # Field name made lowercase.
    cpf = models.IntegerField(db_column='CPF', primary_key=True)  # Field name made lowercase.
    estado_codigo = models.ForeignKey(Estado, models.DO_NOTHING, db_column='Estado_Codigo')  # Field name made lowercase.
    partido_sigla = models.ForeignKey('Partido', models.DO_NOTHING, db_column='Partido_Sigla')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Governador'


class GovernadorHasProjetos(models.Model):
    governador_cpf = models.ForeignKey(Governador, models.DO_NOTHING, db_column='Governador_CPF', primary_key=True)  # Field name made lowercase.
    projetos_numero = models.ForeignKey('Projetos', models.DO_NOTHING, db_column='Projetos_Numero')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Governador_has_Projetos'
        unique_together = (('governador_cpf', 'projetos_numero'),)


class Municipio(models.Model):
    codigo = models.AutoField(db_column='Codigo', primary_key=True)  # Field name made lowercase.
    nome = models.CharField(db_column='Nome', max_length=45)  # Field name made lowercase.
    eleitores = models.IntegerField(db_column='Eleitores')  # Field name made lowercase.
    area = models.IntegerField(db_column='Area')  # Field name made lowercase.
    população = models.IntegerField(db_column='População')  # Field name made lowercase.
    estado_codigo = models.ForeignKey(Estado, models.DO_NOTHING, db_column='Estado_Codigo')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Municipio'


class Partido(models.Model):
    sigla = models.CharField(db_column='Sigla', primary_key=True, max_length=5)  # Field name made lowercase.
    filiados = models.IntegerField(db_column='Filiados')  # Field name made lowercase.
    nome = models.CharField(db_column='Nome', max_length=45)  # Field name made lowercase.
    posicao = models.TextField(db_column='Posicao')  # Field name made lowercase.
    logo = models.TextField(db_column='Logo')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Partido'


class Prefeito(models.Model):
    nome = models.CharField(db_column='Nome', max_length=25)  # Field name made lowercase.
    localnasc = models.CharField(db_column='LocalNasc', max_length=45)  # Field name made lowercase.
    sexo = models.CharField(db_column='Sexo', max_length=1)  # Field name made lowercase.
    escolaridade = models.CharField(db_column='Escolaridade', max_length=45)  # Field name made lowercase.
    cpf = models.IntegerField(db_column='CPF', primary_key=True)  # Field name made lowercase.
    municipio_codigo = models.ForeignKey(Municipio, models.DO_NOTHING, db_column='Municipio_Codigo')  # Field name made lowercase.
    partido_sigla = models.ForeignKey(Partido, models.DO_NOTHING, db_column='Partido_Sigla')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Prefeito'


class PrefeitoHasProjetos(models.Model):
    prefeito_cpf = models.ForeignKey(Prefeito, models.DO_NOTHING, db_column='Prefeito_CPF', primary_key=True)  # Field name made lowercase.
    projetos_numero = models.ForeignKey('Projetos', models.DO_NOTHING, db_column='Projetos_Numero')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Prefeito_has_Projetos'
        unique_together = (('prefeito_cpf', 'projetos_numero'),)


class Presidente(models.Model):
    nome = models.CharField(db_column='Nome', max_length=25)  # Field name made lowercase.
    localnasc = models.CharField(db_column='LocalNasc', max_length=45)  # Field name made lowercase.
    sexo = models.CharField(db_column='Sexo', max_length=1)  # Field name made lowercase.
    escolaridade = models.CharField(db_column='Escolaridade', max_length=45)  # Field name made lowercase.
    cpf = models.IntegerField(db_column='CPF', primary_key=True)  # Field name made lowercase.
    partido_sigla = models.ForeignKey(Partido, models.DO_NOTHING, db_column='Partido_Sigla')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Presidente'


class PresidenteHasProjetos(models.Model):
    presidente_cpf = models.ForeignKey(Presidente, models.DO_NOTHING, db_column='Presidente_CPF', primary_key=True)  # Field name made lowercase.
    projetos_numero = models.ForeignKey('Projetos', models.DO_NOTHING, db_column='Projetos_Numero')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Presidente_has_Projetos'
        unique_together = (('presidente_cpf', 'projetos_numero'),)


class Processos(models.Model):
    numero = models.IntegerField(db_column='Numero', primary_key=True)  # Field name made lowercase.
    juiz = models.CharField(db_column='Juiz', max_length=45)  # Field name made lowercase.
    forum = models.CharField(db_column='Forum', max_length=45)  # Field name made lowercase.
    delito = models.CharField(db_column='Delito', max_length=45)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Processos'


class ProcessosHasDeputadoestadual(models.Model):
    processos_numero = models.ForeignKey(Processos, models.DO_NOTHING, db_column='Processos_Numero', primary_key=True)  # Field name made lowercase.
    deputadoestadual_cpf = models.ForeignKey(Deputadoestadual, models.DO_NOTHING, db_column='DeputadoEstadual_CPF')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Processos_has_DeputadoEstadual'
        unique_together = (('processos_numero', 'deputadoestadual_cpf'),)


class ProcessosHasDeputadofederal(models.Model):
    processos_numero = models.ForeignKey(Processos, models.DO_NOTHING, db_column='Processos_Numero', primary_key=True)  # Field name made lowercase.
    deputadofederal_cpf = models.ForeignKey(Deputadofederal, models.DO_NOTHING, db_column='DeputadoFederal_CPF')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Processos_has_DeputadoFederal'
        unique_together = (('processos_numero', 'deputadofederal_cpf'),)


class ProcessosHasGovernador(models.Model):
    processos_numero = models.ForeignKey(Processos, models.DO_NOTHING, db_column='Processos_Numero', primary_key=True)  # Field name made lowercase.
    governador_cpf = models.ForeignKey(Governador, models.DO_NOTHING, db_column='Governador_CPF')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Processos_has_Governador'
        unique_together = (('processos_numero', 'governador_cpf'),)


class ProcessosHasPrefeito(models.Model):
    processos_numero = models.ForeignKey(Processos, models.DO_NOTHING, db_column='Processos_Numero', primary_key=True)  # Field name made lowercase.
    prefeito_cpf = models.ForeignKey(Prefeito, models.DO_NOTHING, db_column='Prefeito_CPF')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Processos_has_Prefeito'
        unique_together = (('processos_numero', 'prefeito_cpf'),)


class ProcessosHasPresidente(models.Model):
    processos_numero = models.ForeignKey(Processos, models.DO_NOTHING, db_column='Processos_Numero', primary_key=True)  # Field name made lowercase.
    presidente_cpf = models.ForeignKey(Presidente, models.DO_NOTHING, db_column='Presidente_CPF')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Processos_has_Presidente'
        unique_together = (('processos_numero', 'presidente_cpf'),)


class ProcessosHasSenador(models.Model):
    processos_numero = models.ForeignKey(Processos, models.DO_NOTHING, db_column='Processos_Numero', primary_key=True)  # Field name made lowercase.
    senador_cpf = models.ForeignKey('Senador', models.DO_NOTHING, db_column='Senador_CPF')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Processos_has_Senador'
        unique_together = (('processos_numero', 'senador_cpf'),)


class ProcessosHasVereador(models.Model):
    processos_numero = models.ForeignKey(Processos, models.DO_NOTHING, db_column='Processos_Numero', primary_key=True)  # Field name made lowercase.
    vereador_cpf = models.ForeignKey('Vereador', models.DO_NOTHING, db_column='Vereador_CPF')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Processos_has_Vereador'
        unique_together = (('processos_numero', 'vereador_cpf'),)


class Projetos(models.Model):
    numero = models.IntegerField(db_column='Numero', primary_key=True)  # Field name made lowercase.
    data = models.DateField(db_column='Data')  # Field name made lowercase.
    descrição = models.TextField(db_column='Descrição')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Projetos'


class Senador(models.Model):
    nome = models.CharField(db_column='Nome', max_length=25)  # Field name made lowercase.
    localnasc = models.CharField(db_column='LocalNasc', max_length=45)  # Field name made lowercase.
    sexo = models.CharField(db_column='Sexo', max_length=1)  # Field name made lowercase.
    escolaridade = models.CharField(db_column='Escolaridade', max_length=45)  # Field name made lowercase.
    cpf = models.IntegerField(db_column='CPF', primary_key=True)  # Field name made lowercase.
    estado_codigo = models.ForeignKey(Estado, models.DO_NOTHING, db_column='Estado_Codigo')  # Field name made lowercase.
    partido_sigla = models.ForeignKey(Partido, models.DO_NOTHING, db_column='Partido_Sigla')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Senador'


class SenadorHasProjetos(models.Model):
    senador_cpf = models.ForeignKey(Senador, models.DO_NOTHING, db_column='Senador_CPF', primary_key=True)  # Field name made lowercase.
    projetos_numero = models.ForeignKey(Projetos, models.DO_NOTHING, db_column='Projetos_Numero')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Senador_has_Projetos'
        unique_together = (('senador_cpf', 'projetos_numero'),)


class Vereador(models.Model):
    nome = models.CharField(db_column='Nome', max_length=25)  # Field name made lowercase.
    localnasc = models.CharField(db_column='LocalNasc', max_length=45)  # Field name made lowercase.
    sexo = models.CharField(db_column='Sexo', max_length=1)  # Field name made lowercase.
    escolaridade = models.CharField(db_column='Escolaridade', max_length=45)  # Field name made lowercase.
    cpf = models.IntegerField(db_column='CPF', primary_key=True)  # Field name made lowercase.
    municipio_codigo = models.ForeignKey(Municipio, models.DO_NOTHING, db_column='Municipio_Codigo')  # Field name made lowercase.
    partido_sigla = models.ForeignKey(Partido, models.DO_NOTHING, db_column='Partido_Sigla')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Vereador'


class VereadorHasProjetos(models.Model):
    vereador_cpf = models.ForeignKey(Vereador, models.DO_NOTHING, db_column='Vereador_CPF', primary_key=True)  # Field name made lowercase.
    projetos_numero = models.ForeignKey(Projetos, models.DO_NOTHING, db_column='Projetos_Numero')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Vereador_has_Projetos'
        unique_together = (('vereador_cpf', 'projetos_numero'),)


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'
