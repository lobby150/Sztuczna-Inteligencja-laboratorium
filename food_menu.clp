(deftemplate kategoria
    (slot k_typ_imprezy)
    (slot k_wyznanie (default none))
    (slot k_wiek (default none))
    (slot k_typ_diety (default none))
    (slot k_rodzaj_kuchni (default none)))

(defrule MAIN::ask_typ_imprezy
    (not (impreza ?))
=>
    (println "Jaka impreza? (wesele / stypa / urodziny / spotkanie_biznesowe / wieczor_kawalerski)")
    (assert(impreza(read))))

(defrule MAIN::typ_imprezy_iocheck
    (impreza ?impreza)
    ?rule <- (impreza ?)
(not (impreza wesele))
(not (impreza stypa))
(not (impreza urodziny))
(not (impreza spotkanie_biznesowe))
(not (impreza wieczor_kawalerski))
=>
(retract ?rule))


(defrule MAIN::ask_wyznanie
    (not (wyznanie ?))
    (or
    (impreza wesele)
    (impreza stypa)
    (impreza spotkanie_biznesowe)
    (impreza wieczor_kawalerski)
    (impreza urodziny))
=>
    (assert (kategoria (k_typ_imprezy impreza)))
    (println "Jakie wyznanie? (islam / chrzescijanstwo / judaizm)")
    (assert (wyznanie (read))))

(defrule MAIN::wyznanie_iocheck
    (wyznanie ?wyznanie)
    ?rule <- (wyznanie ?)
(not (wyznanie islam))
(not (wyznanie chrzescijanstwo))
(not (wyznanie judaizm))
=>
(retract ?rule))


(defrule MAIN::ask_wiek
    (not (wiek ?))
    (or
    (wyznanie islam)
    (wyznanie chrzescijanstwo)
    (wyznanie judaizm))
=>
    (assert (kategoria (k_wyznanie wyznanie)))
    (println "Jaki wiek?")
    (assert (wiek (read))))

(defrule MAIN::wiek_iocheck
    (wiek ?wiek)
    ?rule <- (wiek ?)
(or (test(> ?wiek 120))(test(<= ?wiek 0))(not(test(integerp ?wiek))))
=>
(retract ?rule))

(defrule MAIN::wiek_test1
    (wiek ?wiek)
    (test (> ?wiek 18))
    (test (< ?wiek 120))
=>
(assert (wiek_test pelnoletni)))

(defrule MAIN::wiek_test2
    (wiek ?wiek)
    (test (< ?wiek 18))
    (test (> ?wiek 0))
=>
(assert (wiek_test niepelnoletni)))


(defrule MAIN::ask_typ_diety
    (not (typ_diety ?))
    (wiek ?wiek)
=>
    (assert (kategoria (k_wiek wiek)))
    (println "Jaki typ diety? (miesna / wegetarianska)")
    (assert (typ_diety (read))))

(defrule MAIN::typ_diety_iocheck
    (typ_diety ?typ_diety)
    ?rule <- (typ_diety ?)
(not (typ_diety miesna))
(not (typ_diety wegetarianska))
=>
(retract ?rule))


(defrule MAIN::ask_rodzaj_kuchni
    (not (rodzaj_kuchni ?))
    (or
    (typ_diety miesna)
    (typ_diety wegetarianska))
=>  
    (assert (kategoria (k_typ_diety typ_diety)))
    (println "Jaki rodzaj kuchni? (europejska / azjatycka)")
    (assert (rodzaj_kuchni (read)))
    (assert (kategoria (k_rodzaj_kuchni rodzaj_kuchni))))

(defrule MAIN::rodzaj_kuchni_iocheck
    (rodzaj_kuchni ?rodzaj_kuchni)
    ?rule <- (rodzaj_kuchni ?)
(not (rodzaj_kuchni europejska))
(not (rodzaj_kuchni azjatycka))
=>
(retract ?rule))


(defrule MAIN::menu-1
    (impreza wesele)
    (wyznanie islam)
    (wiek_test niepelnoletni)
    (typ_diety wegetarianska)
    (rodzaj_kuchni europejska)
=>
(println "Tort wisniowy z beza, pasta z baklazana, pieczone ziemniaki, salatka z pora, sok jablkowy."))

(defrule MAIN::menu-2
    (impreza wesele)
    (wyznanie islam)
    (wiek_test niepelnoletni)
    (typ_diety wegetarianska)
    (rodzaj_kuchni azjatycka)
=>
(println "Tort pomaranczowy z marakuja, sajgonki z warzywami, krewetki z orzechami, napoj aloesowy."))

(defrule MAIN::menu-3
    (impreza wesele)
    (wyznanie islam)
    (wiek_test pelnoletni)
    (typ_diety wegetarianska)
    (rodzaj_kuchni europejska)
=>
(println "Tort wisniowy z beza, pasta z baklazana, pieczone ziemniaki, salatka z pora, sok jablkowy, wodka Finlandia."))

