import csv
import mysql.connector
from datetime import datetime


db_config = {
    'host': 'localhost',
    'user': 'info_gr3',
    'password': 'bL3',
    'database': 'info306_tp_info_gr3'
}

conn = mysql.connector.connect(**db_config)
cursor = conn.cursor(buffered=True)
print("Connexion OK")
with open('data3.csv', mode='r', encoding='latin-1') as fichier_csv:
    lecteur = csv.reader(fichier_csv, delimiter=';')

    for ligne in lecteur:
        if len(ligne) < 16:
            print(f"Ligne ignorée (trop courte) : {ligne}")
            continue  # passe à la ligne suivante
        
        else:
            if '' in ligne[:16] or 'NULL' in ligne[:16]:
                print(f"Ligne ignorée (champ vide) : {ligne}")
                continue  # passe à la ligne suivante
    
            activity_names = ligne[0]
            activity_syllabus = ligne[1]
            activity_coin = ligne[2]
            activity_marks = ligne[4]
            roles_name = ligne[3]
            period_name = ligne[5]
                    
            raw_startDate = ligne[6].split(' ')[0]
            raw_endDate = ligne[7].split(' ')[0]
            period_endDate = ligne[7]
            perido_color = ligne[8]
            skill_name = ligne[9]
            comments_message = ligne[10]
            comments_date = ligne[11]
            learner_email = ligne[12]
            session_date = ligne[13]
            rooms_bulding = ligne[14]
            rooms_number = ligne[15]
            password = "password123"
            stateId = 4
            requete = f"INSERT IGNORE INTO period (title, startDate, endDate, color) VALUES ('{period_name}', STR_TO_DATE('{raw_startDate}', '%d/%m/%Y'), STR_TO_DATE('{raw_endDate}', '%d/%m/%Y'), '{perido_color}')"
            # print(ligne)
            cursor.execute(requete)
            conn.commit()



        

        


        
