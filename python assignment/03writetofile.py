# Open a file in write mode ('w') — this will create the file if it doesn't exist
file = open("student_notes.txt", "w")

# Write content to the file using write method
file.write("This is a sample text file\n")
file.write("It contains notes about student grades\n")
file.write("Each line can represent a different student\n")

# closing the file
file.close()

print("File created and content written successfully")