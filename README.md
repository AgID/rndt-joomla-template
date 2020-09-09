# Template Joomla RNDT
Template Joomla per il portale RNDT

Il repository contiene i seguenti file e cartelle:

- [```geoportale```](geoportale)
  - [```/includes```](geoportale/includes)
    Contiene alcuni file .php da copiare nella cartella corrispondente nell&#39;installazione. &quot;geoportale&quot; è il nome dell&#39;applicazione Joomla, che può essere comunque modificato
  - [```/templates/rndt```](geoportale/templates/rndt)
    Template Joomla completo dell&#39;applicazione. Va copiata nella cartella corrispondente nell&#39;installazione.
  - [```/images/guida```](geoportale/images/guida)
    Contiene i file html della guida in linea.
  - [```/proxy4```](geoportale/proxy4)
    Applicativo da utilizzare con Windows se si vogliono caricare servizi esterni al dominio di installazione. Va configurata come applicazione aspx in IIS.
  - [```/proxyPHP```](geoportale/proxyPHP)
    Applicativo da utilizzare con Apache se si vogliono caricare servizi esterni al dominio di installazione.

## Installazione

L&#39;installazione del Geoportale consiste nella copia dei seguenti files:

- ```geoportale/includes/*.php```  --> ```<webserver>/geoportale/includes```
- [```geoportale/templates/rndt```](geoportale/templates/rndt) --> ```<webserver>/geoportale/templates```
- [```geoportale/images/guida```](geoportale/images/guida) --> ```<webserver>/geoportale/images/guida```
  

