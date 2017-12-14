library(readr)
library(dplyr)
library(tidyr)

#tabela z bdp
stolpci <- c("meritev", "koda", "država", "kratica", 1990:2015)
bdp <- read_csv("podatki/podatki.csv",
                locale = locale(encoding = "cp1250"),
                col_names = stolpci,
                skip = 8, n_max = 7)
bdp$koda <- NULL
bdp$kratica <- NULL
bdp$meritev <- NULL
bdp <- melt(bdp, id.vars = "država", variable.name = "leto", value.name = "vrednosti")

#tabela z vladnimi izdatki
stolpci <- c("meritev", "koda", "država", "kratica", 1990:2015)
vlada <- read_csv("podatki/podatki.csv",
                  locale = locale(encoding = "cp1250"),
                  col_names = stolpci,
                  skip = 15, n_max = 7,
                  na = "..")
vlada$koda <- NULL
vlada$kratica <- NULL
vlada$meritev <- NULL
vlada <- melt(vlada, id.vars = "država", variable.name = "leto", value.name = "vrednosti")

#tabela z rodnostjo
stolpci <- c("meritev", "koda", "država", "kratica", 1990:2015)
rodnost <- read_csv("podatki/podatki.csv",
                locale = locale(encoding = "cp1250"),
                col_names = stolpci,
                skip = 22, n_max = 7)
rodnost$koda <- NULL
rodnost$kratica <- NULL
rodnost$meritev <- NULL
rodnost <- melt(rodnost, id.vars = "država", variable.name = "leto", value.name = "vrednosti")

#tabela s podatki o kontracepciji
stolpci <- c("meritev", "koda", "država", "kratica", 1990:2015)
kontracepcija <- read_csv("podatki/podatki.csv",
                    locale = locale(encoding = "cp1250"),
                    col_names = stolpci,
                    skip = 29, n_max = 7,
                    na = "..")
kontracepcija$koda <- NULL
kontracepcija$kratica <- NULL
kontracepcija$meritev <- NULL
kontracepcija <- melt(kontracepcija, id.vars = "država", variable.name = "leto", value.name = "vrednosti")
View(kontracepcija)
