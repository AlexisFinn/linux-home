#!/bin/sh

# ATTENTION, l'installation de net-sftp seras necessaire (gem install net-sftp)

# Script de deploiement pour la recette qui permet de deployer automatiquement
# en preprod en faisant usage de Dandelion afin
# de ne deployer que les fichiers modifies depuis la derniere version.
# Le diff se fait avec git.

# un argument optionel 'dry-run' peut etre passe afin de simuler une livraison, produisant un log qui pourras etre etudie avant de livrer pour de vrai

# Test si Ruby est installe et dans le path
command -v ruby >/dev/null 2>&1 || { echo >&2 "I require ruby but it's not installed.  Aborting."; exit 1; }

# Test si dandelion est installe et dans le path
command -v dandelion >/dev/null 2>&1 || { echo >&2 "I require Dandelion but it's not installed, try installing it with 'gem install dandelion'.  Aborting."; exit 1; }

# securite qui indique la branche a deployer. Toute autre branche seras refuse.
branch=master

# recuperation du nom de la branche actuelle
head=$(git rev-parse --abbrev-ref HEAD)

# date pour les logs
dployfolderdate=$(date +"%d%m%Y")
dploylogdate=$(date +"%d%m%Y_%H%M%S")

# Test si la branche actuelle est bien la branche a deployer,
# dans le cas contraire terminer le script avec un message d'erreur.
if [ "$branch" = "$head" ]; then

    # si le dossier de log n'existe pas, le creer
    if [ ! -d ../deploy_log ]; then
        mkdir ../deploy_log
    fi
    #Si le sous-dossier de log n'existe pas, le creer
    if [ ! -d ../deploy_log/$dployfolderdate ]; then
        mkdir ../deploy_log/$dployfolderdate
    fi


    # DRY RUN : Simuler la mise en recette uniquement, afin de produire un log de ce qui seras fait
    if [ "$1" = "dry-run" ]; then
        # simulation du deploiement
            echo "########################################### LIVRAISON PREPROD ! DRY-RUN ###########################################"
            echo "loging to file: ../deploy_log/$dployfolderdate/mise_en_preprod_DRY_RUN_$dploylogdate.log"
            dandelion --config=config_deploy_preprod.yml deploy --dry-run > ../deploy_log/$dployfolderdate/mise_en_preprod_DRY_RUN_$dploylogdate.log
    # Si pas d'argument 'dry-run', deployer pour de vrai
    else
        # deploiement
            echo "########################################### LIVRAISON PREPROD ###########################################"
            echo "loging to file: ../deploy_log/$dployfolderdate/mise_en_preprod_$dploylogdate.log"
            dandelion --config=config_deploy_preprod.yml deploy > ../deploy_log/$dployfolderdate/mise_en_preprod_$dploylogdate.log
    fi
else
    echo "You must be on $branch to deploy"
fi
