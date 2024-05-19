import pyodbc as odbc # pip install pyodbc     #<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
import sys
import bcrypt
from dateutil import parser
from datetime import datetime, date

DRIVER_NAME = 'SQL Server'
SERVER_NAME = 'LAPTOP-7R329VJ2'
DATABASE_NAME = 'HospitalManagementSystem'

# Define your connection string
connection_string = f"""
    DRIVER={{{DRIVER_NAME}}};
    SERVER={SERVER_NAME};
    DATABASE={DATABASE_NAME};
    Trusted_Connection=yes;
"""

try:
    conn = odbc.connect(connection_string)
    cursor = conn.cursor()
    print("Connection successful!")
except odbc.DatabaseError as e:
    print(f"Database connection error: {e}")
    sys.exit()
except odbc.InterfaceError as e:
    print(f"Interface error: {e}")
    sys.exit()




def verify_password(stored_password, input_password):
    return stored_password == input_password



def add_admin():
    print("Sign up as a new Admin:")
    username = input("Enter username: ")
    password = input("Enter password: ")
    name = input("Enter name: ")
    
    query = "INSERT INTO Admin (username, password, name) VALUES (?, ?, ?)"
    cursor.execute(query, (username, password, name))
    conn.commit()
    print("Admin added successfully.")


def admin_login():
    print("Admin Login:")
    username = input("Enter username: ")
    password = input("Enter password: ")
    
    query = "SELECT password FROM Admin WHERE username = ?"
    cursor.execute(query, (username,))
    result = cursor.fetchone()
    if result and result[0] == password:
        print("Login successful.")
    else:
        print("Invalid username or password.")


def update_user_details():
    print("Update a patient's details:")
    patient_id = input("Enter patient ID: ")
    new_name = input("Enter new name: ")

    update_query = "UPDATE Patient SET name = ? WHERE patient_id = ?"
    cursor.execute(update_query, (new_name, patient_id))
    conn.commit()
    print("Patient details updated successfully.")


def add_patient():
    print("\nAdd a patient:")
    name = input("Enter patient's name: ")
    gender = input("Enter patient's gender (M/F): ")
    date_of_birth = input("Enter patient's date of birth (YYYY-MM-DD): ")
    address = input("Enter patient's address: ")
    phone_number = input("Enter patient's phone number: ")
    emergency_contact_name = input("Enter emergency contact name: ")
    emergency_contact_phone = input("Enter emergency contact phone number: ")
    insurance_information = input("Enter insurance information: ")

    insert_query = """
    INSERT INTO Patient (name, gender, date_of_birth, address, phone_number, emergency_contact_name,
                            emergency_contact_phone, insurance_information)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    """
    cursor.execute(insert_query, (name, gender, date_of_birth, address, phone_number,
                                    emergency_contact_name, emergency_contact_phone, insurance_information))
    conn.commit()
    print("Patient added successfully.")


def admin_actions():
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



def Check_valid_doc_id():
    id =input('Please enter your id: ')
    id = int(id)
    flag=False
    cursor.execute('select doctor_id from Doctor ')
    row = cursor.fetchone()
    while row:
        if row[0] == id:
            flag = True
            break
        row = cursor.fetchone()
    if not flag :
        print("Wrong id, Please try again:()")
        return False
    else:
        return id

