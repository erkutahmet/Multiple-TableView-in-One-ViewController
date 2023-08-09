//
//  ViewController.swift
//  Multiple TableView in One ViewController
//
//  Created by Ahmet Erkut on 9.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableViewCountry: UITableView!
    @IBOutlet weak var tableViewCity: UITableView!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var backgroundLabel: UILabel!
    
    var countries:[String] = [String]()
    var cities:[String] = [String]()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundLabel.text = ""
        backgroundLabel.backgroundColor = .systemGray2
        
        label.text = "Please Choose.."
        label.backgroundColor = .white
        
        tableViewCountry.delegate = self
        tableViewCountry.dataSource = self
        
        tableViewCity.delegate = self
        tableViewCity.dataSource = self
        
        countries = ["Turkey", "Germany", "Russia", "Ukraine", "Japan", "U.S.A.", "Canada"]
        cities = ["Ankara", "Köln", "Moscow", "Kyiv", "Tokyo", "Washington D.C.", "Ottowa"]
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var numberOfData: Int?
        
        if tableView == tableViewCountry{
            numberOfData = countries.count
        }
        if tableView == tableViewCity{
            numberOfData = cities.count
        }
        
        return numberOfData!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        if tableView == tableViewCountry{
            
            cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
            
            var content = cell?.defaultContentConfiguration()
            content?.text = countries[indexPath.row]
            cell?.contentConfiguration = content
            
        }
        
        if tableView == tableViewCity{
            
            cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
            
            var content = cell?.defaultContentConfiguration()
            content?.text = cities[indexPath.row]
            cell?.contentConfiguration = content
            
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = indexPath.row + 1
        
        if tableView == tableViewCountry{
            
            backgroundLabel.textAlignment = .left
            backgroundLabel.text = "\t\(String(index))"
            backgroundLabel.textColor = .white
            label.text = "Choosed from Country\n\(countries[index])\n\(cities[index])"
            
        }
        
        if tableView == tableViewCity{
            
            if index == 1 {
                backgroundLabel.text = "\(String(index))\t\t"
            } else {
                backgroundLabel.text = "\(String(index))\t"
            }
            
            backgroundLabel.textAlignment = .right
            backgroundLabel.textColor = .white
            label.text = "Choosed from City\n\(cities[index])\n\(countries[index])"
            
        }
    }
    
}

