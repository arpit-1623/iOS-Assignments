class BankAccount {
    var balance: Double

    init(initBalance: Double) {
        self.balance = initBalance
    }

    func deposit(amount: Double) {
        self.balance += amount
    }

    func withdraw(amount: Double) -> Double? {
        guard amount <= balance else {
            return nil
        }

        self.balance = balance - amount
        return amount
    }
}

class SavingsAccount: BankAccount {

}

class CurrentAccount: BankAccount {

}

func getAccountById(_ id: Int) -> BankAccount? {
    if id == 1 {
        return BankAccount(initBalance: 1000)
    } else if id == 2 {
        return BankAccount(initBalance: 2500)
    } else {
        return nil
    }
}

var account = getAccountById(1)
let withdraw = account?.withdraw(amount: 500)

if let amount = withdraw {
    print("Withdraw Successful: \(amount)")
} else {
    print("Amount Exceeds the Current Balance")
}