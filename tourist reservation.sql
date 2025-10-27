CREATE TABLE Tourist (
    TouristID NUMBER PRIMARY KEY,
    FullName VARCHAR2(100),
    Gender VARCHAR2(10),
    DateOfBirth DATE,
    PhoneNumber VARCHAR2(20),
    Email VARCHAR2(100),
    Address VARCHAR2(200)
);

CREATE TABLE Destination (
    DestinationID NUMBER PRIMARY KEY,
    Country VARCHAR2(50),
    City VARCHAR2(50)
);

CREATE TABLE Guide (
    GuideID NUMBER PRIMARY KEY,
    FullName VARCHAR2(100),
    PhoneNumber VARCHAR2(20),
    ExperienceYears NUMBER
);

CREATE TABLE TourPackage (
    TourPackageID NUMBER PRIMARY KEY,
    Title VARCHAR2(100),
    StartDate DATE,
    EndDate DATE,
    PricePerPerson NUMBER(10,2),
    DestinationID NUMBER,
    GuideID NUMBER,
    FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID),
    FOREIGN KEY (GuideID) REFERENCES Guide(GuideID)
);

CREATE TABLE Reservation (
    ReservationID NUMBER PRIMARY KEY,
    TouristID NUMBER,
    TourPackageID NUMBER,
    ReservationDate DATE,
    NumberOfPeople NUMBER,
    TotalCost NUMBER(10,2),
    PaymentStatus VARCHAR2(20),
    FOREIGN KEY (TouristID) REFERENCES Tourist(TouristID),
    FOREIGN KEY (TourPackageID) REFERENCES TourPackage(TourPackageID)
);

CREATE TABLE Hotel (
    HotelID NUMBER PRIMARY KEY,
    HotelName VARCHAR2(100),
    Location VARCHAR2(100),
    ContactNumber VARCHAR2(20),
    Email VARCHAR2(100),
    StarRating NUMBER
);

CREATE TABLE HotelBooking (
    BookingID NUMBER PRIMARY KEY,
    ReservationID NUMBER,
    HotelID NUMBER,
    CheckInDate DATE,
    CheckOutDate DATE,
    RoomType VARCHAR2(50),
    NumberOfRooms NUMBER,
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID),
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID)
);

CREATE TABLE Transport (
    TransportID NUMBER PRIMARY KEY,
    Type VARCHAR2(20),
    CompanyName VARCHAR2(100),
    ContactNumber VARCHAR2(20),
    Capacity NUMBER
);

CREATE TABLE TransportBooking (
    TransportBookingID NUMBER PRIMARY KEY,
    ReservationID NUMBER,
    TransportID NUMBER,
    PickupLocation VARCHAR2(100),
    DropoffLocation VARCHAR2(100),
    PickupDate DATE,
    DropoffDate DATE,
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID),
    FOREIGN KEY (TransportID) REFERENCES Transport(TransportID)
);

CREATE TABLE Payment (
    PaymentID NUMBER PRIMARY KEY,
    ReservationID NUMBER,
    PaymentDate DATE,
    AmountPaid NUMBER(10,2),
    PaymentMethod VARCHAR2(20),
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID)
);

INSERT INTO Tourist VALUES (1, 'Nejat Ebrahim', 'Female', TO_DATE('2003-05-12','YYYY-MM-DD'), '0911123456', 'nejat@gmail.com', 'Addis Ababa');
INSERT INTO Tourist VALUES (2, 'Amina Yusuf', 'Female', TO_DATE('1998-11-23','YYYY-MM-DD'), '0911988776', 'amina@gmail.com', 'Dire Dawa');
INSERT INTO Tourist VALUES (3, 'Abel Mekonnen', 'Male', TO_DATE('1985-02-10','YYYY-MM-DD'), '0911345678', 'abel@gmail.com', 'Bahir Dar');

INSERT INTO Destination VALUES (1, 'Ethiopia', 'Lalibela');
INSERT INTO Destination VALUES (2, 'Ethiopia', 'Simien Mountains');
INSERT INTO Destination VALUES (3, 'Ethiopia', 'Bale Mountains');

INSERT INTO Guide VALUES (1, 'Samuel Berhanu', '0911555666', 5);
INSERT INTO Guide VALUES (2, 'Mekdes Alemu', '0911223344', 4);
INSERT INTO Guide VALUES (3, 'Getahun Kebede', '0911445566', 7);

