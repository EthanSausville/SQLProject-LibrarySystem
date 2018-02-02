-- Ethan Sausville		Last Modified: 2/1/2018
-- Note you must execute each block of code individually
-- or you will get errors

-- Block 0: Reset to Rerun
Use master
Drop Database dbLibraryProject
	
	
-- Block 1: Create Database
Create Database dbLibraryProject
Use dbLibraryProject

	
-- Block 2: Create Books Schema
Create Schema Books;
	Go
	Create Table Books.Books (
		BookID Int Primary Key Not Null Identity(1,1),
		BookTitle varchar(50) Not Null,
		BookPublisher varchar(50) Not Null
	);
	
	Create Table Books.Authors (
		BookID Int Not Null,
		AuthorName varchar(50) Not Null
	);
	
	Create Table Books.Publisher (
		BookPublisher varchar(50) Not Null,
		PublisherAddress varchar(100) Not Null,
		PublisherPhone varchar(25) Not Null
	);


-- Block 3: Create Tracking Schema
Create Schema Tracking
	Go
		Create Table Tracking.Loans (
			BookID Int Not Null,
			BranchID Int Not Null,
			CardNo varchar(30) Not Null, 
			DateOut Date Not Null,
			DateDue Date Not Null
		);

		Create Table Tracking.Borrowers (
			CardNo varchar(30) Primary Key Not Null,
			BorrowerName varchar(50) Not Null,
			BorrowerAddress varchar(100) Not Null,
			BorrowerPhone varchar(25) Not Null
		);

		Create Table Tracking.BookCopies (
			BookID Int Not Null,
			BranchID Int Not Null,
			Copies Int Not Null
		);

		Create Table Tracking.Branch (
			BranchID Int Primary Key Not Null,
			BranchName varchar(50) Not Null,
			BranchAddress varchar(100) Not Null
		);


-- Block 4: Insert Data into Tables
Insert Into Books.Books
	(BookTitle, BookPublisher)
	Values
		('The Lost Tribe', 'Writers Digest Books'),
		('A Bridge too Far ', 'Simon & Schuster'),
		('Conflict & Suspense', 'Writers Digest Books'),
		('Revision and Self-Editing for Publication ', 'Writers Digest Books'),
		('A History of the American People', 'Harper Collins'),
		('The Holy Bible', 'Harper Collins'),
		('The Jungle Book', 'Barnes & Noble Classics'),
		('The 39 Steps', 'Harper Collins'),
		('The Four Feathers', 'Barnes & Noble Classics'),
		('Little Women', 'Barnes & Noble Classics'),
		('The Scarlet Pimpernel', 'Barnes & Noble Classics'),
		('Hard Times', 'Barnes & Noble Classics'),
		('Sherlock Holmes', 'Barnes & Noble Classics'),
		('The Counte of Monte Christo', 'Barnes & Noble Classics'),
		('Modern Times', 'Harper Collins'),
		('A History of the Jews', 'Harper Collins'),
		('1776', 'Simon & Schuster'),
		('John Adams', 'Simon & Schuster'),
		('Brave Companions', 'Simon & Schuster'),
		('The Last Battle', 'Simon & Schuster'),
		('The Longest Day', 'Simon & Schuster'),
		('It', 'Simon & Schuster'),
		('The Dark Tower', 'Simon & Schuster')
	;

Insert Into Books.Authors
	(BookID, AuthorName)
	Values 
		(1, 'Sharon Hamilton'),
		(2, 'Cornelius Ryan'),
		(3, 'James Scott Bell'),
		(4, 'James Scott Bell'),
		(5, 'Paul Johnson'),
		(6, 'Various'),
		(7, 'Rudyard Kipling'),
		(8, 'John Buchan'),
		(9, 'AEW Mason'),
		(10, 'Louisa May Alcott'),
		(11, 'Baroness Orczy'),
		(12, 'Charles Dickens'),
		(13, 'Sir Arthur Conan Doyle'),
		(14, 'Alexander Dumas'),
		(15, 'Paul Johnson'),
		(16, 'Paul Johnson'),
		(17, 'David McCullough'),
		(18, 'David McCullough'),
		(19, 'David McCullough'),
		(20, 'Cornelius Ryan'),
		(21, 'Cornelius Ryan'),
		(22, 'Stephen King'),
		(23, 'Stephen King')
	;

Insert Into Books.Publisher
	(BookPublisher, PublisherAddress, PublisherPhone)
	Values
		('Barnes & Noble Classics', '122 Fifth Avenue, New York, NY 10011', '(123)-985-8857'),
		('Harper Collins', '195 Broadway, New York, NY 10007', '(123)-253-2463'),
		('Simon & Schuster', '1230 Avenue of the Americas, 10th F, New York, NY 10020', '(123)-268-4342'),
		('Writers Digest Books', '1140 Broadway, 14th Floor, New York, NY 10001', '(123)-758-6619')
	;

