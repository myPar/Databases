CREATE TABLE CashFlow(
    ReportDate DATE NOT NULL,
    ClientName VARCHAR2(20) NOT NULL,
    CCY VARCHAR2(5) NOT NULL,
    AmountCCY INTEGER NOT NULL
);

CREATE TABLE CurrencyRates(
    ReportDate DATE NOT NULL,
    CCY VARCHAR2(5) NOT NULL,
    CurrencyRate DECIMAL(6,3) NOT NULL
);

INSERT INTO CashFlow VALUES(TO_DATE('01.09.2020', 'DD/MM/YYYY'), 'КлиентA', 'RUB', 181)
INSERT INTO CashFlow VALUES(TO_DATE('01.09.2020', 'DD/MM/YYYY'), 'КлиентB', 'RUB', -71)
INSERT INTO CashFlow VALUES(TO_DATE('01.09.2020', 'DD/MM/YYYY'), 'КлиентC', 'RUB', 192)
INSERT INTO CashFlow VALUES(TO_DATE('01.09.2020', 'DD/MM/YYYY'), 'КлиентD', 'EUR', 100)
INSERT INTO CashFlow VALUES(TO_DATE('01.09.2020', 'DD/MM/YYYY'), 'КлиентE', 'USD', 184)
INSERT INTO CashFlow VALUES(TO_DATE('01.09.2020', 'DD/MM/YYYY'), 'КлиентF', 'RUB', -86)
INSERT INTO CashFlow VALUES(TO_DATE('01.09.2020', 'DD/MM/YYYY'), 'КлиентG', 'RUB', -148)
INSERT INTO CashFlow VALUES(TO_DATE('01.09.2020', 'DD/MM/YYYY'), 'КлиентH', 'RUB', -77)

INSERT INTO CashFlow VALUES(TO_DATE('02.09.2020', 'DD/MM/YYYY'), 'КлиентX', 'RUB', -149)
INSERT INTO CashFlow VALUES(TO_DATE('02.09.2020', 'DD/MM/YYYY'), 'КлиентK', 'RUB', 59)
INSERT INTO CashFlow VALUES(TO_DATE('02.09.2020', 'DD/MM/YYYY'), 'КлиентA', 'RUB', -59)
INSERT INTO CashFlow VALUES(TO_DATE('02.09.2020', 'DD/MM/YYYY'), 'КлиентM', 'EUR', -43)
INSERT INTO CashFlow VALUES(TO_DATE('02.09.2020', 'DD/MM/YYYY'), 'КлиентL', 'USD', 30)
INSERT INTO CashFlow VALUES(TO_DATE('02.09.2020', 'DD/MM/YYYY'), 'КлиентO', 'RUB', -78)
INSERT INTO CashFlow VALUES(TO_DATE('02.09.2020', 'DD/MM/YYYY'), 'КлиентG', 'RUB', 23)
INSERT INTO CashFlow VALUES(TO_DATE('02.09.2020', 'DD/MM/YYYY'), 'КлиентH', 'RUB', 37)

INSERT INTO CashFlow VALUES(TO_DATE('03.09.2020', 'DD/MM/YYYY'), 'КлиентA', 'RUB', -27)
INSERT INTO CashFlow VALUES(TO_DATE('03.09.2020', 'DD/MM/YYYY'), 'КлиентM', 'RUB', -121)
INSERT INTO CashFlow VALUES(TO_DATE('03.09.2020', 'DD/MM/YYYY'), 'КлиентL', 'RUB', 66)
INSERT INTO CashFlow VALUES(TO_DATE('03.09.2020', 'DD/MM/YYYY'), 'КлиентO', 'RUB', -197)
INSERT INTO CashFlow VALUES(TO_DATE('03.09.2020', 'DD/MM/YYYY'), 'КлиентG', 'USD', -147)
INSERT INTO CashFlow VALUES(TO_DATE('03.09.2020', 'DD/MM/YYYY'), 'КлиентH', 'EUR', -96)
INSERT INTO CashFlow VALUES(TO_DATE('03.09.2020', 'DD/MM/YYYY'), 'КлиентA', 'USD', 119)
INSERT INTO CashFlow VALUES(TO_DATE('03.09.2020', 'DD/MM/YYYY'), 'КлиентM', 'USD', 159)

INSERT INTO CashFlow VALUES(TO_DATE('04.09.2020', 'DD/MM/YYYY'), 'КлиентA', 'RUB', 80)
INSERT INTO CashFlow VALUES(TO_DATE('04.09.2020', 'DD/MM/YYYY'), 'КлиентM', 'RUB', -57)
INSERT INTO CashFlow VALUES(TO_DATE('04.09.2020', 'DD/MM/YYYY'), 'КлиентL', 'RUB', 146)
INSERT INTO CashFlow VALUES(TO_DATE('04.09.2020', 'DD/MM/YYYY'), 'КлиентO', 'RUB', 86)
INSERT INTO CashFlow VALUES(TO_DATE('04.09.2020', 'DD/MM/YYYY'), 'КлиентG', 'USD', 165)
INSERT INTO CashFlow VALUES(TO_DATE('04.09.2020', 'DD/MM/YYYY'), 'КлиентH', 'EUR', 135)
INSERT INTO CashFlow VALUES(TO_DATE('04.09.2020', 'DD/MM/YYYY'), 'КлиентA', 'USD', -134)
INSERT INTO CashFlow VALUES(TO_DATE('04.09.2020', 'DD/MM/YYYY'), 'КлиентM', 'USD', 192)

