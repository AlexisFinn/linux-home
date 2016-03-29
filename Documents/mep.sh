#!/bin/sh

folderdate=$(date +"%d%m%Y")
logdate=$(date +"%d%m%Y_%H%M%S")

# si le dossier de log n'existe pas, le creer
if [ ! -d /home/samsung/logs/mep ]; then
    mkdir /home/samsung/logs/mep
fi
#Si le sous-dossier de log n'existe pas, le creer
if [ ! -d /home/samsung/logs/mep/$folderdate ]; then
    mkdir /home/samsung/logs/mep/$folderdate
fi


if [ "$1" = "dry-run" ]; then
    echo "########################################### LIVRAISON PROD ! DRY-RUN ! ###########################################"
    echo "Etape 1) LIVRAISON PROD ! DRY-RUN : APPLICATIF (Tout remplacer, supprimer inexistant)"
    echo "loging to file: /home/samsung/logs/mep/$folderdate/mep_applicatif_DRY_RUN_$logdate.log"
    rsync -avzq  --dry-run --exclude-from=/home/samsung/website/rsync_exclude_application_list --delete --list-only --log-file="/home/samsung/logs/mep/$folderdate/mep_applicatif_DRY_RUN_$logdate.log" /home/samsung/website/ samsung@172.31.0.211:/home/samsung/website/
    echo "Etape 2) LIVRAISON PROD ! DRY-RUN : DOSSIER WEB (Ne pas effacer, ne pas remplacer si destination plus recente)"
    echo "loging to file: /home/samsung/logs/mep/$folderdate/mep_web_DRY_RUN_$logdate.log"
    rsync -avuzq --dry-run --exclude-from=/home/samsung/website/rsync_exclude_web_list --list-only --log-file="/home/samsung/logs/mep/$folderdate/mep_web_DRY_RUN_$logdate.log" /home/samsung/website/web/ samsung@172.31.0.211:/home/samsung/website/web/
else
    echo "########################################### LIVRAISON PROD ! ###########################################"
    echo "Etape 1) LIVRAISON PROD : APPLICATIF (Tout remplacer, supprimer inexistant)"
    echo "loging to file: /home/samsung/logs/mep/$folderdate/mep_applicatif_$logdate.log"
    rsync -avzq --exclude-from=/home/samsung/website/rsync_exclude_application_list --delete --log-file="/home/samsung/logs/mep/$folderdate/mep_applicatif_$logdate.log" /home/samsung/website/ samsung@172.31.0.211:/home/samsung/website/
    echo "Etape 2) LIVRAISON PROD : DOSSIER WEB (Ne pas effacer, ne pas remplacer si destination plus recente)"
    echo "loging to file: /home/samsung/logs/mep/$folderdate/mep_web_$logdate.log"
    rsync -avuzq --exclude-from=/home/samsung/website/rsync_exclude_web_list --log-file="/home/samsung/logs/mep/$folderdate/mep_web_$logdate.log" /home/samsung/website/web/ samsung@172.31.0.211:/home/samsung/website/web/
fi