(defrule MAIN::menu-4
    (impreza wesele)
    (wyznanie islam)
    (wiek_test pelnoletni)
    (typ_diety wegetarianska)
    (rodzaj_kuchni azjatycka)
=>
(println "Tort pomaranczowy z marakuja, sajgonki z warzywami, krewetki z orzechami, napoj aloesowy,sake."))

(defrule MAIN::menu-5
    (impreza wesele)
    (wyznanie islam)
    (wiek_test niepelnoletni)
    (typ_diety miesna)
    (rodzaj_kuchni europejska)
=>
(println "Grillowany stek, salata, ziemniaki, winoTort wiśniowy z bezą, kaczka nadziewana, pyzy, sos pieczeniowy, sok jabłkowy."))

(defrule MAIN::menu-6
    (impreza wesele)
    (wyznanie islam)
    (wiek_test niepelnoletni)
    (typ_diety miesna)
    (rodzaj_kuchni azjatycka)
=>
(println "Tort pomarańczowy z marakują, kurczak w cieście w sosie sojowym, ryż basmati, sos curry, napój aloesowy."))

(defrule MAIN::menu-7
    (impreza wesele)
    (wyznanie islam)
    (wiek_test pelnoletni)
    (typ_diety miesna)
    (rodzaj_kuchni europejska)
=>
(println "Tort wiśniowy z bezą, kaczka nadziewana, pyzy, sos pieczeniowy, sok jabłkowy, wódka Finlandia."))

(defrule MAIN::menu-8
    (impreza wesele)
    (wyznanie islam)
    (wiek_test pelnoletni)
    (typ_diety miesna)
    (rodzaj_kuchni azjatycka)
=>
(println "Tort pomarańczowy z marakują, kurczak w cieście w sosie sojowym, ryż basmati, sos curry, napój aloesowy, sake."))

(defrule MAIN::menu-9
    (impreza wesele)
    (wyznanie chrzescijanstwo)
    (wiek_test niepelnoletni)
    (typ_diety wegetarianska)
    (rodzaj_kuchni europejska)
=>
(println "Tort truskawkowy, zupa z grzybów leśnych, ziemniaki, sos grzybowy, cukinia zapiekana z pomidorami i serem, sok pomarańczowy."))

(defrule MAIN::menu-10
    (impreza wesele)
    (wyznanie chrzescijanstwo)
    (wiek_test niepelnoletni)
    (typ_diety wegetarianska)
    (rodzaj_kuchni azjatycka)
=>
(println "Tort z liczi, zupa z grzybami mun, ryż basmati z sosem curry, sajgonki warzywne, napój o smaku marakui."))

(defrule MAIN::menu-11
    (impreza wesele)
    (wyznanie chrzescijanstwo)
    (wiek_test pelnoletni)
    (typ_diety wegetarianska)
    (rodzaj_kuchni europejska)
=>
(println "Tort truskawkowy, zupa z grzybów leśnych, ziemniaki, sos grzybowy, cukinia zapiekana z pomidorami i serem, sok pomarańczowy, wódka Finlandia."))

(defrule MAIN::menu-12
    (impreza wesele)
    (wyznanie chrzescijanstwo)
    (wiek_test pelnoletni)
    (typ_diety wegetarianska)
    (rodzaj_kuchni azjatycka)
=>
(println "Tort z liczi, zupa z grzybami mun, ryż basmati z sosem curry, sajgonki warzywne, napój o smaku marakui, sake."))

(defrule MAIN::menu-13
    (impreza wesele)
    (wyznanie chrzescijanstwo)
    (wiek_test niepelnoletni)
    (typ_diety miesna)
    (rodzaj_kuchni europejska)
=>
(println "Tort truskawowy, udziec wieprzowy, pieczone ziemniaki z sosem czosnkowym, surówka z jabłkiem, sok z czarnej porzeczki."))

(defrule MAIN::menu-14
    (impreza wesele)
    (wyznanie chrzescijanstwo)
    (wiek_test niepelnoletni)
    (typ_diety miesna)
    (rodzaj_kuchni azjatycka)
=>
(println "Tort z liczi, krewetki zapiekane z migdałami, chińskie pierożki z wieprzowiną, surówka z awokado, napój aloesowy."))

(defrule MAIN::menu-15
    (impreza wesele)
    (wyznanie chrzescijanstwo)
    (wiek_test pelnoletni)
    (typ_diety miesna)
    (rodzaj_kuchni europejska)
=>
(println "Tort truskawowy, udziec wieprzowy, pieczone ziemniaki z sosem czosnkowym, surówka z jabłkiem, sok z czarnej porzeczki, wódka Finlandia."))

(defrule MAIN::menu-16
    (impreza wesele)
    (wyznanie chrzescijanstwo)
    (wiek_test pelnoletni)
    (typ_diety miesna)
    (rodzaj_kuchni azjatycka)
=>
(println "Tort z liczi, krewetki zapiekane z migdałami, chińskie pierożki z wieprzowiną, surówka z awokado, napój aloesowy, sake."))

