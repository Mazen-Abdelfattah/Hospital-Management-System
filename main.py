import pyodbc as odbc  # pip install pypyodbc #<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
import sys
from dateutil import parser
from datetime import datetime

SERVER = 'DESKTOP-VMKA1K4'
DATABASE = 'HospitalManagementSystem'
connectionString = (f'DRIVER={{SQL SERVER}};'
                    f' SERVER={SERVER};'
                    f' DATABASE={DATABASE};'
                    f' Trusted_Connection=yes')
conn = odbc.connect(connectionString)
cursor = conn.cursor()
# def admin_actions(): #Habiba
#     while True:
#         print("\nAdmin's Actions:")
#         print("1. Sign up as a new Admin")
#         print("2. Login")
#         print("3. Update a users's details")
#         print("4. Add a Patient")
#         print("5. Close the application")
#         choice = input("Enter your choice: ")
#
#         if choice == '1':
#             add_admin()
#         elif choice == '2':
#             admin_login()
#         elif choice == '3':
#             update_user_details()
#         elif choice == '4':
#             add_patient()
#         elif choice == '5':
#             print("Closing the application.")
#             sys.exit()
#         else:
#             print("Invalid choice. Please try again.")
#
#
#
# def doctor_actions(): #Yara
#     while True:
#         print("\nDoctor's Actions:")
#         print("1. Add medicine details")
#         print("2. Assign a assign_medicine for Patient")
#         print("3. Show all appointments")
#         print("4. Show appointments with certain criteria (date, specefic patient, ...)")
#         print("5. Show all operations")
#         print("6. Show specific operations")
#         print("7. Close the application")
#
#         choice = input("Enter your choice: ")
#
#         if choice == '1':
#             add_medicine()
#         elif choice =='2':
#             assign_medicine()
#         elif choice =='3':
#             all_appointments()
#         elif choice =='4':
#             specific_appointments()
#         elif choice == '5':
#             all_operations()
#         elif choice == '6':
#             specific_operations()
#         elif choice == '7':
#             print("Closing the application.")
#             sys.exit()
#         else:
#             print("Invalid choice. Please try again.")
#


