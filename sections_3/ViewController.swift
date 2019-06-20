//
//  ViewController.swift
//  sections_2
//
//  Created by mac on 19/06/19.
//  Copyright © 2019 gammastack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct forObjects {
        var sectionName: String!
        var sectionObject: [String]!
    }
    
    @IBOutlet weak var tableView: UITableView!
    var sections = [String]()
    let cellItems = ["Harry","hoss","Bruce","Cook","Carolyn","Morgan","Albert","Walker","Randy","Reed","Larry","Barnes","Lois","Wilson","Jesse","Campbell","Ernest","Rogers","Theresa","Patterson","Henry","Simmons","Michelle","Perry","Frank","Butler","Shirley","Brooks","Rachel","Edwards","Christopher","Perez","Thomas","Shubhanshu","Baker","Sara","Moore","Chris","Bailey","Roger","Johnson","Marilyn","Thompson","Anthony","Evans","Julie","Hall","Paula","Phillips","Annie","Hernandez","Dorothy","Murphy","Alice","Howard","Ruth","Jackson","Debra","Allen","Gerald","Harris","Raymond","Carter","Jacqueline","Torres","Joseph","Nelson","Carlos","Sanchez","Ralph","Clark","Jean","Alexander","Stephen","Roberts","Eric","Long","Amanda","Scott","Teresa","Diaz","Wanda","Thomas","Zubin"]
    var objectArray = [forObjects]()
    var nameDict = [String: [String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateDictionary()
        sortingOfArray()
    }
    
    func generateDictionary() {
        for item in cellItems {
            let key = "\(item[item.startIndex])"
            let lowerCase = key.lowercased()
            if var value = nameDict[lowerCase] {
                value.append(item)
                nameDict[lowerCase] = value
            } else {
                nameDict[lowerCase] = [item]
            }
        }
        print(nameDict)
    }
    
    func sortingOfArray() {
        let ordered = nameDict.sorted { $0.0 < $1.0 }
        for (key, value) in ordered {
            objectArray.append(forObjects(sectionName: key, sectionObject: value))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectArray[section].sectionName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return objectArray[section].sectionObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.label.text = objectArray[indexPath.section].sectionObject[indexPath.row]
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections
    }
}












