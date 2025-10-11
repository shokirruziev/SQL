EASY LEVEL (7 ta topshiriq)

1️⃣
Показать все заказы, размещенные после 2022 года

SELECT O.OrderID, CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName, O.OrderDate
ОТ Приказов О
ПРИСОЕДИНЯЙТЕСЬ К КЛИЕНТАМ C ON O.CustomerID = C.CustomerID
ГДЕ ГОД(O.OrderDate) > 2022;


2️⃣
Отобразить сотрудников, работающих в отделе продаж или маркетинга

ВЫБЕРИТЕ E.Name AS EmployeeName, D.DepartmentName
ОТ сотрудников E
ПРИСОЕДИНЯЙТЕСЬ к отделам D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName IN ('Продажи', 'Маркетинг');


3️⃣
Показать самую высокую зарплату для каждого отдела

SELECT D.DepartmentName, MAX(E.Salary) AS MaxSalary
ОТ сотрудников E
ПРИСОЕДИНЯЙТЕСЬ к отделам D ON E.DepartmentID = D.DepartmentID
ГРУППИРОВАТЬ ПО D.НазваниеОтдела;


4️⃣
Перечислите всех клиентов из США, которые разместили заказы в 2023 году.

SELECT CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName, O.OrderID, O.OrderDate
ОТ клиентов C
ПРИСОЕДИНИТЬСЯ к заказам O ON C.CustomerID = O.CustomerID
ГДЕ C.Country = 'США' И ГОД(O.OrderDate) = 2023;


5️⃣
Показывать, сколько заказов сделал каждый клиент

SELECT CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName, COUNT(O.OrderID) AS TotalOrders
ОТ клиентов C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY CONCAT(C.FirstName, ' ', C.LastName);


6️⃣
Демонстрация продукции, поставляемой Gadget Supplies или Clothing Mart

ВЫБЕРИТЕ P.НазваниеПродукта, S.НазваниеПоставщика
ИЗ ПРОДУКТОВ P
ПРИСОЕДИНЯЙТЕСЬ к поставщикам S ON P.SupplierID = S.SupplierID
WHERE S.SupplierName IN ('Товары для гаджетов', 'Маркет одежды');


7️⃣
Для каждого клиента покажите его последний заказ (включая те, у которых его нет)

SELECT CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName, MAX(O.OrderDate) AS MostRecentOrderDate
ОТ клиентов C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY CONCAT(C.FirstName, ' ', C.LastName);

🟠 СРЕДНИЙ УРОВЕНЬ (6 та топширык)

1️⃣
Показывать клиентов, которые оформили заказ на общую сумму > 500

SELECT CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName, O.TotalAmount AS OrderTotal
ОТ Приказов О
ПРИСОЕДИНЯЙТЕСЬ К КЛИЕНТАМ C ON O.CustomerID = C.CustomerID
ГДЕ O.TotalAmount > 500;


2️⃣
Перечислите продажи продукции, которые были совершены в 2022 году или на сумму > 400

ВЫБРАТЬ P.НазваниеПродукта, S.ДатаПродажи, S.СуммаПродажи
ОТ ПРОДАЖ S
ПРИСОЕДИНЯЙТЕСЬ к продуктам P ON S.ProductID = P.ProductID
ГДЕ ГОД(S.SaleDate) = 2022 ИЛИ S.SaleAmount > 400;


3️⃣
Отобразить каждый продукт с общей суммой продаж

ВЫБРАТЬ P.НазваниеПродукта, СУММА(S.СуммаПродаж) КАК ОбщаяСуммаПродаж
ОТ ПРОДАЖ S
ПРИСОЕДИНЯЙТЕСЬ к продуктам P ON S.ProductID = P.ProductID
ГРУППИРОВАТЬ ПО P.НазваниеПродукта;


4️⃣
Сотрудники отдела кадров с зарплатой > 60000

