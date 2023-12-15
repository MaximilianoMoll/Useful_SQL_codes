-- Row-wise sum of BOOL columns of comorbidities after casting to INT and extraction of rows without comorbidities

WITH tmp AS(
		SELECT(
			SELECT SUM(t.f) AS total_comorb
			FROM (VALUES ("AIDS"::int), ("Angina"::int), ("Anomalia_cromosomica"::int), ("Anomalie_alte_vie_respiratorie"::int), ("Anomalie_basse_vie_respiratorie"::int), 
                   ("Aplasia_midollare"::int), ("Aritmia"::int), ("Asma"::int), ("Broncodisplasia"::int), ("Cardiopatia_congenita"::int), ("Coagulopatie"::int), 
                   ("Coagulopatie_da_farmaci"::int), ("Demenza"::int), ("Diabete_Tipo_I"::int), ("Diabete_Tipo_II_con_terapia_insulinica"::int), 
                   ("Diabete_Tipo_II_senza_terapia_insulinica"::int), ("Diabete_complicato"::int), ("Diabete_non_complicato"::int), ("Dipendenza_da_alcol"::int), 
                   ("Dipendenza_da_sostanze_stupefacenti"::int), ("Disturbo_della_coagulazione"::int), ("Dolore_cronico"::int), 
                   ("Emiplegia_o_paraplegia_o_tetraplegia"::int), ("Encefalopatia"::int), ("Enterocolite_necrotizzante"::int), ("Epatopatia_lieve"::int), 
                   ("Epatopatia_moderata_o_grave"::int), ("HIV"::int), ("Idrocefalo"::int), ("Immunodeficienza_congenita"::int), ("Immunosoppressione"::int), 
                   ("Infarto"::int), ("Infarto_miocardico"::int), ("Insuff_renale_grave"::int), ("Insuff_renale_lieve"::int), ("Insuff_renale_moderata"::int), 
                   ("Insufficienza_Renale_moderata_o_grave"::int), ("Insufficienza_renale_terminale"::int), ("Ipertensione"::int), ("Ipertensione_polmonare"::int), 
                   ("Ipertensione_sistemica"::int), ("Malattia_neuromuscolare_neurodegenerativa"::int), ("Malattia_vascolare_periferica"::int), 
                   ("Malattie_autoimmuni"::int), ("Malattie_ematologiche_maligne"::int), ("Malattie_endocrino_metaboliche"::int), ("Malattie_genetiche"::int), 
                   ("Malattie_polmonari_restrittive"::int), ("Malformazioni_cerebrali_o_della_teca_cranica"::int), ("Malformazioni_gastroenteriche"::int),
                   ("Malformazioni_gastroenteriche_operate"::int), ("Malformazioni_polmonari"::int), ("Malformazioni_disturbi_scheletrici"::int),
                   ("Malnutrizione_grave"::int), ("Miastenia"::int), ("Miocardiopatia"::int), ("Miocardite"::int), ("Miopatia"::int), ("Obesità_patologica"::int), 
                   ("Patologia_infiammatoria"::int), ("Patologia_psichiatrica"::int), ("Pneumopatia_cronica_grave"::int), ("Pneumopatia_cronica_lieve"::int), 
                   ("Pneumopatia_cronica_moderata"::int), ("Pneumopatia_cronica_ostruttiva_BPCO_grave"::int), ("Pneumopatia_cronica_ostruttiva_BPCO_moderata"::int),
                   ("Psicosi_grave"::int), ("Retinopatia"::int), ("SLA"::int), ("Sclerosi_multipla"::int), ("Scompenso_cardiaco_NYHA_classe_2_3_o_ACC_stadio_C"::int),
                   ("Scompenso_cardiaco_NYHA_classe_4_o_ACC_stadio_D"::int), ("Scompenso_cardiaco_classe_NYHA_1_2_3"::int), ("Scompenso_cardiaco_classe_NYHA_4"::int),
                   ("Terapia_antiaggregante"::int), ("Tumore"::int), ("Tumore_metastatizzato"::int), ("Tumore_senza_metastasi"::int), ("Ulcera_peptica"::int),
                   ("Valvulopatia"::int), ("Valvulopatia_non_congenita"::int), ("Vasculopatia"::int), ("Vasculopatia_cerebrale"::int), ("Altri_apparati"::int), 
                   ("Altri_rilievi"::int), ("Apparato_cardiocircolatorio"::int), ("Apparato_gastroenterico"::int), ("Apparato_neurologico"::int), ("Apparato_respiratorio"::int)) t(f)
		),"COMORBIDITIES".*
		FROM "COMORBIDITIES"
		)
SELECT * FROM tmp WHERE total_comorb=0
