import UIKit

class MpgGainController: UIViewController {
    
    @IBOutlet weak var iphoneBT: UIButton!
    @IBOutlet weak var huaweiBT: UIButton!
    @IBOutlet weak var samsungBT: UIButton!
    @IBOutlet weak var oppoBT: UIButton!
    @IBOutlet weak var oneplusBT: UIButton!
    @IBOutlet weak var xiaomiBT: UIButton!
    @IBOutlet weak var sonyBT: UIButton!
    @IBOutlet weak var vivoBT: UIButton!
    
    @IBOutlet weak var colourTF: UITextField!
    
    @IBOutlet weak var ram64G: UIButton!
    @IBOutlet weak var ram128G: UIButton!
    @IBOutlet weak var ram256G: UIButton!
    @IBOutlet weak var ram512G: UIButton!
    @IBOutlet weak var ram1T: UIButton!
    @IBOutlet weak var ram2T: UIButton!
    
    var deviceImgs: UIImage?
    var deviceBrand: DeviceBrand? = .iPhone
    var deviceRam: DeviceRAM? = .ram64G
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initPlaceholderStyle()
    }
    
    func initPlaceholderStyle() {
        let attrs = [
            NSAttributedString.Key.foregroundColor : UIColor.ext.rgb(51,51,51),
        ]
        self.colourTF.attributedPlaceholder = NSAttributedString(string: "Colour", attributes: attrs)
    }
    
    @IBAction func MprRetumprItem(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func MrClickDevmrImgs(_ sender: UIButton) {
        guard let phoneAlbum = TZImagePickerController(maxImagesCount: 1, delegate: nil) else {
            return
        }
        phoneAlbum.allowPickingVideo = false
        phoneAlbum.allowTakeVideo = false
        phoneAlbum.allowTakePicture = false
        phoneAlbum.didFinishPickingPhotosHandle = { (picts, _, _) in
            self.deviceImgs = picts?.first
            sender.setBackgroundImage(picts?.first, for: .normal)
            sender.ext.rbc(10)
        }
        self.present(phoneAlbum, animated: true, completion: nil)
    }
    
    @IBAction func MrCheckDevmrBrand(_ sender: UIButton) {
        self.deviceBrand = DeviceBrand(rawValue: sender.tag)
        self.iphoneBT.isSelected = self.deviceBrand == .iPhone
        self.huaweiBT.isSelected = self.deviceBrand == .Huawei
        self.samsungBT.isSelected = self.deviceBrand == .Samsung
        self.oppoBT.isSelected = self.deviceBrand == .OPPO
        self.oneplusBT.isSelected = self.deviceBrand == .OnePlus
        self.xiaomiBT.isSelected = self.deviceBrand == .Xiaomi
        self.sonyBT.isSelected = self.deviceBrand == .Sony
        self.vivoBT.isSelected = self.deviceBrand == .vivo
    }
    
    @IBAction func MrCheckDevmrRAM(_ sender: UIButton) {
        self.deviceRam = DeviceRAM(rawValue: sender.tag)
        self.ram64G.isSelected = self.deviceRam == .ram64G
        self.ram128G.isSelected = self.deviceRam == .ram128G
        self.ram256G.isSelected = self.deviceRam == .ram256G
        self.ram512G.isSelected = self.deviceRam == .ram512G
        self.ram1T.isSelected = self.deviceRam == .ram1T
        self.ram2T.isSelected = self.deviceRam == .ram2T
    }
    
    @IBAction func MrClickTestmrDev(_ sender: Any) {
        
        guard let img = self.deviceImgs?.pngData() else {
            self.ext.show("Please add device images.")
            return
        }
        
        guard let colour = self.colourTF.text, !colour.isEmpty else {
            self.ext.show("Please input device colour.")
            return
        }
        
        
        let MobilePhoneTest = UIStoryboard(name: "MobilePhoneTest", bundle: nil)
        guard let nav = MobilePhoneTest.instantiateInitialViewController() as? UINavigationController, let vc = nav.topViewController as? MptTestController else {
            return
        }
        vc.deviceImgs = img
        vc.deviceBrand = self.deviceBrand
        vc.deviceRam = self.deviceRam
        vc.deviceColour = colour
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
