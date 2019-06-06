-- Mostre um comando em SQL que mostre os dados disponiveis do censo para todas
-- as capitais de estado.
SELECT USCensus.*, USStates.StateName, USStates.CensusRegion, USStates.CensusRegionName, USStates.CensusDivision, USStates.CensusDivisionName, USStates.HouseSeats FROM 
    USCensus JOIN USStates ON 
    (USCensus.City = USStates.Capital) AND (USCensus.STATE = USStates.STATE) LIMIT 20;

-- Modifique esse comando para que ele mostre quais dados estao inconsistentes e
-- sugira como as tabelas devem ser corrigidas para evitar tais inconsistencias.
ALTER TABLE USStates ALTER COLUMN State TYPE TEXT;
