-- non equal join with equal join
SELECT ITEM_CNT, FACT.CAL_DT, ORDER_ID, WEEK_BEG_DT FROM
(
select sum(ITEM_COUNT) as ITEM_CNT, CAL_DT, TEST_ORDER.ORDER_ID
FROM TEST_KYLIN_FACT as TEST_KYLIN_FACT
INNER JOIN TEST_ORDER as TEST_ORDER
ON TEST_KYLIN_FACT.ORDER_ID = TEST_ORDER.ORDER_ID
GROUP BY CAL_DT, TEST_ORDER.ORDER_ID
) FACT
LEFT JOIN EDW.TEST_CAL_DT DT
ON FACT.CAL_DT = DT.CAL_DT AND WEEK_BEG_DT = DATE'2013-03-24'

