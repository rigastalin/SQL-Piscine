SELECT  COALESCE ("user".name, 'not defined' ) AS name,
        COALESCE ("user".lastname, 'not defined') AS lastname,
        cur.name  AS currency_name,
        money*COALESCE((SELECT c.rate_to_usd AS rate_to_usd
            FROM currency AS c
            WHERE balance.currency_id = c.id AND c.updated < balance.updated
            ORDER BY c.updated DESC
            LIMIT 1),
               (SELECT c.rate_to_usd AS rate_to_usd
            FROM currency AS c
            WHERE balance.currency_id = c.id AND c.updated >= balance.updated
            ORDER BY c.updated ASC
            LIMIT 1)) AS currency_in_usd
FROM balance
FULL JOIN "user" ON balance.user_id = "user".id
JOIN (SELECT DISTINCT currency.id, currency.name  FROM currency) AS cur ON balance.currency_id = cur.id
ORDER BY name DESC, lastname, currency_name;
