//
//  Person.swift
//  SB ContactList
//
//  Created by Арсентий Халимовский on 02.03.2023.
//

struct Person {
    
    var firstName: String
    var lastName: String
    var phoneNumber: String
    var emailAddress: String
    
}


class DataManager {
    
    
    var arrayOfFirstNames = ["Bruce", "John", "Steven", "Aaron", "Tim", "Allan", "Sharon", "Ted", "Carl", "Nicola"]
    var arrayOfLastNames = ["Butler", "Smith", "Black", "Robertson", "Murphy", "Williams", "isaacson", "Jankin", "Pennyworth", "Dow"]
    var arrayOfPhoneNumbers = ["432324432", "994321223", "843153855", "129443124", "929329333", "888431234", "761284443", "439322312", "112094323", "9491129393"]
    var arrayOfEmailAddresses = ["as@ya.ru", "ja@gmail.com", "bl@jur.ru", "gur@yahoo.com", "baba@gmail.com", "qtun@ya.ru", "squt@ya.ru", "malba@gmail.com", "dork@blur.ru", "asu@gava.com"]
    
    func getUsers() -> [Person] {
        
        var arrayOfUser = [Person]()
        let numberOfUsers = arrayOfFirstNames.count
        
        var firstNames = arrayOfFirstNames.shuffled()
        var lastNames = arrayOfLastNames.shuffled()
        var numbers = arrayOfPhoneNumbers.shuffled()
        var emails = arrayOfEmailAddresses.shuffled()
        
        for person in 1...numberOfUsers {
            arrayOfUser.append(Person(
                firstName: firstNames.removeLast(),
                lastName: lastNames.removeLast(),
                phoneNumber: numbers.removeLast(),
                emailAddress: emails.removeLast()))
            
        }
        return arrayOfUser
    }
}
