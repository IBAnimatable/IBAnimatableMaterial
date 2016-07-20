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
import IBAnimatableMaterial

private enum components: String {
  case AnimatableMaterialButtons, AnimatableMaterialTextField, AnimatableMaterialErrorTextField = "ErrorTextField / TextView / Label / SearchBar", AnimatableMaterialCardView
  case AnimatableImageCardView, AnimatableControlView = "ControlView / PulseView", AnimatableMaterialCollectionViewCell
  
  static let AllValues = [AnimatableMaterialButtons, AnimatableMaterialTextField, AnimatableMaterialErrorTextField, AnimatableMaterialCardView, AnimatableImageCardView, AnimatableControlView, AnimatableMaterialCollectionViewCell]
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
    case .AnimatableMaterialButtons:
      performSegueWithIdentifier("toAnimatableMaterialButtons", sender: self)
    case .AnimatableMaterialTextField:
      performSegueWithIdentifier("toAnimatableMaterialTextField", sender: self)
    case .AnimatableMaterialErrorTextField:
      performSegueWithIdentifier("toAnimatableMaterialErrorTextField", sender: self)
    case .AnimatableMaterialCardView:
      performSegueWithIdentifier("toAnimatableMaterialCardView", sender: self)
    case .AnimatableImageCardView:
      performSegueWithIdentifier("toAnimatableMaterialImageCardView", sender: self)
    case .AnimatableControlView:
      performSegueWithIdentifier("toAnimatableMaterialControlView", sender: self)
    case .AnimatableMaterialCollectionViewCell:
      performSegueWithIdentifier("toAnimatableMaterialCollectionViewCellViewController", sender: self)
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
    menuButton.pulseColor = MaterialColor.purple.lighten5
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



