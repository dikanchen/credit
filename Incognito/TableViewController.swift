//
//  TableViewController.swift
//  Incognito
//
//  Created by User on 2/20/18.
//  Copyright © 2018 raywenderlich. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  var product: [card]?
  override func viewDidLoad() {
        super.viewDidLoad()
    NetworkService.GetPeople{
      (product, error) in
      if let error = error{
        print(error)
        return
      }
      guard let product = product else {return}
      self.product = product
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let product = product else{return 0}
    return product.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    guard let product = product else {return cell}
    cell.textLabel?.text = product[indexPath.row].productDisplayName
    return cell
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