(defrule MAIN::menu-17
    (impreza wesele)
    (wyznanie judaizm)
    (wiek_test niepelnoletni)
    (typ_diety wegetarianska)
    (rodzaj_kuchni europejska)
=>
(println "Teiglach, czulent z ogórkami, zupa porowa z miodem, kulki z siekanej ryby, sok jabłkowy."))

(defrule MAIN::menu-18
    (impreza wesele)
    (wyznanie judaizm)
    (wiek_test niepelnoletni)
    (typ_diety wegetarianska)
    (rodzaj_kuchni azjatycka)
=>
(println "Teiglach, czulent z ogórkami, zupa porowa z miodem, kulki z siekanej ryby z sosem sojowym, napój z marakui."))

(defrule MAIN::menu-19
    (impreza wesele)
    (wyznanie judaizm)
    (wiek_test pelnoletni)
    (typ_diety wegetarianska)
    (rodzaj_kuchni europejska)
=>
(println "Teiglach, czulent z ogórkami, zupa porowa z miodem, kulki z siekanej ryby, sok jabłkowy, wódka Absolut."))

(defrule MAIN::menu-20
    (impreza wesele)
    (wyznanie judaizm)
    (wiek_test pelnoletni)
    (typ_diety wegetarianska)
    (rodzaj_kuchni azjatycka)
=>
(println "Teiglach, czulent z ogórkami, zupa porowa z miodem, kulki z siekanej ryby z sosem sojowym, napój z marakui, sake."))

(defrule MAIN::menu-21
    (impreza wesele)
    (wyznanie judaizm)
    (wiek_test niepelnoletni)
    (typ_diety miesna)
    (rodzaj_kuchni europejska)
=>
(println "Teiglach, czulent z jagnięciną, zupa warzywna z miodem, knyszes z kurczakiem, sok z czarnej porzeczki."))

(defrule MAIN::menu-22
    (impreza wesele)
    (wyznanie judaizm)
    (wiek_test niepelnoletni)
    (typ_diety miesna)
    (rodzaj_kuchni azjatycka)
=>
(println "Teiglach, czulent z jagnięcina i nasionami sezamu, knyszesz z kurczakiem w sosie sojowym, zupa z grzybami mun, napój o smaku liczi."))

(defrule MAIN::menu-23
    (impreza wesele)
    (wyznanie judaizm)
    (wiek_test pelnoletni)
    (typ_diety miesna)
    (rodzaj_kuchni europejska)
=>
(println "Teiglach, czulent z jagnięciną, zupa warzywna z miodem, knyszes z kurczakiem, sok z czarnej porzeczki, wódka Absolut."))

(defrule MAIN::menu-24
    (impreza wesele)
    (wyznanie judaizm)
    (wiek_test pelnoletni)
    (typ_diety miesna)
    (rodzaj_kuchni azjatycka)
=>
(println "Teiglach, czulent z jagnięcina i nasionami sezamu, knyszesz z kurczakiem w sosie sojowym, zupa z grzybami mun, napój o smaku liczi, sake."))

(defrule MAIN::menu-25
    (impreza stypa)
    (wyznanie islam)
    (wiek_test niepelnoletni)
    (typ_diety wegetarianska)
    (rodzaj_kuchni europejska)
=>
(println "Faszerowany bakłażan z młodymi ziemniakami, zupa pomidorowa z kluskami, ciasto drożdzowe z truskawkami, sok jabłkowy."))

(defrule MAIN::menu-26
    (impreza stypa)
    (wyznanie islam)
    (wiek_test niepelnoletni)
    (typ_diety wegetarianska)
    (rodzaj_kuchni azjatycka)
=>
(println "Ryż curry z warzywami, zupa z grzybami mun i nasionami sezamu, placek bananowy z orzechami, napój aloesowy."))

(defrule MAIN::menu-27
    (impreza stypa)
    (wyznanie islam)
    (wiek_test pelnoletni)
    (typ_diety wegetarianska)
    (rodzaj_kuchni europejska)
=>
(println "Faszerowany bakłażan z młodymi ziemniakami, zupa pomidorowa z kluskami, ciasto drożdzowe z truskawkami, sok jabłkowy."))

(defrule MAIN::menu-28
    (impreza stypa)
    (wyznanie islam)
    (wiek_test pelnoletni)
    (typ_diety wegetarianska)
    (rodzaj_kuchni azjatycka)
=>
(println " Ryż curry z warzywami, zupa z grzybami mun i nasionami sezamu, placek bananowy z orzechami, napój aloesowy."))

(defrule MAIN::menu-29
    (impreza stypa)
    (wyznanie islam)
    (wiek_test niepelnoletni)
    (typ_diety miesna)
    (rodzaj_kuchni europejska)
=>
(println "Kotlety drobiowe, ziemniaki, sos koperkowy, rosół, sernik,  sok jabłkowy."))

(defrule MAIN::menu-30
    (impreza stypa)
    (wyznanie islam)
    (wiek_test niepelnoletni)
    (typ_diety miesna)
    (rodzaj_kuchni azjatycka)
=>
(println "Kotlety drobiowe z przyprawą curry, ryż z warzywami orientalnymi, placek bananowy z orzechami, napój aloesowy."))

