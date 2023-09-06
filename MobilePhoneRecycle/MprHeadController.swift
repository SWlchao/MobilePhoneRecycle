import UIKit

class MprHeadController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func MrClickGainmrdev(_ sender: Any) {
        let MobilePhoneGain = UIStoryboard(name: "MobilePhoneGain", bundle: nil)
        guard let nav = MobilePhoneGain.instantiateInitialViewController() as? UINavigationController, let vc = nav.topViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func MrClickmrList(_ sender: Any) {
        let MobilePhoneList = UIStoryboard(name: "MobilePhoneList", bundle: nil)
        guard let nav = MobilePhoneList.instantiateInitialViewController() as? UINavigationController, let vc = nav.topViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func MrClickmrClear(_ sender: Any) {
        let MprClearCache = UIStoryboard(name: "MprClearCache", bundle: nil)
        guard let nav = MprClearCache.instantiateInitialViewController() as? UINavigationController, let vc = nav.topViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

