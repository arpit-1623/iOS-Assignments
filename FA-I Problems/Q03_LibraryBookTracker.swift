struct Book {
    var title: String
    var author: String
    var status: BookStatus {
        didSet {
            print("Book Status Changed from \(oldValue) to \(status)")
        }
    }
}

class Library {
    var books: [Book] = []
    var borrowed: [String: [Book]] = [:]

    init(books: [Book], borrowed: [String: [Book]]) {
        self.books = books
        self.borrowed = borrowed
    }

    func avaliableBooks() {
        for book in books {
            if (book.status == BookStatus.avaliable) {
                print(book.title)
            }
        }
    }

    func borrowedBooks() {
        for (user, books) in borrowed {
            print("\(user) Borrowed: ")
            for book in books {
                print(book.title)
            }
        }
    }
}

enum BookStatus {
    case avaliable, issued, reserved
}

var sampleBook = Book(title: "Art of War",author: "Sun Tzu", status: BookStatus.avaliable)
print(sampleBook)
sampleBook.status = BookStatus.issued
print(sampleBook)