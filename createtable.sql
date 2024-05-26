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