ВЫБЕРИТЕ E.Name AS EmployeeName, D.DepartmentName, E.Salary
ОТ сотрудников E
ПРИСОЕДИНЯЙТЕСЬ к отделам D ON E.DepartmentID = D.DepartmentID
ГДЕ D.DepartmentName = 'Отдел кадров' И E.Salary > 60000;


5️⃣
Продано товаров в 2023 году и их запас > 100

ВЫБРАТЬ P.НазваниеПродукта, S.ДатаПродажи, P.КоличествоНаличии
ОТ ПРОДАЖ S
ПРИСОЕДИНЯЙТЕСЬ к продуктам P ON S.ProductID = P.ProductID
ГДЕ ГОД(S.ДатаПродажи) = 2023 И P.КоличествоНаличия > 100;


6️⃣
Сотрудники отдела продаж или нанятые после 2020 года

ВЫБЕРИТЕ E.Name AS EmployeeName, D.DepartmentName, E.HireDate
ОТ сотрудников E
ПРИСОЕДИНЯЙТЕСЬ к отделам D ON E.DepartmentID = D.DepartmentID
ГДЕ D.DepartmentName = 'Продажи' ИЛИ ​​ГОД(E.HireDate) > 2020;

🔴 ЖЕСТКИЙ УРОВЕНЬ (7 та топширик)

1️⃣
Заказы, сделанные клиентами из США с адресом, начинающимся с 4 цифр

SELECT CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName, O.OrderID, C.Address, O.OrderDate
ОТ клиентов C
ПРИСОЕДИНИТЬСЯ к заказам O ON C.CustomerID = O.CustomerID
ГДЕ C.Country = 'USA' И C.Address как '[0-9][0-9][0-9][0-9]%';


2️⃣
Продажи товаров категории «Электроника» или SaleAmount > 350

ВЫБРАТЬ P.НазваниеПродукта, P.Категория, S.СуммаПродажи
ОТ ПРОДАЖ S
ПРИСОЕДИНЯЙТЕСЬ к продуктам P ON S.ProductID = P.ProductID
ГДЕ P.Category = 'Электроника' ИЛИ ​​S.SaleAmount > 350;


3️⃣
Количество товаров в каждой категории

SELECT C.CategoryName, COUNT(P.ProductID) AS ProductCount
ИЗ ПРОДУКТОВ P
ПРИСОЕДИНИТЬСЯ к категориям C ON P.Category = C.CategoryID
ГРУППИРОВАТЬ ПО C.НазваниеКатегории;


4️⃣
Заказы из Лос-Анджелеса на сумму > 300

SELECT CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName, C.City, O.OrderID, O.TotalAmount AS Amount
ОТ клиентов C
ПРИСОЕДИНИТЬСЯ к заказам O ON C.CustomerID = O.CustomerID
ГДЕ C.City = 'Лос-Анджелес' И O.TotalAmount > 300;


5️⃣
Сотрудники отдела кадров или финансов, а также те, чьи имена содержат более 4 гласных букв

ВЫБЕРИТЕ E.Name AS EmployeeName, D.DepartmentName
ОТ сотрудников E
ПРИСОЕДИНЯЙТЕСЬ к отделам D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName IN («Отдел кадров», «Финансы»)
ИЛИ ДЛ(ЗАМЕНИТЬ(ЗАМЕНИТЬ(ЗАМЕНИТЬ(ЗАМЕНИТЬ(ЗАМЕНИТЬ(НИЖНИЙ(E.Name), 'a', ''), 'e', ​​''), 'i', ''), 'o', ''), 'u', '')) <= ДЛ(E.Name) - 4;


6️⃣
Сотрудники отдела продаж или маркетинга с зарплатой > 60000

ВЫБЕРИТЕ E.Name AS EmployeeName, D.DepartmentName, E.Salary
ОТ сотрудников E
ПРИСОЕДИНЯЙТЕСЬ к отделам D ON E.DepartmentID = D.DepartmentID
ГДЕ D.НазваниеОтдела IN ('Продажи', 'Маркетинг') AND E.Зарплата > 60000;
