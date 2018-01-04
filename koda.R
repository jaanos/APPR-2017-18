library(readr)
library(dplyr)
library(tidyr)
library(magrittr)
library(XML)

sl <- locale(encoding = "Windows-1250", decimal_mark = ",", grouping_mark = ".")


#tabela z bdp
stolpci <- c("meritev", "koda", "drzava", "kratica", 1990:2015)
bdp <- read_csv("podatki/podatki.csv",
                col_names = stolpci,
                skip = 8, n_max = 7)
bdp$koda <- NULL
bdp$kratica <- NULL
bdp$meritev <- NULL
bdp <- melt(bdp, id.vars = "drzava", variable.name = "leto", value.name = "vrednosti")
bdp$leto <- parse_integer(bdp$leto)

#tabela z vladnimi izdatki
stolpci <- c("meritev", "koda", "drzava", "kratica", 1990:2015)
vlada <- read_csv("podatki/podatki.csv",
                  locale = locale(encoding = "cp1250"),
                  col_names = stolpci,
                  skip = 15, n_max = 7,
                  na = "..")
vlada$koda <- NULL
vlada$kratica <- NULL
vlada$meritev <- NULL
vlada <- melt(vlada, id.vars = "drzava", variable.name = "leto", value.name = "vrednosti")
vlada$leto <- parse_integer(vlada$leto)

#tabela z rodnostjo
stolpci <- c("meritev", "koda", "drzava", "kratica", 1990:2015)
rodnost <- read_csv("podatki/podatki.csv",
                locale = locale(encoding = "cp1250"),
                col_names = stolpci,
                skip = 22, n_max = 7)
rodnost$koda <- NULL
rodnost$kratica <- NULL
rodnost$meritev <- NULL
rodnost <- melt(rodnost, id.vars = "drzava", variable.name = "leto", value.name = "vrednosti")
rodnost$leto <- parse_integer(rodnost$leto)

#tabela s podatki o kontracepciji
stolpci <- c("meritev", "koda", "drzava", "kratica", 1990:2015)
kontracepcija <- read_csv("podatki/podatki.csv",
                    locale = locale(encoding = "cp1250"),
                    col_names = stolpci,
                    skip = 29, n_max = 7,
                    na = "..")
kontracepcija$koda <- NULL
kontracepcija$kratica <- NULL
kontracepcija$meritev <- NULL
kontracepcija <- melt(kontracepcija, id.vars = "drzava", variable.name = "leto", value.name = "vrednosti")
kontracepcija$leto <- parse_integer(kontracepcija$leto)
kontracepcija$vrednosti <- parse_number(kontracepcija$vrednosti)

#tabela z locitvami
link <- "https://en.wikipedia.org/wiki/Divorce_demography"
stran <- html_session(link) %>% read_html()
tabela <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>%
  .[[1]] %>% html_table(dec = ",")
colnames(tabela) <- c("drzava", "poroka", "locitev", "delez", "leto.podatka")
sl <- locale("sl", decimal_mark = ",", grouping_mark = ".")
for (col in c("poroka", "locitev", "delez", "leto.podatka")) {
  tabela[[col]] <- parse_number(tabela[[col]], locale = sl)
}
locitev <- subset(tabela, drzava == "China" |
                    drzava == "Iran" |
                    drzava == "Italy" |
                    drzava == "United Kingdom" |
                    drzava == "Romania" |
                    drzava == "Thailand")
locitev$leto.podatka <- NULL

