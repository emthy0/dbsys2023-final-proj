CREATE TYPE MESSAGE_TYPE AS ENUM('MESSAGE', 'IMAGE', 'GEO');
CREATE TYPE TRANSACTION_TYPE AS ENUM('PayEarnest', 'PayRemain', 'Deposit', 'CustomerRefund', 'WorkerRefund');
CREATE OR REPLACE FUNCTION get_duration( startd timestamptz , endd timestamptz)
RETURNS interval
AS $CODE$
BEGIN
    RETURN endd - startd;
END
$CODE$
LANGUAGE plpgsql IMMUTABLE;

CREATE TABLE "USER" (
    "UID" UUID NOT NULL,
    "FirstName" VARCHAR(255) NOT NULL,
    "LastName" VARCHAR(255) NOT NULL,
    "PhotoUrl" VARCHAR(255),
    "Gender" CHAR(1) NOT NULL CHECK ("Gender" IN ('M', 'F', 'O')),    
    "PhoneNumber" VARCHAR(20) NOT NULL,
    "CitizenID" VARCHAR(13),
    "VerifiedFlag" BOOLEAN NOT NULL,
    "PaymentDetail_Bank" VARCHAR(255),
    "PaymentDetail_Account" VARCHAR(255),
    "ProfileDescription" TEXT,
    PRIMARY KEY ("UID"),
    -- Unique Constraint: Ensure each User has a unique phone number and citizen id
    CONSTRAINT unique_phone_number UNIQUE ("PhoneNumber"),
    CONSTRAINT unique_citizen_id UNIQUE ("CitizenID")
);

CREATE TABLE "MESSAGE" (
    "UID" UUID NOT NULL,
    "RecpID" UUID NOT NULL,
    "Type" MESSAGE_TYPE NOT NULL,
    "Data" TEXT NOT NULL,
    "Date" timestamptz NOT NULL,
    PRIMARY KEY ("UID", "RecpID", "Date"),
    CONSTRAINT fk_uid FOREIGN KEY ("UID") REFERENCES "USER"("UID")
);

CREATE TABLE "CUSTOMER" (
    "UID" UUID NOT NULL,
    PRIMARY KEY ("UID"),
    CONSTRAINT fk_uid FOREIGN KEY ("UID") REFERENCES "USER"("UID")
);

CREATE TABLE "WORKER" (
    "UID" UUID NOT NULL,
    PRIMARY KEY ("UID"),
    CONSTRAINT fk_uid FOREIGN KEY ("UID") REFERENCES "USER"("UID")
);

CREATE TABLE "ADMIN" (
    "UID" UUID NOT NULL,
    "LOGIN_KEY" bytea NOT NULL,
    PRIMARY KEY ("UID"),
    CONSTRAINT fk_uid FOREIGN KEY ("UID") REFERENCES "USER"("UID")
);

CREATE TABLE "TASK" (
    "TaskID" UUID NOT NULL,
    "Title" VARCHAR(255) NOT NULL,
    "Category" VARCHAR(255) NOT NULL,
    "Description" TEXT,
    "Images" TEXT,
    "Location" VARCHAR(255),
    "State" VARCHAR(255) NOT NULL,
    "Wages" DOUBLE PRECISION NOT NULL,
    "StartDateTime" timestamptz NOT NULL,
    "EndDateTime" timestamptz NOT NULL,
    "Duration" interval GENERATED ALWAYS AS (get_duration("StartDateTime", "EndDateTime")) STORED,
    "VerifyFlag" BOOLEAN NOT NULL,
    "CustomerID" UUID NOT NULL,
    PRIMARY KEY ("TaskID"),
    FOREIGN KEY ("CustomerID") REFERENCES "USER"("UID"),
    -- Data Integrity: Ensure that the StartDateTime is always before EndDateTime in the TASK table
    CONSTRAINT check_start_end_dates CHECK ("StartDateTime" < "EndDateTime"),
    -- Data Integrity: Ensure that the wages is positive values
    CONSTRAINT check_positive_wages CHECK ("Wages" > 0)
);

CREATE TABLE "TRANSACTION" (
    "UID" UUID NOT NULL,
    "TRANS_ID" UUID NOT NULL,
    "Amount" DOUBLE PRECISION NOT NULL,
    "Status" VARCHAR(255) NOT NULL CHECK ("Status" IN ('In Progress', 'Completed')),
    "Datetime" timestamptz NOT NULL,
    "Type" TRANSACTION_TYPE NOT NULL,
    "TaskID" UUID NOT NULL,
    PRIMARY KEY ("TRANS_ID"),
    CONSTRAINT fk_uid FOREIGN KEY ("UID") REFERENCES "USER"("UID"),
    CONSTRAINT fk_task_id FOREIGN KEY ("TaskID") REFERENCES "TASK"("TaskID") 
);

CREATE TABLE "WORK_IN" (
    "WorkerID" UUID NOT NULL,
    "TaskID" UUID NOT NULL,
    "Status" VARCHAR(255) NOT NULL CHECK ("Status" IN ('In Progress', 'Completed')),
    PRIMARY KEY ("WorkerID", "TaskID"),
    CONSTRAINT fk_worker_id FOREIGN KEY ("WorkerID") REFERENCES "WORKER"("UID"),
    CONSTRAINT fk_task_id FOREIGN KEY ("TaskID") REFERENCES "TASK"("TaskID")
);

CREATE TABLE "ASSIGN_TASK" (
    "WorkerID" UUID NOT NULL,
    "TaskID" UUID NOT NULL,
    "CustomerID" UUID NOT NULL,
    "ReviewFromCustomer_Message" TEXT,
    "ReviewFromCustomer_Rating" INT,
    "ReviewFromWorker_Message" TEXT,
    "ReviewFromWorker_Rating" INT,
    PRIMARY KEY ("WorkerID", "TaskID", "CustomerID"),
    CONSTRAINT fk_worker_id FOREIGN KEY ("WorkerID") REFERENCES "WORKER"("UID"),
    CONSTRAINT fk_task_id FOREIGN KEY ("TaskID") REFERENCES "TASK"("TaskID"),
    CONSTRAINT fk_customer_id FOREIGN KEY ("CustomerID") REFERENCES "CUSTOMER"("UID"),
    -- Data Integrity: Review score has to be greater than 0 and less than 5
    CONSTRAINT check_rating CHECK ("ReviewFromCustomer_Rating" >= 0 AND "ReviewFromCustomer_Rating" <= 5 AND "ReviewFromWorker_Rating" >= 0 AND "ReviewFromWorker_Rating" <= 5)
);