/**
 Copyright (c) 2016-present, Facebook, Inc. All rights reserved.

 The examples provided by Facebook are for non-commercial testing and evaluation
 purposes only. Facebook reserves all rights not expressly granted.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 FACEBOOK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import UIKit
import IGListKit

final class DisplaySectionController: IGListSectionController, IGListSectionType, IGListDisplayDelegate {

    override init() {
        super.init()
        displayDelegate = self
        inset = UIEdgeInsets(top: 10, left: 10, bottom: 30, right: 10)
        minimumLineSpacing = 10
        minimumInteritemSpacing = 10
    }

    func numberOfItems() -> Int {
        return 1
    }

    func sizeForItem(at index: Int) -> CGSize {
        var width = collectionContext!.containerSize.width
        if collectionContext!.containerSize.width > 600 {
            width = collectionContext!.containerSize.width * 0.4
        } else if collectionContext!.containerSize.width > 1200  {
            width = collectionContext!.containerSize.width * 0.2
        }
        return CGSize(width: width, height: CGFloat(arc4random_uniform(100) + 50))
    }

    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cellClass: AnyClass = ImageCell.self
        let cell = collectionContext!.dequeueReusableCell(of: cellClass, for: self, at: index)
        (cell as? ImageCell)?.setImage(image: UIImage(named: "kotik"))
        return cell
    }

    func didUpdate(to object: Any) {}

    func didSelectItem(at index: Int) {}

    // MARK: IGListDisplayDelegate

    func listAdapter(_ listAdapter: IGListAdapter, willDisplay sectionController: IGListSectionController) {
        let section = collectionContext!.section(for: self)
        print("Will display section \(section)")
    }

    func listAdapter(_ listAdapter: IGListAdapter, willDisplay sectionController: IGListSectionController, cell: UICollectionViewCell, at index: Int) {
        let section = collectionContext!.section(for: self)
        print("Did will display cell \(index) in section \(section)")
    }

    func listAdapter(_ listAdapter: IGListAdapter, didEndDisplaying sectionController: IGListSectionController) {
        let section = collectionContext!.section(for: self)
        print("Did end displaying section \(section)")
    }

    func listAdapter(_ listAdapter: IGListAdapter, didEndDisplaying sectionController: IGListSectionController, cell: UICollectionViewCell, at index: Int) {
        let section = collectionContext!.section(for: self)
        print("Did end displaying cell \(index) in section \(section)")
    }

}
