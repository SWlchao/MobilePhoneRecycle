import UIKit

class MpdDetailController: UIViewController {
    
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

    var deviceModules: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    @IBAction func MprRetumprItem(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
