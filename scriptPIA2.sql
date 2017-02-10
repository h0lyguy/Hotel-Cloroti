#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Hotel
#------------------------------------------------------------

CREATE TABLE Hotel(
        NomHotel       Char (15) NOT NULL ,
        AdresseHotel   Char (50) ,
        MailHotel      Char (25) ,
        TelephoneHotel BigInt ,
        URLWeb         Char (50) ,
        PRIMARY KEY (NomHotel )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CHAMBRE
#------------------------------------------------------------

CREATE TABLE CHAMBRE(
        NumeroChambre  Int NOT NULL ,
        Capacite       Int ,
        Description    Char (100) ,
        TypeChambre    Char (25) ,
        PrixChambre    Int ,
        ID_Reservation BigInt ,
        NomHotel       Char (15) ,
        PRIMARY KEY (NumeroChambre )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CLIENT
#------------------------------------------------------------

CREATE TABLE CLIENT(
        ID_Client       BigInt NOT NULL ,
        NomClient       Char (25) ,
        PrenomClient    Char (25) ,
        AdresseClient   Char (50) ,
        TelephoneClient BigInt ,
        MailClient      Char (25) ,
        NumeroCB        BigInt ,
        MotDePasse      Varchar (50) ,
        ID_Reservation  BigInt ,
        ID_Carte        BigInt ,
        PRIMARY KEY (ID_Client )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: FORMULE
#------------------------------------------------------------

CREATE TABLE FORMULE(
        ID_Formule          BigInt NOT NULL ,
        NomFormule          Char (25) ,
        Description_Formule Char (50) ,
        PrixFormule         Int ,
        ID_Reservation      BigInt ,
        PRIMARY KEY (ID_Formule )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PAIEMENT
#------------------------------------------------------------

CREATE TABLE PAIEMENT(
        ID_Paiment     BigInt NOT NULL ,
        Type_Paiement  Char (25) ,
        Date_Paiement  Date ,
        Mode_Paiement  Char (25) ,
        ID_Reservation BigInt ,
        PRIMARY KEY (ID_Paiment )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CARTE_FIDELITE
#------------------------------------------------------------

CREATE TABLE CARTE_FIDELITE(
        ID_Carte     BigInt NOT NULL ,
        NbVisite     Int ,
        RangFidelite Char (25) ,
        ID_Client    BigInt ,
        PRIMARY KEY (ID_Carte )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: RESERVATION
#------------------------------------------------------------

CREATE TABLE RESERVATION(
        ID_Reservation   BigInt NOT NULL ,
        Nb_Personnes     Int ,
        PrixReservation  Int ,
        Date_Reservation Date ,
        Date_Sejour      Date ,
        Duree            Date ,
        NumeroChambre    Int NOT NULL ,
        ID_Paiment       BigInt ,
        ID_Client        BigInt ,
        PRIMARY KEY (ID_Reservation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: EMPLOYE
#------------------------------------------------------------

CREATE TABLE EMPLOYE(
        ID_Employe       BigInt NOT NULL ,
        NomEmploye       Char (25) ,
        PrenomEmploye    Char (25) ,
        AdresseEmploye   Char (50) ,
        TelephoneEmploye BigInt ,
        MotDePasse       Varchar (50) ,
        ID_Service       BigInt ,
        PRIMARY KEY (ID_Employe )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: SERVICE
#------------------------------------------------------------

CREATE TABLE SERVICE(
        ID_Service    BigInt NOT NULL ,
        NomService    Char (25) ,
        NumeroService Int ,
        NomHotel      Char (15) ,
        PRIMARY KEY (ID_Service )
)ENGINE=InnoDB;

ALTER TABLE CHAMBRE ADD CONSTRAINT FK_CHAMBRE_ID_Reservation FOREIGN KEY (ID_Reservation) REFERENCES RESERVATION(ID_Reservation);
ALTER TABLE CHAMBRE ADD CONSTRAINT FK_CHAMBRE_NomHotel FOREIGN KEY (NomHotel) REFERENCES Hotel(NomHotel);
ALTER TABLE CLIENT ADD CONSTRAINT FK_CLIENT_ID_Reservation FOREIGN KEY (ID_Reservation) REFERENCES RESERVATION(ID_Reservation);
ALTER TABLE CLIENT ADD CONSTRAINT FK_CLIENT_ID_Carte FOREIGN KEY (ID_Carte) REFERENCES CARTE_FIDELITE(ID_Carte);
ALTER TABLE FORMULE ADD CONSTRAINT FK_FORMULE_ID_Reservation FOREIGN KEY (ID_Reservation) REFERENCES RESERVATION(ID_Reservation);
ALTER TABLE PAIEMENT ADD CONSTRAINT FK_PAIEMENT_ID_Reservation FOREIGN KEY (ID_Reservation) REFERENCES RESERVATION(ID_Reservation);
ALTER TABLE CARTE_FIDELITE ADD CONSTRAINT FK_CARTE_FIDELITE_ID_Client FOREIGN KEY (ID_Client) REFERENCES CLIENT(ID_Client);
ALTER TABLE RESERVATION ADD CONSTRAINT FK_RESERVATION_ID_Paiment FOREIGN KEY (ID_Paiment) REFERENCES PAIEMENT(ID_Paiment);
ALTER TABLE RESERVATION ADD CONSTRAINT FK_RESERVATION_ID_Client FOREIGN KEY (ID_Client) REFERENCES CLIENT(ID_Client);
ALTER TABLE EMPLOYE ADD CONSTRAINT FK_EMPLOYE_ID_Service FOREIGN KEY (ID_Service) REFERENCES SERVICE(ID_Service);
ALTER TABLE SERVICE ADD CONSTRAINT FK_SERVICE_NomHotel FOREIGN KEY (NomHotel) REFERENCES Hotel(NomHotel);
