
# 🔥 IGNISSHIELD

Sistema Inteligente de Monitorização e Gestão de Incêndios com integração entre Website PHP/MySQL e Arduino Uno R4 WiFi.

## 📖 Descrição

O IGNISSHIELD é uma plataforma desenvolvida para monitorização de incêndios em tempo real através de sensores ligados a um Arduino Uno R4 WiFi.

O sistema permite:

* Registo e gestão de sensores.
* Gestão de utilizadores.
* Criação e monitorização de alertas.
* Painel de controlo para bombeiros.
* Integração com Arduino através de HTTP POST.
* Simulação e deteção de incêndios em tempo real.
* Separação de alertas por localização.
* Dashboard com estatísticas do sistema.

---

## 🚀 Tecnologias Utilizadas

### Backend

* PHP
* MySQL
* SQL

### Frontend

* HTML5
* CSS3
* JavaScript

### Hardware

* Arduino Uno R4 WiFi

### Servidor

* Apache
* XAMPP (desenvolvimento)
* InfinityFree (produção)

---

## 📂 Estrutura do Projeto

```text
IGNISSHIELD/
│
├── htdocs/
│   ├── index.php
│   ├── dashboard.php
│   ├── alertas.php
│   ├── sensores.php
│   ├── utilizadores.php
│   ├── config.php
│   ├── arduino.php
│   ├── atualizar_sensor.php
│   ├── listar_sensores.php
│   ├── recuperar.php
│   ├── logout.php
│   ├── criar_sensores.php
│   ├── nova_password.php
|   ├── dados.txt
|   ├── dados.php
|   ├── registar.php
|
├── database/
│   └── ignisshield.sql
│
├── arduino/
│   └── codigo_arduino.txt
│
└── README.md
```

---

## 👨‍🚒 Funcionalidades

### Dashboard

* Total de sensores.
* Total de utilizadores.
* Total de alertas ativos.
* Informações do sistema em tempo real.

### Gestão de Sensores

* Criar sensores.
* Associar sensores a utilizadores.
* Definir localização.
* Monitorizar estado dos sensores.

### Gestão de Alertas

* Criar alertas automaticamente.
* Enviar bombeiros.
* Monitorizar ocorrências.
* Registar histórico de alertas.

### Gestão de Utilizadores

* Administradores.
* Técnicos.
* Bombeiros.
* Utilizadores normais.

### Recuperação de Palavra-passe

* Alteração de password.
* Verificação por email.

---

## 📡 Integração Arduino

O Arduino Uno R4 WiFi comunica com o sistema através do ficheiro:

```text
arduino.php
```

Os dados são enviados por HTTP POST.

Exemplo:

```http
POST arduino.php

chave=IGNISSHIELD2024
id_sensor=1
fogo=1
```

Quando um incêndio é detetado:

1. O sensor muda para estado ALERTA.
2. É criado um alerta na base de dados.
3. O alerta fica disponível no painel dos bombeiros.

---

## 🗄️ Base de Dados

O repositório inclui:

```text
ignisshield.sql
```

Contendo todas as tabelas necessárias:

* utilizadores
* sensores
* alertas

---

## 🔐 Segurança

* Passwords protegidas com `password_hash()`.
* Sessões PHP.
* Controlo de permissões por perfil.
* Chave de autenticação para comunicação Arduino.

---

## 👤 Perfis do Sistema

### Administrador

* Gestão total da plataforma.

### Bombeiro

* Visualização dos alertas da sua área.
* Monitorização de ocorrências.

### Técnico

* Gestão de sensores.

### Utilizador

* Acesso limitado.

---

## ⚙️ Instalação

### 1. Clonar o repositório

```bash
git clone https://github.com/SEU_UTILIZADOR/IGNISSHIELD.git
```

### 2. Copiar para o servidor

Colocar os ficheiros da pasta:

```text
htdocs/
```

na pasta do servidor web.

### 3. Importar a base de dados

Importar:

```text
ignisshield.sql
```

através do phpMyAdmin.

### 4. Configurar a ligação

Editar:

```php
config.php
```

e definir:

```php
$host
$user
$pass
$db
```

---

## 🎓 Projeto Escolar

Curso: Técnico de Gestão e Programação de Sistemas Informáticos (GPSI)

Projeto desenvolvido no âmbito da aprendizagem de:

* Programação Web
* PHP
* Bases de Dados MySQL
* IoT
* Arduino
* Desenvolvimento Full Stack

---

## 📄 Licença

Projeto desenvolvido para fins educativos.
