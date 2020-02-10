<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200210122932 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE etat (id INT AUTO_INCREMENT NOT NULL, libelle VARCHAR(70) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE lieu (id INT AUTO_INCREMENT NOT NULL, ville_id INT NOT NULL, nom VARCHAR(100) NOT NULL, adresse VARCHAR(150) NOT NULL, INDEX IDX_2F577D59A73F0036 (ville_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE rejoindre (id INT AUTO_INCREMENT NOT NULL, son_utilisateur_id INT NOT NULL, sa_sortie_id INT NOT NULL, date_inscription DATETIME NOT NULL, INDEX IDX_56E78755187326B7 (son_utilisateur_id), INDEX IDX_56E78755DB3FCCAB (sa_sortie_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE site (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(150) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE sortie (id INT AUTO_INCREMENT NOT NULL, lieu_id INT NOT NULL, etat_id INT NOT NULL, site_id INT NOT NULL, organisateur_id INT NOT NULL, nom VARCHAR(150) NOT NULL, date_heure_debut DATETIME NOT NULL, duree INT NOT NULL, date_limite_inscription DATETIME NOT NULL, nb_inscription_max INT NOT NULL, commentaire VARCHAR(255) NOT NULL, nb_inscrits INT NOT NULL, motif VARCHAR(200) DEFAULT NULL, INDEX IDX_3C3FD3F26AB213CC (lieu_id), INDEX IDX_3C3FD3F2D5E86FF (etat_id), INDEX IDX_3C3FD3F2F6BD1646 (site_id), INDEX IDX_3C3FD3F2D936B2FA (organisateur_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE utilisateur (id INT AUTO_INCREMENT NOT NULL, site_id INT DEFAULT NULL, nom VARCHAR(50) NOT NULL, prenom VARCHAR(50) NOT NULL, telephone VARCHAR(10) DEFAULT NULL, mail VARCHAR(100) NOT NULL, admin TINYINT(1) NOT NULL, actif TINYINT(1) NOT NULL, password VARCHAR(255) NOT NULL, picture_filename VARCHAR(255) DEFAULT NULL, publication_par_site TINYINT(1) NOT NULL, organisateur_inscription_desistement TINYINT(1) NOT NULL, administrateur_publication TINYINT(1) NOT NULL, pseudo VARCHAR(255) NOT NULL, administration_modification TINYINT(1) NOT NULL, notif_veille_sortie TINYINT(1) NOT NULL, token VARCHAR(255) DEFAULT NULL, UNIQUE INDEX UNIQ_1D1C63B35126AC48 (mail), UNIQUE INDEX UNIQ_1D1C63B386CC499D (pseudo), INDEX IDX_1D1C63B3F6BD1646 (site_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE ville (id INT AUTO_INCREMENT NOT NULL, departement VARCHAR(3) NOT NULL, slug VARCHAR(255) NOT NULL, nom VARCHAR(45) NOT NULL, nom_simple VARCHAR(45) NOT NULL, nom_reel VARCHAR(45) NOT NULL, nom_soundex VARCHAR(20) NOT NULL, nom_metaphone VARCHAR(22) NOT NULL, code_postal VARCHAR(6) NOT NULL, code_commune VARCHAR(5) NOT NULL, arrondissement SMALLINT NOT NULL, canton VARCHAR(4) NOT NULL, amdi SMALLINT NOT NULL, population_2010 INT NOT NULL, population_1999 INT NOT NULL, population_2012 INT NOT NULL, densite_2010 INT NOT NULL, surface DOUBLE PRECISION NOT NULL, longitude_deg DOUBLE PRECISION NOT NULL, latitude_deg DOUBLE PRECISION NOT NULL, longitude_grd VARCHAR(9) NOT NULL, latitude_grv VARCHAR(8) NOT NULL, longitude_dms VARCHAR(9) NOT NULL, latitude_dms VARCHAR(8) NOT NULL, zmin SMALLINT NOT NULL, zmax SMALLINT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE lieu ADD CONSTRAINT FK_2F577D59A73F0036 FOREIGN KEY (ville_id) REFERENCES ville (id)');
        $this->addSql('ALTER TABLE rejoindre ADD CONSTRAINT FK_56E78755187326B7 FOREIGN KEY (son_utilisateur_id) REFERENCES utilisateur (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE rejoindre ADD CONSTRAINT FK_56E78755DB3FCCAB FOREIGN KEY (sa_sortie_id) REFERENCES sortie (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE sortie ADD CONSTRAINT FK_3C3FD3F26AB213CC FOREIGN KEY (lieu_id) REFERENCES lieu (id)');
        $this->addSql('ALTER TABLE sortie ADD CONSTRAINT FK_3C3FD3F2D5E86FF FOREIGN KEY (etat_id) REFERENCES etat (id)');
        $this->addSql('ALTER TABLE sortie ADD CONSTRAINT FK_3C3FD3F2F6BD1646 FOREIGN KEY (site_id) REFERENCES site (id)');
        $this->addSql('ALTER TABLE sortie ADD CONSTRAINT FK_3C3FD3F2D936B2FA FOREIGN KEY (organisateur_id) REFERENCES utilisateur (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE utilisateur ADD CONSTRAINT FK_1D1C63B3F6BD1646 FOREIGN KEY (site_id) REFERENCES site (id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE sortie DROP FOREIGN KEY FK_3C3FD3F2D5E86FF');
        $this->addSql('ALTER TABLE sortie DROP FOREIGN KEY FK_3C3FD3F26AB213CC');
        $this->addSql('ALTER TABLE sortie DROP FOREIGN KEY FK_3C3FD3F2F6BD1646');
        $this->addSql('ALTER TABLE utilisateur DROP FOREIGN KEY FK_1D1C63B3F6BD1646');
        $this->addSql('ALTER TABLE rejoindre DROP FOREIGN KEY FK_56E78755DB3FCCAB');
        $this->addSql('ALTER TABLE rejoindre DROP FOREIGN KEY FK_56E78755187326B7');
        $this->addSql('ALTER TABLE sortie DROP FOREIGN KEY FK_3C3FD3F2D936B2FA');
        $this->addSql('ALTER TABLE lieu DROP FOREIGN KEY FK_2F577D59A73F0036');
        $this->addSql('DROP TABLE etat');
        $this->addSql('DROP TABLE lieu');
        $this->addSql('DROP TABLE rejoindre');
        $this->addSql('DROP TABLE site');
        $this->addSql('DROP TABLE sortie');
        $this->addSql('DROP TABLE utilisateur');
        $this->addSql('DROP TABLE ville');
    }
}