Insert Into Tracking.Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	Values
		(17, 101, '0168-2345-4255-0928', '2018-01-17', '2018-03-03'),
		(19, 102, '0168-2345-4255-0928', '2018-01-29', '2018-03-15'),
		(6, 104, '0199-6545-9095-3863', '2018-01-26', '2018-03-12'),
		(20, 106, '0199-6545-9095-3863', '2018-01-29', '2018-03-15'),
		(6, 104, '0567-0278-3344-3632', '2018-01-21', '2018-03-07'),
		(13, 104, '0567-0278-3344-3632', '2018-01-20', '2018-03-06'),
		(11, 104, '1611-2089-4461-8885', '2017-12-16', '2018-01-30'),
		(13, 101, '1897-2453-8806-5170', '2018-01-17', '2018-03-03'),
		(12, 103, '2088-2809-5807-5549', '2018-01-31', '2018-03-17'),
		(12, 104, '2088-2809-5807-5549', '2018-01-20', '2018-03-06'),
		(7, 101, '2142-4251-9730-6250', '2017-12-29', '2018-02-12'),
		(7, 101, '2142-4251-9730-6250', '2018-01-15', '2018-03-01'),
		(22, 101, '2348-0161-2900-9890', '2018-01-25', '2018-03-11'),
		(20, 102, '2462-4021-5334-2423', '2017-12-17', '2018-01-31'),
		(10, 104, '2474-0539-6166-3051', '2018-01-17', '2018-03-03'),
		(19, 101, '2474-0539-6166-3051', '2017-12-16', '2018-01-30'),
		(22, 102, '2474-0539-6166-3051', '2017-12-27', '2018-02-10'),
		(9, 105, '2474-0539-6166-3051', '2018-01-17', '2018-03-03'),
		(9, 105, '2474-0539-6166-3051', '2017-12-29', '2018-02-12'),
		(19, 102, '2474-0539-6166-3051', '2017-12-21', '2018-02-04'),
		(23, 102, '2596-8686-6536-9411', '2018-01-18', '2018-03-04'),
		(4, 101, '2724-8686-1286-4015', '2017-12-26', '2018-02-09'),
		(11, 104, '2918-7096-0483-9398', '2018-01-13', '2018-02-27'),
		(17, 102, '3143-0426-6905-3452', '2018-01-03', '2018-02-17'),
		(21, 102, '3168-6021-6120-4958', '2018-02-01', '2018-03-18'),
		(1, 101, '3237-7581-6934-1151', '2018-01-16', '2018-03-02'),
		(22, 101, '3237-7581-6934-1151', '2017-12-19', '2018-02-02'),
		(7, 101, '3406-8900-4753-6546', '2018-01-22', '2018-03-08'),
		(2, 102, '3465-5591-4290-2378', '2018-01-01', '2018-02-15'),
		(10, 102, '3465-5591-4290-2378', '2018-01-18', '2018-03-04'),
		(21, 105, '3603-9534-0869-2745', '2018-01-12', '2018-02-26'),
		(22, 102, '3882-4022-0208-1081', '2018-01-31', '2018-03-17'),
		(22, 102, '3954-4654-6984-9489', '2018-01-26', '2018-03-12'),
		(21, 105, '4816-0709-9220-0840', '2018-01-08', '2018-02-22'),
		(19, 101, '5333-3243-0507-5678', '2017-12-28', '2018-02-11'),
		(2, 101, '5546-1799-4689-7305', '2017-12-28', '2018-02-11'),
		(1, 106, '6144-9813-6132-5755', '2018-01-20', '2018-03-06'),
		(7, 101, '6144-9813-6132-5755', '2017-12-30', '2018-02-13'),
		(11, 106, '6144-9813-6132-5755', '2017-12-20', '2018-02-03'),
		(20, 102, '6144-9813-6132-5755', '2017-12-19', '2018-02-02'),
		(21, 105, '6144-9813-6132-5755', '2018-01-21', '2018-03-07'),
		(4, 101, '6151-7933-1584-3941', '2018-01-13', '2018-02-27'),
		(13, 104, '6151-7933-1584-3941', '2018-01-25', '2018-03-11'),
		(19, 101, '6204-4778-0473-1901', '2017-12-24', '2018-02-07'),
		(8, 106, '6211-5986-7306-8181', '2017-12-24', '2018-02-07'),
		(17, 101, '7264-9606-5306-3102', '2018-01-14', '2018-02-28'),
		(18, 103, '7264-9606-5306-3102', '2018-01-28', '2018-03-14'),
		(12, 104, '8503-2372-9073-0494', '2018-01-29', '2018-03-15'),
		(10, 102, '9220-2899-9970-2138', '2018-01-16', '2018-03-02'),
		(18, 103, '9220-2899-9970-2138', '2018-01-11', '2018-02-25'),
		(20, 106, '9220-2899-9970-2138', '2018-01-05', '2018-02-19'),
		(14, 101, '9467-9565-2437-8128', '2018-01-16', '2018-03-02'),
		(11, 106, '9541-1745-0531-3269', '2018-01-30', '2018-03-16'),
		(22, 101, '9863-7409-3386-9104', '2018-01-11', '2018-02-25')
	;

