//
//  ViewController.swift
//  Midterm
//
//  Created by GeFrank on 3/30/21.
//

import UIKit


class ViewController: UITableViewController {
    var covidData: [CovidData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: String(describing: UITableViewCell.self))
        let networkDriver = CovidDataNetwork()
        networkDriver.promiseRequest()
            .done {covidDataList in
                self.covidData = covidDataList
                self.tableView.reloadData()
                print(self.covidData.count)
            }
            .catch { error in
                print(error)
                
            }
        // Do any additional setup after loading the view.
    
    }

    override func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.covidData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        let covidDataCurrent = self.covidData[indexPath.row]
        cell.textLabel?.text = covidDataCurrent.state +  ": total - " + String(covidDataCurrent.totalTests) + ";  positive - " + String(covidDataCurrent.positiveCases)
        
        return cell
    }

}

