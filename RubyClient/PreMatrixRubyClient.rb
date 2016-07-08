require 'savon'

Client = Savon.client(wsdl: 'http://localhost:9999/ws/PreMatrix?wsdl')

ans = "100"
begin
    system "clear" or system "cls"

    puts "Welcome to PreMatrix Ruby Client\n\nChoose you options below by typing its initials: "
    ans = "100"
    Client.operations.each do |option|
        puts "\t--> #{option}"
    end

    puts "Press 0 to exit\nOption:"
    $ans = gets.chomp

    system "clear" or system "cls"

    case $ans
    when "ans" # add_new_student
        puts "Matricula:"
        mat = gets.chomp
        
        puts "First Name:"
        fir = gets.chomp
        
        puts "Last Name:"
        las = gets.chomp
        
        puts "Career:"
        car = gets.chomp
        
        Client.call(:add_new_student, message: { arg0: mat, arg1: fir, arg2: las, arg3: car })
        
        puts "New Student Added! Press any key to continue"
        gets.chomp
        
    when "acts" # assign_course_to_student
        puts "Matricula:"
        mat = gets.chomp
        
        puts "Course Code:"
        cod = gets.chomp
        
        puts "Course name:"
        nam = gets.chomp
        
        Client.call(:assign_course_to_student,  message: { arg0: mat, arg1: cod, arg2: nam })
        
        puts "Added Course! Press any key to continue"
        gets.chomp
        
    when "rsc" # remove_student_course 
        puts "Matricula:"
        mat = gets.chomp
        
        puts "Course Code:"
        cod = gets.chomp
        
        puts "Course name:"
        nam = gets.chomp
        
        Client.call(:remove_student_course,  message: { arg0: mat, arg1: cod, arg2: nam })
        
        puts "Removed Course! Press any key to continue"
        gets.chomp
        
    when "msi" # modify_student_info
        puts "Matricula:"
        mat = gets.chomp
        
        puts "First Name:"
        fir = gets.chomp
        
        puts "Last Name:"
        las = gets.chomp
        
        puts "Career:"
        car = gets.chomp
        
        Client.call(:modify_student_info, message: { arg0: mat, arg1: fir, arg2: las, arg3: car })
        
        puts "Student Modified ! Press any key to continue"
        gets.chomp
        
    when "ds" # delete_student
        puts "Matricula:"
        mat = gets.chomp
        
        Client.call(:delete_student, message: { arg0: mat })
        
        puts "Deleted Student! Press any key to continue"
        gets.chomp
        
    when "fas" # fetch_all_students
        response = Client.call(:fetch_all_students, message: {})
        
        puts "#{response.body}"
        
        puts "Press any key to continue"
        gets.chomp
    
    when "fs" # fetch_student
        puts "Matricula:"
        mat = gets.chomp
        
        response = Client.call(:fetch_student, message: { arg0: mat })
        
        puts "#{response.body}"
        
        puts "Press any key to continue"
        gets.chomp
        
    when "0" # Closing the application
        puts "Terminating application"
    else
        puts "Not valid Option! Press any key to continue"
        gets.chomp
    end
    
end until $ans == "0"

puts "Thank you for using PreMatix!"