(deftemplate MAIN::food
   (slot name (type STRING)))

(defrule MAIN::bachelorparty_test
	(not (bachelor ?))
   =>
   (println "Czy wieczor kawalerski? (tak / nie)")
   (assert (bachelor (read))))

(defrule MAIN::b_dinnerType_test
	(not (typical_dinner ?))
	(bachelor tak)
   =>
   (println "Menu tradycyjne? (tak / nie)")
   (assert (typical_dinner (read))))

(defrule MAIN::b_dinnerType_iocheck
	(typical_dinner ?typical_dinner)
   ?rule <- (typical_dinner ?)
   (not (typical_dinner nie))
	(not (typical_dinner tak))
   =>
   (retract ?rule))

(defrule MAIN::b_meatType_test
	(not (meatType ?))
	(typical_dinner tak)
   =>
   (println "Czy mieso tradycyjne? (tak / nie)")
   (assert (meatType (read))))

(defrule MAIN::b_meatType_iocheck
	(meatType ?meatType)
   ?rule <- (meatType ?)
   (not (meatType nie))
	(not (meatType tak))
   =>
   (retract ?rule))

(defrule MAIN::b_cutlet_test
	(not (cutlet ?))
	(meatType tak)
   =>
   (println "Miesa Tradycyjne")
   (println "Czy kotlet? (tak / nie)")
   (assert (cutlet (read))))

(defrule MAIN::b_cutlet_iocheck
	(cutlet ?cutlet)
   ?rule <- (cutlet ?)
   (not (cutlet nie))
	(not (cutlet tak))
   =>
   (retract ?rule))

(defrule MAIN::b_soycutlet_test
	(not (soycutlet ?))
	(cutlet tak)
   =>
   (println "Czy kotlet sojowy? (tak / nie)")
   (assert (soycutlet (read))))

(defrule MAIN::b_soycutlet_iocheck
	(soycutlet ?soycutlet)
   ?rule <- (soycutlet ?)
   (not (soycutlet nie))
	(not (soycutlet tak))
   =>
   (retract ?rule))

(defrule MAIN::b_meatloaf_test
	(not (meatloaf ?))
	(soycutlet nie)
   =>
   (println "Czy kotlet mielony? (tak / nie)")
   (assert (meatloaf (read))))

(defrule MAIN::b_meatloaf_iocheck
	(meatloaf ?meatloaf)
   ?rule <- (meatloaf ?)
   (not (meatloaf nie))
	(not (meatloaf tak))
   =>
   (retract ?rule))

(defrule MAIN::b_chine_test
	(not (chine ?))
	(cutlet nie)
   =>
   (println "Czy karkowka? (tak / nie)")
   (assert (chine (read))))

(defrule MAIN::b_chine_iocheck
	(chine ?chine)
   ?rule <- (chine ?)
   (not (chine nie))
	(not (chine tak))
   =>
   (retract ?rule))

(defrule MAIN::b_haunch_test
	(not (haunch ?))
	(chine nie)
   =>
   (println "Czy udziec? (tak / nie)")
   (assert (haunch (read))))

(defrule MAIN::b_haunch_iocheck
	(haunch ?haunch)
   ?rule <- (haunch ?)
   (not (haunch nie))
	(not (haunch tak))
   =>
   (retract ?rule))

(defrule MAIN::b_loin_test
	(not (loin ?))
	(haunch nie)
   =>
	(println "Czy poledwica? (tak / nie)")
	(assert (loin (read))))

(defrule MAIN::b_loin_iocheck
	(loin ?loin)
	?rule <- (loin ?)
	(not (loin nie))
	(not (loin tak))
   =>
	(retract ?rule))

(defrule MAIN::b_beefloin_test
	(not (beefloin ?))
	(loin tak)
   =>
	(println "Czy Poledwica wolowa (tak / nie)")
	(assert (beefloin (read))))

(defrule MAIN::b_beefloin_iocheck
	(beefloin ?beefloin)
	?rule <- (beefloin ?)
	(not (beefloin nie))
	(not (beefloin tak))
   =>
	(retract ?rule))

(defrule MAIN::b_fastfood_test
	(not (fastfood ?))
	(typical_dinner nie)
   =>
	(println "Czy nietradycyjne danie, fastfood? (tak / nie)")
	(assert (fastfood (read))))

