# Generated by Django 3.2.19 on 2023-06-15 13:27

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0004_auto_20230615_1215'),
    ]

    operations = [
        migrations.RenameField(
            model_name='recipe',
            old_name='ingrediens',
            new_name='ingredients',
        ),
    ]
