//
//  ViewController.swift
//  eShares-iOS-Challenge
//
//  Created by Thiago Orniz Martin on 07/03/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

class ReleaseTableViewController: UITableViewController, SpotifyDelegate
{

    private var releases: [ReleaseModel] = []
    private var spotifyManager: SpotifyManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 75

        spotifyManager = SpotifyManager(delegate: self)
        spotifyManager?.retrieveData()
        
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(loadMoreReleases), for: UIControlEvents.valueChanged)
        
        tableView.refreshControl?.beginRefreshing()
        let rect = CGRect.init(x: 0, y: 0, width: 1, height: 1)
        tableView.scrollRectToVisible(rect, animated: true)
    }
    
    func loadMoreReleases(){
       spotifyManager?.retrieveData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return releases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ReleaseTableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReleaseTableViewCell", for: indexPath) as! ReleaseTableViewCell
        let release = releases[indexPath.row]
        
        cell.populateView(release)
        return cell
    }

    // MARK: - SpotifyDelegate
    func dataRetrieved(_ releases: [ReleaseModel]) {
        
        tableView.refreshControl?.endRefreshing()
        self.releases.insert(contentsOf: releases, at: 0)
        tableView.reloadData()
    }
    
    func spotifyRequestDidFail() {
        let alert = UIAlertController(title: "Couldn't retrieve releases", message: "Verify your internet.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ReleaseDetailsSegue" {
            
            if let index = self.tableView.indexPathForSelectedRow?.row {
                
                let releaseDetailsViewController = segue.destination as! ReleaseDetailsViewController
                releaseDetailsViewController.setRelease(releases[index])
                
            }
        }
    }
}

