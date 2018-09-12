

import Foundation

class SmartSingleTon {
    private init(){}
    static let share = SmartSingleTon()
    
    var arrName = ["Nguyen Hoang SOn", "Le Van Luyen", "U_94"]
//    var name: [String] {
//        get {
//            if _name == nil {
//                _name = ["Nguyen Hoang SOn", "Le Van Luyen", "U_94"]
//            }
//            return _name!
//        }
//        set {
//            _name = newValue
//        }
//    }
//
//    func addNew() {
//        _name = ["Nguyen Hoang SOn", "Le Van Luyen", "U_94"]
//    }
    
    func editName(index: Int, name: String) {
        arrName[index] = name
    }
    
    func addData(name: String)  {
        arrName.append(name)
    }
    
}
