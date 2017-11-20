# Analiza podatkov s programom R, 2017/18

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2017/18

## Tematika

Odločila sem se, da bom analizirala slovenske košarkaše in evropska košarkaška prvenstva. Za to temo sem se odločila, saj me košarka že od vedno zanima, letos pa smo postali še evropski prvaki. Podatke sem dobila na:
* https://basketball.realgm.com/info/birth-cities/288/
* https://en.wikipedia.org/wiki/EuroBasket

Prva povezava vsebuje podatke o slovenskih košarkaših in ti podatki bodo vsebovani v prvi tabeli. Vsaka vrstica bo dodeljena enemu igralcu, v stolpcih pa bodo njegovi podatki o:
* poziciji, ki jo igra
* višini
* datumu rojstva
* kraju rojstva
* ekipi, v kateri igra

Druga tabela pa se bo nanašala na evropska prvenstva. Po vrsticah bodo leta evropskih prvenstev, vse od začetka leta 1935, pa do letošnjega prvenstva (2017). Vrstice bodo vsebovale državo v kateri se je evropsko prvenstvo izvajalo, potem pa še za vsako leto države, ki so osvojile prvo, drugo, tretje in četrto mesto. 

## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`. Ko ga prevedemo,
se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Zemljevidi v obliki SHP, ki jih program pobere, se
shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `maptools` - za uvoz zemljevidov
* `sp` - za delo z zemljevidi
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)