Insert Into Tracking.Borrowers
	(CardNo, BorrowerName, BorrowerAddress, BorrowerPhone)
	Values
		('0168-2345-4255-0928', 'Kaiya A. Page', '11516 Atlantic Avenue,  Missouri', '(491)-048-7463'),
		('0199-6545-9095-3863', 'Jaycee K. Hernandez', '3871 Maple Street,  Missouri', '(491)-595-9303'),
		('0343-0272-6020-6552', 'Kenzie J. Powell', '2962 Mulberry Court,  Missouri', '(491)-451-3863'),
		('0567-0278-3344-3632', 'Milo E. Pineda', '16599 Mechanic Street,  Missouri', '(491)-831-7761'),
		('0713-3100-6614-7977', 'Prince A. Lynch', '7435 Lawrence Street,  Missouri', '(491)-123-4589'),
		('0963-2991-5759-6064', 'Maia K. Rubio', '12461 Hillside Avenue,  Missouri', '(491)-527-6824'),
		('1146-1302-7221-6902', 'Colin K. Rubio', '12758 Bank Street,  Missouri', '(491)-317-9228'),
		('1611-2089-4461-8885', 'Jayden B. Love', '16171 Adams Avenue,  Missouri', '(491)-566-7843'),
		('1897-2453-8806-5170', 'Sherlyn H. Wu', '15041 Eagle Road,  Missouri', '(491)-962-5246'),
		('2088-2809-5807-5549', 'Stacy A. Spence', '10151 Laurel Street,  Missouri', '(491)-371-6494'),
		('2142-4251-9730-6250', 'Evelin M. Powell', '8779 Front Street,  Missouri', '(491)-450-6872'),
		('2348-0161-2900-9890', 'Billy C. Choi', '17818 Holly Court, Hoover Missouri', '(491)-958-1103'),
		('2462-4021-5334-2423', 'Aden A. Petty', '19496 College Avenue,  Missouri', '(491)-136-3744'),
		('2474-0539-6166-3051', 'Josiah L. Wallace', '7782 East Avenue, Danshill Missouri', '(491)-721-1672'),
		('2558-3926-4134-4143', 'Maia L. Horton', '314 Hillside Avenue,  Missouri', '(491)-034-5216'),
		('2596-8686-6536-9411', 'Annie B. Spencer', '482 Pheasant Run,  Missouri', '(491)-834-9895'),
		('2724-8686-1286-4015', 'Lana B. Hamilton', '7492 Oxford Court,  Missouri', '(491)-855-6913'),
		('2918-7096-0483-9398', 'Jackson N. Tanner', '15656 Canterbury Road,  Missouri', '(491)-005-5290'),
		('3143-0426-6905-3452', 'Kaia J. Sutton', '17543 14th Street,  Missouri', '(491)-129-4906'),
		('3168-6021-6120-4958', 'Braelyn H. Dickson', '12626 6th Avenue,  Missouri', '(491)-534-5990'),
		('3237-7581-6934-1151', 'Mark T. Gardner', '15015 Eagle Road,  Missouri', '(491)-985-6252'),
		('3406-8900-4753-6546', 'Francesca J. Lynch', '6239 Ivy Lane,  Missouri', '(491)-032-7146'),
		('3465-5591-4290-2378', 'Kane J. Robles', '8782 Mechanic Street,  Missouri', '(491)-409-6633'),
		('3603-9534-0869-2745', 'George J. Case', '15117 Cottage Street,  Missouri', '(491)-520-0051'),
		('3687-8780-6927-0715', 'Marley L. Snyder', '18991 Franklin Avenue,  Missouri', '(491)-162-1588'),
		('3762-1299-1092-0321', 'Efrain E. Gordon', '3563 Oxford Court,  Missouri', '(491)-800-5120'),
		('3882-4022-0208-1081', 'Elijah K. Hudson', '150 Madison Court,  Missouri', '(491)-452-9362'),
		('3954-4654-6984-9489', 'Garrett D. Stafford', '959 Jackson Avenue,  Missouri', '(491)-192-5516'),
		('4057-2530-1781-8379', 'Lane J. Lynch', '13545 Street Road,  Missouri', '(491)-501-2723'),
		('4816-0709-9220-0840', 'Ashtyn D. Schmidt', '18287 Madison Avenue,  Missouri', '(491)-013-9870'),
		('5333-3243-0507-5678', 'Jackson A. House', '7036 Ivy Lane,  Missouri', '(491)-738-1570'),
		('5546-1799-4689-7305', 'Harmony J. Huber', '7309 Cleveland Street,  Missouri', '(491)-627-9625'),
		('5966-7616-0261-6247', 'Jorden K. Stafford', '13998 York Road,  Missouri', '(491)-039-9259'),
		('6144-9813-6132-5755', 'Elizabeth K. Johns', '593 4th Street,  Missouri', '(491)-752-7449'),
		('6151-7933-1584-3941', 'Hazel M. Mahoney', '17858 State Street East,  Missouri', '(491)-220-4225'),
		('6204-4778-0473-1901', 'Priscilla M. Hill', '6050 Virginia Street,  Missouri', '(491)-837-2402'),
		('6211-5986-7306-8181', 'Ace L. Nolan', '5519 Mill Road,  Missouri', '(491)-624-2882'),
		('6264-5245-6916-7243', 'Cole H. House', '279 Hilltop Road,  Missouri', '(491)-167-9008'),
		('7264-9606-5306-3102', 'Camryn K. Baxter', '7370 Eagle Road,  Missouri', '(491)-904-2567'),
		('7270-5023-8702-5937', 'Kaya M. Jacobson', '17419 Inverness Drive,  Missouri', '(491)-568-2561'),
		('7750-4041-9060-3245', 'Aden K. Stafford', '3093 2nd Street North,  Missouri', '(491)-233-3782'),
		('8361-3293-1561-4949', 'Aleah E. Gardner', '5774 Elmwood Avenue,  Missouri', '(491)-004-8061'),
		('8503-2372-9073-0494', 'Lydia J. Velez', '3108 Spruce Avenue,  Missouri', '(491)-116-3794'),
		('8574-0336-8184-2005', 'Mark A. Terrell', '7336 Inverness Drive,  Missouri', '(491)-655-3912'),
		('9220-2899-9970-2138', 'Jean A. Booker', '11263 Ivy Court,  Missouri', '(491)-532-4929'),
		('9467-9565-2437-8128', 'Lydia E. Velez', '12395 Locust Lane,  Missouri', '(491)-146-7515'),
		('9541-1745-0531-3269', 'Kaylyn T. Martin', '17051 York Street,  Missouri', '(491)-854-0563'),
		('9692-1899-6520-5313', 'Lana G. Mcintyre', '14925 Harrison Street,  Missouri', '(491)-641-1730'),
		('9863-7409-3386-9104', 'Conor D. Cardenas', '19618 Linda Lane,  Missouri', '(491)-771-0252'),
		('9980-3563-5046-1832', 'Emely H. Singh', '11858 Maiden Lane,  Missouri', '(491)-629-2711')
	;

