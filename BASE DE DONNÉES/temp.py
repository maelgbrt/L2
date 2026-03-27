import csv
import mysql.connector

# 1. Configuration de la connexion à la base de données
# REMPLACEZ CES VALEURS par les vôtres
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'votre_mot_de_passe',
    'database': 'votre_base_de_donnees'
}

try:
    # Connexion à MySQL
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()
    print("Connexion à la base de données réussie.")

    # 2. La requête SQL d'insertion
    # Remplacez 'utilisateurs' par le nom réel de votre table
    sql_query = "INSERT INTO utilisateurs (nom, prenom) VALUES (%s, %s)"

    # 3. Ouverture et lecture du fichier CSV
    fichier_csv = 'mon_fichier.csv'
    
    with open(fichier_csv, 'r', encoding='utf-8') as f:
        reader = csv.reader(f)
        
        # OPTIONNEL : Si la 1ère ligne est un en-tête (Titres), décommentez la ligne suivante
        # next(reader) 

        for row in reader:
            # Vérification de sécurité pour éviter les lignes vides
            if len(row) >= 2:
                nom = row[0]    # Première colonne du CSV
                prenom = row[1] # Deuxième colonne du CSV
                
                # Exécution de la requête pour cette ligne
                cursor.execute(sql_query, (nom, prenom))

    # 4. Valider les changements (Crucial !)
    conn.commit()
    print(f"Importation terminée. {cursor.rowcount} lignes insérées.")

except mysql.connector.Error as err:
    print(f"Erreur MySQL : {err}")
except FileNotFoundError:
    print(f"Le fichier {fichier_csv} est introuvable.")
except Exception as e:
    print(f"Une erreur est survenue : {e}")

finally:
    # 5. Fermeture propre de la connexion
    if 'conn' in locals() and conn.is_connected():
        cursor.close()
        conn.close()
        print("Connexion fermée.")