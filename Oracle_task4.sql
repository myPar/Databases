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