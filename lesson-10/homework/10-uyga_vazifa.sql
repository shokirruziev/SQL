Задания легкого уровня (10)

1. Сотрудники – 50 000 дан катта маошлар.

ВЫБЕРИТЕ E.Name AS ИмяСотрудника, E.Зарплата, D.НазваниеОтдела
ОТ сотрудников E
LEFT JOIN Departments D ON E.DepartmentID = D.DepartmentID
ГДЕ E.Зарплата > 50000;


2. Клиенты × Заказы – итоги 2023 г.

ВЫБРАТЬ C.Имя, C.Фамилия, O.ДатаЗаказа
ОТ клиентов C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
ГДЕ ГОД(O.OrderDate) = 2023;


3. Сотрудники + Подразделения – хамма ходимлар (NULL bo'lsa ham)

ВЫБЕРИТЕ E.Name AS EmployeeName, D.DepartmentName
ОТ сотрудников E
LEFT JOIN Отделы D ON E.DepartmentID = D.DepartmentID;


4. Поставщики + Продукция – хамма етказиб берувчилар

ВЫБЕРИТЕ S.НазваниеПоставщика, P.НазваниеПродукта
ОТ Поставщиков S
LEFT JOIN Товары P ON S.SupplierID = P.SupplierID;


5. Заказы + платежи – ветчина иккала томон, ветчина хатто йо'к бо'лса

ВЫБРАТЬ O.ID заказа, O.Дата заказа, P.Дата платежа, P.Сумма
ОТ Приказов О
ПОЛНОЕ ВНЕШНЕЕ ОБЪЕДИНЕНИЕ Платежи P ON O.OrderID = P.OrderID;


6. Сотрудники – менеджеры билан

ВЫБЕРИТЕ E.Name AS EmployeeName, M.Name AS ManagerName
ОТ сотрудников E
LEFT JOIN Сотрудники M ON E.ManagerID = M.EmployeeID;


7. Студенты – «Математика 101» курсига йозилганлар

ВЫБЕРИТЕ S.Name AS StudentName, C.CourseName
ОТ студентов S
ВНУТРЕННЕЕ СОЕДИНЕНИЕ Зачисления E ON S.StudentID = E.StudentID
ВНУТРЕННЕЕ СОЕДИНЕНИЕ Курсы C ON E.CourseID = C.CourseID
ГДЕ C.CourseName = 'Математика 101';


8. Клиенты – 3 предмета тадан ортик байюртма килганлар.

ВЫБРАТЬ C.Имя, C.Фамилия, O.Количество
ОТ клиентов C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
ГДЕ O.Количество > 3;


9. Сотрудники – отдел кадров bo'limidagi xodimlar

ВЫБЕРИТЕ E.Name AS EmployeeName, D.DepartmentName
ОТ сотрудников E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
ГДЕ D.DepartmentName = 'Отдел кадров';

🟠 Задачи среднего уровня (9)

1. Департаментларда 5 тадан ко'п ходимлар

SELECT D.DepartmentName, COUNT(E.EmployeeID) AS EmployeeCount
ИЗ Департаментов D
INNER JOIN Сотрудники E ON D.DepartmentID = E.DepartmentID
ГРУППИРОВАТЬ ПО D.НазваниеОтдела
HAVING COUNT(E.EmployeeID) > 5;


2. Хеч кахон сотилмаган продуктлар

SELECT P.ProductID, P.ProductName
ИЗ ПРОДУКТОВ P
LEFT JOIN Продажи S ON P.ProductID = S.ProductID
ГДЕ S.ProductID РАВЕН NULL;


3. Buyurtma qilgan mijozlar

SELECT C.FirstName, C.LastName, COUNT(O.OrderID) AS TotalOrders
ОТ клиентов C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
ГРУППИРОВАТЬ ПО C.Имя, C.Фамилия;


4. Сотрудники + Подразделения – faqat mos bo'lganlar

ВЫБЕРИТЕ E.Name AS EmployeeName, D.DepartmentName
ОТ сотрудников E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID;


5. Бир хил менеджерга бойсунадиган юфтликлар

ВЫБЕРИТЕ E1.Имя КАК Сотрудник1, E2.Имя КАК Сотрудник2, E1.IDМенеджера
ОТ сотрудников E1
ВНУТРЕННЕЕ СОЕДИНЕНИЕ Сотрудники E2 НА E1.ManagerID = E2.ManagerID
ГДЕ E1.EmployeeID < E2.EmployeeID И E1.ManagerID НЕ ЯВЛЯЕТСЯ NULL;


6. 2022-йылдаги буюртмалар+миджоз исми

SELECT O.OrderID, O.OrderDate, C.FirstName, C.LastName
ОТ Приказов О
INNER JOIN Customers C ON O.CustomerID = C.CustomerID
ГДЕ ГОД(O.OrderDate) = 2022;


7. Продажи бо'лими, маоши > 60000 бо'лган ходимлар

ВЫБЕРИТЕ E.Name AS ИмяСотрудника, E.Зарплата, D.НазваниеОтдела
ОТ сотрудников E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
ГДЕ D.НазваниеОтдела = 'Продажи' И E.Зарплата > 60000;


8. Заказы + Платежи – faqat mos kelganlar

ВЫБРАТЬ O.ID заказа, O.Дата заказа, P.Дата платежа, P.Сумма
ОТ Приказов О
ВНУТРЕННЕЕ СОЕДИНЕНИЕ Платежи P ON O.OrderID = P.OrderID;


9. Хеч качон буюртма цилинмаган продуктлар

SELECT P.ProductID, P.ProductName
ИЗ ПРОДУКТОВ P
LEFT JOIN Orders O ON P.ProductID = O.ProductID
ГДЕ O.ProductID РАВЕН NULL;

🔴 Задания сложного уровня (9)

1. О'з бо'лимидаги о'ртача маошдан ко'п ойлик оладиган ходимлар

ВЫБЕРИТЕ E.Name AS EmployeeName, E.Salary
ОТ сотрудников E
ВНУТРЕННЕЕ СОЕДИНЕНИЕ (
ВЫБЕРИТЕ DepartmentID, AVG(зарплата) AS AvgSalary
ОТ сотрудников
ГРУППИРОВАТЬ ПО ИДЕНТИФИКАТОРУ ОТДЕЛА
) A ON E.DepartmentID = A.DepartmentID
ГДЕ E.Зарплата > A.Средняя зарплата;


2. 2020-йилгача болган ва платежи йо'к буюртмалар

ВЫБРАТЬ O.OrderID, O.OrderDate
ОТ Приказов О
LEFT JOIN Платежи P ON O.OrderID = P.OrderID
ГДЕ O.OrderDate < '2020-01-01' И P.OrderID РАВЕН NULL;


3. Категория yo'q productlar

SELECT P.ProductID, P.ProductName
ИЗ ПРОДУКТОВ P
LEFT JOIN Категории C ON P.Category = C.CategoryID
ГДЕ C.CategoryID РАВЕН NULL;


4. Бир xil менеджер + 60000 дан катта маош

ВЫБЕРИТЕ E1.Имя КАК Сотрудник1, E2.Имя КАК Сотрудник2, E1.ID менеджера, E1.Зарплата
ОТ сотрудников E1
ВНУТРЕННЕЕ СОЕДИНЕНИЕ Сотрудники E2 НА E1.ManagerID = E2.ManagerID
ГДЕ E1.IDСотрудника < E2.IDСотрудника И E1.Зарплата > 60000;


5. Название отдела М билан бошланса

ВЫБЕРИТЕ E.Name AS EmployeeName, D.DepartmentName
ОТ сотрудников E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName LIKE 'M%';


6. Продажа – сумма 500 дан катта, билан продукта.

ВЫБРАТЬ S.SaleID, P.ProductName, S.SaleAmount
ОТ ПРОДАЖ S
ВНУТРЕННЕЕ СОЕДИНЕНИЕ Товары P НА S.ProductID = P.ProductID
ГДЕ S.SaleAmount > 500;


7. «Математика 101» для студентов

ВЫБЕРИТЕ S.StudentID, S.Name AS StudentName
ОТ студентов S
ГДЕ S.StudentID НЕТ В (
ВЫБЕРИТЕ E.StudentID
ОТ зачислений E
ВНУТРЕННЕЕ СОЕДИНЕНИЕ Курсы C ON E.CourseID = C.CourseID
ГДЕ C.CourseName = 'Математика 101'
);


8. Payment yo'q buyurtmalar

ВЫБРАТЬ O.OrderID, O.OrderDate, P.PaymentID
ОТ Приказов О
LEFT JOIN Платежи P ON O.OrderID = P.OrderID
ГДЕ P.PaymentID РАВЕН NULL;


9. Электроника yoki Мебельная продукцияlari

SELECT P.ProductID, P.ProductName, C.CategoryName
ИЗ ПРОДУКТОВ P
ВНУТРЕННЕЕ СОЕДИНЕНИЕ Категории C ON P.Category = C.CategoryID
WHERE C.CategoryName IN ('Электроника', 'Мебель');