INSERT INTO TourPackage VALUES (1, 'Historic Route Tour', TO_DATE('2025-07-01','YYYY-MM-DD'), TO_DATE('2025-07-10','YYYY-MM-DD'), 300.00, 1, 1);
INSERT INTO TourPackage VALUES (2, 'Nature Trekking Tour', TO_DATE('2025-08-01','YYYY-MM-DD'), TO_DATE('2025-08-07','YYYY-MM-DD'), 500.00, 2, 2);
INSERT INTO TourPackage VALUES (3, 'Cultural Exploration', TO_DATE('2025-09-10','YYYY-MM-DD'), TO_DATE('2025-09-20','YYYY-MM-DD'), 450.00, 3, 3);

INSERT INTO Reservation VALUES (1, 1, 1, TO_DATE('2025-06-15','YYYY-MM-DD'), 2, 600.00, 'Paid');

INSERT INTO Reservation VALUES (2, 2, 2, TO_DATE('2025-07-10','YYYY-MM-DD'), 1, 500.00, 'Pending');
INSERT INTO Reservation VALUES (3, 3, 3, TO_DATE('2025-08-20','YYYY-MM-DD'), 3, 1350.00, 'Paid');
INSERT INTO Hotel VALUES (1, 'Lalibela Hotel', 'Lalibela', '0334455666', 'lalibelahotel@gmail.com', 4);
INSERT INTO Hotel VALUES (2, 'Simien Lodge', 'Debark', '0334567890', 'simienlodge@gmail.com', 5);
INSERT INTO Hotel VALUES (3, 'Bale Resort', 'Robe', '0334234567', 'baleresort@gmail.com', 4);

INSERT INTO HotelBooking VALUES (1, 1, 1, TO_DATE('2025-07-01','YYYY-MM-DD'), TO_DATE('2025-07-10','YYYY-MM-DD'), 'Deluxe', 1);
INSERT INTO HotelBooking VALUES (2, 2, 2, TO_DATE('2025-08-01','YYYY-MM-DD'), TO_DATE('2025-08-07','YYYY-MM-DD'), 'Standard', 2);
INSERT INTO HotelBooking VALUES (3, 3, 3, TO_DATE('2025-09-10','YYYY-MM-DD'), TO_DATE('2025-09-20','YYYY-MM-DD'), 'Suite', 3);

INSERT INTO Transport VALUES (1, 'Van', 'Ethio Tours Co', '0911777888', 12);
INSERT INTO Transport VALUES (2, 'Minibus', 'Highland Adventures', '0911002233', 18);
INSERT INTO Transport VALUES (3, 'Bus', 'Green Valley Transport', '0911456789', 30);

INSERT INTO TransportBooking VALUES (1, 1, 1, 'Addis Ababa Airport', 'Lalibela Town', TO_DATE('2025-07-01','YYYY-MM-DD'), TO_DATE('2025-07-10','YYYY-MM-DD'));
INSERT INTO TransportBooking VALUES (2, 2, 2, 'Gondar Airport', 'Simien Lodge', TO_DATE('2025-08-01','YYYY-MM-DD'), TO_DATE('2025-08-07','YYYY-MM-DD'));
INSERT INTO TransportBooking VALUES (3, 3, 3, 'Addis Ababa', 'Bale Mountains', TO_DATE('2025-09-10','YYYY-MM-DD'), TO_DATE('2025-09-20','YYYY-MM-DD'));

INSERT INTO Payment VALUES (1, 1, TO_DATE('2025-06-15','YYYY-MM-DD'), 600.00, 'Mobile');
INSERT INTO Payment VALUES (2, 2, TO_DATE('2025-07-11','YYYY-MM-DD'), 500.00, 'Credit Card');
INSERT INTO Payment VALUES (3, 3, TO_DATE('2025-08-21','YYYY-MM-DD'), 1350.00, 'Cash');


CREATE USER C##tour_admin IDENTIFIED BY ADMIN;
GRANT CONNECT, RESOURCE TO C##tour_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Tourist TO C##tour_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Reservation TO C##tour_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON TourPackage TO C##tour_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Destination TO C##tour_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Guide TO C##tour_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Hotel TO C##tour_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON HotelBooking TO C##tour_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Transport TO C##tour_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON TransportBooking TO C##tour_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Payment TO C##tour_admin;
REVOKE INSERT, UPDATE ON Payment FROM C##tour_admin;
REVOKE INSERT ON Guide FROM C##tour_admin;
REVOKE UPDATE ON TourPackage FROM C##tour_admin;
REVOKE DELETE ON Hotel FROM C##tour_admin;


