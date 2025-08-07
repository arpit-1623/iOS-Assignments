struct Student {
    var name: String
    var marks: [String: Int]
    
    var totalMarks: Int {
        var temp = 0
        for (_, value) in marks {
            temp += value
        }
        return temp
    }

    var percentage: Double {
        return (Double(totalMarks) / Double(marks.count))
    }

    var grade: Grade {
        calculateGrade()
    }

    init?(name: String, marks: [String: Int]) {
        guard !name.isEmpty && name.first?.isUppercase == true else {
            return nil
        }

        self.name = name
        self.marks = marks
    }

    func calculateGrade() -> Grade {
        switch self.percentage {
            case 80...100:
                return .A
            case 60..<80:
                return .B
            case 40..<60:
                return .C
            default:
                return .Fail
        }
    }
}

enum Grade {
    case A, B, C, Fail
}

func printStudent(student: Student?) {
    guard let student = student else {
        return
    }

    print("*------------------------------------------*")
    print("Student Name:", student.name)
    print("Student Marks:", student.marks)
    print("Student Total Marks:", student.totalMarks)
    print("Students Percentage:", student.percentage)

    switch student.grade {
        case .A:
            print("Student Scored A Grade")
        case .B:
            print("Student Scored B Grade")
        case .C:
            print("Student Scored C Grade")
        case .Fail:
            print("Student Failed")
    }
    print("*------------------------------------------*")
}

let sampleStudent = Student (
    name: "Arpit Garg",
    marks: [
        "Math": 80,
        "Science": 90,
        "English": 85
    ]
)

printStudent(student: sampleStudent)