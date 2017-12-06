# Supermarket-statistiky

Modul: Štatistiky
	• Coho sa predava najviac – najviac predavane tovary (10)
	• Coho sa predava najmenej – najmenej predavane tovary (10)
	• Priemerna cena jedneho nakupu
	• Aka je zatial trzba
	• Ake su zatial naklady
  
  
# éSkupinový projekt – informačný systém pre hypermarket
Storyline
Do vášho mesta prišiel nový hypermarket. Potrebuje pokryť základné biznisprocesy súvisiace s riadením zásob (nákupom a predajom tovaru), a nemá na to zatiaľ existujúce IT riešenie. Vypísal teda súťaž na vyhotovenie takéhoto riešenia. Do súťaže sa zapájate vo forme dvoch tímov, pričom každé vyvíja riešenie samo. Vaše riešenia však musia dodržiavať predpísaný dátovy formát, aby prevádzkovateľ hypermarketu mohol svoje rozhodnutie kedykoľvek zmeniť. Riešenie sa musí skladať z niekoľkých samostatných modulov (programov), pracujúcich nad spoločnou databázou.
Funkcionálne požiadavky na jednotlivé moduly
Modul: Sklad
	• Zobrazit kolko ktoreho tovaru mame na sklade
	• Upozornovat na tovary ktorych mame najmensie zasoby
	• Moznost vygenerovat objednavku tovaru (automaticka / poloautomaticka / manualna) – vygeneruje sa objednavka_[id_transakcie].txt
Modul: Cenotvorba
	• Nacita databazu tovaru a pre kazdy Tovar zobrazi ceny (nakup, predaj) a dovoli tieto ceny aj editovat
	• Tovar ktory nema cenu sa nemoze predavat, ani nakupovat
	• Zmena ceny tovaru nezmeni existujuci doklad (nakup, predaj)
	• Cena – dve desatine miesta
Modul: Interna databaza tovaru
	• Kod tovaru
	• Nazov tovaru
Modul: Štatistiky
	• Coho sa predava najviac – najviac predavane tovary (10)
	• Coho sa predava najmenej – najmenej predavane tovary (10)
	• Priemerna cena jedneho nakupu
	• Aka je zatial trzba
	• Ake su zatial naklady
Modul: Pokladna
	• Musi vylistovat rozumny zoznam poloziek, ktory si naklikam, aj s mnozstvom
	• Musi mat moznost na zadanie kodu tovaru
	• Neexistujuci Tovar – vyhodi chybu
	• Ked nieco nie je na sklade, zo zoznamu to vyhodi
	• Ked nieco nie je na sklade, pri zadani kodu ide do zapornych cisel
	• Kazdy nakup sa da uzavriet a vygeneruje sa uctenka_[id_transakcie].txt
	• Musim vediet meno pokladnika
Dátové štruktúry a názvoslovie súborov
SKLAD.txt [pocet_riadkov] [kod];[mnozstvo] [kod];[mnozstvo] [kod];[mnozstvo]
TOVAR.txt [pocet_riadkov] [kod];[nazov] [kod];[nazov] [kod];[nazov]
CENNIK.txt [pocet_riadkov] [kod];[cena_kus_nakup];[cena_kus_predaj] [kod];[cena_kus_nakup];[cena_kus_predaj] [kod];[cena_kus_nakup];[cena_kus_predaj]
STATISTIKY.txt [pocet_riadkov] [typ (char N/P)];[id_transakcie (INT, nahodne, 8 miestne)];[kod];[mnozstvo];[cena_za_kus] [typ (char N/P)];[id_transakcie (INT, nahodne, 8 miestne)];[kod];[mnozstvo];[cena_za_kus] [typ (char N/P)];[id_transakcie (INT, nahodne, 8 miestne)];[kod];[mnozstvo];[cena_za_kus] [typ (char N/P)];[id_transakcie (INT, nahodne, 8 miestne)];[kod];[mnozstvo];[cena_za_kus]
ID_TRANSAKCIE – generuje sa vo formáte
NXXXXXXXXXX – pre nákupné transakcie, kde XXXXXXXXXX je 10 miestné náhodne vygenerované číslo
P NXXXXXXXXXX – pre predajné transakcie, kde XXXXXXXXXX je 10 miestné náhodne vygenerované číslo
Účtenka aj Objednávka tovaru nemajú predpísaný formát, musí na nich však byť zrejme kedy vznikla, pri účtenke ktorý pokladník ju vytvoril, musí byť rozpis položiek, množstiev, jednotkových cien, celkových cien vynásobených množstvom ako aj celková cena účtenky alebo objednávky.
Zamykanie súborov
Keďže nad spoločnými databázovými súbormi pracuje viacero programov súčasne, pristupujte k nim efektívne – otvárajte ich na nevyhnutný potrebný čas aby ste nebránili ostatným k prístupu.
V prípade, že do súboru potrebujete zapisovať, je potrebné dať vedieť ostatným častiam systému, že teraz do neho nemôžu zapisovať iní. Na tento účel vytvorte zámok, ktorým sa rozumie vytvorenie súboru [SUBOR]_LOCK.txt kde namiesto [SUBOR] bude názov súboru, ktorý aktuálne uzamykáte. Po dokončení zápisu do súboru zámok zmažte. Zámky vytvárajte v rovnakom priečinku ako sú vaše súbory.
Verzie súborov
V prípade, že niečo v súbore zmeníte, je potrebné, aby sa o tom dozvedeli ostatné časti systému. Pre tento účel bude pre každý súbor existovať aj [SUBOR]_VERZIA.txt, pričom tento súbor bude obsahovať iba jedno jediné číslo, ktoré sa každým zápisom do pôvodného súboru inkrementuje o 1.
Každý modul, ktorý si na svoju prácu načítava údaje zo súborov do svojich dátových štruktúr bude timerom na pozadí kontrolovať, či sa verzia nezmenila oproti tej, ktorú naposledy načítal. Ak sa verzia zmenila, aktualizuje si svoje dátové štruktúry ako aj údaje zobrazené na obrazovke. Aktualizácia však nesmie narušiť prácu používateľa.
Cesty k súborom
Vzhľadom na to, že niečo budete testovať na svojich počítačoch, niečo na stretnutiach v škole, a netušíte ešte, ako bude systém na konci vývoja nainštalovaný u zákazníka, je dôležité, aby cesta k priečinku so súbormi bola zadefinovaná v globálnej premennej na jednom jedinom mieste v kóde každého modulu.
Git
Každý modul bude samostatný verejný projekt na Githube, spravovaný človekom, ktorý bude vyvíjať daný modul.
