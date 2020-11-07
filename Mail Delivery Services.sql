-- Create the Database in dbdiagram.io
Project post {
database_type: 'mysql'
Note: 'Package Delivery'
} 

table customer {
  customer_id integer [pk, increment]
  first_name varchar
  last_name varchar
  street varchar
  city varchar
}

table recipient {
  recipient_id integer [pk, increment]
  first_name varchar
  last_name varchar
  street varchar
  city varchar
}

table employee {
  employee_id int [pk , increment]
  first_name varchar
  last_name varchar
}

table postoffice {
  postoffice_id int [pk, increment]
  postoffice_name varchar
  postoffice_street varchar
  postoffice_city varchar
}

table package {
  package_id int [pk ,increment]
  package_type package_type
  delivery_type delivery_type
  sender_id integer
  recipient_id integer
  weight varchar
  tracking_number integer
  price float
}

table enroll {
  enroll_id int [pk, increment]
  package_id int
  enroll_type action_type
  time timestamp
  employee_id int
  location_id int
}

-- Creating dropwodn menu
Enum package_type {
  LETTER
  PACKAGE
}

Enum delivery_type {
  STANDARD
  EXPRESS
}

Enum enroll_type{
  STORE_PICKUP
  START_DELIVER
  END_DELIVERY
  STORE_HANDOUT
}

-- Create the foreign key
REF: package.package_id > enroll.package_id
REF: postoffice.postoffice_id > enroll.location_id
REF: employee.employee_id > enroll.employee_id
REF: customer.customer_id > package.sender_id
REF: recipient.recipient_id > package.recipient_id

-- Create JOINS in my SQL queries that connect more than 3 tables
SELECT package.tracking_number, enroll.enroll_id, enroll.enroll_type, enroll.time, postoffice.postoffice_name, package.package_id, customer.first_name AS SenderFirstName , customer.last_name AS SenderLastName, recipient.first_name AS RecipientFirstName, recipient.last_name AS RecipientLastName
FROM package
LEFT JOIN enroll ON package.package_id = enroll.package_id
INNER JOIN customer ON customer.customer_id = package.sender_id
INNER JOIN recipient ON recipient.recipient_id = package.recipient_id
INNER JOIN postoffice ON postoffice.postoffice_id = enroll.location_id

-- Show all packages and information
SELECT `package_id`, `package_type`, `delivery_type`, `sender_id`, `recipient_id`, `weight`, `tracking_number`, `price`, `start_date`, `end_date` FROM `package` WHERE 1

-- Show packages with delivery type STANDARD
SELECT package.package_id from package WHERE package.delivery_type = 'STANDARD'

-- Show packages with delivery type EXPRESS
SELECT package.package_id from package WHERE package.delivery_type = 'EXPRESS'

-- Show all employees and there names
SELECT `employee_id`, `first_name`, `last_name` FROM `employee` WHERE 1

-- Show all packages + sender and recipient
SELECT package.tracking_number, customer.first_name AS SenderFirstName, customer.last_name AS SenderLastName, recipient.first_name AS RecipientFirstName, recipient.last_name AS RecipientLastName FROM package INNER JOIN customer ON package.sender_id = customer.customer_id INNER JOIN recipient ON package.recipient_id = recipient.recipient_id

-- Show hole enroll
SELECT * FROM `enroll` WHERE 1