(defrule MAIN::b_fastfood_iocheck
	(fastfood ?fastfood)
	?rule <- (fastfood ?)
	(not (fastfood nie))
	(not (fastfood tak))
   =>
	(retract ?rule))

(defrule MAIN::b_pizza_test
	(not (pizza ?))
	(fastfood tak)
   =>
	(println "Czy pizza? (tak / nie)")
	(assert (pizza (read))))

(defrule MAIN::b_pizza_iocheck
	(pizza ?pizza)
	?rule <- (pizza ?)
	(not (pizza nie))
	(not (pizza tak))
   =>
	(retract ?rule))

(defrule MAIN::b_hawaii_test
	(not (hawaii ?))
	(pizza tak)
   =>
	(println "Czy pizza hawajska? (tak / nie)")
	(assert (hawaii (read))))

(defrule MAIN::b_hawaii_iocheck
	(hawaii ?hawaii)
	?rule <- (hawaii ?)
	(not (hawaii nie))
	(not (hawaii tak))
   =>
	(retract ?rule))

(defrule MAIN::b_capriciosa_test
	(not (capriciosa ?))
	(hawaii nie)
   =>
	(println "Czy pizza capriciosa? (tak / nie)")
	(assert (capriciosa (read))))

(defrule MAIN::b_capriciosa_iocheck
	(capriciosa ?capriciosa)
	?rule <- (capriciosa ?)
	(not (capriciosa nie))
	(not (capriciosa tak))
   =>
	(retract ?rule))

(defrule MAIN::b_funghi_test
	(not (funghi ?))
	(capriciosa nie)
   =>
	(println "Czy pizza funghi? (tak / nie)")
	(assert (funghi (read))))

(defrule MAIN::b_funghi_iocheck
	(funghi ?funghi)
	?rule <- (funghi ?)
	(not (funghi nie))
	(not (funghi tak))
   =>
	(retract ?rule))

(defrule MAIN::b_kebab_test
	(not (kebab ?))
	(pizza nie)
   =>
	(println "Czy kebab? (tak / nie)")
	(assert (kebab (read))))

(defrule MAIN::b_kebab_iocheck
	(kebab ?kebab)
	?rule <- (kebab ?)
	(not (kebab nie))
	(not (kebab tak))
   =>
	(retract ?rule))

(defrule MAIN::b_mildsauce_test
	(not (mildsauce ?))
	(kebab tak)
   =>
	(println "Czy sos lagodny? (tak / nie)")
	(assert (mildsauce (read))))

(defrule MAIN::b_mildsauce_iocheck
	(mildsauce ?mildsauce)
	?rule <- (mildsauce ?)
	(not (mildsauce nie))
	(not (mildsauce tak))
   =>
	(retract ?rule))

(defrule MAIN::b_spicysauce_test
	(not (spicysauce ?))
	(mildsauce nie)
   =>
	(println "Czy sos pikantny? (tak / nie)")
	(assert (spicysauce (read))))

(defrule MAIN::b_spicysauce_iocheck
	(spicysauce ?spicysauce)
	?rule <- (spicysauce ?)
	(not (spicysauce nie))
	(not (spicysauce tak))
   =>
	(retract ?rule))


(defrule MAIN::weddingdinner_test
	(not (weddingdinner ?))
        (bachelor nie)
   =>
   (println "Czy obiad weselny? (tak / nie)")
   (assert (weddingdinner (read))))

(defrule MAIN::b_vegeterian_test
	(not (vegeterian ?))
	(weddingdinner tak)
   =>
   (println "Czy wegeterianska potrawa? (tak / nie)")
   (assert (vegeterian (read))))
   
(defrule MAIN::b_vegeterian_iocheck
		(vegeterian ?vegeterian)
	?rule <- (vegeterian ?)
	(not (vegeterian nie))
		(not (vegeterian tak))
	=>
	(retract ?rule))

(defrule MAIN::b_falafel_test
		(not (falafel ?))
		(vegeterian tak)
	=>
	(println "Czy falafel? (tak / nie)")
	(assert (falafel(read))))

(defrule MAIN::b_falafel_iocheck
		(falafel ?falafel)
	?rule <- (falafel ?)
	(not (falafel nie))
		(not (falafel tak))
	=>
	(retract ?rule))
	
(defrule MAIN::b_dumplings_test
		(not (dumplings ?))
		(falafel nie)
	=>
	(println "Czy pierogi? (tak / nie)")
	(assert (dumplings(read))))
	

