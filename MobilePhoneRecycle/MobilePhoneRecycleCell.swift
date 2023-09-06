//
//  MobilePhoneRecycleCell.swift
//  MobilePhoneRecycle
//
//  Created by Mac on 2023/8/15.
//

import UIKit

class MobilePhoneRecycleCell: UITableViewCell {
    
    @IBOutlet weak var deviceImgs: UIImageView!
    @IBOutlet weak var deviceName: UILabel!
    @IBOutlet weak var deviceRAM: UILabel!
    @IBOutlet weak var deviceColour: UILabel!
    @IBOutlet weak var devicePrice: UILabel!
    
    static let RegisterCellId = "MobilePhoneRecycleCellId"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.deviceImgs.ext.rbc(10)
    }

    func mobileDeviceRecycleCell(_ device: MobileDeviceModel) {
        self.deviceImgs.image = UIImage(data: device.imgs)
        self.deviceName.text = device.model
        self.deviceRAM.text = DeviceRAM(rawValue: device.ram)?.ram
        self.deviceColour.text = device.colour
        self.devicePrice.text = "$" + device.price.ext.txt
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