Insert Into Tracking.BookCopies
	(BookID, BranchID, Copies)
	Values
		(1, 101, 3),
		(2, 101, 4),
		(2, 102, 3),
		(3, 105, 2),
		(4, 101, 4),
		(5, 104, 4),
		(6, 101, 4),
		(6, 104, 2),
		(7, 101, 4),
		(7, 102, 2),
		(8, 106, 3),
		(9, 105, 4),
		(10, 102, 2),
		(10, 103, 4),
		(10, 104, 2),
		(11, 104, 4),
		(11, 105, 4),
		(11, 106, 3),
		(12, 103, 4),
		(12, 104, 3),
		(13, 101, 2),
		(13, 104, 2),
		(14, 101, 2),
		(15, 106, 2),
		(16, 102, 4),
		(17, 101, 3),
		(17, 102, 3),
		(18, 103, 4),
		(19, 101, 4),
		(19, 102, 2),
		(20, 102, 3),
		(20, 106, 4),
		(21, 102, 3),
		(21, 105, 3),
		(22, 101, 3),
		(22, 102, 4),
		(23, 102, 2),
		(1, 103, 2),
		(1, 106, 3)
	;

Insert Into Tracking.Branch
	(BranchID, BranchName, BranchAddress)
	Values
		(101, 'Sharpstown', '1938 Crescent Street, Sharpstown Missouri'),
		(102, 'Central', '1022 Magnolia Avenue, Littlewood Missouri'),
		(103, 'Everett', '2993 Canterbury Road, Everett Missouri'),
		(104, 'Danshill', '495 Broadway, Danshill Missouri'),
		(105, 'Hoover', '3549 4th Avenue, Hoover Missouri'),
		(106, 'Goldston', '362 Madison Court, Goldston Missouri')
	;