INSERT INTO CurrencyRates VALUES(TO_DATE('01.09.2020'), 'CHF', 81.623)
INSERT INTO CurrencyRates VALUES(TO_DATE('01.09.2020'), 'EUR', 87.827)
INSERT INTO CurrencyRates VALUES(TO_DATE('01.09.2020'), 'USD', 73.804)

INSERT INTO CurrencyRates VALUES(TO_DATE('02.09.2020'), 'CHF', 81.634)
INSERT INTO CurrencyRates VALUES(TO_DATE('02.09.2020'), 'EUR', 88.155)
INSERT INTO CurrencyRates VALUES(TO_DATE('02.09.2020'), 'USD', 73.585)

INSERT INTO CurrencyRates VALUES(TO_DATE('03.09.2020'), 'CHF', 80.870)
INSERT INTO CurrencyRates VALUES(TO_DATE('03.09.2020'), 'EUR', 87.737)
INSERT INTO CurrencyRates VALUES(TO_DATE('03.09.2020'), 'USD', 73.859)

INSERT INTO CurrencyRates VALUES(TO_DATE('04.09.2020'), 'CHF', 82.750)
INSERT INTO CurrencyRates VALUES(TO_DATE('04.09.2020'), 'EUR', 89.135)
INSERT INTO CurrencyRates VALUES(TO_DATE('04.09.2020'), 'USD', 75.468)

---1.
SELECT ClientName FROM CashFlow
WHERE CCY != 'USD'

---2.

SELECT CashFlow.ReportDate, CashFlow.CCY, CashFlow.AmountCCY, CurrencyRates.CurrencyRate FROM
CashFlow INNER JOIN CurrencyRates
ON CashFlow.CCY = CurrencyRates.CCY and CashFlow.ReportDate = CurrencyRates.ReportDate
WHERE CashFlow.CCY = 'EUR'

---3.
SELECT CashFlow.ReportDate, CashFlow.CCY, CashFlow.AmountCCY, CurrencyRates.CurrencyRate FROM
CashFlow INNER JOIN CurrencyRates
ON CashFlow.CCY = CurrencyRates.CCY and CashFlow.ReportDate = CurrencyRates.ReportDate
WHERE CashFlow.CCY = 'EUR' or CashFlow.CCY = 'USD'
ORDER BY CashFlow.ReportDate, CashFlow.CCY

---4.
SELECT ReportDate, CCY, AmountCCY, AmountCCY/AmountCCY AS CurrencyRate  FROM CashFlow WHERE CCY = 'RUB'
UNION ALL
SELECT CashFlow.ReportDate, CashFlow.CCY, CashFlow.AmountCCY, CurrencyRates.CurrencyRate 
FROM CashFlow INNER JOIN CurrencyRates 
ON CashFlow.CCY = CurrencyRates.CCY AND CashFlow.ReportDate = CurrencyRates.ReportDate

---5

SELECT CashFlow.ReportDate, CashFLow.CCY, CashFlow.AmountCCY, (CurrencyRates.CurrencyRate * CashFlow.AmountCCY) AS Amount_RUB FROM
CashFlow INNER JOIN CurrencyRates
ON CashFlow.ReportDate = CurrencyRates.ReportDate and CashFlow.CCY = CurrencyRates.CCY
UNION
SELECT ReportDate, CCY, AMOUNTCCY, AMOUNTCCY AS AMOUNT_RUB FROM CashFLow
WHERE CCY = 'RUB' 

---6
SELECT eu_table.ReportDate, eu_table.CCY, ROUND(eu_table.CurrencyRate / usd_table.CurrencyRate, 2) AS eu_to_usd FROM
(SELECT ReportDate, CCY, CurrencyRate FROM CurrencyRates WHERE CCY = 'EUR') eu_table
INNER JOIN
(SELECT ReportDate, CCY, CurrencyRate FROM CurrencyRates WHERE CCY = 'USD') usd_table
ON eu_table.ReportDate = usd_table.ReportDate

---7
SELECT ReportDate, CCY, SUM(AmountCCY) sum_amount FROM CashFlow
GROUP BY ReportDate, CCY
ORDER BY ReportDate

---8
SELECT ReportDate, CCY, SUM(Full_amount) AS Full_amount FROM
(SELECT eu_usd_amount.ReportDate, t.CCY, eu_usd_amount.Amount_USD AS full_amount FROM
(SELECT eu_usd_rate.ReportDate, eu_usd_rate.CCY, (eu_usd_rate.eu_to_usd * CashFlow.Amountccy) AS amount_usd  FROM
(SELECT eu_table.ReportDate, eu_table.CCY, ROUND(eu_table.CurrencyRate / usd_table.CurrencyRate, 2) AS eu_to_usd FROM
(SELECT ReportDate, CCY, CurrencyRate FROM CurrencyRates WHERE CCY = 'EUR') eu_table
INNER JOIN
(SELECT ReportDate, CCY, CurrencyRate FROM CurrencyRates WHERE CCY = 'USD') usd_table
ON eu_table.ReportDate = usd_table.ReportDate) eu_usd_rate
INNER JOIN CashFlow ON CashFlow.CCY = eu_usd_rate.CCY and CashFlow.ReportDate = eu_usd_rate.ReportDate) eu_usd_amount
FULL OUTER JOIN
(SELECT CCY FROM CurrencyRates WHERE CCY = 'USD' and ReportDate = TO_DATE('01.09.2020')) t
ON 1=1

UNION

SELECT ReportDate, CCY, SUM(AmountCCY) full_amount FROM CashFlow
WHERE CCY != 'EUR'
GROUP BY ReportDate, CCY) result_table
GROUP BY CCY, ReportDate
ORDER BY ReportDate