(defrule MAIN::b_dumplings_iocheck
		(dumplings ?dumplings)
	?rule <- (dumplings ?)
	(not (dumplings nie))
		(not (dumplings tak))
	=>
	(retract ?rule))
	

(defrule MAIN::b_russiandumplings_test
		(not (russiandumplings ?))
		(dumplings tak)
	=>
	(println "Czy pierogi ruskie? (tak / nie)")
	(assert (russiandumplings(read))))
	
(defrule MAIN::b_russiandumplings_iocheck
		(russiandumplings ?russiandumplings)
	?rule <- (russiandumplings ?)
	(not (russiandumplings nie))
		(not (russiandumplings tak))
	=>
	(retract ?rule))	


(defrule MAIN::b_cheesedumplings_test
		(not (cheesedumplings ?))
		(russiandumplings nie)
	=>
	(println "Czy pierogi z serem? (tak / nie)")
	(assert (cheesedumplings(read))))
	
(defrule MAIN::b_cheesedumplings_iocheck
		(cheesedumplings ?cheesedumplings)
	?rule <- (cheesedumplings ?)
	(not (cheesedumplings nie))
		(not (cheesedumplings tak))
	=>
	(retract ?rule))
	

(defrule MAIN::b_miesne_test
		(not (miesne ?))
		(vegeterian nie)
	=>
	(println "Czy danie miesne? (tak / nie)")
	(assert (miesne(read))))
	
	
(defrule MAIN::b_miesne_iocheck
		(miesne ?miesne)
	?rule <- (miesne ?)
	(not (miesne nie))
		(not (miesne tak))
	=>
	(retract ?rule))
	
	
(defrule MAIN::b_kotlet_test
		(not (kotlet ?))
		(miesne tak)
	=>
	(println "Czy kotlet? (tak / nie)")
	(assert (kotlet(read))))

(defrule MAIN::b_kotlet_iocheck
		(kotlet ?kotlet)
	?rule <- (kotlet ?)
	(not (kotlet nie))
		(not (kotlet tak))
	=>
	(retract ?rule))


(defrule MAIN::b_schabowy_test
		(not (schabowy ?))
		(kotlet tak)
	=>
	(println "Czy kotlet schabowy? (tak / nie)")
	(assert (schabowy(read))))

(defrule MAIN::b_schabowy_iocheck
		(schabowy ?schabowy)
	?rule <- (schabowy ?)
	(not (schabowy nie))
		(not (schabowy tak))
	=>
	(retract ?rule))
	
	
(defrule MAIN::b_kotletkurczak_test
		(not (kotletkurczak ?))
		(schabowy nie)
	=>
	(println "Czy kotlet z kurczaka? (tak / nie)")
	(assert (kotletkurczak(read))))
	
(defrule MAIN::b_kotletkurczak_iocheck
		(kotletkurczak ?kotletkurczak)
	?rule <- (kotletkurczak ?)
	(not (kotletkurczak nie))
		(not (kotletkurczak tak))
	=>
	(retract ?rule))
	
(defrule MAIN::b_klopsy_test
		(not (klopsy ?))
		(kotlet nie)
	=>
	(println "Czy klopsy? (tak / nie)")
	(assert (klopsy(read))))	
	
(defrule MAIN::b_klopsy_iocheck
		(klopsy ?klopsy)
	?rule <- (klopsy ?)
	(not (klopsy nie))
		(not (klopsy tak))
	=>
	(retract ?rule))
	
(defrule MAIN::b_klopsywolowe_test
		(not (klopsywolowe ?))
		(klopsy tak)
	=>
	(println "Czy klopsy wolowe? (tak / nie)")
	(assert (klopsywolowe(read))))

(defrule MAIN::b_klopsywolowe_iocheck
		(klopsywolowe ?klopsywolowe)
	?rule <- (klopsywolowe ?)
	(not (klopsywolowe nie))
		(not (klopsywolowe tak))
	=>
	(retract ?rule))
	
(defrule MAIN::b_klopsywieprzowe_test
		(not (klopsywieprzowe ?))
		(klopsywolowe nie)
	=>
	(println "Czy klopsy wieprzowe? (tak / nie)")
	(assert (klopsywieprzowe(read))))

