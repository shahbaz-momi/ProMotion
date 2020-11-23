//
//  ViewController.swift
//  Promotion
//
//  Created by Temp on 2020-11-21.
//

import UIKit
import ARKit

class PracticeSport {
    var name: String
    var supportedActions: [String]
    var image: String
    var gradient: [UIColor]
    
    init(name: String, supportedActions: [String], image: String, gradient: [UIColor]) {
        self.name = name
        self.supportedActions = supportedActions
        self.image = image
        self.gradient = gradient
    }
}

var index = 0

func cellRandomBackgroundColors() -> [UIColor] {
    let red = [#colorLiteral(red: 0.9654200673, green: 0.1590853035, blue: 0.2688751221, alpha: 1),#colorLiteral(red: 0.7559037805, green: 0.1139892414, blue: 0.1577021778, alpha: 1)]
    let orangeRed = [#colorLiteral(red: 0.9338900447, green: 0.4315618277, blue: 0.2564975619, alpha: 1),#colorLiteral(red: 0.8518816233, green: 0.1738803983, blue: 0.01849062555, alpha: 1)]
    let orange = [#colorLiteral(red: 0.9953531623, green: 0.54947716, blue: 0.1281470656, alpha: 1),#colorLiteral(red: 0.9409626126, green: 0.7209432721, blue: 0.1315650344, alpha: 1)]
    let yellow = [#colorLiteral(red: 0.9409626126, green: 0.7209432721, blue: 0.1315650344, alpha: 1),#colorLiteral(red: 0.8931249976, green: 0.5340107679, blue: 0.08877573162, alpha: 1)]
    let green = [#colorLiteral(red: 0.3796315193, green: 0.7958304286, blue: 0.2592983842, alpha: 1),#colorLiteral(red: 0.2060100436, green: 0.6006633639, blue: 0.09944178909, alpha: 1)]
    let greenBlue = [#colorLiteral(red: 0.2761503458, green: 0.824685812, blue: 0.7065336704, alpha: 1),#colorLiteral(red: 0, green: 0.6422213912, blue: 0.568986237, alpha: 1)]
    let kindaBlue = [#colorLiteral(red: 0.2494148612, green: 0.8105323911, blue: 0.8425348401, alpha: 1),#colorLiteral(red: 0, green: 0.6073564887, blue: 0.7661359906, alpha: 1)]
    let skyBlue = [#colorLiteral(red: 0.3045541644, green: 0.6749247313, blue: 0.9517192245, alpha: 1),#colorLiteral(red: 0.008423916064, green: 0.4699558616, blue: 0.882807076, alpha: 1)]
    let blue = [#colorLiteral(red: 0.1774400771, green: 0.466574192, blue: 0.8732826114, alpha: 1),#colorLiteral(red: 0.00491155684, green: 0.287129879, blue: 0.7411141396, alpha: 1)]
    let bluePurple = [#colorLiteral(red: 0.4613699913, green: 0.3118675947, blue: 0.8906354308, alpha: 1),#colorLiteral(red: 0.3018293083, green: 0.1458326578, blue: 0.7334778905, alpha: 1)]
    let purple = [#colorLiteral(red: 0.7080290914, green: 0.3073516488, blue: 0.8653779626, alpha: 1),#colorLiteral(red: 0.5031493902, green: 0.1100070402, blue: 0.6790940762, alpha: 1)]
    let pink = [#colorLiteral(red: 0.9495453238, green: 0.4185881019, blue: 0.6859942079, alpha: 1),#colorLiteral(red: 0.8123683333, green: 0.1657164991, blue: 0.5003474355, alpha: 1)]
    
    let colorsTable: [Int: [UIColor]] = [0: red, 1: orangeRed, 2: orange, 3: yellow, 4: green, 5: greenBlue, 6: kindaBlue, 7: skyBlue, 8: blue, 9: bluePurple, 10: bluePurple, 11: purple, 12: pink]
    
//    index = (index + 1) % 12
//    let randomColors = colorsTable[index]
    
    let randomColors = colorsTable.values.randomElement()
    return randomColors!
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ARSCNViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
        
    @IBOutlet weak var arView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arView.delegate = self
       
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    let practiceSports: [PracticeSport] = [
        PracticeSport(
            name: "Create",
            supportedActions: ["Custom motion"],
            image: "👍",
            gradient: cellRandomBackgroundColors()
        ),
        PracticeSport(
            name: "Basketball",
            supportedActions: ["Jump Shot", "Free Throw"],
            image: "🏀",
            gradient: cellRandomBackgroundColors()
        ),
        PracticeSport(
            name: "Soccer",
            supportedActions: ["Free Kick", "Throw In"],
            image: "⚽",
            gradient: cellRandomBackgroundColors()
        ),
        PracticeSport(
            name: "Voleyball",
            supportedActions: ["Spike", "Volley"],
            image: "🏐",
            gradient: cellRandomBackgroundColors()
        ),
        PracticeSport(
            name: "Baseball",
            supportedActions: ["Swing", "Pitch"],
            image: "⚾",
            gradient: cellRandomBackgroundColors()
        ),
        PracticeSport(
            name: "Bowling",
            supportedActions: ["Bowl"],
            image: "🎳",
            gradient: cellRandomBackgroundColors()
        ),
        PracticeSport(
            name: "Hockey",
            supportedActions: ["Shot", "Dribble"],
            image: "🏒",
            gradient: cellRandomBackgroundColors()
        ),
        PracticeSport(
            name: "Golf",
            supportedActions: ["Swing"],
            image: "⛳",
            gradient: cellRandomBackgroundColors()
        )
    ]

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return practiceSports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.cellLabel.text = practiceSports[indexPath.item].name
        cell.cellSubLabel.text = practiceSports[indexPath.item].supportedActions.joined(separator: ", ")
        cell.cellImage.text = practiceSports[indexPath.item].image
        cell.gradient = practiceSports[indexPath.item].gradient
        cell.image = practiceSports[indexPath.item].image
        
        func gradient(frame:CGRect) -> CAGradientLayer {
                let layer = CAGradientLayer()
                layer.frame = frame
                layer.startPoint = CGPoint(x: 0, y: 0.5)
                layer.endPoint = CGPoint(x: 1, y: 0.5)
                layer.colors = [
                    (practiceSports[indexPath.item].gradient.first! as UIColor).cgColor,
                    (practiceSports[indexPath.item].gradient.last! as UIColor).cgColor
                ]
                return layer
            }

        cell.layer.insertSublayer(gradient(frame: cell.bounds), at:0)
    
//        cell.contentView.backgroundColor = practiceSports[indexPath.item].gradient.first! as UIColor
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is DetailPageViewController {
            var title = (sender! as! CollectionViewCell).cellLabel!.text
            let gradient = (sender! as! CollectionViewCell).gradient
            let subLabel = (sender! as! CollectionViewCell).cellSubLabel!.text
            let image = (sender! as! CollectionViewCell).image
            let vc = segue.destination as? DetailPageViewController
            vc?.title = title
            title!.append(" ")
            title!.append(image)
            vc?.titl = title!
            vc?.image = image
            vc?.desc = subLabel!
            vc?.gradient = gradient
        }
    }

}

