<<<<<<< HEAD
import pypyodbc as odbc # pip install pypyodbc     #<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
import sys

DRIVER_NAME = 'SQL SERVER'
SERVER_NAME = 'LAPTOP-7R329VJ2\LOCALDB#5B3A185A'   #<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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




def admin_actions(): #Habiba 
    while True:
        print("\nAdmin's Actions:")
        print("1. Sign up as a new Admin")
        print("2. Login")
        print("3. Update a users's details")
        print("4. Add a Patient")
        print("5. Close the application")
        
        choice = input("Enter your choice: ")
        
        if choice == '1':
            add_admin()
        elif choice == '2':
            admin_login()
        elif choice == '3':
            update_user_details()
        elif choice == '4':
            add_patient()
        elif choice == '5':
            print("Closing the application.")
            sys.exit()
        else:
            print("Invalid choice. Please try again.")



def doctor_actions(): #Yara
    while True:
        print("\nDoctor's Actions:")
        print("1. Add medicine details")
        print("2. Assign a assign_medicine for Patient")
        print("3. Show all appointments")
        print("4. Show appointments with certain criteria (date, specefic patient, ...)")
        print("5. Show all operations")
        print("6. Show specific operations")
        print("7. Close the application")
        
        choice = input("Enter your choice: ")
        
        if choice == '1':
            add_medicine()
        elif choice =='2':
            assign_medicine()
        elif choice =='3':
            all_appointments()
        elif choice =='4':
            specific_appointments()
        elif choice == '5':
            all_operations()
        elif choice == '6':
            specific_operations()
        elif choice == '7':
            print("Closing the application.")
            sys.exit()
        else:
            print("Invalid choice. Please try again.")



def patient_actions(): #Salma
    while True:
        print("\nPatient's Actions:")
        print("1. Add a new appointment")
        print("2. Cancel an appointment")
        print("3. Show the medical history")
        print("4. Show my operation details")
        print("5. Assign for a room")
        print("6. Close the application")
        
        choice = input("Enter your choice: ")
        
        if choice == '1':
            add_appointment()
        elif choice == '2':
            cancel_appointment()
        elif choice == '3':
            show_medical_history()
        elif choice == '4':
            patient_operation()
        elif choice == '5':
            assign_room()
        elif choice == '6':
            print("Closing the application.")
            sys.exit()
        else:
            print("Invalid choice. Please try again.")



def nurse_actions(): #Youssef
    while True:
        print("\nNurse's Actions:")
        print("1. Show all rooms")
        print("2. Show rooms with certain criteria (room_id, specefic patient, ...)")
        print("3. Close the application.")
        
        choice = input("enter your choice: ")
        
        if choice == '1':
            all_rooms()
        elif choice == '2':
            specific_rooms()
        elif choice == '3':
            print("Closing the application.")
            sys.exit()
        else:
            print("Invalid choice. Please try again")



def main():
    while True:
        print("\nWelcome to the Library Management System!")
        print("Choose user type:")
        print("1. Admin")
        print("2. Doctor")
        print("3. Patient")
        print("4. Nurse")
        print("5. Exit")

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
=======
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

>>>>>>> c6420734514198c8ebce8c47e94dc4f549c5efe9
