-------------------------------------------------------------------------------------------------------
-- Caetano Traina Júnior -- Maio de 2019 --------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
SELECT * 
    FROM USStates left JOIN USCensus 
	     ON USStates.State = USCensus.State AND 
	        USStates.Capital = USCensus.City
    ORDER BY USStates.State
