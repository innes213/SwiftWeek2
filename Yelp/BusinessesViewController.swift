//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var navTitleView: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    
    var businesses: [Business]!
    var searchBar = UISearchBar()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // this VC is also the table's DataSource and Delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        //setup search bar
        searchBar.delegate = self
        searchBar.placeholder = "Whatcha want?"
        navTitleView.titleView = searchBar
        
        //Autolayout nonsense
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        /*
        Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            
            self.businesses = businesses
            self.tableView.reloadData()
            
            for business in businesses {
                println(business.name!)
                println(business.address!)
            }
        })
        
        Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            
            for business in businesses {
                println(business.name!)
                println(business.address!)
            }
        }
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if businesses != nil {
            return businesses.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
        cell.business = businesses[indexPath.row]
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    /* Search Bar functions */
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        Business.searchWithTerm(searchText, completion: { (businesses: [Business]!, error: NSError!) -> Void in
            
            self.businesses = businesses
            self.tableView.reloadData()
            
            for business in businesses {
                println(business.name!)
                println(business.address!)
            }
        })
    }

}
