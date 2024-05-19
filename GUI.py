import tkinter as tk
from tkinter import messagebox
from PIL import Image, ImageTk
import os
# import main



def on_admin_click():
    # Clear existing widgets
    for widget in root.winfo_children():
        widget.destroy()

    # Set new background image (if needed)
    try:
        image_path = os.path.join(os.path.dirname(__file__), 'photo.jpg')
        bg_image = Image.open(image_path)
        bg_image = bg_image.resize((window_width, window_height), Image.LANCZOS)
        bg_photo = ImageTk.PhotoImage(bg_image)
        
        # Create a label for the background image
        bg_label = tk.Label(root, image=bg_photo)
        bg_label.image = bg_photo  # Keep a reference to avoid garbage collection
        bg_label.place(x=0, y=0, relwidth=1, relheight=1)
    except Exception as e:
        messagebox.showerror("Error", f"Failed to load background image: {e}")

    # Create new widgets for the Admin Section
    admin_label = tk.Label(root, text="Admin Section", font=("Helvetica", 16), bg="white")
    admin_label.place(x=330, y=100)
    
    button1 = tk.Button(root, text="Sign Up", font=("Helvetica", 14), padx=50, pady=10)
    button1.place(x=335, y=200)
    
    button2 = tk.Button(root, text="Login", font=("Helvetica", 14), padx=50, pady=10)
    button2.place(x=335, y=270)
    
    button3 = tk.Button(root, text="Update patient's details", font=("Helvetica", 14), padx=50, pady=10)
    button3.place(x=335, y=340)
    
    button4 = tk.Button(root, text="Add a new Patient", font=("Helvetica", 14), padx=50, pady=10)
    button4.place(x=335, y=410)
    
    button5 = tk.Button(root, text="Close the application", font=("Helvetica", 14), padx=50, pady=10)
    button5.place(x=335, y=480)



def on_patient_click():
    # Clear existing widgets
    for widget in root.winfo_children():
        widget.destroy()

    # Set new background image (if needed)
    try:
        image_path = os.path.join(os.path.dirname(__file__), 'photo.jpg')
        bg_image = Image.open(image_path)
        bg_image = bg_image.resize((window_width, window_height), Image.LANCZOS)
        bg_photo = ImageTk.PhotoImage(bg_image)
        
        # Create a label for the background image
        bg_label = tk.Label(root, image=bg_photo)
        bg_label.image = bg_photo  # Keep a reference to avoid garbage collection
        bg_label.place(x=0, y=0, relwidth=1, relheight=1)
    except Exception as e:
        messagebox.showerror("Error", f"Failed to load background image: {e}")

    # Create new widgets for the Patient Section
    patient_label = tk.Label(root, text="Patient Section", font=("Helvetica", 16), bg="white")
    patient_label.place(x=330, y=100)
    
    button1 = tk.Button(root, text="Add a new appointment", font=("Helvetica", 14), padx=50, pady=10)
    button1.place(x=335, y=200)
    
    button2 = tk.Button(root, text="Cancel an appointment", font=("Helvetica", 14), padx=50, pady=10)
    button2.place(x=335, y=270)
    
    button3 = tk.Button(root, text="Assign for a room", font=("Helvetica", 14), padx=50, pady=10)
    button3.place(x=335, y=340)
    
    button4 = tk.Button(root, text="Close the application", font=("Helvetica", 14), padx=50, pady=10)
    button4.place(x=335, y=410)
    # patient_window = tk.Toplevel(root)
    # patient_window.title("Patient Window")
    
    # # Set the size of the patient window
    # patient_window_width = 820
    # patient_window_height = 600
    # screen_width = root.winfo_screenwidth()
    # screen_height = root.winfo_screenheight()
    # position_top = int(screen_height / 2 - patient_window_height / 2)
    # position_right = int(screen_width / 2 - patient_window_width / 2)
    # patient_window.geometry(f"{patient_window_width}x{patient_window_height}+{position_right}+{position_top}")
    
    # # Create buttons for the patient window
    # button1 = tk.Button(patient_window, text="Button 1", font=("Helvetica", 14))
    # button1.pack(pady=10)
    
    # button2 = tk.Button(patient_window, text="Button 2", font=("Helvetica", 14))
    # button2.pack(pady=10)
    
    # button3 = tk.Button(patient_window, text="Button 3", font=("Helvetica", 14))
    # button3.pack(pady=10)



