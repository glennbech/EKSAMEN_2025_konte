Oppgave 1: <br/>
Jeg har håndtert sensitive verdier i koden min ved å definere en sensitiv variabel for API-tokenet i Terraform og deretter referere til denne variabelen i provider-blokken for StatusCake. <br/>
På denne måten unngår jeg å hardkode tokenet direkte i koden. Videre benytter jeg GitHub Repo Secrets for å lagre API-tokenet på en sikker måte. I GitHub Actions workflow injiserer jeg deretter tokenet som en miljøvariabel (med prefikset TF_VAR_), slik at Terraform får tilgang til den under kjøring uten at den eksponeres i koden. Dette sikrer at sensitive data håndteres trygt gjennom hele prosessen.

Oppgave 2: <br/>
check_interval & confirmations:<br/>
Jeg har satt sjekkeintervallet til 300 sekunder (5 minutter), og krever 3 påfølgende bekreftelser før en alarm utløses. Dette reduserer risikoen for falske alarmer, slik at kortvarige feil ikke fører til unødvendige varsler. 

trigger_rate:<br/>
Trigger rate er satt til 10 for å begrense antall varsler, slik at det ikke blir for mange varsler på kort tid hvis en feil vedvarer.

timeout: <br/>
Timeout er satt til 20 sekunder for å begrense tiden det tar å oppdage en feil. Dette sikrer at varsler sendes raskt, slik at eventuelle problemer kan løses raskt.

Oppgave 4:<br/>
Når Terraform state-filen lagres i repositoryet, kan dette fungere bra i starten, men når teamet vokser og flere utviklere jobber samtidig, kan det medføre flere problemer:

Samtidig redigering og konflikter:<br/>
Når flere utviklere endrer koden og dermed også state-filen, kan det oppstå konflikter og uregelmessigheter. Samtidige endringer kan overskrives, noe som kan lede til uventet oppførsel i infrastrukturen.

AWS S3 Buckets: <br/>
Ved å lagre Terraform state-filen i en S3 bucket, får du en sentral og sikker lagringsplass. Ved å kombinere dette med DynamoDB for state locking, sikrer du at kun én endring skjer om gangen, noe som forhindrer konflikter og holder state-filen konsistent.

Andre alternativer inkluderer bruk av Terraform Cloud eller andre skybaserte lagringsløsninger som Azure Blob Storage eller Google Cloud Storage. Disse løsningene tilbyr også mekanismer for state locking og versjonering, som er avgjørende for samarbeid i større team.