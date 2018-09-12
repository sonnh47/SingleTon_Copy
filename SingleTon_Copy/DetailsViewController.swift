

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var txtDataFromMaster: UITextField!
    var indexPath: IndexPath!
    override func viewDidLoad() {
        super.viewDidLoad()
        if indexPath != nil {
            txtDataFromMaster.text = SmartSingleTon.share.arrName[indexPath.row]
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnDone(_ sender: Any) {
        if indexPath != nil {
            SmartSingleTon.share.editName(index: indexPath.row, name: txtDataFromMaster.text!)
        }
        else {
            SmartSingleTon.share.addData(name: txtDataFromMaster.text!)
        }
        navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
