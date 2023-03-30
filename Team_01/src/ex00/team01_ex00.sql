WITH currency_tbl AS (SELECT currency.id AS currency_id, name AS currency_name, rate_to_usd, updated FROM currency
    JOIN (SELECT  id, MAX(updated) AS last_updated
          FROM currency
          GROUP BY id
      ) AS c ON last_updated = currency.updated AND c.id = currency.id),
    balance_tbl AS (SELECT balance.user_id AS user_id,
                         balance.type AS type,
                         sum(money) AS volume,
                         balance.currency_id AS currency_id
                  FROM balance
                      GROUP BY balance.user_id, balance.type, balance.currency_id),
    tbl AS (SELECT *
            FROM "user"
            RIGHT JOIN balance_tbl ON "user".id = balance_tbl.user_id
            LEFT JOIN currency_tbl ON balance_tbl.currency_id = currency_tbl.currency_id
            ORDER BY name DESC, lastname, type
            )
SELECT  COALESCE (name, 'not defined' ) AS name,
        COALESCE (lastname, 'not defined') AS lastname,
        type,
        volume,
        COALESCE (currency_name, 'not defined' ) AS currency_name,
        COALESCE (rate_to_usd, 1) AS last_rate_to_usd,
        COALESCE (rate_to_usd*volume, volume) AS total_volume_in_usd
FROM tbl
ORDER BY name DESC, lastname, type;