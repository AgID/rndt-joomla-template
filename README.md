# Template Joomla RNDT

Applicazione Joomla/PHP che gira sotto un Web Server (ad.es. IIS 8 o Apache Web Server). Il nome dell’applicazione può essere qualunque, purché vengano coerentemente modificati i file di configurazione. Il nome utilizzato è “geoportale”.

Il repository contiene i seguenti file e cartelle:

- [```geoportale```](geoportale)
  - [```/includes```](geoportale/includes)
    Contiene file .php. &quot;geoportale&quot; è il nome dell&#39;applicazione Joomla, che può essere comunque modificato
  - [```/templates/rndt```](geoportale/templates/rndt)
    Template Joomla completo dell&#39;applicazione.
  - [```/images/guida```](geoportale/images/guida)
    Contiene i file html della guida in linea.
  - [```/proxy4```](geoportale/proxy4)
    Applicativo da utilizzare con Windows se si vogliono caricare servizi esterni al dominio di installazione. Va configurata come applicazione aspx in IIS.
  - [```/proxyPHP```](geoportale/proxyPHP)
    Applicativo da utilizzare con Apache se si vogliono caricare servizi esterni al dominio di installazione.
    
I requisiti minimi per eseguire il software sono i seguenti:

- Sistema operativo (Linux o Windows)
- Apache Web server (2.4.6) (o IIS 7 o 8) installato e attivo
- PHP 7.1 installato e configurato inclusa estensione per mysql, mbstring e ldap
- Joomla 3.8 con estensione Shmanic LDAP.

## Documentazione

- [Manuale di installazione e configurazione](documentation/manuale-installazione.md)

## Licenza

Il codice di questo repository è reso disponibile con [**licenza EUPL 1.2**](LICENSE).

## Credits

La soluzione è stata sviluppata da ESRI Italia per [**AgID**](https://agid.gov.it/) nell'ambito della gara per le **Infrastrutture Nazionali Condivise SPC**.