def doctor_actions():
    while True:
        print("\nDoctor's Actions:")
        print("1. Sign up")
        print("2. login")
        print("3. Update info")
        print("4. Add medicine details")
        print("5. Assign a assign_medicine for Patient")
        print("6. Show appointments")
        print("7. Show medical history for specific patient ")
        print("8. Close the application")

        choice = input("Enter your choice: ")
        if choice == '1':
            name = input("Enter your name: ")
            dep = input("Enter your department: ")
            spe = input("Enter your specialization: ")
            yex = input("Enter your year of experience: ")

            # Using parameterized query to prevent SQL injection
            cursor.execute('INSERT INTO Doctor (name, department, Specialty, years_of_experience) VALUES (?, ?, ?, ?)',
                            (name, dep, spe, yex))
            conn.commit()  # Commit the transaction after the loop
            break  
        elif choice =='2':
            while True:
                id =input('Please enter your id: ')
                id = int(id)
                flag=False
                cursor.execute('select doctor_id from Doctor')
                row = cursor.fetchone()
                while row:
                    if row[0] == id:
                        cursor.execute('select name from Doctor where doctor_id = ?',(id,))
                        result=cursor.fetchone()
                        print("Welcome back "+result[0])
                        flag = True
                        break
                    row = cursor.fetchone()
                if not flag :
                    print("Wrong id, Please try again:()")
                else:
                    break
            break
        elif choice =='3':
            while True:
                id =input('Please enter your id: ')
                id = int(id)
                flag=False
                cursor.execute('select doctor_id from Doctor')
                row = cursor.fetchone()
                while row:
                    if row[0] == id:
                        while True:
                            print("1. Update name ")
                            print("2. Update department ")
                            print("3. Update specialty ")
                            print("4. Update years_of_experience ")
                            print ("5. Exit")
                            c= input("Please enter yor choice 1 to 5: ")
                            if c == '1':
                                n=input("please enter the new name: ")
                                cursor.execute('update Doctor set name = ? where doctor_id=?',(n,id,))
                                conn.commit() 
                                print("Name updated successfully.")
                                flag=True
                                break
                            elif c=='2':
                                d=input("please enter the new department: ")
                                cursor.execute('update Doctor set department = ? where doctor_id=?',(d,id,))
                                conn.commit() 
                                print("Department updated successfully.")
                                flag=True
                                break
                            elif c=='3':
                                s=input("please enter the new specialty: ")
                                cursor.execute('update Doctor set specialty = ? where doctor_id=?',(s,id,))
                                conn.commit() 
                                print("Specialty updated successfully.")
                                flag=True
                                break
                            elif c=='4':
                                while True:
                                    y=input("please enter update year experience: ")
                                    y=int(y)
                                    if y<=50:
                                        cursor.execute('update Doctor set years_of_experience = ? where doctor_id=?',(y,id,))
                                        conn.commit() 
                                        print("Year of updated successfully.")
                                        flag=True
                                        break
                                    else:
                                        print("Please select year experience from 0 to 50")
                                break
                            elif c=='5':
                                flag=True
                                break
                            else:
                                print("Please try again!")
                        break
                    row = cursor.fetchone()

                if not flag :
                    print("Something wrong, Please try again:()")
                else:
                    break
            break
        elif choice == '4':
            flag =False
            while True:
                name = input("Enter Medicien's name: ")
                des = input("Enter Medicien's description: ")
                dos = input("Enter  Medicien's dosage: ")
                cursor.execute('select name from Medication')
                row = cursor.fetchone()
                while row:
                    if(row[0].lower()==name.lower()):
                        flag =True
                        break  
                    row = cursor.fetchone()
                if not flag :
                    cursor.execute('INSERT INTO Medication (name, description, dosage) VALUES (?, ?, ?)',
                            (name, des, dos))
                    conn.commit() 
                    print ("Medcien add successfully")
                    break
                else:
                    print("This medcien is already found!")
            break
        elif choice == '5':
            pid=input ("Please enter patient id: ")
            pid=int(pid)
            mid=input ("Please enter medication id: ")
            mid=int(mid)
            enddate = input("Enter a end date (YYYY-MM-DD): ")
            startdate=date.today()
            d=input("please enter dosage: ")
            while True:
                flag=False
                cursor.execute('select patient_id from Patient')
                row = cursor.fetchone()
                while row:
                    if row[0] == pid:
                        flag = True
                        break
                    row = cursor.fetchone()
                if not flag :
                    print("Wrong patient id, Please try again:()")
                else:
                    break
                pid=input ("Please enter patient id: ")
                pid=int(pid)
            while True:
                flag=False
                cursor.execute('select medication_id from Medication')
                row = cursor.fetchone()
                while row:
                    if row[0] == mid:
                        flag = True
                        break
                    row = cursor.fetchone()
                if not flag :
                    print("Wrong medication id, Please try again:()")
                    mid=input ("Please enter medication id: ")
                    mid=int(mid)
                else:
                    break
            while True:
                try:
                    date_obj = datetime.strptime(enddate, '%Y-%m-%d').date()
                    if (startdate>date_obj):
                        print ("entered date is in the past please try again")
                    else:
                        break
                except ValueError:
                    print("Invalid date format. Please enter the date in the format YYYY-MM-DD.")
                enddate = input("Enter a date (YYYY-MM-DD): ")

            data = (pid,mid,d,startdate.strftime('%Y-%m-%d'),enddate)
            cursor.execute('INSERT INTO PatientMedication (patient_id, medication_id, Dosage, StartDate, EndDate) VALUES (?, ?, ?, ?, ?)',
                            data)
            conn.commit()
            print("medcien assigned successfully")
            break
        elif choice=='6':
            while True:
                print("1. show all appointment ")
                print("2. show appointment for specific patient ")
                print("3. show appointment for specific date ")
                print ("4. Exit")
                c= input("Please enter yor choice 1 to 4: ")
                if c=='1':
                    while True:
                        id=Check_valid_doc_id()
                        if id:
                            break
                    cursor.execute('select appointment_time, appointment_date, patient_id, reason_for_visit  from Appointment where doctor_id=? ', (id,))
                    row = cursor.fetchone()
                    flag = False
                    while row:
                            print(row)
                            row = cursor.fetchone()
                            flag= True
                    if not flag:
                        print("You don't have any appointment")
                    break
                elif c=='2':
                    while True:
                        id=Check_valid_doc_id()
                        if id:
                            break
                    while True:
                        pid =input('Please enter your Patient id: ')
                        pid = int(pid)
                        flag=False
                        cursor.execute('select patient_id from Patient ')
                        row = cursor.fetchone()
                        while row:
                            if row[0] == pid:
                                flag = True
                                break
                            row = cursor.fetchone()
                        if not flag :
                            print("Wrong patient id, Please try again:()")
                        else:
                            break
                    cursor.execute('select appointment_time, appointment_date, reason_for_visit  from Appointment where doctor_id=? and patient_id=? ', (id,pid))
                    row = cursor.fetchone()
                    flag = False
                    while row:
                            print(row)
                            row = cursor.fetchone()
                            flag= True
                    if not flag:
                        print("You don't have any appointment with this patient")
                    break
                elif c=='3':
                    while True:
                        id=Check_valid_doc_id()
                        if id:
                            break
                    while True:
                        date = input("Enter date (YYYY-MM-DD): ")
                        try:
                            date_obj = datetime.strptime(date, '%Y-%m-%d').date()
                            break
                        except ValueError:
                            print("Invalid date format. Please enter the date in the format YYYY-MM-DD.")
                    cursor.execute('select appointment_time, patient_id, reason_for_visit  from Appointment where doctor_id=? and appointment_date=? ', (id,date))
                    row = cursor.fetchone()
                    flag = False
                    while row:
                            print(row)
                            row = cursor.fetchone()
                            flag= True
                    if not flag:
                        print("You don't have any appointment in this day")
                    break
                elif c=='4':
                    break
                else:
                    print("Invalid choice please try again")

            break
        elif choice=='7':
            pid=input("Please enter patient id: ")
            pid = int(pid)
            flag=False
            cursor.execute('select patient_id from Patient ')
            row = cursor.fetchone()
            while True:
                while row:
                    if row[0] == pid:
                        flag = True
                        break
                    row = cursor.fetchone()
                if not flag :
                    print("Wrong id, Please try again:()")
                else:
                    break

            cursor.execute('select PatientMedication.*,Diagnosis.Description,Diagnosis.DiagnosisDate from PatientMedication,Diagnosis where PatientMedication.patient_id=Diagnosis.patient_id and Diagnosis.patient_id=?',(pid,))
            row = cursor.fetchone()
            while row:
                print(row)
                row=cursor.fetchone()
            break        
        elif choice =='8':
            break
        else:
            print('Invalid,Please select number from 1 to 8')



def patient_actions():  
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


def all_rooms():
    cursor.execute('SELECT room_id, room_type FROM Room')
    rooms = cursor.fetchall()
    
    print("\nAll Rooms:")
    for room_id, room_type in rooms:  
        print(f"Room {room_id}: {room_type}")
    conn.close()


def specific_rooms():
    criteria = input("Enter room number or room type: ")
    cursor.execute('''
        SELECT room_id, room_type FROM Room WHERE room_id = ?
    ''', (criteria,))
    rooms = cursor.fetchall()
    
    if not rooms: 
        cursor.execute('''
            SELECT room_id, room_type FROM Room WHERE room_type = ?
        ''', (criteria,))
        rooms = cursor.fetchall()
    
    print("\nRooms matching criteria:")
    for room_id, room_type in rooms:
        print(f"Room {room_id}: {room_type}")


def main():
    while True:
        print("\nWelcome to the Hospital Management System!")
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
