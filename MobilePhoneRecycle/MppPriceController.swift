import UIKit
import RealmSwift

class MppPriceController: UIViewController {
    
    @IBOutlet weak var deviceImgs: UIImageView!
    @IBOutlet weak var deviceName: UIButton!
    @IBOutlet weak var deviceRAM: UIButton!
    @IBOutlet weak var deviceColour: UIButton!
    @IBOutlet weak var rearCameraBT: UIButton!
    @IBOutlet weak var frontCameraBT: UIButton!
    @IBOutlet weak var flashLampBT: UIButton!
    @IBOutlet weak var compassBT: UIButton!
    @IBOutlet weak var gyroscopeBT: UIButton!
    @IBOutlet weak var speakerBT: UIButton!
    @IBOutlet weak var microphoneBT: UIButton!
    @IBOutlet weak var bluetoothBT: UIButton!
    @IBOutlet weak var wifiBT: UIButton!
    @IBOutlet weak var screenBT: UIButton!
    @IBOutlet weak var gpsBT: UIButton!
    @IBOutlet weak var lightSensorBT: UIButton!
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    
    var deviceBrand: DeviceBrand? = .iPhone
    var deviceRam: DeviceRAM? = .ram64G
    var deviceImg: Data!
    var deviceColor: String!
    var deviceModules: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.deviceImgs.ext.rbc(10)
        self.initPlaceholderStyle()
        self.deviceImgs.image = UIImage(data: self.deviceImg)
        self.deviceColour.setTitle(self.deviceColor, for: .normal)
        self.deviceRAM.setTitle(self.deviceRam?.ram, for: .normal)
        self.rearCameraBT.isSelected = self.deviceModules[0] == 1
        self.frontCameraBT.isSelected = self.deviceModules[1] == 1
        self.flashLampBT.isSelected = self.deviceModules[2] == 1
        self.compassBT.isSelected = self.deviceModules[3] == 1
        self.gyroscopeBT.isSelected = self.deviceModules[4] == 1
        self.speakerBT.isSelected = self.deviceModules[5] == 1
        self.microphoneBT.isSelected = self.deviceModules[6] == 1
        self.bluetoothBT.isSelected = self.deviceModules[7] == 1
        self.wifiBT.isSelected = self.deviceModules[8] == 1
        self.screenBT.isSelected = self.deviceModules[9] == 1
        self.gpsBT.isSelected = self.deviceModules[10] == 1
        self.lightSensorBT.isSelected = self.deviceModules[11] == 1
    }
    
    func initPlaceholderStyle() {
        if let font = UIFont(name: "PingFangSC-Regular", size: 15) {
            let attrs = [
                NSAttributedString.Key.foregroundColor : UIColor.ext.rgb(255,255,255,0.7),
                .font : font,
            ]
            self.nameTF.attributedPlaceholder = NSAttributedString(string: "Device name", attributes: attrs)
        }
    }
    
    @IBAction func MprRetumprItem(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func MrClickmrDone(_ sender: Any) {
        
        guard let name = self.nameTF.text, !name.isEmpty else {
            self.ext.show("Please input device model name.")
            return
        }
        
        guard let prices = self.priceTF.text, !prices.isEmpty else {
            self.ext.show("Please input final recycling price.")
            return
        }
        
        guard let price = Int(prices), price > 0 else {
            self.ext.show("Please input final recycling price.")
            return
        }
        
        let modules = List<Int>()
        for module in deviceModules {
            modules.append(module)
        }
        
        let id = MobileDeviceModel.deviceId()
        let deviceM = MobileDeviceModel(id: id, model: name, brand: deviceBrand, ram: deviceRam, colour: deviceColor, price: price, imgs: deviceImg, modules: modules)
        MobilePhoneRecycleMr.addDeviceModel(deviceM)
        MobileDeviceModel.saveDeviceId(id+1)
        self.ext.alert("Save succeed") {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