def on_doctor_click():
    # Clear existing widgets
    for widget in root.winfo_children():
        widget.destroy()

    # Set new background image (if needed)
    try:
        image_path = os.path.join(os.path.dirname(__file__), 'photo.jpg')
        bg_image = Image.open(image_path)
        bg_image = bg_image.resize((window_width, window_height), Image.LANCZOS)
        bg_photo = ImageTk.PhotoImage(bg_image)
        
        # Create a label for the background image
        bg_label = tk.Label(root, image=bg_photo)
        bg_label.image = bg_photo  # Keep a reference to avoid garbage collection
        bg_label.place(x=0, y=0, relwidth=1, relheight=1)
    except Exception as e:
        messagebox.showerror("Error", f"Failed to load background image: {e}")

    # Create new widgets for the Doctor Section
    doctor_label = tk.Label(root, text="Doctor Section", font=("Helvetica", 16), bg="white")
    doctor_label.place(x=330, y=100)
    
    button1 = tk.Button(root, text="Add medicine details", font=("Helvetica", 14), padx=50, pady=10)
    button1.place(x=335, y=200)
    
    button2 = tk.Button(root, text="Assign a assign_medicine for Patient", font=("Helvetica", 14), padx=50, pady=10)
    button2.place(x=335, y=270)
    
    button3 = tk.Button(root, text="Show all appointments", font=("Helvetica", 14), padx=50, pady=10)
    button3.place(x=335, y=340)
    
    button4 = tk.Button(root, text="Show appointments with certain criteria (date, specefic patient, ...)", font=("Helvetica", 14), padx=50, pady=10)
    button4.place(x=335, y=410)
    
    button5 = tk.Button(root, text="Show all operations", font=("Helvetica", 14), padx=50, pady=10)
    button5.place(x=335, y=480)
    
    button6 = tk.Button(root, text=" Show specific operations", font=("Helvetica", 14), padx=50, pady=10)
    button6.place(x=335, y=550)
    
    button7 = tk.Button(root, text="Close the application", font=("Helvetica", 14), padx=50, pady=10)
    button7.place(x=335, y=620)



def on_nurse_click():
    # Clear existing widgets
    for widget in root.winfo_children():
        widget.destroy()

    # Set new background image (if needed)
    try:
        image_path = os.path.join(os.path.dirname(__file__), 'photo.jpg')
        bg_image = Image.open(image_path)
        bg_image = bg_image.resize((window_width, window_height), Image.LANCZOS)
        bg_photo = ImageTk.PhotoImage(bg_image)
        
        # Create a label for the background image
        bg_label = tk.Label(root, image=bg_photo)
        bg_label.image = bg_photo  # Keep a reference to avoid garbage collection
        bg_label.place(x=0, y=0, relwidth=1, relheight=1)
    except Exception as e:
        messagebox.showerror("Error", f"Failed to load background image: {e}")

    # Create new widgets for the Doctor Section
    doctor_label = tk.Label(root, text="Doctor Section", font=("Helvetica", 16), bg="white")
    doctor_label.place(x=330, y=100)
    
    button1 = tk.Button(root, text="Add medicine details", font=("Helvetica", 14), padx=50, pady=10)
    button1.place(x=335, y=200)
    
    button2 = tk.Button(root, text="Assign a assign_medicine for Patient", font=("Helvetica", 14), padx=50, pady=10)
    button2.place(x=335, y=270)
    
    button3 = tk.Button(root, text="Show all appointments", font=("Helvetica", 14), padx=50, pady=10)
    button3.place(x=335, y=340)
    
    button4 = tk.Button(root, text="Show appointments with certain criteria (date, specefic patient, ...)", font=("Helvetica", 14), padx=50, pady=10)
    button4.place(x=335, y=410)
    
    button5 = tk.Button(root, text="Close the application", font=("Helvetica", 14), padx=50, pady=10)
    button5.place(x=335, y=480)


# Create the main window
root = tk.Tk()
root.title("Hospital Management System")

# Set the size of the window
window_width = 820
window_height = 600
screen_width = root.winfo_screenwidth()
screen_height = root.winfo_screenheight()
position_top = int(screen_height / 2 - window_height / 2)
position_right = int(screen_width / 2 - window_width / 2)
root.geometry(f"{window_width}x{window_height}+{position_right}+{position_top}")
root.resizable(False, False)

# Load the background image
image_path = os.path.join(os.path.dirname(__file__), 'photo.jpg')
bg_image = Image.open(image_path)
bg_image = bg_image.resize((window_width, window_height), Image.LANCZOS)
bg_photo = ImageTk.PhotoImage(bg_image)

# Create a label for the background image
bg_label = tk.Label(root, image=bg_photo)
bg_label.place(x=0, y=0, relwidth=1, relheight=1)

# Create a label for the message
msg_label = tk.Label(root, text="Choose user type", font=("Helvetica", 24), bg="white")
msg_label.place(x=300, y=100)

# Create buttons for different user types
admin_button = tk.Button(root, text="Admin", command=on_admin_click, font=("Helvetica", 14), padx=51, pady=10, bg="gray")
admin_button.place(x=335, y=200)

patient_button = tk.Button(root, text="Patient", command=on_patient_click, font=("Helvetica", 14), padx=50, pady=10, bg="gray")
patient_button.place(x=335, y=270)

doctor_button = tk.Button(root, text="Doctor", font=("Helvetica", 14), padx=50, pady=10, bg="gray")
doctor_button.place(x=335, y=340)

nurse_button = tk.Button(root, text="Nurse", font=("Helvetica", 14), padx=54, pady=10, bg="gray")
nurse_button.place(x=335, y=410)

# Run the application
root.mainloop()
