//
//  ViewController.swift
//  CustomControlTransitionDelegate
//
//  Created by Nattapong Unaregul on 7/7/17.
//  Copyright © 2017 Nattapong Unaregul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel : ViewModel = ViewModel()
    lazy var transitionManager = TransitionManager()
    var isFirstTime : Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        viewModel.fetchData {[unowned self] (isDone) in
            self.collectionView.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //    override func viewDidAppear(_ animated: Bool) {
    //        if isFirstTime {
    //            isFirstTime = false
    //            collectionView(self.collectionView, didSelectItemAt: IndexPath(item: 1, section: 0))
    //        }
    //    }
}
extension ViewController : UICollectionViewDataSource,UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.chats.count == 0 ? 0 : viewModel.chats.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if viewModel.chats[indexPath.item].typeofChatter == .selfChatter{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selfIdentifer", for: indexPath) as! SelfChatCell
            cell.lb_Message.text = viewModel.chats[indexPath.item].message
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "otherIdentifer", for: indexPath) as! OtherChatCell
            cell.lb_Message.text = viewModel.chats[indexPath.item].message
            return cell
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueGoToSecondVc"{
            let secondVc = segue.destination as! SecondViewController
            let imageProfile = sender as! UIImageViewWithBorder
            transitionManager.image = imageProfile
            secondVc.transitioningDelegate = transitionManager
            secondVc.modalPresentationStyle = .custom
            secondVc.imageData = imageProfile.image
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            var imageProfile : UIImageViewWithBorder!
            if let selfCell = cell as? SelfChatCell {
                imageProfile = selfCell.im_Profile
            }else if let otherCell = cell as? OtherChatCell {
                imageProfile = otherCell.im_Profile
            }else {
                print("no cell")
            }
            performSegue(withIdentifier: "segueGoToSecondVc", sender: imageProfile)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width , height: 81)
    }
    
}