BEGIN
    INSERT INTO Tourist (TouristID, FullName, Gender, DateOfBirth, PhoneNumber, Email, Address)
    VALUES (4, 'Helen Mekonnen', 'Female', TO_DATE('1998-09-15','YYYY-MM-DD'), '0911777888', 'helen@gmail.com', 'Adama');
    SAVEPOINT after_tourist_insert;
    INSERT INTO Reservation (ReservationID, TouristID, TourPackageID, ReservationDate, NumberOfPeople, TotalCost, PaymentStatus)
    VALUES (4, 4, 1, CURRENT_DATE, 1, 600.00, 'Not Paid'); -- Changed 999 to 1
    ROLLBACK TO SAVEPOINT after_tourist_insert;
    INSERT INTO Reservation (ReservationID, TouristID, TourPackageID, ReservationDate, NumberOfPeople, TotalCost, PaymentStatus)
    VALUES (4, 4, 1, CURRENT_DATE, 1, 600.00, 'Not Paid');
    COMMIT;
END;
/
BEGIN
    INSERT INTO Tourist (TouristID, FullName, Gender, DateOfBirth, PhoneNumber, Email, Address)
    VALUES (5, 'Abel Tadesse', 'Male', TO_DATE('2001-02-25','YYYY-MM-DD'), '0911666777', 'abel1@gmail.com', 'Dire Dawa');
    SAVEPOINT after_tourist;
    INSERT INTO Reservation (ReservationID, TouristID, TourPackageID, ReservationDate, NumberOfPeople, TotalCost, PaymentStatus)
    VALUES (5, 5, 1, CURRENT_DATE, 2, 900.00, 'Not Paid');
    SAVEPOINT after_reservation;
    INSERT INTO Payment (PaymentID, ReservationID, PaymentDate, AmountPaid, PaymentMethod)
    VALUES (4, 5, CURRENT_DATE, 900.00, 'Card'); -- Changed 999 to 5
    ROLLBACK TO SAVEPOINT after_reservation;
    INSERT INTO Payment (PaymentID, ReservationID, PaymentDate, AmountPaid, PaymentMethod)
    VALUES (4, 5, CURRENT_DATE, 900.00, 'Card'); -- Changed 5 to 4 to avoid PK violation
    COMMIT;
END;
/

CREATE SEQUENCE tourist_seq START WITH 10 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER trg_tourist_id
BEFORE INSERT ON Tourist
FOR EACH ROW
BEGIN
  IF :NEW.TouristID IS NULL THEN
    :NEW.TouristID := tourist_seq.NEXTVAL;
  END IF;
END;
/


CREATE SEQUENCE payment_seq START WITH 10 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER trg_payment_id
BEFORE INSERT ON Payment
FOR EACH ROW
BEGIN
  IF :NEW.PaymentID IS NULL THEN
    :NEW.PaymentID := payment_seq.NEXTVAL;
  END IF;
END;
/


CREATE SEQUENCE reservation_seq START WITH 10 INCREMENT BY 1;

CREATE OR REPLACE FUNCTION GET_TOURIST_TOTAL_PAYMENTS(p_tourist_id NUMBER)
RETURN NUMBER IS
    total_paid NUMBER := 0;
BEGIN
    SELECT NVL(SUM(p.AmountPaid), 0)
    INTO total_paid
    FROM Reservation r
    JOIN Payment p ON r.ReservationID = p.ReservationID
    WHERE r.TouristID = p_tourist_id;
    RETURN total_paid;
END;
/

SELECT GET_TOURIST_TOTAL_PAYMENTS(1) AS Total_Paid FROM DUAL;

CREATE OR REPLACE FUNCTION GET_PACKAGE_DURATION(p_package_id NUMBER)
RETURN NUMBER IS
    duration_days NUMBER;
BEGIN
    SELECT EndDate - StartDate
    INTO duration_days
    FROM TourPackage
    WHERE TourPackageID = p_package_id;
    RETURN duration_days;
END;
/

SELECT GET_PACKAGE_DURATION(1) AS Duration FROM DUAL;

CREATE OR REPLACE PROCEDURE ADD_NEW_TOURIST (
    p_fullname     IN Tourist.FullName%TYPE,
    p_gender       IN Tourist.Gender%TYPE,
    p_dob          IN Tourist.DateOfBirth%TYPE,
    p_phone        IN Tourist.PhoneNumber%TYPE,
    p_email        IN Tourist.Email%TYPE,
    p_address      IN Tourist.Address%TYPE
) IS
BEGIN
    
    INSERT INTO Tourist (FullName, Gender, DateOfBirth, PhoneNumber, Email, Address)
    VALUES (p_fullname, p_gender, p_dob, p_phone, p_email, p_address);
    COMMIT;
