import pypyodbc as odbc # pip install pypyodbc

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
# print(conn)

