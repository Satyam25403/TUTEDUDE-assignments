# Open the file in read mode ('r')
file = open("student_notes.txt", "r")

# Read the file
content = file.read()

# Print the contents
print("File Content:\n")
print(content)

# Close the file
file.close()