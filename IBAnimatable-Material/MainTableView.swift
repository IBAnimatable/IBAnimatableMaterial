//
//  MainTableView.swift
//  IBAnimatable-Material
//
//  Created by Damien Tsenkoff on 7/10/16.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import Foundation
import Material
import IBAnimatable

private enum components: String {
    case AnimatableRaisedButton = "Animatable Raised Button"
    case AnimatableMaterialTextField = "AnimatableMaterial TextField"
    case AnimatableButton2 = "Animatable Button 2"
    case AnimatableButton3 = "Animatable Button 3"
    case AnimatableButton4 = "Animatable Button 4"
    case AnimatableButton5 = "Animatable Button 5"
    
    static let AllValues = [AnimatableRaisedButton, AnimatableMaterialTextField, AnimatableButton2, AnimatableButton3, AnimatableButton4, AnimatableButton5]
}


class MainTableView: UITableViewController {
    
    //  MARK: Properties
    @IBOutlet var tableview: UITableView!
    
    //  MARK: Main Variables
    private var dataSourceTable = [String]()
    
    private var searchButton: IconButton!
    private var menuButton: IconButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareItems()
        
        prepareSearchButton()
        prepareMenuButton()
        prepareNavigationItem()
    }
    
    // Prepares the dataSource Array.
    private func prepareItems() {
        for i in components.AllValues {
            dataSourceTable.append(i.rawValue)
        }
    }
    
    
    //  MARK: TableView
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceTable.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("materialCell", forIndexPath: indexPath) as! AnimatableMaterialTableViewCell
        //let cell = MaterialTableViewCell(style: .Default, reuseIdentifier: "materialCell")
        let dataCell = dataSourceTable[indexPath.row]
        
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.selectionStyle = .None
        cell.textLabel?.text = dataCell
        cell.textLabel?.font = RobotoFont.regular
        
        return cell
    }
    
    
    
    //  MARK: Selection
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch components.AllValues[indexPath.row] {
        case .AnimatableRaisedButton:
            performSegueWithIdentifier("toAnimatableRaisedButton", sender: self)
        case .AnimatableMaterialTextField:
            performSegueWithIdentifier("toAnimatableMaterialTextField", sender: self)
        case .AnimatableButton2:
            print("AnimatableButton2")
        case .AnimatableButton3:
            print("AnimatableButton3")
        case .AnimatableButton4:
            print("AnimatableButton4")
        case .AnimatableButton5:
            print("AnimatableButton5")
        }
    }
    
    
}


extension MainTableView {
    
    /// Prepares the searchButton.
    private func prepareSearchButton() {
        let image: UIImage? = MaterialIcon.cm.search
        searchButton = IconButton()
        searchButton.pulseColor = MaterialColor.white
        searchButton.setImage(image, forState: .Normal)
        searchButton.setImage(image, forState: .Highlighted)
    }
    
    /// Prepares the menuButton.
    private func prepareMenuButton() {
        let image: UIImage? = MaterialIcon.cm.menu
        menuButton = IconButton()
        menuButton.pulseColor = MaterialColor.white
        menuButton.setImage(image, forState: .Normal)
        menuButton.setImage(image, forState: .Highlighted)
    }
    
    /// Prepares the navigationItem.
    private func prepareNavigationItem() {
        navigationItem.title = "Components List"
        navigationItem.titleLabel.textAlignment = .Left
        navigationItem.titleLabel.font = RobotoFont.mediumWithSize(20)
        
        navigationItem.leftControls = [menuButton]
        navigationItem.rightControls = [searchButton]
    }
}



