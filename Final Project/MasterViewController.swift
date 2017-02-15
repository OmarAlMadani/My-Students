//
//  MasterViewController.swift
//  Final Project
//

//  Copyright © 2017 Omar Almadani. All rights reserved.
//

import UIKit


extension MasterViewController: changeValueDelegate {
    func updateData(data: SimpleModel) {
        let model4 = SimpleModel.init(name: data.name, photo: UIImage(named : "image1"), subtitle: data.subtitle, description: data.description)
        self.itemArray.append(model4)
        self.tableView.reloadData()
    }
}

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil


    
    var itemArray = [(SimpleModel)]()
    
    @IBAction func addNew(_ sender: Any) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem

       
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.model = itemArray[(indexPath.row)]
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }else if segue.identifier == "addIdentifier"{
            (segue.destination as! AddIteamViewController).delegate = self
            
        }

    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell

        let data = itemArray[indexPath.row]
        // Configure the cell...
        
        cell?.name.text = data.name
        cell?.subTitle.text = data.subtitle
        cell?.profileImage.image = data.photo
        return cell!
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            itemArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

