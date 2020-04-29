CREATE OR REPLACE FUNCTION gds.insert_reservation(une_date_debut timestamp without time zone,une_date_fin timestamp without time zone, 
un_nom_de_salle character varying(250)) RETURNS gds.reservation AS $$
DECLARE 
 une_reservation gds.reservation%ROWTYPE;
 id_salle INTEGER;
BEGIN 
SELECT id INTO id_salle FROM gds.salle WHERE nom = un_nom_de_salle;
IF FOUND 
THEN 
INSERT INTO gds.reservation (id, date_debut, date_fin, date_creation, date_modification,salle_id) 
VALUES (nextval('gds.reservation_seq'),une_date_debut, une_date_fin, now(), now(),id_salle) returning * INTO une_reservation;
ELSE 
RAISE NOTICE 'salle non trouvé';
END IF; 
RETURN une_reservation;
END;
$$ LANGUAGE plpgsql;