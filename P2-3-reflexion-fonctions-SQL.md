2.1 Problèmes posés par cette fonction

Utiliser un VARCHAR(500) pour l'username prend trop de mémoire (et ne sert à rien)
Utiliser un VARCHAR(200) pour title prend trop de mémoire
utiliser Bigint pour an_act_id et a_ser_id prend trop de mémoire

2.2 Propositions de solution

passer le VARCHAR de l'username à 50
passer le VARCHAR du title à 100
utiliser un int à la place de bigint pour an_act_id et a_ser_id