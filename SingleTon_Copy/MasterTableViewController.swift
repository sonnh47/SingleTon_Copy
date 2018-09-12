

import UIKit

class MasterTableViewController: UITableViewController {

    @IBOutlet weak var footerView: UIView!
    @IBOutlet var noDataView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.tableFooterView = footerView
        tableView.reloadData()
        print("WillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //tableView.tableFooterView = footerView
        print("DidAppear")
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("willDisAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("didDisappear")
    }
    
    deinit {
        print("Deinit")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SmartSingleTon.share.arrName.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = SmartSingleTon.share.arrName[indexPath.row]

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? DetailsViewController {
            if let index = tableView.indexPathForSelectedRow {
                detailViewController.indexPath = index
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            SmartSingleTon.share.arrName.remove(at: indexPath.row
            )
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            if SmartSingleTon.share.arrName.count == 0 {
                tableView.tableFooterView = noDataView
            }
        }
    }
    

}
