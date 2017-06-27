//
//  JobViewController.swift
//  LinkingTalent
//
//  Created by Matthew Falzon on 2017-06-26.
//  Copyright © 2017 Matthew Falzon. All rights reserved.
//

import UIKit

class JobViewController: UIViewController {
    
    var jobId: String?
    var job: Job?
    
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var lblJobCategory: UILabel!
    @IBOutlet weak var lblEmploymentType: UILabel!
    @IBOutlet weak var tvJobDescription: UITextView!
    @IBOutlet weak var lblJobBounty: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //jobTitle.text = jobId
        self.navigationItem.title = job?.title
        jobTitle.text = job?.location
        lblJobCategory.text = job?.category
        lblEmploymentType.text = job?.employmentType
        tvJobDescription.text = job?.desc
        let bounty = job?.bounty
        lblJobBounty.text = "Reward: $" + String(bounty!)
        print(bounty!)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
