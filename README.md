# Library Management System

## Overview
This project is a Library Management System implemented using SQL. It includes various tables and relationships to manage books, authors, publishers, members, loans, and fines.

## Database Schema
The database schema consists of the following tables:

1. **publishers**: Stores information about book publishers.
2. **authors**: Stores details about authors.
3. **categories**: Contains book categories.
4. **books**: Stores book details, including title, ISBN, and publisher.
5. **book_authors**: A junction table linking books and authors.
6. **book_categories**: A junction table linking books and categories.
7. **members**: Stores member details.
8. **loans**: Tracks book loans by members.
9. **fines**: Tracks fines associated with overdue loans.

## Relationships
- `publishers` is linked to `books` via `publisher_id`.
- `books` is linked to `book_authors` and `book_categories`.
- `authors` is linked to `book_authors`.
- `categories` is linked to `book_categories`.
- `books` is linked to `loans`.
- `members` is linked to `loans`.
- `loans` is linked to `fines`.

## Features
- Manage books, authors, and publishers.
- Categorize books into multiple categories.
- Track loans and returns of books by members.
- Calculate and manage fines for overdue books.

## How to Use
1. Import the SQL file into your database management system.
2. Ensure all foreign key relationships are correctly established.
3. Use SQL queries to interact with the database for CRUD operations.

## Future Enhancements
- Add triggers for automatic fine calculation.
- Implement stored procedures for common operations.
- Integrate with a front-end application for user-friendly interaction.