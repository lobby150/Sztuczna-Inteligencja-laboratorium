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