(defrule MAIN::b_klopsywieprzowe_iocheck
		(klopsywieprzowe ?klopsywieprzowe)
	?rule <- (klopsywieprzowe ?)
	(not (klopsywieprzowe nie))
		(not (klopsywieprzowe tak))
	=>
	(retract ?rule))
	
	
(defrule MAIN::b_dewolaj_test
		(not (dewolaj ?))
		(klopsy nie)
	=>
	(println "Czy dewolaj? (tak / nie)")
	(assert (dewolaj(read))))	
	
(defrule MAIN::b_dewolaj_iocheck
		(dewolaj ?dewolaj)
	?rule <- (dewolaj ?)
	(not (dewolaj nie))
		(not (dewolaj tak))
	=>
	(retract ?rule))
		
	
(defrule MAIN::funeralmeal_test
	(not (funeralmeal ?))
        (weddingdinner nie)
   =>
   (println "Czy stypa? (tak / nie)")
   (assert (funeralmeal (read))))
   
(defrule MAIN::b_funeralmeal_iocheck
		(funeralmeal ?funeralmeal)
	?rule <- (funeralmeal ?)
	(not (funeralmeal nie))
		(not (funeralmeal tak))
	=>
	(retract ?rule))

(defrule MAIN::s_zupa_test
		(not (zupa ?))
		(funeralmeal tak)
	=>
	(println "Czy zupa? (tak / nie)")
	(assert (zupa (read))))

(defrule MAIN::s_zupa_iocheck
		(zupa ?zupa)
	?rule <- (zupa ?)
	(not (zupa nie))
	(not (zupa tak))
	=>
	(retract ?rule))

(defrule MAIN::s_rosol_test
		(not (rosol ?))
		(zupa tak)
	=>
	(println "Czy rosol? (tak / nie)")
	(assert (rosol (read))))

(defrule MAIN::s_rosol_iocheck
		(rosol ?rosol)
		?rule <- (rosol ?)
		(not (rosol nie))
		(not (rosol tak))
	=>
	(retract ?rule))

(defrule MAIN::s_barszcz_test
		(not (barszcz ?))
		(rosol nie)
	=>
	(println "Czy barszcz? (tak / nie)")
	(assert (barszcz (read))))

(defrule MAIN::s_barszcz_iocheck
		(barszcz ?barszcz)
		?rule <- (barszcz ?)
		(not (barszcz nie))
		(not (barszcz tak))
	=>
	(retract ?rule))

(defrule MAIN::s_zurek_test
		(not (zurek ?))
		(barszcz nie)
	=>
	(println "Czy zurek? (tak / nie )")
	(assert (zurek (read))))

(defrule MAIN::s_zurek_iocheck
		(zurek ?zurek)
		?rule <- (zurek ?)
		(not (zurek nie))
		(not (zurek tak))
	=>
	(retract ?rule))

(defrule MAIN::birthdayparty_test
	(not (birthdayparty ?))
        (funeralmeal nie)
   =>
   (println "Czy urodziny? (tak / nie)")
   (assert (birthdayparty (read))))
   
(defrule MAIN::b_birthdayparty_iocheck
		(birthdayparty ?birthdayparty)
	?rule <- (birthdayparty ?)
	(not (birthdayparty nie))
		(not (birthdayparty tak))
	=>
	(retract ?rule))
 
(defrule MAIN::businessmeeting_test
	(not (businessmeeting ?))
        (birthdayparty nie)
   =>
   (println "Czy spotkanie biznesowe? (tak / nie)")
   (assert (businessmeeting (read))))
   
(defrule MAIN::b_businessmeeting_iocheck
		(businessmeeting ?businessmeeting)
	?rule <- (businessmeeting ?)
	(not (businessmeeting nie))
		(not (businessmeeting tak))
	=>
	(retract ?rule))   

(defrule MAIN::food-0
	(meatType nie)
   =>
   (println "Deska serow, paluszki, pierogi ruskie")
   (assert (food (name "Deska serow, paluszki, pierogi ruskie"))))

(defrule MAIN::food-1
	(soycutlet tak)
   =>
   (println "Deska serow, paluszki, bimber, kotlet sojowy")
   (assert (food (name "Deska serow, paluszki, bimber, kotlet sojowy"))))

(defrule MAIN::food-2
	(meatloaf tak)
   =>
   (println "Deska serow, paluszki, bimber, kotlet mielony")
   (assert (food (name "Deska serow, paluszki, kotlet mielony"))))

