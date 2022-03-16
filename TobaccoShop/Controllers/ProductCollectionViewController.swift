//
//  ProductCollectionViewController.swift
//  TobaccoShop
//
//  Created by Егор Кожемин on 02.03.2022.
//

import UIKit

let cellReuseIdentifier = "ProductCell"

final class ProductCollectionViewController: UIViewController {
    let sectionInset: CGFloat = 10
    let itemsPerRow: CGFloat = 2
    let minimumLineSpacing: CGFloat = 30

    var productList = [Product]() {
        didSet {
            collectionView.reloadData()
        }
    }

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        return collectionView
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(
            ProductHeaderCollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: ProductHeaderCollectionReusableView.collectionViewHeaderFooterReuseIdentifier
        )
        configureUI()
    }

    override func loadView() {
        super.loadView()
    }

    func configureUI() {
        view.addSubview(collectionView)
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView.snp.makeConstraints { make -> Void in
            make.edges.equalTo(view)
        }
    }
}

extension ProductCollectionViewController: UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        productList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! ProductCollectionViewCell
        myCell.routDelegate = self
        let product = productList[indexPath.row]
        myCell.configure(product: product)
        return myCell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: ProductHeaderCollectionReusableView.collectionViewHeaderFooterReuseIdentifier,
                for: indexPath
            ) as! ProductHeaderCollectionReusableView
            return headerView

        default:
            assert(false, "Unexpected element kind")
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, referenceSizeForHeaderInSection _: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 110.0)
    }
}

extension ProductCollectionViewController: UICollectionViewDelegate {
    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
    }
}

extension ProductCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        let paddingWidth = sectionInset * (itemsPerRow + 1)
        let availWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availWidth / itemsPerRow
        let heightPerItem = widthPerItem * 1.6

        return CGSize(width: widthPerItem, height: heightPerItem)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt _: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: sectionInset, left: sectionInset, bottom: sectionInset, right: sectionInset)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt _: Int) -> CGFloat {
        minimumLineSpacing
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumInteritemSpacingForSectionAt _: Int) -> CGFloat {
        sectionInset
    }
}

extension ProductCollectionViewController: PresentNextControllerDelegate {
    func present(_ data: Any?) {
        if data == nil {
            let vc = OrderSuccessController()
            navigationController?.pushViewController(vc, animated: true)
        }

        guard let product = data as? Product else { return }
        let vc = ProductDetailController()
        vc.displayProduct(product)
        navigationController?.pushViewController(vc, animated: true)
    }
}
