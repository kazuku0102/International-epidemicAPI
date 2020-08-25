//
//  EpidemicTableViewController.swift
//  International-epidemicAPI
//
//  Created by 蕭聿莘 on 2020/8/23.
//

import UIKit

class EpidemicTableViewController: UITableViewController {

    var epidemics = [Epidemic]()
    var refreshCon: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "國際重要疫情資訊"
        refreshCon = UIRefreshControl()
        refreshCon.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshCon)
        
        let urlStr = "https://www.cdc.gov.tw/TravelEpidemic/ExportJSON"
        
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response, erroe) in
                let decoder = JSONDecoder()
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy/MM/dd"
                decoder.dateDecodingStrategy = .iso8601
                if let data = data {
                    do {
                        let epdemics = try decoder.decode([Epidemic].self, from: data)
                        self.epidemics = epdemics
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } catch {
                        print(error)
                    }
                }
            }.resume()
            
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return epidemics.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "outBreakCell", for: indexPath) as! EpidemicTableViewCell

        let epidemic = epidemics[indexPath.row]
        cell.titleLabel.text = epidemic.headline
        
        //顯示時間
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let dateStr = formatter.string(from: epidemic.effective)
        cell.ourbreakDayLabel.text = dateStr
        return cell
    }
    
    
    @IBSegueAction func ToDetailPage(_ coder: NSCoder) -> DetailViewController? {
        let controller =  DetailViewController(coder: coder)
        if let row = tableView.indexPathForSelectedRow?.row {
            controller?.epidemic = epidemics[row]
            
        }
        return controller
    }
    
    @objc func refresh() {
        tableView.reloadData()
        refreshCon.endRefreshing()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