(defrule MAIN::menu-31
    (impreza stypa)
    (wyznanie islam)
    (wiek_test pelnoletni)
    (typ_diety miesna)
    (rodzaj_kuchni europejska)
=>
(println "Kotlety drobiowe, ziemniaki, sos koperkowy, rosół, sernik,  sok jabłkowy."))

(defrule MAIN::menu-32
    (impreza stypa)
    (wyznanie islam)
    (wiek_test pelnoletni)
    (typ_diety miesna)
    (rodzaj_kuchni azjatycka)
=>
(println "Kotlety drobiowe z przyprawą curry, ryż z warzywami orientalnymi, placek bananowy z orzechami, napój aloesowy."))

(defrule MAIN::menu-33
    (impreza stypa)
    (wyznanie chrzescijanstwo)
    (wiek_test niepelnoletni)
    (typ_diety wegetarianska)
    (rodzaj_kuchni europejska)
=>
(println "Zupa pomidorowa, ziemniaki w sosie koperkowym, sałatka warzywna, kotlety jajeczne, sok jabłkowy."))

(defrule MAIN::menu-34
    (impreza stypa)
    (wyznanie chrzescijanstwo)
    (wiek_test niepelnoletni)
    (typ_diety wegetarianska)
    (rodzaj_kuchni azjatycka)
=>
(println "Zupa z grzybami mun, ryż w sosie curry, surówka z warzyw orientalnych, kotlet z cieciorki, napój z aloesu."))

(defrule MAIN::menu-35
    (impreza stypa)
    (wyznanie chrzescijanstwo)
    (wiek_test pelnoletni)
    (typ_diety wegetarianska)
    (rodzaj_kuchni europejska)
=>
(println "Zupa pomidorowa, ziemniaki w sosie koperkowym, sałatka warzywna, kotlety jajeczne, sok jabłkowy."))

(defrule MAIN::menu-36
    (impreza stypa)
    (wyznanie chrzescijanstwo)
    (wiek_test pelnoletni)
    (typ_diety wegetarianska)
    (rodzaj_kuchni azjatycka)
=>
(println "Zupa z grzybami mun, ryż w sosie curry, surówka z warzyw orientalnych, kotlet z cieciorki, napój z aloesu."))

(defrule MAIN::menu-37
    (impreza stypa)
    (wyznanie chrzescijanstwo)
    (wiek_test niepelnoletni)
    (typ_diety miesna)
    (rodzaj_kuchni europejska)
=>
(println "Kotlet schabowy, ziemniaki duszone, rosół, placek drożdzowy, sok jabłkowy."))

(defrule MAIN::menu-38
    (impreza stypa)
    (wyznanie chrzescijanstwo)
    (wiek_test niepelnoletni)
    (typ_diety miesna)
    (rodzaj_kuchni azjatycka)
=>
(println "Gulasz wieprzowy Gong Bao, ryż basmati, sernik z wiórkami kokosowymi, surówka z pora, napój z aloesu."))

(defrule MAIN::menu-39
    (impreza stypa)
    (wyznanie chrzescijanstwo)
    (wiek_test pelnoletni)
    (typ_diety miesna)
    (rodzaj_kuchni europejska)
=>
(println "Kotlet schabowy, ziemniaki duszone, rosół, placek drożdzowy, sok jabłkowy."))

(defrule MAIN::menu-40
    (impreza stypa)
    (wyznanie chrzescijanstwo)
    (wiek_test pelnoletni)
    (typ_diety miesna)
    (rodzaj_kuchni azjatycka)
=>
(println "Gulasz wieprzowy Gong Bao, ryż basmati, sernik z wiórkami kokosowymi, surówka z pora, napój z aloesu."))

(defrule MAIN::menu-41
	(impreza stypa)
	(wyznanie judaizm)
	(wiek_test niepelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni europejska)
=>
(println "Zupa pomidorowa, ziemniaki w sosie koperkowym, sałatka warzywna, kotlety jajeczne, sok jabłkowy"))

(defrule MAIN::menu-42
	(impreza stypa)
	(wyznanie judaizm)
	(wiek_test niepelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni azjatycka)
=>
(println "Zupa z grzybami mun, ryż w sosie curry, surówka z warzyw orientalnych, kotlet z cieciorki, napój z aloesu"))

(defrule MAIN::menu-43
	(impreza stypa)
	(wyznanie judaizm)
	(wiek_test pelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni europejska)
=>
(println "Zupa pomidorowa, ziemniaki w sosie koperkowym, sałatka warzywna, kotlety jajeczne, sok jabłkowy, kieliszek wódki"))

(defrule MAIN::menu-44
	(impreza stypa)
	(wyznanie judaizm)
	(wiek_test pelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni azjatycka)
=>
(println "Zupa z grzybami mun, ryż w sosie curry, surówka z warzyw orientalnych, kotlet z cieciorki, napój z aloesu, kieliszek wódki"))

