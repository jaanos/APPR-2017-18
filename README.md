# Analiza podatkov s programom R, 2018/19

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2018/19

* [![Shiny](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/urskajeranko/APPR-2018-19/master?urlpath=shiny/APPR-2018-19/projekt.Rmd) Shiny
* [![RStudio](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/urskajeranko/APPR-2018-19/master?urlpath=rstudio) RStudio

## Analiza izbranih držav glede na prevladujočo državno religijo

V svoji projektni nalogi bom preučila vplive šestih svetovnih religij na sedem izbranih držav, pri čemer bo ena od držav zastopala neverujoče. Ker so gospodarstva držav, njihov razvoj ter uspešnost v svetu odvisna predvsem od drugih dejavnikov (npr. od zgodovine naroda, osamosvojitve države, naravnogeografske lege, naravnih virov, ...), se bom bolj osredotočila na populacijo in njene značilnosti, ki so bolj odvisne od državne religije.

Države, ki jih bom preučevala, sem izbrala tako, da v čim večji meri zastopajo določeno religijo oz. čim večji delež prebivalstva pripada tej veri. Tako sem kot predstavnico katolištva izbrala Italijo, protestantizma Veliko Britanijo, pravoslavcev Romunijo, islam zastopa Iran, hinduizem seveda Indija in budizem Tajska. Kot predstavnico neverujočih sem določila Kitajsko, saj se je po raziskavi iz leta 2014 kar 90 % prebivalstva opredelilo kot ateist ali neverujoči.

Tabele:

* tabela 1: država, religija, leto, rodnost
* tabela 2: država, religija, leto, izobrazba(delež potrošnje, ki ga vlada nameni izobraževanju)
* tabela 3: država, religija, leto, delež žensk, ki uporabljajo kontracepcijo
* tabela 4: država, religija, leto, število ločitev na 1000 ljudi
* tabela 5: država, religija, leto, BDP per capita po kupni moči

Analizirana leta: 1990-2015

Viri tabel
* rodnost, izobrazba, BDP: http://databank.worldbank.org/data/reports.aspx?Code=NY.GDP.PCAP.CD&id=1ff4a498&report_name=Popular-Indicators&populartype=series&ispopular=y
* ločitve: https://en.wikipedia.org/wiki/Divorce_demography, http://ec.europa.eu/eurostat/statistics-explained/index.php/File:Crude_divorce_rate,_selected_years,_1960-2015_(per_1_000_persons).png

## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`.
Ko ga prevedemo, se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`.
Podatkovni viri so v mapi `podatki/`.
Zemljevidi v obliki SHP, ki jih program pobere,
se shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `rgdal` - za uvoz zemljevidov
* `rgeos` - za podporo zemljevidom
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `mosaic` - za pretvorbo zemljevidov v obliko za risanje z `ggplot2`
* `maptools` - za delo z zemljevidi
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)

## Binder

Zgornje [povezave](#analiza-podatkov-s-programom-r-201819)
omogočajo poganjanje projekta na spletu z orodjem [Binder](https://mybinder.org/).
V ta namen je bila pripravljena slika za [Docker](https://www.docker.com/),
ki vsebuje večino paketov, ki jih boste potrebovali za svoj projekt.

Če se izkaže, da katerega od paketov, ki ji potrebujete, ni v sliki,
lahko za sprotno namestitev poskrbite tako,
da jih v datoteki [`install.R`](install.R) namestite z ukazom `install.packages`.
Te datoteke (ali ukaza `install.packages`) **ne vključujte** v svoj program -
gre samo za navodilo za Binder, katere pakete naj namesti pred poganjanjem vašega projekta.

Tako nameščanje paketov se bo izvedlo pred vsakim poganjanjem v Binderju.
Če se izkaže, da je to preveč zamudno,
lahko pripravite [lastno sliko](https://github.com/jaanos/APPR-docker) z želenimi paketi.

Če želite v Binderju delati z git,
v datoteki `gitconfig` nastavite svoje ime in priimek ter e-poštni naslov
(odkomentirajte vzorec in zamenjajte s svojimi podatki) -
ob naslednjem.zagonu bo mogoče delati commite.
Te podatke lahko nastavite tudi z `git config --global` v konzoli
(vendar bodo veljale le v trenutni seji).
