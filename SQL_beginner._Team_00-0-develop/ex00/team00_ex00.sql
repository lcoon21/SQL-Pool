WITH RECURSIVE find_cost (city1, city2, all_way, cost, level) AS
                     ((SELECT point1, point1, '{' || point1, way.cost, 1
                         FROM way
                        WHERE point1 = 'a'
                          AND point2 = 'a')
                      UNION ALL
                     (SELECT point1,
                             point2,
                             find_cost.all_way || ',' || way.point2,
                             find_cost.cost + way.cost,
                             level + 1
                        FROM find_cost
                                 JOIN way ON find_cost.city2 = way.point1
                       WHERE (level < 4 OR (level = 4 AND way.point2 = 'a'))
                         AND way.cost != 0
                         AND find_cost.city1 != way.point2))


SELECT cost AS total_cost, all_way || '}' AS tour
  FROM find_cost
 WHERE level = 5
   AND cost = (SELECT MIN(cost) FROM find_cost WHERE level = 5)
 ORDER BY total_cost, tour