def patient_actions():  # Salma
    print("Choose:")
    print("1. Sign UP")
    print("2. Log IN")
    print("3. Exit")

    while True:
        ch = input("Enter your choice: ")
        if ch == '1':
            n = input("Enter your Full Name: ")
            g = input("Enter your Gender( F || M ): ")
            while g != 'F' and g != 'M':
                g = input("Enter your Gender( F || M ): ")

            today = datetime.now().strftime('%y-%m-%d')
            d = input("Enter your Date of birth in this format YYYY-MM-DD: ")
            while True:
                try:
                    vaild = parser.parse(d)
                    if today < d:
                        break
                except ValueError:
                    print("invalid format ")
                    d = input("Enter your Date of birth in this format YYYY-MM-DD: ")

            a = input("Enter your Address: ")
            p = input("Enter your Phone Number: ")
            while len(p) != 7:
                p = input("Enter your Phone Number(7 numbers): ")
            e1 = input("Enter your Emergency contact name): ")
            e2 = input("Enter your Emergency contact Phone Number: ")
            while len(p) != 7:
                p = input("Enter your Phone Number(7 numbers): ")
            i = input("Enter your insurance information if you don't have insurance write 'no': ")
            data = (n, g, d, a, p, e1, e2, i)
            cursor.execute(f"INSERT INTO Patient(name, gender, date_of_birth, address, phone_number, emergency_contact_name, emergency_contact_phone, insurance_information) values(?, ?, ?, ?, ?, ?, ?, ?)",data)
            ch = input("to log in type 2: \nto Exit type 3: ")
        elif ch == '2':
            p = input("Enter your phone number to log in: ")
            cursor.execute(f"SELECT phone_number FROM Patient WHERE phone_number = '{p}' ")
            while cursor.fetchone() == None:
                print(cursor.fetchone())
                p = input("please Enter your phone number that you hav signed up with: ")
                cursor.execute(f"SELECT phone_number FROM Patient WHERE phone_number = ?",(p, ))
            break
        elif ch == '3':
            print("Exiting program.")
            cursor.commit()
            sys.exit()
        else:
            print("invalid value")
    while True:
        cursor.execute(f"SELECT patient_id FROM Patient WHERE phone_number = ?", (p, ))
        login_id = cursor.fetchone()
        print("welcome user with id: " + str(login_id[0]))
        print("\nPatient's Actions:")
        print("1. Add a new appointment")
        print("2. Cancel an appointment")
        print("3. Assign for a room")
        print("4. Close the application")
        choice = input("Enter your choice: ")

        if choice == '1':

            di = input("Enter the Doctor ID: ")
            cursor.execute(f"SELECT doctor_id FROM Doctor WHERE doctor_id = ?", (di, ))
            while cursor.fetchone() == None:
                print(cursor.fetchone())
                di = input("Please Enter Valid Doctor ID: ")
                cursor.execute(f"SELECT doctor_id FROM Doctor WHERE doctor_id = ?", (di, ))

            d = input("Enter your Date of Appointment you want in this format YYYY-MM-DD: ")
            while True:
                try:
                    valid = parser.parse(d)
                    break
                except ValueError:
                    print("invalid format ")
                    d = input("Enter your Date of Appointment you want in this format YYYY-MM-DD: ")

            print("Enter the time of appointment you want we are available in those slots:\n")
            print("1. at 09:00\n2. at 10:00\n3. at 11:00\n")
            print("4. at 12:00\n5. at 13:00\n6. at 14:00\n")
            print("7. at 16:00\n8. at 17:00\n9. at 18:00\n")
            t = input()
            while t != '1' and t != '2' and t != '3' and t != '4' and t != '5' and t != '6' and t != '7' and t != '8' and t != '9':
                print("Please Enter the time of appointment you want we are available in those slots:\n")
                print("1. at 09:00\n2. at 10:00\n3. at 11:00\n")
                print("4. at 12:00\n5. at 13:00\n6. at 14:00\n")
                print("7. at 16:00\n8. at 17:00\n9. at 18:00\n")
                t = input()
            slot = '00:00'
            if t == '1':
                slot = '09:00'
            elif t == '2':
                slot = '10:00'
            elif t == '3':
                slot = '11:00'
            elif t == '4':
                slot = '12:00'
            elif t == '5':
                slot = '13:00'
            elif t == '6':
                slot = '14:00'
            elif t == '7':
                slot = '16:00'
            elif t == '8':
                slot = '17:00'
            elif t == '9':
                slot = '18:00'
            cursor.execute(f"SELECT doctor_id FROM Appointment WHERE doctor_id = '{di}' and appointment_time= '{slot}' and appointment_date='{d}' ")
            while cursor.fetchone() != None:
                print(cursor.fetchone())
                di = input("Please Enter another Doctor ID the doctor you chose is not available in the date and time you wont: \nif you wnat to exit Enter 0")
                if di == '0':
                    cursor.commit()
                    sys.exit()
                cursor.execute(f"SELECT doctor_id FROM Appointment WHERE doctor_id = '{di}' and appointment_time= '{slot}' and appointment_date='{d}' ")

            i = login_id
            r = input("Enter the reason for visit")
            data = (slot, d, i[0], di, r)
            print(slot)
            print(d)
            print(i[0])
            print(di)
            print(r)
            cursor.execute(f"INSERT INTO Appointment (appointment_time, appointment_date, patient_id, doctor_id, reason_for_visit) VALUES (?, ?, ?, ?, ?)", data)

        elif choice == '2':
            di = input("Enter the Doctor ID: ")
            cursor.execute(f"SELECT doctor_id FROM Doctor WHERE doctor_id = ?", (di, ))
            while cursor.fetchone() == None:
                print(cursor.fetchone())
                di = input("Please Enter Valid Doctor ID: ")
                cursor.execute(f"SELECT doctor_id FROM Doctor WHERE doctor_id = ?", (di, ))
            while True:
                d = input("Enter your Date of Appointment you want to cancel in this format YYYY-MM-DD: ")
                check = True
                while check:
                    try:
                        valid = parser.parse(d)
                        check = False
                    except ValueError:
                        print("invalid format ")
                        d = input("Enter your Date of Appointment you want in this format YYYY-MM-DD: ")
                cursor.execute(f"SELECT doctor_id FROM Appointment WHERE appointment_date = '{d}'"
                               f" and patient_id='{login_id[0]}' ")
                check = cursor.fetchone()
                if check != None:
                    break

            cursor.execute(f"DELETE FROM Appointment WHERE doctor_id = '{di}' and patient_id = '{login_id[0]}"
                           f"' and appointment_date = '{d}'")
            print("\nyour appointment has been canceled successfully\n")
        elif choice == '3':
            while True:
                roomType = input("Do you want \n1. Single Room\n2. Double Room \n")
                if roomType == '1':
                    roomType = "Single"
                elif roomType == '2':
                     roomType = "Double"
                else:
                    print("invalid data")
                    continue
                print(roomType)
                cursor.execute(f"SELECT room_id, location FROM Room WHERE room_type ='{roomType}' and patient_id is null ")
                roomId=cursor.fetchone()
                print(roomId)
                if roomId == None:
                    print("There are no available rooms with your selection, so please choose another.")
                else:
                   cursor.execute(f"UPDATE Room  SET patient_id ='{login_id[0]}' WHERE room_id='{roomId[0]}'")
                   print("Your room is assigned here Room ID ")
                   print(roomId[0] )
                   print("and Location in the floor number ")
                   print(roomId[1])
                   break
        elif choice == '4':
            print("Closing the application.")
            cursor.commit()
            sys.exit()
        else:
            print("Invalid choice. Please try again.")



# def nurse_actions(): #Youssef
#     while True:
#         print("\nNurse's Actions:")
#         print("1. Show all rooms")
#         print("2. Show rooms with certain criteria (room_id, specefic patient, ...)")
#         print("3. Close the application.")
#
#         choice = input("enter your choice: ")
#
#         if choice == '1':
#             all_rooms()
#         elif choice == '2':
#             specific_rooms()
#         elif choice == '3':
#             print("Closing the application.")
#             sys.exit()
#         else:
#             print("Invalid choice. Please try again")
#
#

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

        # if user_type == '1':
        #     admin_actions()
        # elif user_type == '2':
        #     doctor_actions()
        # el
        if user_type == '3':
            patient_actions()
        # elif user_type == '4':
        #     nurse_actions()
        # elif user_type == '5':
        #     print("Exiting program.")
        #     break
        else:
            print("Invalid choice. Please try again.")


if __name__ == "__main__":
    main()

conn.close()
