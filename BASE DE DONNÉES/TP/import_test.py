import csv
import mysql.connector

db_config = {
    'host': 'localhost',
    'user': 'info_gr3',
    'password': 'bL3',
    'database': 'info306_tp_info_gr3'
}

conn = mysql.connector.connect(**db_config)
cursor = conn.cursor(buffered=True)
print("Connexion OK")
with open('apprenant.csv', mode='r', encoding='utf-8') as fichier_csv:
    lecteur = csv.reader(fichier_csv, delimiter=';')

    for ligne in lecteur:
        if len(ligne) < 7:
            print(f"Ligne ignorée (trop courte) : {ligne}")
            continue  # passe à la ligne suivante

        id_apprenant = ligne[0]
        nom = ligne[2]
        prenom = ligne[1]
        email = ligne[3]
        team_number = ligne[4]
        team_name = ligne[5]
        team_coin = ligne[6]

        password = "password123"
        stateId = 4

        requete = f"INSERT IGNORE INTO teams (id, name, coin) VALUES ({team_number}, '{team_name}', {team_coin})"
        cursor.execute(requete)
        conn.commit()

        requete = f"INSERT INTO learners (firstName, lastName, email, team, password, stateId) VALUES ('{prenom}', '{nom}', '{email}', '{team_number}', '{password}', {stateId})"
        cursor.execute(requete)
        conn.commit()
