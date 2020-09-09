# Template Joomla RNDT
Template Joomla per il portale RNDT

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

## Installazione

L&#39;installazione del Geoportale consiste nelle seguente operazioni:

- copiare ```geoportale/includes/*.php```  nella propria installazione ```<webserver>/geoportale/includes```
- copiare [```geoportale/templates/rndt```](geoportale/templates/rndt) nella propria installazione ```<webserver>/geoportale/templates```
- copiare [```geoportale/images/guida```](geoportale/images/guida) nella propria installazione ```<webserver>/geoportale/images/guida```.