(defrule MAIN::food-3
	(meatloaf nie)
   =>
   (println "Deska serow, paluszki, bimber, kotlet schabowy")
   (assert (food (name "Deska serow, paluszki, kotlet schabowy"))))

(defrule MAIN::food-4
	(chine tak)
   =>
   (println "Deska serow, paluszki, bimber, karkowka")
   (assert (food (name "Deska serow, paluszki, karkowka"))))

(defrule MAIN::food-5
	(haunch tak)
   =>
   (println "Deska serow, paluszki, bimber, udziec")
   (assert (food (name "Deska serow, paluszki, udziec"))))

(defrule MAIN::food-6
	(beefloin tak)
   =>
   (println "Deska serow, paluszki, bimber, poledwica wolowa")
   (assert (food (name "Deska serow, paluszki, poledwica wolowa"))))

(defrule MAIN::food-7
	(beefloin nie)
   =>
   (println "Deska serow, paluszki, bimber, poledwica wieprzowa")
   (assert (food (name "Deska serow, paluszki, poledwica wieprzowa"))))

(defrule MAIN::food-8
	(loin nie)
   =>
   (println "Deska serow, paluszki, bimber, dziczyzna")
   (assert (food (name "Deska serow, paluszki, dziczyzna"))))


(defrule MAIN::food-9
	(fastfood nie)
   =>
   (println "Deska serow, paluszki, bimber")
   (assert (food (name "Deska serow, paluszki, bimber"))))

(defrule MAIN::food-10
	(hawaii tak)
   =>
   (println "Deska serow, paluszki, bimber, pizza hawajska")
   (assert (food (name "Deska serow, paluszki, bimber, pizza hawajska"))))

(defrule MAIN::food-11
	(capriciosa tak)
   =>
   (println "Deska serow, paluszki, bimber, pizza capriciosa")
   (assert (food (name "Deska serow, paluszki, bimber, pizza capriciosa"))))

(defrule MAIN::food-12
	(funghi tak)
   =>
   (println "Deska serow, paluszki, bimber, pizza funghi")
   (assert (food (name "Deska serow, paluszki, bimber, pizza funghi"))))

(defrule MAIN::food-13
	(funghi nie)
   =>
   (println "Deska serow, paluszki, bimber, pizza cztery sery")
   (assert (food (name "Deska serow, paluszki, bimber, pizza cztery sery"))))

(defrule MAIN::food-14
	(kebab nie)
   =>
   (println "Deska serow, paluszki, bimber, burger z wolowina")
   (assert (food (name "Deska serow, paluszki, bimber, burger z wolowina"))))

(defrule MAIN::food-15
	(mildsauce tak)
   =>
   (println "Deska serow, paluszki, bimber, kebab z sosem lagodnym")
   (assert (food (name "Deska serow, paluszki, bimber, kebab z sosem lagodnym"))))

(defrule MAIN::food-16
	(spicysauce nie)
   =>
   (println "Deska serow, paluszki, bimber, kebab z sosem slodko-kwasnym")
   (assert (food (name "Deska serow, paluszki, bimber, kebab z sosem slodko-kwasnym"))))

(defrule MAIN::food-17
	(spicysauce tak)
   =>
   (println "Deska serow, paluszki, bimber, kebab z sosem pikantnym")
   (assert (food (name "Deska serow, paluszki, bimber, kebab z sosem pikantnym"))))
   
(defrule MAIN::food-18
	(falafel tak)
   =>
   (println "Rosol, ziemniaki, pyzy, udziec, falafel")
   (assert (food (name "Rosol, ziemniaki, pyzy, udziec, falafel"))))
   
(defrule MAIN::food-19
	(dumplings nie)
   =>
   (println "Rosol, ziemniaki, pyzy, udziec, szparagi z sosem beszamelowym")
   (assert (food (name "Rosol, ziemniaki, pyzy, udziec, szparagi z sosem beszamelowym"))))
   
   
(defrule MAIN::food-20
	(russiandumplings tak)
   =>
   (println "Rosol, ziemniaki, pyzy, udziec, pierogi ruskie")
   (assert (food (name "Rosol, ziemniaki, pyzy, udziec, pierogi ruskie"))))
   
(defrule MAIN::food-21
	(cheesedumplings tak)
   =>
   (println "Rosol, ziemniaki, pyzy, udziec, pierogi z serem")
   (assert (food (name "Rosol, ziemniaki, pyzy, udziec, pierogi z serem"))))
   
   