END;
/

BEGIN
    ADD_NEW_TOURIST(
        'Yordanos Fikre',
        'Female',
        TO_DATE('1997-11-23', 'YYYY-MM-DD'),
        '0911223344',
        'yordanos@gmail.com',
        'Gondar'
    );
END;
/

CREATE OR REPLACE PROCEDURE MAKE_RESERVATION (
    p_tourist_id       IN Reservation.TouristID%TYPE,
    p_tour_package_id  IN Reservation.TourPackageID%TYPE,
    p_reservation_date IN Reservation.ReservationDate%TYPE,
    p_num_people       IN Reservation.NumberOfPeople%TYPE,
    p_total_cost       IN Reservation.TotalCost%TYPE,
    p_payment_status   IN Reservation.PaymentStatus%TYPE
) IS
BEGIN
    INSERT INTO Reservation (
        ReservationID,
        TouristID,
        TourPackageID,
        ReservationDate,
        NumberOfPeople,
        TotalCost,
        PaymentStatus
    )
    VALUES (
        reservation_seq.NEXTVAL,
        p_tourist_id,
        p_tour_package_id,
        p_reservation_date,
        p_num_people,
        p_total_cost,
        p_payment_status
    );
    COMMIT;
END;
/
CREATE INDEX index_tourist_email ON Tourist (Email);
CREATE INDEX index_reservation_tourist_id ON Reservation (TouristID);
CREATE INDEX index_reservation_package_id ON Reservation (TourPackageID);
CREATE INDEX index_payment_reservation_id ON Payment (ReservationID);
-- Removed invalid indexes for HotelBooking and TransportBooking

CREATE INDEX index_hotelbooking_hotel_id ON HotelBooking (HotelID);
CREATE INDEX index_transportbooking_transport_id ON TransportBooking (TransportID);
CREATE INDEX index_tourpackage_destination_id ON TourPackage (DestinationID);
CREATE INDEX index_tourpackage_guide_id ON TourPackage (GuideID);
CREATE INDEX index_hotel_name ON Hotel (HotelName);
CREATE INDEX index_transport_type ON Transport (TransportID);

CREATE OR REPLACE VIEW Tourist_Reservations_View AS
SELECT 
    t.TouristID,
    t.FullName,
    r.ReservationID,
    r.TourPackageID,
    r.ReservationDate,
    r.NumberOfPeople,
    r.TotalCost,
    r.PaymentStatus
FROM Tourist t
JOIN Reservation r ON t.TouristID = r.TouristID;

CREATE OR REPLACE VIEW TourPackage_Details_View AS
SELECT
tp.TourPackageID,
    tp.Title AS PackageName,
    tp.StartDate,
    tp.EndDate,
    tp.PricePerPerson AS Price,
    d.Country,
    d.City,
    g.FullName AS GuideName,
    g.PhoneNumber AS GuidePhone
FROM TourPackage tp
JOIN Destination d ON tp.DestinationID = d.DestinationID
JOIN Guide g ON tp.GuideID = g.GuideID;


SELECT * FROM Tourist;
SELECT Gender, COUNT(*) AS Total FROM Tourist GROUP BY Gender;
SELECT * FROM Destination;
SELECT * FROM Guide;
SELECT * FROM Guide WHERE ExperienceYears >= 5;
SELECT * FROM TourPackage;
SELECT 
    TourPackageID,
    Title AS PackageName,
    StartDate,
    EndDate,
    (EndDate - StartDate) AS DurationDays
FROM TourPackage;
SELECT * FROM Reservation;
SELECT * FROM Reservation WHERE PaymentStatus = 'Paid';
SELECT * FROM Payment;
SELECT SUM(AmountPaid) AS TotalPayments FROM Payment;
SELECT * FROM Hotel;
SELECT * FROM HotelBooking;
SELECT * FROM HotelBooking WHERE RoomType = 'Deluxe';
SELECT * FROM Transport;
SELECT * FROM TransportBooking;
SELECT * FROM TransportBooking WHERE PickupLocation = 'Addis Ababa Airport';
SELECT table_name FROM user_tables;
SELECT table_name, column_name, data_type, data_length
FROM user_tab_columns
ORDER BY table_name;
SELECT table_name, constraint_name, constraint_type
FROM user_constraints
ORDER BY table_name;
SELECT index_name, table_name, uniqueness
FROM user_indexes;
SELECT sequence_name FROM user_sequences;

