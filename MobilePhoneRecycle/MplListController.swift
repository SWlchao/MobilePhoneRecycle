import UIKit

class MplListController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ndeviceView: UIImageView!
    
    var devices: [MobileDeviceModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.registerMobilePhoneRecycleCell()
    }
    
    func registerMobilePhoneRecycleCell() {
        self.tableView.register(UINib(nibName: "MobilePhoneRecycleCell", bundle: nil), forCellReuseIdentifier: MobilePhoneRecycleCell.RegisterCellId)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.loadDataSource()
    }
    
    func loadDataSource() {
        self.devices = MobilePhoneRecycleMr.queryDeviceModel(object: MobileDeviceModel())
        self.tableView.reloadData()
        self.ndeviceView.isHidden = !self.devices.isEmpty
    }
    
    @IBAction func MprRetumprItem(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension MplListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.devices.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MobilePhoneRecycleCell.RegisterCellId, for: indexPath) as? MobilePhoneRecycleCell else {
            return MobilePhoneRecycleCell(style: .default, reuseIdentifier: MobilePhoneRecycleCell.RegisterCellId)
        }
        let device = self.devices[indexPath.row]
        cell.mobileDeviceRecycleCell(device)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let MobilePhoneDetail = UIStoryboard(name: "MobilePhoneDetail", bundle: nil)
        guard let nav = MobilePhoneDetail.instantiateInitialViewController() as? UINavigationController, let vc = nav.topViewController as? MpdDetailController else {
            return
        }
        var modules = [Int]()
        for module in self.devices[indexPath.row].modules {
            modules.append(module)
        }
        vc.deviceModules = modules
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
