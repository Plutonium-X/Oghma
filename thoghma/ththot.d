BEGIN ~ThThot~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Rencontre
   SAY @0
   IF ~~ THEN REPLY @1 DO ~SetGlobal("ThRoleThot", "AR0319", 1)~ GOTO Question
   IF ~~ THEN REPLY @2  DO ~SetGlobal("ThThotVexe", "AR0319", 1)~ GOTO Vexe
   IF ~Gender(LastTalkedToBy,FEMALE) !Global("ThPervers", "AR0319", 1)~ THEN REPLY @3 DO ~SetGlobal("ThPervers", "AR0319", 1)~ GOTO Pervers
   IF ~~ THEN REPLY @4 EXIT
END

IF ~!NumTimesTalkedTo(0)
   !Global("ThThotVexe", "AR0319", 1)
   !Global("ThRoleThot", "AR0319", 1)
   ~ THEN BEGIN NouvelleRencontre
   SAY @5
   IF ~~ THEN REPLY @1 DO ~SetGlobal("ThRoleThot", "AR0319", 1)~ GOTO Question
   IF ~~ THEN REPLY @2  DO ~SetGlobal("ThThotVexe", "AR0319", 1)~ GOTO Vexe
   IF ~Gender(LastTalkedToBy,FEMALE) !Global("ThPervers", "AR0319", 1)~ THEN REPLY @3 DO ~SetGlobal("ThPervers", "AR0319", 1)~ GOTO Pervers
   IF ~~ THEN REPLY @4 EXIT
END

IF ~Global("ThQuete", "AR0319", 3)~ THEN BEGIN Fin
   SAY @6
   IF ~~ THEN EXIT
END

IF ~!NumTimesTalkedTo(0)
   !Global("ThThotVexe", "AR0319", 1)
   Global("ThRoleThot", "AR0319", 1)
   !Global("ThQuete", "AR0319", 3)
   ~ THEN BEGIN ReunionQuete
   SAY @7
   IF ~PartyHasItem("BOOK93")~ THEN DO ~IncrementGlobal("ThQuete", "AR0319", 1) TakePartyItem("BOOK93")~ REPLY @8  UNSOLVED_JOURNAL @9 GOTO Cuisine
   IF ~PartyHasItem("BOOK89")~ THEN DO ~IncrementGlobal("ThQuete", "AR0319", 1) TakePartyItem("BOOK89")~ REPLY @10  UNSOLVED_JOURNAL @11 GOTO Kaza
   IF ~PartyHasItem("MISCBW")~ THEN DO ~IncrementGlobal("ThQuete", "AR0319", 1) TakePartyItem("MISCBW")~ REPLY @12 UNSOLVED_JOURNAL @13 GOTO Sahuagin
   IF ~!PartyHasItem("BOOK93")
      !PartyHasItem("BOOK89")
      !PartyHasItem("MISCBW")~ THEN REPLY @14 GOTO Rien
END

IF ~!NumTimesTalkedTo(0)
   Global("ThThotVexe", "AR0319", 1)~ THEN BEGIN RencontreVexe
   SAY @15
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Question
   SAY @16
   IF ~~ THEN REPLY @17 DO ~SetGlobal("ThQuete", "AR0319", 0)~ GOTO Ouvrages
   IF ~~ THEN REPLY @18 EXIT
END

IF ~~ THEN BEGIN Vexe
   SAY @19
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Pervers
   SAY @20
   IF ~!Global("ThRoleThot", "AR0319", 1)~ THEN REPLY @21 DO ~SetGlobal("ThRoleThot", "AR0319", 1)~ GOTO Question
   IF ~~ THEN REPLY @22 EXIT
   IF ~~ THEN REPLY @23 DO ~SetGlobal("ThThotVexe", "AR0319", 1)~ GOTO Vexe
END

IF ~~ THEN BEGIN Ouvrages
   SAY @24
   IF ~PartyHasItem("BOOK93")~ THEN DO ~IncrementGlobal("ThQuete", "AR0319", 1) TakePartyItem("BOOK93")~ REPLY @8  UNSOLVED_JOURNAL @9  GOTO Cuisine
   IF ~PartyHasItem("BOOK89")~ THEN DO ~IncrementGlobal("ThQuete", "AR0319", 1) TakePartyItem("BOOK89")~ REPLY @10 UNSOLVED_JOURNAL @11 GOTO Kaza
   IF ~PartyHasItem("MISCBW")~ THEN DO ~IncrementGlobal("ThQuete", "AR0319", 1) TakePartyItem("MISCBW")~ REPLY @12 UNSOLVED_JOURNAL @13 GOTO Sahuagin
   IF ~!PartyHasItem("BOOK93")
      !PartyHasItem("BOOK89")
      !PartyHasItem("MISCBW")~ THEN REPLY @25 GOTO Rien
   IF ~~ THEN REPLY @26 DO ~SetGlobal("ThThotVexe", "AR0319", 1)~ GOTO Vexe
END

IF ~~ THEN BEGIN Cuisine
   SAY @27 
   IF ~~ THEN GOTO Recompense
END

IF ~~ THEN BEGIN Kaza
   SAY @28
   IF ~~ THEN GOTO Recompense
END

IF ~~ THEN BEGIN Sahuagin
   SAY @29
   IF ~~ THEN GOTO Recompense
END

IF ~~ THEN BEGIN Rien
   SAY @30
   IF ~~ THEN REPLY @31 EXIT
END

IF ~~ THEN BEGIN Recompense
   SAY @32
   IF ~Global("ThQuete", "AR0319", 1)~ THEN GOTO Bonus1
   IF ~Global("ThQuete", "AR0319", 2)~ THEN GOTO Bonus2
   IF ~Global("ThQuete", "AR0319", 3)~ THEN SOLVED_JOURNAL @33 GOTO Bonus3
END

IF ~~ THEN BEGIN Bonus1
   SAY @34
   IF ~~ THEN DO ~AddXPObject(Player1,10000)
   GiveItemCreate("MISC3P", LastTalkedToBy(Myself), 1, 0, 0)
   ~ EXIT
END

IF ~~ THEN BEGIN Bonus2
   SAY @35
   IF ~~ THEN DO ~AddXPObject(Player1,20000)
   ClearAllActions()
   StartCutSceneMode()
   StartCutScene("ThThoInt")
   ~ EXIT
END

IF ~~ THEN BEGIN Bonus3
   SAY @36
   IF ~~ THEN DO ~AddXPObject(Player1,50000)
   ClearAllActions()
   StartCutSceneMode()
   StartCutScene("ThThoVV")
   ~ EXIT
END

I_C_T ThThot Cuisine ComAerie
      == AERIEJ IF ~IsValidForPartyDialog("Aerie")~ THEN @37
END

I_C_T ThThot Kaza ComKorgan
      == KORGANJ IF ~IsValidForPartyDialog("Korgan")~ THEN @38 
END

I_C_T ThThot Sahuagin ComJan
      == JANJ IF ~IsValidForPartyDialog("Jan")~ THEN @39 = @40
END
