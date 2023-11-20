-- Insert into USER table
INSERT INTO "USER" ("UID", "FirstName", "LastName", "PhotoUrl", "Gender", "PhoneNumber", "CitizenID", "VerifiedFlag", "PaymentDetail_Bank", "PaymentDetail_Account", "ProfileDescription")
VALUES
  ('5dca69ac-36de-4f30-bf02-aab606f48b0f', 'John', 'Doe', 'https://example.com/johndoe.jpg', 'M', '123-456-78930', '1234567890122', true, 'ABC Bank', '123456789', 'My amazing profile description'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b10', 'Jane', 'Smith', 'https://example.com/janesmith.jpg', 'F', '987-3654-3210', '9876543210987', true, 'XYZ Bank', '987654321', 'My beautiful profile description'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b11', 'Alice', 'Johnson', 'https://example.com/alicejohnson.jpg', 'F', '5355-555-5555', '5555555355555', false, 'PQR Bank', '555555555', 'My lovely profile description'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b12', 'John', 'Doe', 'https://example.com/johndoe.jpg', 'M', '1323-456-7890', '1234567890121', true, 'ABC Bank', '123456789', 'My cute profile description'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b13', 'Jane', 'Smith', 'https://example.com/janesmith.jpg', 'F', '987-654-3210222', '9876543210984', true, 'XYZ Bank', '987654321', 'My professional profile description'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b14', 'Alice', 'Johnson', 'https://example.com/alicejohnson.jpg', 'F', '555-555-55553', '5555555555555', false, 'PQR Bank', '555555555', 'My profile description'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b15', 'John', 'Doe', 'https://example.com/johndoe.jpg', 'M', '123-456-789045', '1234567890123', true, 'ABC Bank', '123456789', 'This is the description'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b16', 'Jane', 'Smith', 'https://example.com/janesmith.jpg', 'F', '987-654-32101', '9876543210986', true, 'XYZ Bank', '987654321', ''),
  ('5dca69ac-36de-4f30-bf02-aab606f48b17', 'John', 'Doe', 'https://example.com/johndoe.jpg', 'M', '123-456-789022', '1234567890120', true, 'ABC Bank', '123456789', 'LOL');

-- Insert into CUSTOMER table
INSERT INTO "CUSTOMER" ("UID") VALUES
  ('5dca69ac-36de-4f30-bf02-aab606f48b0f'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b10'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b11');

-- Insert into WORKER table
INSERT INTO "WORKER" ("UID") VALUES
  ('5dca69ac-36de-4f30-bf02-aab606f48b12'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b13'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b14');



-- Insert into TASK table
INSERT INTO "TASK" ("TaskID", "Title", "Category", "Description", "Images", "Location", "State", "Wages", "StartDateTime", "EndDateTime", "VerifyFlag", "CustomerID")
VALUES
  ('5dca69ac-36de-4f30-bf02-aab606f48b18', 'Design Project 1', 'Graphic Design', 'Description of the task', 'URLs or Base64 encoded images', 'City Name', 'In Progress', 150.00, '2023-12-13T00:00:00Z', '2023-12-14T00:00:00Z', true, '5dca69ac-36de-4f30-bf02-aab606f48b0f'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b19', 'Design Project 2', 'Graphic Design', 'Description of the task', 'URLs or Base64 encoded images', 'City Name', 'In Progress', 100.00, '2023-12-15T00:00:00Z', '2023-12-16T00:00:00Z', true, '5dca69ac-36de-4f30-bf02-aab606f48b10'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b1a', 'Data Entry', 'Programming', 'Data entry task', NULL, 'Office', 'Completed', 50.00, '2023-12-14T00:00:00Z', '2023-12-15T00:00:00Z', true, '5dca69ac-36de-4f30-bf02-aab606f48b11');

-- Insert into WORK_IN table
INSERT INTO "WORK_IN" ("WorkerID", "TaskID", "Status")
VALUES
  ('5dca69ac-36de-4f30-bf02-aab606f48b12', '5dca69ac-36de-4f30-bf02-aab606f48b18', 'In Progress'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b13', '5dca69ac-36de-4f30-bf02-aab606f48b19', 'Completed'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b14', '5dca69ac-36de-4f30-bf02-aab606f48b1a', 'Completed');


-- Insert into TRANSACTION table
INSERT INTO "TRANSACTION" ("UID", "TRANS_ID", "Amount", "Status", "Datetime", "Type", "TaskID")
VALUES
  ('5dca69ac-36de-4f30-bf02-aab606f48b0f', '5dca69ac-36de-4f30-bf02-aab606f48b1c', 50.00, 'Completed', '2023-12-13T12:00:00Z', 'PayEarnest', '5dca69ac-36de-4f30-bf02-aab606f48b18'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b0f', '5dca69ac-36de-4f30-bf02-aab606f48b1e', 100.00, 'In Progress', '2023-12-14T14:00:00Z', 'PayRemain', '5dca69ac-36de-4f30-bf02-aab606f48b18'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b13', '5dca69ac-36de-4f30-bf02-aab606f48b20', 100.00, 'Completed', '2023-12-15T16:00:00Z', 'Deposit', '5dca69ac-36de-4f30-bf02-aab606f48b18');



-- Insert into ASSIGN_TASK table
INSERT INTO "ASSIGN_TASK" ("WorkerID", "TaskID", "CustomerID", "ReviewFromCustomer_Message", "ReviewFromCustomer_Rating", "ReviewFromWorker_Message", "ReviewFromWorker_Rating")
VALUES
  ('5dca69ac-36de-4f30-bf02-aab606f48b12', '5dca69ac-36de-4f30-bf02-aab606f48b18', '5dca69ac-36de-4f30-bf02-aab606f48b0f', 'Good experience', 5, 'Overcame challenges', 4),
  ('5dca69ac-36de-4f30-bf02-aab606f48b13', '5dca69ac-36de-4f30-bf02-aab606f48b19', '5dca69ac-36de-4f30-bf02-aab606f48b10', 'Satisfactory', 4, 'Completed on time', 5),
  ('5dca69ac-36de-4f30-bf02-aab606f48b14', '5dca69ac-36de-4f30-bf02-aab606f48b1a', '5dca69ac-36de-4f30-bf02-aab606f48b11', 'Met expectations', 3, 'Good performance', 4);

-- Insert into MESSAGE table
INSERT INTO "MESSAGE" ("UID", "RecpID", "Type", "Data", "Date")
VALUES
  ('5dca69ac-36de-4f30-bf02-aab606f48b12', '5dca69ac-36de-4f30-bf02-aab606f48b0f', 'MESSAGE', 'Hello', '2023-12-13T10:00:00Z'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b0f', '5dca69ac-36de-4f30-bf02-aab606f48b12', 'IMAGE', 'ImageURL', '2023-12-14T11:00:00Z'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b12', '5dca69ac-36de-4f30-bf02-aab606f48b0f', 'GEO', 'Coordinates', '2023-12-15T12:00:00Z');

  -- Insert into ADMIN table
INSERT INTO "ADMIN" ("UID", "LOGIN_KEY") VALUES
  ('5dca69ac-36de-4f30-bf02-aab606f48b15', E'\\x0123456789abcdef0123456789abcdef01234569'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b16', E'\\x0123456789abcdef0123456789abcdef0123456a'),
  ('5dca69ac-36de-4f30-bf02-aab606f48b17', E'\\x0123456789abcdef0123456789abcdef0123456b');
