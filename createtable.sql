CREATE TABLE Polo(
    id  int auto_increment  PRIMARY KEY,
    nome    varchar(100)    NOT NULL,
    via varchar(100) NOT NULL,
    civico  int NOT NULL,
    cap     int NOT NULL,
    citta   varchar(100) NOT NULL
);
CREATE TABLE Edificio(
    id int auto_increment PRIMARY KEY,
    nome varchar(100) NOT NULL,
    recapito_centralino varchar(100) NOT NULL,
    numero_piani    int,
    id_polo int,

    foreign key(id_polo) references Polo(id)
);
CREATE TABLE TipoLuogo(
    id int auto_increment PRIMARY KEY,
    nome_tipo   varchar(100) NOT NULL
);
CREATE TABLE Blocco(
    id int auto_increment PRIMARY KEY,
    nome varchar(100) NOT NULL
);
CREATE TABLE Display(
    id int auto_increment PRIMARY KEY,
    marca varchar(100),
    pollici int,
    descrizione varchar(200),
    interno boolean default false NOT NULL,
    id_luogo int,

    foreign key(id_luogo) references Luogo(id)
);
CREATE TABLE Luogo(
    id int auto_increment PRIMARY KEY,
    piano varchar(4)    NOT NULL,
    longitudine varchar(50) NOT NULL,
    latitudine  varchar(50) NOT NULL,
    id_edificio int,
    id_blocco   int,
    id_tipo_luogo   int,
    id_display int,

    foreign key(id_edificio) references Edificio(id)
    foreign key(id_blocco) references   Blocco(id)
    foreign key(id_tipo_luogo) references TipoLuogo(id)
    foreign key(id_display) references Display(id)
);
CREATE TABLE Aula(
    id int auto_increment PRIMARY KEY,
    materia varchar(50) NOT NULL,
    id_luogo int,

    foreign key(id_luogo) references Luogo(id);
);
CREATE TABLE FasciaOraria(
     id int auto_increment PRIMARY KEY,
     oraInizio TIME NOT NULL,
     oraFine TIME NOT NULL,
     giorno varchar(50) NOT NULL
);
CREATE TABLE Utente(
    id int auto_increment PRIMARY KEY,
    nome varchar(100) NOT NULL,
    cognome varchar(100) NOT NULL,
    codice_fiscale varchar(16) UNIQUE,
    eta int NOT NULL,
    username varchar(100) NOT NULL,
    email varchar(150) UNIQUE,
    password varchar(150) NOT NULL
);
CREATE TABLE Dipendete(
    id_utente int,
    codice_contratto varchar(100) NOT NULL,
    dipartimento varchar(100) NOT NULL,
    stipendio float NOT NULL,
    dataAssunzione DATE NOT NULL,
    iban varchar(100) NOT NULL

    foreign key(id_utente) references Utente(id),
    PRIMARY KEY(id_utente,codice_contratto)
);
CREATE TABLE Orario(
    id int auto_increment PRIMARY KEY,
    giorno varchar(50) NOT NULL,
    ora_apertura TIME NOT NULL,
    ora_chiusura TIME NOT NULL
);
CREATE TABLE UfficioDocente(
    id int auto_increment PRIMARY KEY,
    id_orario int,
    id_luogo int,

    foreign key(id_orario) references Orario(id),
    foreign key(id_luogo) references Luogo(id)
);
CREATE TABLE Docente(
    id_utente int,
    codice_contratto varchar(100) NOT NULL,
    ruolo varchar(100) NOT NULL,
    id_ufficio_docente int,

    foreign key(id_ufficio_docente) references UfficioDocente(id),
    foreign key(id_utente) references Utente(id),
    PRIMARY KEY(id_utente,codice_contratto)
);
CREATE TABLE Lezioni(
    id int auto_increment PRIMARY KEY,
    materia varchar(100) NOT NULL,
    descrizione varchar(200),
    lingua varchar(50) NOT NULL,
    id_aula int,
    id_fascia_oraria int,
    id_dipendente int,
    codice_contratto varchar(100),

    foreign key(id_aula) references Aula(id);
    foreign key(id_fascia_oraria) references FasciaOraria(id);
    foreign key(id_dipendente) references Dipendente(id);
    foreign key(codice_contratto) references Dipendente(codice_contratto);
)