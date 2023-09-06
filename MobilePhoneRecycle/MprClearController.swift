import UIKit

class MprClearController: UIViewController {

    @IBOutlet weak var contentTF: UITextView!
    @IBOutlet weak var cacheLa: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.cacheLa.text = self.ext.cacheFileSize
    }

    @IBAction func MprRetumprItem(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func MrSubmitmrTo(_ sender: Any) {
        guard let content = self.contentTF.text, !content.isEmpty else {
            self.ext.show("Please input feedback content.")
            return
        }
        self.ext.show("Feedback Succeed")
        self.contentTF.text = nil
    }
    
    @IBAction func MrCleanmrCache(_ sender: Any) {
        self.cacheLa.text = self.ext.clearFileCache
        self.ext.show("Clear succeed")
    }
}
