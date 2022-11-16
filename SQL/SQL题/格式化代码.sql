SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee AS e
    JOIN Department AS d ON e.departmentId = d.id
WHERE e.salary >= ALL(
        SELECT
            t.salary
        FROM
            Employee AS t
        WHERE
            e.departmentId = t.departmentId
    );