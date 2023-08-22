USE PowerPlantDB
GO

-- Companies who do not own solar power plants
SELECT CompanyName, Email
FROM OWNER O
WHERE NOT EXISTS (SELECT *
                  FROM POWERPLANT P
				  WHERE Technology = 'Solar'
				  AND O.OwnerID = P.OwnerID);

-- Companies who own more than one solar plant
SELECT CompanyName, Email, Technology, COUNT(Technology) AS Solar_Count
FROM OWNER O, POWERPLANT P
WHERE O.OwnerID = P.OwnerID
GROUP BY CompanyName, Email, Technology
HAVING COUNT(*) > 1
AND Technology = 'Solar';

-- Powerplants that have a capacity >=150MW, capacity factor >=20% and <= 80%
SELECT PlantName, Technology, RatedCapacity, MinCF, MaxCF
FROM POWERPLANT P, SUPPLY S
WHERE P.SupplyType = S.SupplyType
AND NOT (RatedCapacity < 150
         OR MinCF < 0.20
		 OR MaxCF > 0.80);

-- Companies who own both solar and wind plants
SELECT CompanyName, Email
FROM OWNER O, POWERPLANT P
WHERE O.OwnerID = P.OwnerID
AND Technology = 'Solar'
INTERSECT
SELECT CompanyName, Email
FROM OWNER O, POWERPLANT P
WHERE O.OwnerID = P.OwnerID
AND Technology = 'Wind';

-- Companies who only own one type of technology
SELECT CompanyName, Email, Technology
FROM OWNER O, POWERPLANT P
WHERE O.OwnerID = P.OwnerID
AND P.Technology = ALL (SELECT P2.Technology
                        FROM OWNER O2, POWERPLANT P2
						WHERE O2.OwnerID = P2.OwnerID
						AND O.OwnerID = O2.OwnerID);