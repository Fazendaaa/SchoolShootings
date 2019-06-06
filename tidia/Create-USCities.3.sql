-------------------------------------------------------------------------------------------------------
-- Caetano Traina Júnior -- Maio de 2019 --------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

UPDATE USCensus SET City = REGEXP_REPLACE(SubString(City,'(.*)_.*$'), '_', ' ','g'),
                    Kind = Lower(SubString(City,'.*_(.*)$'));
    --SELECT USCensus.City, USCensus.Kind FROM USCensus WHERE State='WI';
