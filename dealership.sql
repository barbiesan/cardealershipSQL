dealership.sql
CREATE TABLE Salesperson (
    salesperson_id INT NOT NULL AUTO_INCREMENT,
    salesperson_first_name VARCHAR(50) NOT NULL,
    salesperson_last_name VARCHAR(50) NOT NULL;
    PRIMARY KEY salesperso_id

INSERT INTO salesperson
    ([salesperso_id], [salesperson_first_name], [salesperson_last_name])
VALUES
    (1, 'Natasha', 'Koshka')
    (2, 'Gianni', 'James'),
    (3, 'Michelle', 'Cabaka');
   
CREATE TABLE Invoice (
    invoice_id SERIAL NOT NULL AUTO_INCREMENT,
    invoice_date DATETIME NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (car_id) REFERENCES CAR(car_id),
    FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id)
);

INSERT INTO Invoice
    ([invoice_id], [invoice_date],[customer_id], [car_id], [salesperson_id]);
VALUES
    ('1', '3-28-2022', '1', '1', '2'),
    ('2', '3-29-2022', '2', '2','3'),
    ('3', '3-30-2022', '3', '3', '1'); 
    
CREATE TABLE Car (
    car_id SERIAL NOT NULL AUTO_INCREMENT,
    model VARCHAR(30) NOT NULL,
    make varchar(30) NOT NULL,
    color varchar(20) NOT NULL,
    car_year INT NOT NULL,
    vin INT NOT NULL,
    PRIMARY KEY(car_id),
    FOREIGN KEY (customer_Id) REFERENCES customer(customer_Id),
);

INSERT INTO Cars
    ([car_id], [model], [make], [color], [car_year], [vin])
VALUES
    ('1', '328i', 'BMW', 'gray', '2022', '231'),
    ('2', 'models', 'Tesla', '2021','233'),
    ('3', 'C Class', 'Mercedez Benz', '2021', '234');

  CREATE TABLE customers (
    customer_id INT NOT NULL AUTO_INCREMENT,
    customer_first_name VARCHAR(50) NOT NULL,
    customer_last_name VARCHAR(50) NOT NULL,
    phone NUMERIC(11),
    custome_address VARCHAR(100) NOT NULL,
    PRIMARY KEY(customer_id)
);

INSERT INTO Customers
    ([customer_id], [customer_first_name], [customer_last_name], [phone], [customer_address])
VALUES
    (1, 'William', 'Arnolds',  '3232206066', '99 2nd st'),
    (2, 'David', 'Solorzano', '9495557799', '100 first st'),
    (3, 'Bette', 'Davis', '7471113344', NULL)
;

CREATE TABLE mechanic (
    mechanic_id INT NOT NULL 
    mechanic_first_name VARCHAR(50) NOT NULL,
    mechanic_last_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(mechanic_id)
    FOREIGN KEY (mechanic_id)REFERENCES mechanic(mechanic_id)
);

INSERT INTO mechanic
    ([mechanic_id], [mechanic_first_name], [mechanic_last_name])
    (1, 'Alejandro', 'Juarez')
    (2, 'Javier', 'Bardem')
    (3, 'Lorenzo', 'Lopez')
;

CREATE TABLE service_ticket (
    service_ticket_id SERIAL NOT NULL AUTO_INCREMENT,
    service_ticket_num INT NOT NULL,
    total_cost_repair NUMERIC(5,2),
    PRIMARY KEY(service_key_id)
    FOREIGN KEY (car_id)REFERENCES(car_id)
    FOREIGN KEY (customer_id)REFERENCES customer(customer_id)
    FOREIGN KEY (mechanic_id)REFERENCES mechanic(mechanic_id)
);

INSERT INTO service_ticket
    ([service_ticket_id], [service_ticket_num], [total_cost_repair]);
VALUES
    (1, '1', '5050.50'),
    (2, '2', '788.75'),
    (3, '3', '134.50')
;

SELECT *
FROM customer
WHERE vip_member = TRUE;

UPDATE customer
SET vip_member = FALSE;

SELECT customer_id, SUM(amount)
FROM invoice
GROUP BY customer_id
HAVING SUM(amount) >= 5000;


UPDATE customer 
SET amount = TRUE
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) >= 500o
);
CREATE OR REPLACE PROCEDURE vip_member_status()
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE customer 
	SET vip_member = TRUE
	WHERE customer_id IN (
		SELECT customer_id
		FROM payment
		GROUP BY customer_id
		HAVING SUM(amount) >= 500o
	);
END;
$$

SELECT *
FROM customer 
WHERE vip_member = TRUE;


SELECT customer_id, SUM(amount)
FROM payment 
GROUP BY customer_id 
HAVING SUM(amount) BETWEEN 4000 AND 5000;


INSERT INTO payment(customer_id,invoice_id)
VALUES(554, 1, 2, 5, '2022-06-03 10:43:00');

SELECT *
FROM customer c 
WHERE customer_id = 1;

CALL update_vip_member_status();

SELECT *
FROM customer c 
WHERE customer_id = 1;