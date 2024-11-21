-- Script SQL pour la création de la base de données PostgreSQL
-- Auteur : Justin DIDELOT
-- Date : 21/11/2024

-- ==================================================================
-- 1. Création de la base de données
-- ==================================================================
CREATE DATABASE simpluedo;
-- ==================================================================
-- 2. Création de l'administrateur
-- ==================================================================
CREATE USER simpluedo_admin;
-- ==================================================================
-- 3. Ajout d'un mot de passe a l'adminisrateur
-- ==================================================================
ALTER USER simpluedo_admin WITH PASSWORD 'admin';
-- ==================================================================
-- 4. Création de la table 'utilisateur'
-- ==================================================================
CREATE TABLE utilisateur(
uuid_utilisateur UUID PRIMARY KEY DEFAULT gen_random_uuid(),
pseudo_utilisateur VARCHAR(50) NOT NULL);
-- ==================================================================
-- 5. Création de la table 'role'
-- ==================================================================
CREATE TABLE role(
id_role INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
nom_role VARCHAR(50) NOT NULL);
-- ==================================================================
-- 6. Création de la table 'salle'
-- ==================================================================
CREATE TABLE salle(
id_salle INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
nom_salle VARCHAR(50) NOT NULL);
-- ==================================================================
-- 7. Création de la table 'personnage'
-- ==================================================================
CREATE TABLE personnage(
id_personnage INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
nom_personnage VARCHAR(50) NOT NULL);
-- ==================================================================
-- 8. Création de la table 'objet'
-- ==================================================================
CREATE TABLE objet(
id_objet INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
nom_objet VARCHAR(50) NOT NULL);
-- ==================================================================
-- 8. Création de la table 'visiter'
-- ==================================================================
CREATE TABLE visiter(
id_personnage INTEGER,
id_salle INTEGER,
heure_arrivee TIME,
heure_sortie TIME,
PRIMARY KEY(id_personnage, id_salle),
FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
FOREIGN KEY(id_salle) REFERENCES salle(id_salle));
-- ==================================================================
-- 8. Ajout de la clé étrangère 'id_role' dans la table 'utilisateur'
-- ==================================================================
ALTER TABLE utilisateur
ADD COLUMN id_role INTEGER,
ADD CONSTRAINT fk_utilisateur_id_role
FOREIGN KEY (id_role) REFERENCES role(id_role);