Select * From Books.Books
Select * From Books.Authors
Select * From Books.Publisher
Select * From Tracking.Branch
Select * From Tracking.BookCopies
Select * From Tracking.Loans
Select * From Tracking.Borrowers








-- Procedure 1: How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
Create Proc copiesAtBranch @bookName varchar(30) = 'The Lost Tribe', @branchName varchar(30) = 'Sharpstown'
	As
	Select Copies
		From (Tracking.BookCopies
			Inner Join Books.Books on Books.BookID = BookCopies.BookID)
			Inner Join Tracking.Branch on Branch.BranchID = BookCopies.BranchID
		Where
			BookTitle = @bookName And
			BranchName = @branchName
	;
	Go
copiesAtBranch --@bookName = 'The Lost Tribe', @branchName = 'Sharpstown'












-- Procedure 2: How many copies of the book titled "The Lost Tribe" are owned by each library branch?
Create Proc copiesAtAllBranches @bookName varchar(30) = 'The Lost Tribe'
	As
	Select Branch.BranchName, Copies
		From (Tracking.BookCopies
			Inner Join Books.Books on Books.BookID = BookCopies.BookID)
			Inner Join Tracking.Branch on Branch.BranchID = BookCopies.BranchID
		Where
			BookTitle = @bookName
	;
	Go
copiesAtAllBranches -- @bookName = 'The Lost Tribe'












-- Procedure 3: Retrieve the names of all borrowers who do not have any books checked out.
Create Proc noLoansList 
	As
	Select Borrowers.*
		From Tracking.Borrowers
			left Join Tracking.Loans On Borrowers.CardNo = Loans.CardNo
		Where Loans.CardNo Is Null
		Order By BorrowerName
	;
	Go
noLoansList












-- Procedure 4: For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.
Create Proc dueByBranch @branchName varchar(30) = 'Sharpstown', @dueDate Date = '2018-03-03'
	As
	Select Books.BookTitle, Branch.BranchName, Borrowers.BorrowerName, Borrowers.BorrowerAddress, Loans.DateOut, Loans.DateDue
		From ((Tracking.Loans
			Inner Join Books.Books On Books.BookID = Loans.BookID)
			Inner Join Tracking.Branch On Branch.BranchID = Loans.BranchID)
			Left Join Tracking.Borrowers On Borrowers.CardNo = Loans.CardNo
		Where Branch.BranchName = @branchName And Loans.DateDue = @dueDate
	;
	Go
dueByBranch --@branchName = 'Sharpstown', @dueDate = '2018-03-03'










-- Procedure 5: For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
Create Proc loansPerBranch
	As
	Select Branch.BranchName 'Library Branch', Count(Loans.BranchID) '# of Loans'
		From Tracking.Loans
			Inner Join Tracking.Branch On Branch.BranchID = Loans.BranchID
		Group By Loans.BranchID, Branch.BranchName
	;
	Go
loansPerBranch










-- Procedure 6: Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.
Create Proc booksLoanedByPerson @minBooksLoaned Int = 5
	As
	Select Borrowers.BorrowerName, Borrowers.BorrowerAddress, Count(loans.CardNo) 'Books on Loan'
		From Tracking.Borrowers
			left Join Tracking.Loans On Loans.CardNo = Borrowers.CardNo
		Group by Borrowers.BorrowerName, Borrowers.BorrowerAddress
		Having Count(loans.CardNo) >= @minBooksLoaned
		Order by Borrowers.BorrowerName
	;
	Go
booksLoanedByPerson -- @minBooksLoaned = 2












-- Procedure 7: For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
Create Proc copiesOfBookByAuthor @Author varchar(50) = 'Stephen King'
	As
	Select Books.BookTitle, Branch.BranchName, BookCopies.Copies
		From ((Tracking.BookCopies
			Inner Join Books.Books On Books.BookID = BookCopies.BookID)
			Inner Join Tracking.Branch On Branch.BranchID = BookCopies.BranchID)
			Inner Join Books.Authors On Authors.BookID = BookCopies.BookID
		Where Authors.AuthorName = @Author
	;
	Go
copiesOfBookByAuthor --@Author = 'Cornelius Ryan'