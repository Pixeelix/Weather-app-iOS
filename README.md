# Martin Pihooja kodutöö
---
# Kodutöö sisu: 
* Antud rakendus näitab välitemperatuuri, ilma pilti ja lühikirjeldust antud ilmast
* Ilm kuvatakse tänase päeva ja järgneva 7 päeva kohta
* Rakendus kasutab [DarkSky](https://darksky.net/dev/docs) API-d 
* Rakenduse avades kuvab rakendus kasutaja reaalse asukoha ilma (asukoha täpsus 1km)
* Kasutaja saab otsida ilmaandmeid teiste linnade kohta 
* Ilma-ajaloo kuvamiseks peab kasutaja looma konto
* Konto loomisel salvestatakse kasutaja nimi, parool ja profiili pilt
* Profiilipilti saab vahetada, vajutades profiilipildi peale
* Rakendus kuvab veateateid vale parooli, vale kasutajanime jne sisestamisel
* Sisse-loginud kasutaja näeb enda asukoha ja temperatuuri ajalugu 
 (kaasa arvatud otsinguriba kaudu otsitud asukohtade nimesid ja temperatuuri)
* Rakendus töötab kõigil iPhone mudelitel vertikaalses asendis
 ---
 # Buggide list: 
 * Kasutaja parool ei ole _hashitud_ - paroolid peaks salvestama _keychaini _
 * Asudes kasutaja profiili lehel (sisse logituna) ja vajutades tab bari peal olevat _kasutaja_ nuppu, näeb korraks sisselogimis lehte
 * Asudes Ajaloo lehel (sisse logituna) ja vajutades tab bari peal olevat Ajaloo nuppu, näeb korraks sisselogimis nõude lehte
 * Ajaloo tabel ei uuene automaatselt - olles ajaloo lehel, tee topeltklik tab baril asuval Ajaloo nupul 
 * Asukoha ja temperatuuri salvestamine userdefaulti array-sse pole kõige parem lahendus

# Kokku kulunud aeg: ~45
