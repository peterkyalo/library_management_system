CREATE TABLE `publishers` (
  `publisher_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(100) UNIQUE NOT NULL,
  `address` varchar(200),
  `phone` varchar(20),
  `email` varchar(100)
);

CREATE TABLE `authors` (
  `author_id` int PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date,
  `nationality` varchar(50),
  `biography` text
);

CREATE TABLE `categories` (
  `category_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) UNIQUE NOT NULL,
  `description` text
);

CREATE TABLE `books` (
  `book_id` int PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `isbn` varchar(20) UNIQUE NOT NULL,
  `publication_year` int,
  `edition` varchar(20),
  `publisher_id` int,
  `quantity_available` int NOT NULL DEFAULT 0,
  `shelf_location` varchar(20)
);

CREATE TABLE `book_authors` (
  `book_id` int,
  `author_id` int,
  PRIMARY KEY (`book_id`, `author_id`)
);

CREATE TABLE `book_categories` (
  `book_id` int,
  `category_id` int,
  PRIMARY KEY (`book_id`, `category_id`)
);

CREATE TABLE `members` (
  `member_id` int PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) UNIQUE NOT NULL,
  `phone` varchar(20),
  `address` varchar(200),
  `date_of_birth` date,
  `membership_date` date NOT NULL DEFAULT (now()),
  `membership_status` varchar(10) DEFAULT 'active'
);

CREATE TABLE `loans` (
  `loan_id` int PRIMARY KEY AUTO_INCREMENT,
  `book_id` int,
  `member_id` int,
  `loan_date` date NOT NULL DEFAULT (now()),
  `due_date` date NOT NULL,
  `return_date` date,
  `status` varchar(10) DEFAULT 'on loan'
);

CREATE TABLE `fines` (
  `fine_id` int PRIMARY KEY AUTO_INCREMENT,
  `loan_id` int,
  `amount` decimal(10,2) NOT NULL,
  `issue_date` date NOT NULL DEFAULT (now()),
  `payment_date` date,
  `status` varchar(10) DEFAULT 'pending'
);

ALTER TABLE `publishers` ADD FOREIGN KEY (`publisher_id`) REFERENCES `books` (`publisher_id`);

ALTER TABLE `books` ADD FOREIGN KEY (`book_id`) REFERENCES `book_authors` (`book_id`);

ALTER TABLE `authors` ADD FOREIGN KEY (`author_id`) REFERENCES `book_authors` (`author_id`);

ALTER TABLE `books` ADD FOREIGN KEY (`book_id`) REFERENCES `book_categories` (`book_id`);

ALTER TABLE `categories` ADD FOREIGN KEY (`category_id`) REFERENCES `book_categories` (`category_id`);

ALTER TABLE `books` ADD FOREIGN KEY (`book_id`) REFERENCES `loans` (`book_id`);

ALTER TABLE `members` ADD FOREIGN KEY (`member_id`) REFERENCES `loans` (`member_id`);

ALTER TABLE `loans` ADD FOREIGN KEY (`loan_id`) REFERENCES `fines` (`loan_id`);
