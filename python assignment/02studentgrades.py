student_grades = {}
#let us maintain a global record for students


#adding new student
def add_new_student():
    name = input("Enter student name to add: ")
    grade = input("Enter grade: ")
    # if a student is already there dont add 
    if name not in student_grades:
        student_grades[name] = grade
        print(f"{name} added with grade {grade}.")
    else:
        print(f"{name} already exists.")


# Update an existing student's grade
def update_student():
    name = input("Enter student name to update: ")
    if name in student_grades:
        new_grade = input("Enter new grade: ")
        student_grades[name] = new_grade
        print(f"{name}'s grade updated to {new_grade}.")
    else:
        print(f"{name} not found.")



# Print all student grades
def display():
    print("All Student Grades:")
    if len(student_grades) == 0:
        print("No grades to show.")
    else:
        for student in student_grades:
            print(f"{student} got {student_grades[student]} marks\n")
            
       
while True:
    #display menu
    print("1. Add New Student")
    print("2. Update Student Grade")
    print("3. Display All Grades")
    print("4. Exit")

    choice = input("Enter your choice (1-4): ")

    #call functions accordingly
    if choice == '1':
        add_new_student()
    elif choice == '2':
        update_student()
    elif choice == '3':
        display()
    elif choice == '4':
        print("Exiting program...")
        break
    else:
        print("Invalid choice. Please enter valid choice.")
     