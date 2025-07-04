CREATE TABLE
	HRIDRemapper (id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT);

INSERT INTO
	HRIDRemapper (Type)
SELECT
	Type
FROM
	Religions
ORDER BY
	ID;

UPDATE Religions
SET
	ID = (
		SELECT
			HRIDRemapper.id -1
		FROM
			HRIDRemapper
		WHERE
			Religions.Type = HRIDRemapper.Type
	);

DROP TABLE HRIDRemapper;