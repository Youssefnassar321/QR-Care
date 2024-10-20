# Health Management API with Role-Based Access and QR Code Integration

## Overview
This API is designed to help people manage their health, prevent medication errors, and facilitate access to hospitals, police, and other authorities. The API provides role-based access to sensitive information, allowing users with different types of accounts to view or manage data according to their permissions. It also includes features for adding and managing patient data, with QR code integration for quick access to relevant information.

## Features

### General Features
- **Log In and Sign Up System**:
  - Multiple account types with different roles and permissions.
  - Role-based access to patient data and other sensitive information.
  
### Patient Management:
- Add and manage patient data.
- Choose to add children as dependents if logged in as a parent and manage their data.
- All patient information is linked to an account and managed based on the user’s role.
- Generate a **QR code** for each patient; scanning the code reveals data depending on the account type and role permissions.

### Role-Based Permissions:
- **Parent**: Can manage their children's data and their own information.
- **Non-Parent User**: Can only manage personal data.
- **Healthcare Personnel**: Can access patient data according to permissions set by their role (e.g., hospital staff, police).
  
### QR Code Integration:
- Each patient’s data is encoded in a **QR code**.
- Scanning the QR code retrieves the information, tailored to the permissions of the user.

### Testing:
- The API is tested and verified using **Postman** to ensure functionality and correct responses based on different user roles and permissions.

## Technology Stack

### Backend:
- **PHP** for server-side logic and API development.
- **MySQL** for data storage and management.
- **PHPMyAdmin** for database administration and management.

### Features:
- **JWT Authentication** for secure user log in and role management.
- **QR Code Generation** using a PHP library to create QR codes linked to patient information.
  
### Testing:
- **Postman** is used to test API endpoints and validate responses for different account types and roles.

## Setup and Installation

1. Clone the repository.
2. Set up the database using **PHPMyAdmin** or any MySQL management tool.
3. Configure the database connection in the PHP files.
4. Install required PHP libraries for QR code generation and JWT authentication (via Composer if applicable).
5. Use **Postman** to test the API endpoints and verify functionality.

## Usage

1. **Parent Account**: Add and manage your children’s information.
2. **Non-Parent Account**: Manage personal information.
3. **Healthcare Personnel Account**: Access and manage patient data based on your assigned role.
4. **QR Code**: Scan to retrieve and display patient information based on your role.
