//
//  ViewController.swift
//  AppTravelForest
//
//  Created by Олег Дмитриев on 06.08.2024.
//

import UIKit

struct SuggestData {
    let image: String
    let title: String
    let location: String
    let rating: String
    
    static func mockData() -> [SuggestData] {
        [
            SuggestData(image: "image-01", title: "Nusa Pedina", location: "Bali, Indonesia", rating: "4.5"),
            SuggestData(image: "image-02", title: "Wachau Forest", location: "river Danube, Austria", rating: "4.8"),
            SuggestData(image: "image-03", title: "Tromso", location: "Norway", rating: "4.9"),
        ]
    }
}

struct BestTourData {
    let image: String
    let title: String
    let date: String
    let price: String
    let location: String
    let rating: String
    
    static func mockData() -> [BestTourData] {
        [
            BestTourData(image: "post-image-01", title: "Western Desert", 
                         date: "12 - 18 Jan 2021", price: "450", location: "Egypt", rating: "4.9"),
        ]
    }
}

class ViewController: UIViewController {

    private let uiBuilder = UIBuilder()
    
    private let suggestData = SuggestData.mockData()
    
    private let bestTourData = BestTourData.mockData()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = true
        view.alwaysBounceVertical = true
        return view
    }()
    
    private lazy var scrollViewContent: UIView = UIView()
    
    // MARK: viewNotis
    private lazy var viewNotis: UIView = uiBuilder.addView()
    
    private lazy var viewNotisAvatar: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = .avatar
        $0.widthAnchor.constraint(equalToConstant: 48).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 48).isActive = true
        $0.layer.cornerRadius = 24
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0).cgColor
        $0.layer.masksToBounds = true
        return $0
    }(UIImageView())
    
    private lazy var viewNotisLabel: UILabel = uiBuilder.addLabel(text: "Welcome back",
                                                                  fontS: 14, fontW: .regular,
                                                                  color: .appGray, lines: 1)
    
    private lazy var viewNotisName: UILabel = uiBuilder.addLabel(text: "Oleg Dmitriev",
                                                                 fontS: 19, fontW: .regular,
                                                                 color: .appWhite, lines: 1)
    
    private lazy var viewNotisBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(.iconNotification, for: .normal)
        $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return $0
    }(UIButton())
    
    // MARK: viewSearch
    private lazy var viewSearch: UIView = uiBuilder.addView()
    
    private lazy var viewSearchField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor : UIColor.appGray])


        $0.heightAnchor.constraint(equalToConstant: 48).isActive = true
        $0.addPaddingToTextField()
        $0.textColor = .appGray
        $0.backgroundColor = .appBlack
        $0.layer.cornerRadius = 10

        return $0
    }(UITextField())
    
    private lazy var viewSearchIconS: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = .iconSearch
        $0.widthAnchor.constraint(equalToConstant: 24).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 24).isActive = true
        return $0
    }(UIImageView())
    
    private lazy var viewSearchFilter: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(.iconFilter, for: .normal)
        $0.widthAnchor.constraint(equalToConstant: 24).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 24).isActive = true
        return $0
    }(UIButton())
    
    // MARK: viewSuggest
    private lazy var viewSuggest: UIView = uiBuilder.addView()
    
    private lazy var viewSuggestTitle: UILabel = uiBuilder.addLabel(text: "Suggestions for you", 
                                                                    fontS: 18, fontW: .regular,
                                                                    color: .appWhite, lines: 0)
    
    private lazy var viewSuggestBlocks: UIView = uiBuilder.addView()
    
    private lazy var viewSuggestLayout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var viewSuggestCollectionView: UICollectionView = {
        let collevtionView = UICollectionView(frame: .zero, collectionViewLayout: self.viewSuggestLayout)
        collevtionView.translatesAutoresizingMaskIntoConstraints = false
        collevtionView.dataSource = self
        collevtionView.delegate = self
        collevtionView.showsHorizontalScrollIndicator = false
        collevtionView.register(SuggestCell.self, forCellWithReuseIdentifier: SuggestCell.reuseId)
        return collevtionView
    }()
    
    // MARK: viewBestTour
    private lazy var viewBestTour: UIView = uiBuilder.addView()
    
    private lazy var viewBestTourTitle: UILabel = uiBuilder.addLabel(text: "The best tours",
                                                                     fontS: 18, fontW: .regular,
                                                                     color: .appWhite, lines: 1)
    
    private lazy var blockTour: UIView = uiBuilder.addView()
    
    private lazy var blockTourImage: UIImageView = uiBuilder.addImage(image: .postImage01, brs: 6)
    
    private lazy var blockTourTitle: UILabel = uiBuilder.addLabel(text: "Western Desert", fontS: 18,
                                                                  fontW: .regular, color: .appWhite, lines: 1)
    
    private lazy var blockTourDateIcon: UIImageView = uiBuilder.addImage(image: .iconCalendarGray, brs: 0)
    
    private lazy var blockTourDate: UILabel = uiBuilder.addLabel(text: "12 - 18 Jan 2021", fontS: 13,
                                                                 fontW: .regular, color: .appWhite, lines: 1)
    
    private lazy var blockTourPriceIcon: UIImageView = uiBuilder.addImage(image: .iconDollarGray, brs: 0)
    
    private lazy var blockTourPrice: UILabel = uiBuilder.addLabel(text: "450", fontS: 13,
                                                                  fontW: .regular, color: .appWhite, lines: 1)
    
    private lazy var blockTourPriceAmount: UILabel = uiBuilder.addLabel(text: "/ Day", fontS: 10,
                                                                   fontW: .regular, color: .appGray, lines: 1)
    
    private lazy var blockTourLocationIcon: UIImageView = uiBuilder.addImage(image: .iconLocationGray, brs: 0)
    
    private lazy var blockTourLocation: UILabel = uiBuilder.addLabel(text: "Egypt", fontS: 13,
                                                                     fontW: .regular, color: .appWhite, lines: 1)
    
    //
    private lazy var viewText: UILabel = uiBuilder.addLabel(text: "The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours The best tours",
                                                                     fontS: 18, fontW: .regular,
                                                                     color: .appWhite, lines: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .appBg
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContent)
        
        scrollViewContent.addSubviews(viewNotis, viewSearch, viewSuggest, viewBestTour, viewText)

        viewNotis.addSubviews(viewNotisAvatar, viewNotisLabel, viewNotisName, viewNotisBtn)
        
        viewSearch.addSubviews(viewSearchField, viewSearchIconS, viewSearchFilter)
        
        viewSuggest.addSubviews(viewSuggestTitle, viewSuggestCollectionView)
        
        viewBestTour.addSubviews(viewBestTourTitle, blockTour)
        
        blockTour.addSubviews(blockTourImage, blockTourTitle, blockTourDateIcon, blockTourDate, blockTourPriceIcon, blockTourPrice, blockTourPriceAmount, blockTourLocationIcon, blockTourLocation)
        
        setupUI()
    }

    func setupUI() {
        viewSuggestCollectionView.backgroundColor = .clear
        blockTour.backgroundColor = .appBlack
        blockTour.layer.cornerRadius = 10
        scrollViewContent.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            scrollViewContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            // MARK: viewNotis
            viewNotis.topAnchor.constraint(equalTo: scrollViewContent.topAnchor, constant: 0),
            viewNotis.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor, constant: uiBuilder.container),
            viewNotis.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -uiBuilder.container),
            
            viewNotisAvatar.topAnchor.constraint(equalTo: viewNotis.topAnchor, constant: 0),
            viewNotisAvatar.leadingAnchor.constraint(equalTo: viewNotis.leadingAnchor, constant: 0),
            
            viewNotisLabel.topAnchor.constraint(equalTo: viewNotis.topAnchor, constant: 0),
            viewNotisLabel.leadingAnchor.constraint(equalTo: viewNotisAvatar.trailingAnchor, constant: 8),
            viewNotisLabel.trailingAnchor.constraint(equalTo: viewNotisBtn.trailingAnchor, constant: -60),

            viewNotisName.topAnchor.constraint(equalTo: viewNotisLabel.bottomAnchor, constant: 4),
            viewNotisName.leadingAnchor.constraint(equalTo: viewNotisAvatar.trailingAnchor, constant: 8),
            viewNotisName.trailingAnchor.constraint(equalTo: viewNotisBtn.trailingAnchor, constant: -60),
            
            viewNotisBtn.topAnchor.constraint(equalTo: viewNotis.topAnchor, constant: 0),
            viewNotisBtn.trailingAnchor.constraint(equalTo: viewNotis.trailingAnchor, constant: 0),
            
            viewNotis.bottomAnchor.constraint(equalTo: viewNotisAvatar.bottomAnchor, constant: 0),
            
            // MARK: viewSearch
            viewSearch.topAnchor.constraint(equalTo: viewNotis.bottomAnchor, constant: 24),
            viewSearch.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor, constant: uiBuilder.container),
            viewSearch.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -uiBuilder.container),
            
            viewSearchField.topAnchor.constraint(equalTo: viewSearch.topAnchor, constant: 0),
            viewSearchField.leadingAnchor.constraint(equalTo: viewSearch.leadingAnchor, constant: 0),
            viewSearchField.trailingAnchor.constraint(equalTo: viewSearch.trailingAnchor, constant: 0),
            
            viewSearchIconS.topAnchor.constraint(equalTo: viewSearch.topAnchor, constant: 12),
            viewSearchIconS.leadingAnchor.constraint(equalTo: viewSearch.leadingAnchor, constant: 12),
            
            viewSearchFilter.topAnchor.constraint(equalTo: viewSearch.topAnchor, constant: 12),
            viewSearchFilter.trailingAnchor.constraint(equalTo: viewSearch.trailingAnchor, constant: -12),
            
            viewSearch.bottomAnchor.constraint(equalTo: viewSearchField.bottomAnchor, constant: 0),
            
            // MARK: viewSuggest
            viewSuggest.topAnchor.constraint(equalTo: viewSearch.bottomAnchor, constant: 24),
            viewSuggest.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor, constant: uiBuilder.container),
            viewSuggest.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -uiBuilder.container),
            
            viewSuggestTitle.topAnchor.constraint(equalTo: viewSuggest.topAnchor, constant: 0),
            viewSuggestTitle.leadingAnchor.constraint(equalTo: viewSuggest.leadingAnchor, constant: 0),
            viewSuggestTitle.trailingAnchor.constraint(equalTo: viewSuggest.trailingAnchor, constant: 0),
            
            viewSuggestCollectionView.topAnchor.constraint(equalTo: viewSuggestTitle.bottomAnchor, constant: 24),
            viewSuggestCollectionView.leadingAnchor.constraint(equalTo: viewSuggest.leadingAnchor, constant: 0),
            viewSuggestCollectionView.trailingAnchor.constraint(equalTo: viewSuggest.trailingAnchor, constant: uiBuilder.container),
            viewSuggestCollectionView.heightAnchor.constraint(equalToConstant: 160),
            
            viewSuggest.bottomAnchor.constraint(equalTo: viewSuggestCollectionView.bottomAnchor, constant: 0),
            
            // MARK: viewBestTour
            viewBestTour.topAnchor.constraint(equalTo: viewSuggest.bottomAnchor, constant: 40),
            viewBestTour.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor, constant: uiBuilder.container),
            viewBestTour.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -uiBuilder.container),
            
            viewBestTourTitle.topAnchor.constraint(equalTo: viewBestTour.topAnchor, constant: 0),
            viewBestTourTitle.leadingAnchor.constraint(equalTo: viewBestTour.leadingAnchor, constant: 0),
            viewBestTourTitle.trailingAnchor.constraint(equalTo: viewBestTour.trailingAnchor, constant: 0),
            
            blockTour.topAnchor.constraint(equalTo: viewBestTourTitle.bottomAnchor, constant: 16),
            blockTour.leadingAnchor.constraint(equalTo: viewBestTour.leadingAnchor, constant: 0),
            blockTour.trailingAnchor.constraint(equalTo: viewBestTour.trailingAnchor, constant: 0),
            blockTour.bottomAnchor.constraint(equalTo: blockTourImage.bottomAnchor, constant: 12),
            
            blockTourImage.topAnchor.constraint(equalTo: blockTour.topAnchor, constant: 12),
            blockTourImage.leadingAnchor.constraint(equalTo: blockTour.leadingAnchor, constant: 12),
            blockTourImage.widthAnchor.constraint(equalToConstant: 88),
            blockTourImage.heightAnchor.constraint(equalToConstant: 88),
            
            blockTourTitle.topAnchor.constraint(equalTo: blockTourImage.topAnchor, constant: 5),
            blockTourTitle.leadingAnchor.constraint(equalTo: blockTourImage.trailingAnchor, constant: 12),
            blockTourTitle.trailingAnchor.constraint(equalTo: blockTour.trailingAnchor, constant: -40),
            
            blockTourDateIcon.topAnchor.constraint(equalTo: blockTourTitle.bottomAnchor, constant: 12),
            blockTourDateIcon.leadingAnchor.constraint(equalTo: blockTourImage.trailingAnchor, constant: 12),
            blockTourDateIcon.widthAnchor.constraint(equalToConstant: 16),
            blockTourDateIcon.heightAnchor.constraint(equalToConstant: 16),
            
            blockTourDate.topAnchor.constraint(equalTo: blockTourTitle.bottomAnchor, constant: 12),
            blockTourDate.leadingAnchor.constraint(equalTo: blockTourDateIcon.trailingAnchor, constant: 6),
            blockTourDate.trailingAnchor.constraint(equalTo: blockTour.trailingAnchor, constant: -12),
            
            blockTourPriceIcon.topAnchor.constraint(equalTo: blockTourDateIcon.bottomAnchor, constant: 12),
            blockTourPriceIcon.leadingAnchor.constraint(equalTo: blockTourImage.trailingAnchor, constant: 12),
            blockTourPriceIcon.widthAnchor.constraint(equalToConstant: 16),
            blockTourPriceIcon.heightAnchor.constraint(equalToConstant: 16),
            
            blockTourPrice.topAnchor.constraint(equalTo: blockTourPriceIcon.topAnchor, constant: 0),
            blockTourPrice.leadingAnchor.constraint(equalTo: blockTourPriceIcon.trailingAnchor, constant: 6),
            
            blockTourPriceAmount.bottomAnchor.constraint(equalTo: blockTourPrice.bottomAnchor, constant: 0),
            blockTourPriceAmount.leadingAnchor.constraint(equalTo: blockTourPrice.trailingAnchor, constant: 4),
            
            blockTourLocationIcon.topAnchor.constraint(equalTo: blockTourDateIcon.bottomAnchor, constant: 12),
            blockTourLocationIcon.leadingAnchor.constraint(equalTo: blockTourPriceAmount.trailingAnchor, constant: 24),
            blockTourLocationIcon.widthAnchor.constraint(equalToConstant: 16),
            blockTourLocationIcon.heightAnchor.constraint(equalToConstant: 16),
            
            blockTourLocation.topAnchor.constraint(equalTo: blockTourLocationIcon.topAnchor, constant: 0),
            blockTourLocation.leadingAnchor.constraint(equalTo: blockTourLocationIcon.trailingAnchor, constant: 6),
            
            viewBestTour.bottomAnchor.constraint(equalTo: blockTour.bottomAnchor, constant: 0),
            
            viewText.topAnchor.constraint(equalTo: viewBestTour.bottomAnchor, constant: 40),
            viewText.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor, constant: 16),
            viewText.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -16),
            viewText.bottomAnchor.constraint(equalTo: scrollViewContent.bottomAnchor, constant: -40),
            

        ])
    }

}