(defrule MAIN::food-22
	(cheesedumplings nie)
   =>
   (println "Rosol, ziemniaki, pyzy, udziec, pierogi z truskawkami")
   (assert (food (name "Rosol, ziemniaki, pyzy, udziec, pierogi z truskawkami"))))
   
(defrule MAIN::food-23
	(miesne nie)
   =>
   (println "Rosol, ziemniaki, pyzy, udziec")
   (assert (food (name "Rosol, ziemniaki, pyzy, udziec"))))
   
   
(defrule MAIN::food-24
	(schabowy tak)
   =>
   (println "Rosol, ziemniaki, pyzy, udziec,kotlet schabowy")
   (assert (food (name "Rosol, ziemniaki, pyzy, udziec, kotlet schabowy"))))
   
(defrule MAIN::food-25
	(kotletkurczak tak)
   =>
   (println "Rosol, ziemniaki, pyzy, udziec,kotlet z kurczaka")
   (assert (food (name "Rosol, ziemniaki, pyzy, udziec, kotlet z kurczaka"))))

(defrule MAIN::food-26
	(kotletkurczak nie)
   =>
   (println "Rosol, ziemniaki, pyzy, udziec,kotlet z indyka")
   (assert (food (name "Rosol, ziemniaki, pyzy, udziec, kotlet z indyka"))))
   
(defrule MAIN::food-27
	(klopsywolowe tak)
   =>
   (println "Rosol, ziemniaki, pyzy, udziec, klopsy wolowe")
   (assert (food (name "Rosol, ziemniaki, pyzy, udziec, klopsy wolowe"))))
   
(defrule MAIN::food-28
	(klopsywieprzowe tak)
   =>
   (println "Rosol, ziemniaki, pyzy, udziec, klopsy wieprzowe")
   (assert (food (name "Rosol, ziemniaki, pyzy, udziec, klopsy wieprzowe"))))

(defrule MAIN::food-29
	(klopsywieprzowe nie)
   =>
   (println "Rosol, ziemniaki, pyzy, udziec, klopsy z kurczaka")
   (assert (food (name "Rosol, ziemniaki, pyzy, udziec, klopsy z kurczaka"))))
   
   
(defrule MAIN::food-30
	(dewolaj tak)
   =>
   (println "Rosol, ziemniaki, pyzy, udziec, dewolaj")
   (assert (food (name "Rosol, ziemniaki, pyzy, udziec, dewolaj"))))

(defrule MAIN::food-31
	(dewolaj nie)
   =>
   (println "Rosol, ziemniaki, pyzy, udziec, gulasz wolowy")
   (assert (food (name "Rosol, ziemniaki, pyzy, udziec, gulasz wolowy"))))

(defrule MAIN::food-32
	(zupa nie)
	=>
	(println "Kotlet schabowy, ziemniaki, pyzy, sos pieczeniowy")
	(assert (food (name "Kotlet schabowy, ziemniaki, pyzy, sos pieczeniowy"))))

(defrule MAIN::food-33
	(rosol tak)
	=>
	(println "Kotlet schabowy, ziemniaki, pyzy, sos pieczeniowy, rosol")
	(assert (food (name "Kotlet schabowy, ziemniaki, pyzy, sos pieczeniowy, rosol"))))   
   
(defrule MAIN::food-34
	(barszcz tak)
	=>
	(println "Kotlet schabowy, ziemniaki, pyzy, sos pieczeniowy, barszcz")
	(assert (food (name "Kotlet schabowy, ziemniaki, pyzy, sos pieczeniowy, barszcz"))))   

(defrule MAIN::food-35
	(zurek tak)
	=>
	(println "Kotlet schabowy, ziemniaki, pyzy, sos pieczeniowy, zurek")
	(assert (food (name "Kotlet schabowy, ziemniaki, pyzy, sos pieczeniowy, zurek"))))   

(defrule MAIN::food-36
	(zurek nie)
	=>
	(println "Kotlet schabowy, ziemniaki, pyzy, sos pieczeniowy, zupa grochowa")
	(assert (food (name "Kotlet schabowy, ziemniaki, pyzy, sos pieczeniowy, zupa grochowa"))))   

(defrule MAIN::end
	(businessmeeting nie)
	=>
	(println "Brak okreslonego typu spotkania")
	(assert (food (name "Brak okreslonego typu spotkania"))))