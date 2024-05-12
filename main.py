import pypyodbc as odbc # pip install pypyodbc
import sys

DRIVER_NAME = 'SQL SERVER'
SERVER_NAME = 'LAPTOP-7R329VJ2\LOCALDB#5B3A185A'
DATABASE_NAME = 'HospitalManagementSystem'

#uid = <username>
#pwd = <password>

connection_string = f"""
    DRIVER = {{{DRIVER_NAME}}};
    SERVER = {SERVER_NAME};
    DATABASE = {DATABASE_NAME};
    Trust_Connection = yes;
"""

conn = odbc.connect(connection_string)


cursor = conn.cursor()



def admin_actions():
    pass


def doctor_actions():
    pass


def patient_actions():
    pass


def nurse_actions():
    pass


def main():
    while True:
        print("\nWelcome to the Library Management System!")
        print("Choose user type:")
        print("1. Admin")
        print("2. User")
        print("3. Exit")

        user_type = input("Enter your choice: ")

        if user_type == '1':
            admin_actions()
        elif user_type == '2':
            doctor_actions()
        elif user_type == '3':
            patient_actions()
        elif user_type == '4':
            nurse_actions()
        elif user_type == '5':
            print("Exiting program.")
            break
        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    main()

