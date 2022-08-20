//
//  Jobs.swift
//  JobsClass
//
//  Created by Yea on 20.08.2022.
//

import Foundation

enum jobsType {
    case enginner
    case customer
    case cio
    case hairDresser
    case pilot
    case developer
    
    
}

class humancreater {
    
    //Property
    var gender : String
    var name : String
    var age : Int
    var jobs : jobsType
    //Initializer
    init(genderInit:String,nameInit: String, ageInit:Int, jobsInit:jobsType ) {
        gender = genderInit
        name = nameInit
        age = ageInit
        jobs = jobsInit
    }
    
        func activities() {
        print("Computer Enginner")
    }
    private func test(){
        print("Test")
    }
    
}
