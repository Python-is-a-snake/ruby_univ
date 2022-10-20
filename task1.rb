class Abiturient
   attr_accessor :id
   attr_accessor :first_name
   attr_accessor :last_name
   attr_accessor :patronymic
   attr_accessor :address
   attr_accessor :phone
   attr_accessor :grades
   attr_accessor :grades_sum
   def initialize(id, first_name, last_name, patronymic, address, phone, grades)
      @id = id
      @first_name = first_name
      @last_name = last_name
      @patronymic = patronymic
      @address = address
      @phone = phone
      @grades = grades
      res = 0
      grades.each { |grade| res+=grade}
      @grades_sum = res
   end
   def to_s
      return "Abiturient id# #{@id}, Name:  #{@first_name}, Last Name:  #{@last_name},  Patronymic:  #{@patronymic}. Address: #{@address}, Phone: #{@phone}, Grades: #{@grades}, Grades SUM: #{@grades_sum} \n"
   end

end
class Abiturients
   def initialize(abiturients)
      @abiturients = abiturients
   end
   def filterByBadGrades()
      result = Array.new
      @abiturients.each do |object|
         if object.grades.find_all { |elem| (elem % 5) >1 && (elem % 5) <4 }!=[]
            result.push(object)
         end
      end
      result
   end
   def filterByGradesSum(neededSum)
      result = Array.new
      @abiturients.each do |object|
         if object.grades_sum > neededSum
            result.push(object)
         end
      end
      result
   end

   def filterBestN(n)
      myarray = @abiturients.sort{|a,b| b.grades_sum <=> a.grades.sum}
      for y in 0...n
         puts myarray[y].to_s
      end

   end

   def to_s
      puts @abiturients
   end

end
a1 = Abiturient.new(1, "Bobby", "Bro", "Johnson", "Mc. Queen Street 49", 34567823, [3, 5, 4])
a2 = Abiturient.new(2, "Tom", "Lean", "Benjamin", "Grow Street 3", 045642234, [5, 5, 4])
a3 = Abiturient.new(3, "Anna", "Ptah", "Anderson", "Great Park Avenue", 347880234, [3, 4, 4])
a4 = Abiturient.new(4, "Michael", "Cost", "Johnson", "Long Beach 80", 8745723, [4, 5, 4])
a5 = Abiturient.new(5, "John", "Raches", "Smiths", "School Street 190", 452380566, [2, 2, 4])
abiturients = Abiturients.new([a1, a2, a3, a4, a5])

puts "_+_+_+_+_+_++_+_+_+_+_+_ ABITURIENTS_+_+_+_+_+_++_+_+_+_+_+_"
puts abiturients.to_s
puts "\n_+_+_+_+_+_+_ ABITURIENTS WITH GRADES SUM > 11_+_+_+_+_+_+_"
puts abiturients.filterByGradesSum(11)
puts "\n_+_+_+_+_+_+_ ABITURIENTS WHO HAVE GRADE < 3 _+_+_+_+_+_+_"
puts abiturients.filterByBadGrades
puts "\n_+_+_+_+_+_+_ TOP N(=2) ABITURIENTS _+_+_+_+_+_+_"
puts abiturients.filterBestN(2)
