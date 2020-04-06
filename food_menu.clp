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


(defrule MAIN::food-0
	(typical_dinner nie)
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
   (println "Deska serow, paluszki, kotlet mielony")
   (assert (food (name "Deska serow, paluszki, kotlet mielony"))))

(defrule MAIN::food-3
	(meatloaf nie)
   =>
   (println "Deska serow, paluszki, kotlet schabowy")
   (assert (food (name "Deska serow, paluszki, kotlet schabowy"))))

(defrule MAIN::food-4
	(chine tak)
   =>
   (println "Deska serow, paluszki, karkowka")
   (assert (food (name "Deska serow, paluszki, karkowka"))))

(defrule MAIN::food-5
	(haunch tak)
   =>
   (println "Deska serow, paluszki, udziec")
   (assert (food (name "Deska serow, paluszki, udziec"))))

(defrule MAIN::food-6
	(beefloin tak)
   =>
   (println "Deska serow, paluszki, poledwica wolowa")
   (assert (food (name "Deska serow, paluszki, poledwica wolowa"))))

(defrule MAIN::food-7
	(beefloin nie)
   =>
   (println "Deska serow, paluszki, poledwica wieprzowa")
   (assert (food (name "Deska serow, paluszki, poledwica wieprzowa"))))

(defrule MAIN::food-8
	(loin nie)
   =>
   (println "Deska serow, paluszki, dziczyzna")
   (assert (food (name "Deska serow, paluszki, dziczyzna"))))
