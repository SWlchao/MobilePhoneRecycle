import UIKit

class MptTestController: UIViewController {
    
    @IBOutlet weak var rearCameraN: UIButton!
    @IBOutlet weak var rearCameraD: UIButton!
    
    @IBOutlet weak var frontCameraN: UIButton!
    @IBOutlet weak var frontCameraD: UIButton!
    
    @IBOutlet weak var flashLampN: UIButton!
    @IBOutlet weak var flashLampD: UIButton!
    
    @IBOutlet weak var compassN: UIButton!
    @IBOutlet weak var compassD: UIButton!
    
    @IBOutlet weak var gyroscopeN: UIButton!
    @IBOutlet weak var gyroscopeD: UIButton!
    
    @IBOutlet weak var speakerN: UIButton!
    @IBOutlet weak var speakerD: UIButton!
    
    @IBOutlet weak var microphoneN: UIButton!
    @IBOutlet weak var microphoneD: UIButton!
    
    @IBOutlet weak var bluetoothN: UIButton!
    @IBOutlet weak var bluetoothD: UIButton!
    
    @IBOutlet weak var wifiN: UIButton!
    @IBOutlet weak var wifiD: UIButton!
    
    @IBOutlet weak var screenN: UIButton!
    @IBOutlet weak var screenD: UIButton!
    
    @IBOutlet weak var gpsN: UIButton!
    @IBOutlet weak var gpsD: UIButton!
    
    @IBOutlet weak var lightSensorN: UIButton!
    @IBOutlet weak var lightSensorD: UIButton!
    
    var deviceBrand: DeviceBrand? = .iPhone
    var deviceRam: DeviceRAM? = .ram64G
    var deviceImgs: Data!
    var deviceColour: String!
    
    var deviceModules: [Int?] = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func MprRetumprItem(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func MrCheckDevmrRearCamera(_ sender: UIButton) {
        self.rearCameraN.isSelected = sender.tag == 0
        self.rearCameraD.isSelected = sender.tag == 1
        self.deviceModules[0] = sender.tag == 0 ? 0 : 1
    }
    
    @IBAction func MrCheckDevmrFrontCamera(_ sender: UIButton) {
        self.frontCameraN.isSelected = sender.tag == 0
        self.frontCameraD.isSelected = sender.tag == 1
        self.deviceModules[1] = sender.tag == 0 ? 0 : 1
    }
    
    @IBAction func MrCheckDevmrFlashLamp(_ sender: UIButton) {
        self.flashLampN.isSelected = sender.tag == 0
        self.flashLampD.isSelected = sender.tag == 1
        self.deviceModules[2] = sender.tag == 0 ? 0 : 1
        
    }
    
    @IBAction func MrCheckDevmrCompass(_ sender: UIButton) {
        self.compassN.isSelected = sender.tag == 0
        self.compassD.isSelected = sender.tag == 1
        self.deviceModules[3] = sender.tag == 0 ? 0 : 1
    }
    
    @IBAction func MrCheckDevmrGyroscope(_ sender: UIButton) {
        self.gyroscopeN.isSelected = sender.tag == 0
        self.gyroscopeD.isSelected = sender.tag == 1
        self.deviceModules[4] = sender.tag == 0 ? 0 : 1
    }
    
    @IBAction func MrCheckDevmrSpeaker(_ sender: UIButton) {
        self.speakerN.isSelected = sender.tag == 0
        self.speakerD.isSelected = sender.tag == 1
        self.deviceModules[5] = sender.tag == 0 ? 0 : 1
    }
    
    @IBAction func MrCheckDevmrMicrophone(_ sender: UIButton) {
        self.microphoneN.isSelected = sender.tag == 0
        self.microphoneD.isSelected = sender.tag == 1
        self.deviceModules[6] = sender.tag == 0 ? 0 : 1
    }
    
    @IBAction func MrCheckDevmrBluetooth(_ sender: UIButton) {
        self.bluetoothN.isSelected = sender.tag == 0
        self.bluetoothD.isSelected = sender.tag == 1
        self.deviceModules[7] = sender.tag == 0 ? 0 : 1
    }
    
    @IBAction func MrCheckDevmrWiFi(_ sender: UIButton) {
        self.wifiN.isSelected = sender.tag == 0
        self.wifiD.isSelected = sender.tag == 1
        self.deviceModules[8] = sender.tag == 0 ? 0 : 1
    }
    
    @IBAction func MrCheckDevmrScreen(_ sender: UIButton) {
        self.screenN.isSelected = sender.tag == 0
        self.screenD.isSelected = sender.tag == 1
        self.deviceModules[9] = sender.tag == 0 ? 0 : 1
    }
    
    @IBAction func MrCheckDevmrGPS(_ sender: UIButton) {
        self.gpsN.isSelected = sender.tag == 0
        self.gpsD.isSelected = sender.tag == 1
        self.deviceModules[10] = sender.tag == 0 ? 0 : 1
    }
    
    @IBAction func MrCheckDevmrLightSensor(_ sender: UIButton) {
        self.lightSensorN.isSelected = sender.tag == 0
        self.lightSensorD.isSelected = sender.tag == 1
        self.deviceModules[11] = sender.tag == 0 ? 0 : 1
    }
    
    @IBAction func MrClickDevmrPrice(_ sender: Any) {
        
        let count = self.deviceModules.filter{ $0 != nil }.count
        if count != self.deviceModules.count {
            self.ext.show("Functional testing not completed!")
            return
        }
        
        var modules = [Int]()
        for module in self.deviceModules {
            if let num = module {
                modules.append(num)
            }
        }
        print(modules)
        
        let MobilePhonePrice = UIStoryboard(name: "MobilePhonePrice", bundle: nil)
        guard let nav = MobilePhonePrice.instantiateInitialViewController() as? UINavigationController, let vc = nav.topViewController as? MppPriceController else {
            return
        }
        vc.deviceImg = self.deviceImgs
        vc.deviceBrand = self.deviceBrand
        vc.deviceRam = self.deviceRam
        vc.deviceColor = self.deviceColour
        vc.deviceModules = modules
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
