import UIKit

class MaskViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    private var masks = [Mask]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Hit the API endpoint
        let urlString = "https://quality.data.gov.tw/dq_download_json.php?nid=116285&md5_url=2150b333756e64325bdbc4a5fd45fad1"
        
        let url = URL(string: urlString)
        
        guard url != nil else { return }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil{
                // Parse JSON
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                
                do {
                let downloadedMasks = try decoder.decode([Mask].self, from: data!)
                    self.masks = downloadedMasks
                    
                    
                }
                catch{
                    print("Error in JSON parsing")
                }
                
            }
        }
        dataTask.resume()
        }
}
extension MaskViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return masks.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MaskCell") as? MaskTableViewCell else { return UITableViewCell() }
            
    //        cell.nameLabel.text = masks[indexPath.row].name
    //        cell.timeLabel.text = masks[indexPath.row].time
            return cell
        }
}
    