(defrule MAIN::menu-45
	(impreza stypa)
	(wyznanie judaizm)
	(wiek_test niepelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Zupa rybna po żydowsku, kotlet drobiowy, ziemniaki duszone, placek drożdzowy, sok jabłkowy"))

(defrule MAIN::menu-46
	(impreza stypa)
	(wyznanie judaizm)
	(wiek_test niepelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni azjatycka)
=>
(println "Złoty joich,  Klopsiki wołowo-jagnięce z bobem i cytryną, pascha, lemoniada miętowa"))

(defrule MAIN::menu-47
	(impreza stypa)
	(wyznanie judaizm)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Rosół, kotlet drobiowy, ziemniaki duszone, placek drożdzowy, sok jabłkowy, kieliszek wódki"))

(defrule MAIN::menu-48
	(impreza stypa)
	(wyznanie judaizm)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni azjatycka)
=>
(println "Złoty joich,  Klopsiki wołowo-jagnięce z bobem i cytryną, pascha, lemoniada miętowa, kieliszek araku"))

(defrule MAIN::menu-49
	(impreza spotkanie_biznesowe)
	(wyznanie islam)
	(wiek_test niepelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni europejska)
=>
(println "Pasta z bakłażana, pieczone ziemniaki, sałatka z pora, sok jabłkowy"))

(defrule MAIN::menu-50
	(impreza spotkanie_biznesowe)
	(wyznanie islam)
	(wiek_test niepelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni azjatycka)
=>
(println "Sajgonki z warzywami, krewetki z orzechami, napój aloesowy"))

(defrule MAIN::menu-51
	(impreza spotkanie_biznesowe)
	(wyznanie islam)
	(wiek_test pelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni europejska)
=>
(println "Pasta z bakłażana, pieczone ziemniaki, sałatka z pora, sok jabłkowy"))

(defrule MAIN::menu-52
	(impreza spotkanie_biznesowe)
	(wyznanie islam)
	(wiek_test pelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni azjatycka)
=>
(println "Sajgonki z warzywami, krewetki z orzechami, napój aloesowy"))

(defrule MAIN::menu-53
	(impreza spotkanie_biznesowe)
	(wyznanie islam)
	(wiek_test niepelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Kaczka nadziewana, pyzy, sos pieczeniowy, sok jabłkowy"))

(defrule MAIN::menu-54
	(impreza spotkanie_biznesowe)
	(wyznanie islam)
	(wiek_test niepelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni azjatycka)
=>
(println "Bulgur, duszona baranina, harrisa, lemoniada miętowa"))

(defrule MAIN::menu-55
	(impreza spotkanie_biznesowe)
	(wyznanie islam)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Kaczka nadziewana, pyzy, sos pieczeniowy, sok jabłkowy"))

(defrule MAIN::menu-56
	(impreza spotkanie_biznesowe)
	(wyznanie islam)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Bulgur, duszona baranina, harrisa, lemoniada miętowa"))

(defrule MAIN::menu-57
	(impreza spotkanie_biznesowe)
	(wyznanie chrzescijanin)
	(wiek_test niepelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni europejska)
=>
(println "Krem borowikowy, cukinia zapiekana z pomidorami i serem, kasza, creme brulee, sok jabłkowy"))

(defrule MAIN::menu-58
	(impreza spotkanie_biznesowe)
	(wyznanie chrzescijanin)
	(wiek_test niepelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni azjatycka)
=>
(println "Zupa z grzybami mun, ryż basmati z sosem curry, sajgonki warzywne, napój o smaku marakui"))

(defrule MAIN::menu-59
	(impreza spotkanie_biznesowe)
	(wyznanie chrzescijanin)
	(wiek_test pelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni europejska)
=>
(println "Krem borowikowy, cukinia zapiekana z pomidorami i serem, kasza, creme brulee, sok jabłkowy, whisky "))

(defrule MAIN::menu-60
	(impreza spotkanie_biznesowe)
	(wyznanie chrzescijanin)
	(wiek_test pelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni azjatycka)
=>
(println "Zupa z grzybami mun, ryż basmati z sosem curry, sajgonki warzywne, napój o smaku marakui, sake
"))

(defrule MAIN::menu-61
	(impreza spotkanie_biznesowe)
	(wyznanie chrzescijanin)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Krem borowikowy, kluseczki półfrancuskie, bouef strogonow, creme brulee, sok jabłkowy"))

(defrule MAIN::menu-62
	(impreza spotkanie_biznesowe)
	(wyznanie chrzescijanin)
	(wiek_test niepelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni azjatycka)
=>
(println "krewetki zapiekane z migdałami, chińskie pierożki z wieprzowiną, surówka z awokado, napój aloesowy"))

(defrule MAIN::menu-63
	(impreza spotkanie_biznesowe)
	(wyznanie chrzescijanin)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Krem borowikowy, kluseczki półfrancuskie, bouef strogonow, creme brulee, sok jabłkowy, whisky "))

(defrule MAIN::menu-64
	(impreza spotkanie_biznesowe)
	(wyznanie chrzescijanin)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni azjatycka)
=>
(println "krewetki zapiekane z migdałami, chińskie pierożki z wieprzowiną, surówka z awokado, napój aloesowy, sake"))

(defrule MAIN::menu-65
	(impreza spotkanie_biznesowe)
	(wyznanie judaizm)
	(wiek_test niepelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni europejska)
=>
(println "Teiglach, czulent z ogórkami, zupa porowa z miodem, kulki z siekanej ryby, sok jabłkowy"))

(defrule MAIN::menu-66
	(impreza spotkanie_biznesowe)
	(wyznanie judaizm)
	(wiek_test niepelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni azjatycka)
=>
(println "Zupa z grysikiem, gołąbki po żydowsku z ryżem, kuskus, herbata miętowa"))

(defrule MAIN::menu-67
	(impreza spotkanie_biznesowe)
	(wyznanie judaizm)
	(wiek_test pelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni europejska)
=>
(println "Teiglach, czulent z ogórkami, zupa porowa z miodem, kulki z siekanej ryby, sok jabłkowy, whisky"))

(defrule MAIN::menu-68
	(impreza spotkanie_biznesowe)
	(wyznanie judaizm)
	(wiek_test pelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni azjatycka)
=>
(println "Zupa z grysikiem, gołąbki po żydowsku z ryżem, kuskus, herbata miętowa, arak"))

(defrule MAIN::menu-69
	(impreza spotkanie_biznesowe)
	(wyznanie judaizm)
	(wiek_test niepelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Rosół, Gefilte fish, frytki belgijskie, sok jabłkowy"))

(defrule MAIN::menu-70
	(impreza spotkanie_biznesowe)
	(wyznanie judaizm)
	(wiek_test niepelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni azjatycka)
=>
(println "Zupa rybna po żydowsku,  Klopsiki wołowo-jagnięce z bobem i cytryną, kuskus, herbata miętowa"))

(defrule MAIN::menu-71
	(impreza spotkanie_biznesowe)
	(wyznanie judaizm)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Rosół, Gefilte fish, frytki belgijskie, sok jabłkowy, whisky"))

(defrule MAIN::menu-72
	(impreza spotkanie_biznesowe)
	(wyznanie judaizm)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni azjatycka)
=>
(println "Zupa rybna po żydowsku,  Klopsiki wołowo-jagnięce z bobem i cytryną, kuskus, herbata miętowa, arak"))

(defrule MAIN::menu-73
	(impreza urodziny)
	(wyznanie islam)
	(wiek_test niepelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni europejska)
=>
(println "Tort czekoladowy, Rolada serowa z pieczarkami, sałatka grecka, sok jabłkowy"))

(defrule MAIN::menu-74
	(impreza urodziny)
	(wyznanie islam)
	(wiek_test niepelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni azjatycka)
=>
(println "Tort z polewą truskawkową, Bakłżany faszerowane kuskusem, hummus, herbata miętowa"))

(defrule MAIN::menu-75
	(impreza urodziny)
	(wyznanie islam)
	(wiek_test pelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni europejska)
=>
(println "Tort czekoladowy, Rolada serowa z pieczarkami, sałatka grecka, sok jabłkowy"))

(defrule MAIN::menu-76
	(impreza urodziny)
	(wyznanie islam)
	(wiek_test pelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni azjatycka)
=>
(println "Tort z polewą truskawkową, Bakłżany faszerowane kuskusem, hummus, herbata miętowa"))

(defrule MAIN::menu-77
	(impreza urodziny)
	(wyznanie islam)
	(wiek_test niepelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Tort wiśniowy, tadżin, sałatka grecka, frytki belgijskie, herbata miętowa"))

(defrule MAIN::menu-78
	(impreza urodziny)
	(wyznanie islam)
	(wiek_test niepelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni azjatycka)
=>
(println "Tort z polewą truskawkową, Tortilla z kurczakiem z przyprawą curry, Fettusz, napój aloesowy"))

(defrule MAIN::menu-79
	(impreza urodziny)
	(wyznanie islam)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Tort wiśniowy, tadżin, sałatka z pomidorów i ogórków, kuskus, herbata miętowa"))

(defrule MAIN::menu-80
	(impreza urodziny)
	(wyznanie islam)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni azjatycka)
=>
(println "Tort z polewą truskawkową, Tortilla z kurczakiem z przyprawą curry, Fettusz, napój aloesowy"))

(defrule MAIN::menu-81
	(impreza urodziny)
	(wyznanie chrzescijanstwo)
	(wiek_test niepelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni europejska)
=>
(println "Tort czekoladowy, Rolada serowa z pieczarkami, sałatka grecka, sok pomarańczowy"))

(defrule MAIN::menu-82
	(impreza urodziny)
	(wyznanie chrzescijanstwo)
	(wiek_test niepelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni azjatycka)
=>
(println "Tort z polewą wiśniową, sajgonki wegetariańskie, sałatka rojak, woda kokosowa"))

(defrule MAIN::menu-83
	(impreza urodziny)
	(wyznanie chrzescijanstwo)
	(wiek_test pelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni europejska)
=>
(println "Tort czekoladowy, Rolada serowa z pieczarkami, sałatka grecka, piwo"))

(defrule MAIN::menu-84
	(impreza urodziny)
	(wyznanie chrzescijanstwo)
	(wiek_test pelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni azjatycka)
=>
(println "Tort z polewą wiśniową, sajgonki wegetariańskie, sałatka rojak, Shochu"))

(defrule MAIN::menu-85
	(impreza urodziny)
	(wyznanie chrzescijanstwo)
	(wiek_test niepelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Tort truskawkowy z bezami, skrzydełka kurczaka, sałatka grecka, frytki belgijskie, sok z limonki"))

(defrule MAIN::menu-86
	(impreza urodziny)
	(wyznanie chrzescijanstwo)
	(wiek_test niepelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni azjatycka)
=>
(println "Tort bezowy z polewą wiśniową, tajskie zielone curry z kurczakiem i kukurydzą, sałatka z kapusty pekińskiej, woda kokosowa"))

(defrule MAIN::menu-87
	(impreza urodziny)
	(wyznanie chrzescijanstwo)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Tort truskawkowy z bezami, skrzydełka kurczaka, sałatka grecka, frytki belgijskie, grzaniec"))

(defrule MAIN::menu-88
	(impreza urodziny)
	(wyznanie chrzescijanstwo)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni azjatycka)
=>
(println "Tort bezowy z polewą wiśniową, tajskie zielone curry z kurczakiem i kukurydzą, sałatka z kapusty pekińskiej, sake"))

(defrule MAIN::menu-89
	(impreza urodziny)
	(wyznanie judaizm)
	(wiek_test niepelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni europejska)
=>
(println "Tort czekoladowy, pierogi z dynią, sałatka grecka, sok jabłkowy"))


(defrule MAIN::menu-90
	(impreza urodziny)
	(wyznanie judaizm)
	(wiek_test niepelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni azjatycka)
=>
(println "Tort bezowy z polewą waniliową, sałatka ziemniaczana z jabłkiem i ogórkiem kiszonym, czulent z ogórkami, sok bananowy"))


(defrule MAIN::menu-91
	(impreza urodziny)
	(wyznanie judaizm)
	(wiek_test pelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni europejska)
=>
(println "Tort czekoladowy, pierogi z dynią, sałatka grecka, wódka Absolut"))


(defrule MAIN::menu-92
	(impreza urodziny)
	(wyznanie judaizm)
	(wiek_test pelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni azjatycka)
=>
(println "Tort bezowy z polewą waniliową, sałatka ziemniaczana z jabłkiem i ogórkiem kiszonym, czulent z ogórkami, sake"))


(defrule MAIN::menu-93
	(impreza urodziny)
	(wyznanie judaizm)
	(wiek_test niepelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Tort bezowy z polewą bananową, czulent z jagnięciną, kugel na słodko, sok z liczi"))


(defrule MAIN::menu-94
	(impreza urodziny)
	(wyznanie judaizm)
	(wiek_test niepelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni azjatycka)
=>
(println "Tort z polewą limonkową, stek wołowy po syczuańsku, orientalna sałatka z komosą, napój z marakui"))


(defrule MAIN::menu-95
	(impreza urodziny)
	(wyznanie judaizm)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Tort bezowy z polewą bananową, czulent z jagnięciną, kugel na słodko, wódka Bols"))


(defrule MAIN::menu-96
	(impreza urodziny)
	(wyznanie judaizm)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni azjatycka)
=>
(println "Tort z polewą limonkową, stek wołowy po syczuańsku, orientalna sałatka z komosą, sake"))


(defrule MAIN::menu-97
	(impreza wieczor_kawalerski)
	(wyznanie islam)
	(wiek_test niepelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni europejska)
=>
(println "Faszerowane pieczarki portobello, grissini z sosem czosnkowym, sok z czarnej porzeczki"))

(defrule MAIN::menu-98
	(impreza wieczor_kawalerski)
	(wyznanie islam)
	(wiek_test niepelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni azjatycka)
=>
(println "Sałatka z awokado i surimi, tofu z warzywami woka, sok z liczi"))

(defrule MAIN::menu-99
	(impreza wieczor_kawalerski)
	(wyznanie islam)
	(wiek_test pelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni europejska)
=>
(println "Faszerowane pieczarki portobello, grissini z sosem czosnkowym, sok z czarnej porzeczki"))

(defrule MAIN::menu-100
	(impreza wieczor_kawalerski)
	(wyznanie islam)
	(wiek_test pelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni azjatycka)
=>
(println "Sałatka z awokado i surimi, tofu z warzywami woka, sok z liczi"))

(defrule MAIN::menu-101
	(impreza wieczor_kawalerski)
	(wyznanie islam)
	(wiek_test niepelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Udka z kurczaka, sałatka grecka, deska serów, napój aloesowy"))

(defrule MAIN::menu-102
	(impreza wieczor_kawalerski)
	(wyznanie islam)
	(wiek_test niepelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni azjatycka)
=>
(println "Makaron soba z grillowanym kurczakiem, sałatka orientalna z komosą, sok jabłkowy"))

(defrule MAIN::menu-103
	(impreza wieczor_kawalerski)
	(wyznanie islam)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Udka z kurczaka, sałatka grecka, deska serów, napój aloesowy"))

(defrule MAIN::menu-104
	(impreza wieczor_kawalerski)
	(wyznanie islam)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni azjatycka)
=>
(println "Makaron soba z grillowanym kurczakiem, sałatka orientalna z komosą, sok jabłkowy"))


(defrule MAIN::menu-105
	(impreza wieczor_kawalerski)
	(wyznanie chrzescijanstwo)
	(wiek_test niepelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni europejska)
=>
(println "Ziemniak Hasselback z sosem koperkowym, cukinia z pestkami dyni, bruschetta z sosem czosnkowym, sok jabłkowy"))

(defrule MAIN::menu-106
	(impreza wieczor_kawalerski)
	(wyznanie chrzescijanstwo)
	(wiek_test niepelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni azjatycka)
=>
(println "Hinduska sałatka Raita, humus z rukwią i czerwoną papryką, sok z limonki"))

(defrule MAIN::menu-107
	(impreza wieczor_kawalerski)
	(wyznanie chrzescijanstwo)
	(wiek_test pelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni europejska)
=>
(println "Ziemniaki Hasselback z sosem koperkowym, cukinia z pestkami dyni, bruschetta z sosem czosnkowym, wódka Wyborowa"))

(defrule MAIN::menu-108
	(impreza wieczor_kawalerski)
	(wyznanie chrzescijanstwo)
	(wiek_test pelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni azjatycka)
=>
(println "Hinduska sałatka Raita, hummus z rukwią i czerwoną papryką, wódka Smirnoff"))

(defrule MAIN::menu-109
	(impreza wieczor_kawalerski)
	(wyznanie chrzescijanstwo)
	(wiek_test niepelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Udka z kurczaka, parówki w cieście francuskim, zupa meksykańska, sok jabłkowy"))

(defrule MAIN::menu-110
	(impreza wieczor_kawalerski)
	(wyznanie chrzescijanstwo)
	(wiek_test niepelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni azjatycka)
=>
(println "Wieprzowina na ostro z orzechami nerkowca, grissini z sosem słodko-kwaśnym, sałatka z makaronem ryżowym, woda kokosowa"))

(defrule MAIN::menu-111
	(impreza wieczor_kawalerski)
	(wyznanie chrzescijanstwo)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Udka z kurczaka, parówki w cieście francuskim, zupa meksykańska, koniak"))

(defrule MAIN::menu-112
	(impreza wieczor_kawalerski)
	(wyznanie chrzescijanstwo)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni azjatycka)
=>
(println "Wieprzowina na ostro z orzechami nerkowca, grissini z sosem słodko-kwaśnym, sałatka z makaronem ryżowym, sake"))

(defrule MAIN::menu-113
	(impreza wieczor_kawalerski)
	(wyznanie judaizm)
	(wiek_test niepelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni europejska)
=>
(println "Falafel z hummusem, kanapki z kalarepty, sałatka grecka, sok jabłkowy
"))

(defrule MAIN::menu-114
	(impreza wieczor_kawalerski)
	(wyznanie judaizm)
	(wiek_test niepelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni azjatycka)
=>
(println "Sałatka z dynią w curry, tosty z pomidorową salsą, lassi różane
"))

(defrule MAIN::menu-115
	(impreza wieczor_kawalerski)
	(wyznanie judaizm)
	(wiek_test pelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni europejska)
=>
(println "Falafel z hummusem, kanapki z kalarepty, sałatka grecka, wódka Wyborowa
"))

(defrule MAIN::menu-116
	(impreza wieczor_kawalerski)
	(wyznanie judaizm)
	(wiek_test pelnoletni)
	(typ_diety wegetarianska)
	(rodzaj_kuchni azjatycka)
=>
(println "Sałatka z dynią w curry, tosty z pomidorową salsą, sake
"))

(defrule MAIN::menu-117
	(impreza wieczor_kawalerski)
	(wyznanie judaizm)
	(wiek_test niepelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Stek wołowy, sałatka grecka, grissini z sosem czosnkowym, sok jabłkowy
"))

(defrule MAIN::menu-118
	(impreza wieczor_kawalerski)
	(wyznanie judaizm)
	(wiek_test niepelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni azjatycka)
=>
(println "Tajwańska zupa z wołowiną, sałatka z kurczakiem curry, sok pomarańczowy
"))

(defrule MAIN::menu-119
	(impreza wieczor_kawalerski)
	(wyznanie judaizm)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni europejska)
=>
(println "Stek wołowy, sałatka grecka, grissini z sosem czosnkowym, wódka Bols
"))

(defrule MAIN::menu-120
	(impreza wieczor_kawalerski)
	(wyznanie judaizm)
	(wiek_test pelnoletni)
	(typ_diety miesna)
	(rodzaj_kuchni azjatycka)
=>
(println "Tajwańska zupa z wołowiną, sałatka z kurczakiem curry, wódka Absolut
"))
