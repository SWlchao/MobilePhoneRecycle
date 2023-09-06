import UIKit
import Realm
import RealmSwift

class MobileDeviceModel: Object {
    
    static let MobileDeviceID = "MobileDeviceID"
    
    @objc dynamic var id: Int = 0
    @objc dynamic var model: String?
    @objc dynamic var brand: Int = DeviceBrand.iPhone.rawValue
    @objc dynamic var ram: Int = DeviceRAM.ram64G.rawValue
    @objc dynamic var colour: String?
    @objc dynamic var price: Int = 0
    @objc dynamic var imgs: Data!
    var modules = List<Int>()
    
    convenience init(id: Int,
                     model: String?,
                     brand: DeviceBrand?,
                     ram: DeviceRAM?,
                     colour: String?,
                     price: Int,
                     imgs: Data,
                     modules: List<Int>) {
        self.init()
        self.id = id
        self.model = model
        self.brand = brand?.rawValue ?? 0
        self.ram = ram?.rawValue ?? 0
        self.colour = colour
        self.price = price
        self.imgs = imgs
        self.modules = modules
    }
    
    //设置模型的主键
    override class func primaryKey() -> String? {
        return "id"
    }
    
    class func saveDeviceId(_ id: Int) {
        UserDefaults.standard.setValue(id, forKey: MobileDeviceID)
        UserDefaults.standard.synchronize()
    }
    
    class func deviceId() -> Int {
        return UserDefaults.standard.object(forKey: MobileDeviceID) as? Int ?? 0
    }
}

enum DeviceBrand: Int {
    case iPhone = 0
    case Huawei = 1
    case Samsung = 2
    case OPPO = 3
    case OnePlus = 4
    case Xiaomi = 5
    case Sony = 6
    case vivo = 7
}

enum DeviceRAM: Int {
    case ram64G = 0
    case ram128G = 1
    case ram256G = 2
    case ram512G = 3
    case ram1T = 4
    case ram2T = 5
    
    var ram: String {
        switch self {
        case .ram64G: return "64G"
        case .ram128G: return "128G"
        case .ram256G: return "256G"
        case .ram512G: return "512G"
        case .ram1T: return "1T"
        case .ram2T: return "2T"
        }
    }
}
