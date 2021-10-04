////
////  3-11_OHHTTPStubsSample.swift
////  UnitTestExerciseTests
////
////  Created by 白数叡司 on 2021/10/04.
////
//
//import XCTest
//@testable import UnitTestExercise
//
//// MARK: - テストターゲット
//struct User: Decodable {
//    let name: String
//}
//
//class APIManager {
//    func fetchUser(completion: @escaping ((Result<User, Error>) -> Void)) {
//        let url = URL(string: "https://tanaka.com/user")!
//        let request = URLRequest(url: url)
//        let session = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard let data = data else { return }
//
//            let decoder = JSONDecoder()
//            do {
//                let user = try decoder.decode(User.self, from: data)
//                completion(.success(user))
//
//            } catch {
//                completion(.failure(error))
//            }
//        }
//
//        session.resume()
//    }
//}
//
//class UserManager {
//    static let shared = UserManager()
//    private init() {}
//
//    private(set) var user: User?
//
//    func fetchUser(completion: @escaping (() -> Void)) {
//        // コンポーネント内部で通信処理を実施する
//        let apiManager = APIManager()
//        apiManager.fetchUser { [weak self] result in
//            switch result {
//            case .success(let user):
//                // 通信が完了したらuserを保持する
//                self?.user = user
//                completion()
//            case .failure(let error):
//                // 省略
//                break
//            }
//        }
//    }
//}
//
//// MARK: - テストコード
//
///*
// ① 非同期処理のテスト(wait(for:timout:)メソッドで非同期処理終了をfulfill()まで待つ設定を施す)
// ② HTTPスタブが作動する条件を記述(host が tanaka.com の HTTPリクエストでスタブが返却されるように設定)
// ③ バンドルしている User.json ファイルを取得して通信結果の HTTP レスポンスとして返却する設定を施している
//    → OHHTTPStubsResponseクラス：HTTPスタブのレスポンスを表すクラス
// ④ 通信の完了を知らせるクロージャが呼び出されたタイミングでアサーションを行う
// ⑤ テストが終了後の設定の後片付け
//
// */
//
//class UserManagerTests: XCTestCase {
//    private var userManager: UserManager!
//
//    override func setUp() {
//        super.setUp()
//        userManager = UserManager.shared
//    }
//
//    override func tearDown() {
//        // ⑤
//        userManager = nil
//        OHHTTPStubs.removeAllStubs()
//        super.tearDown()
//    }
//
//    func testFetchUser() {
//        // ①
//        let exp = expectation(description: #function)
//
//        // ②
//        stub(condition: isHost("tanaka.com")) { url -> OHHTTPStubsResponse in
//            // ③
//            let url = Bundle(for: UserManagerTests.self).url(forResource: "User", withExtension: "json")!
//            let data = try! Data(contentsOf: url)
//
//            return OHHTTPStubsResponse(data: data, statusCode: 200, headers: nil)
//        }
//
//        userManager.fetchUser { [weak self] in
//            // ④
//            XCTAssertNotNil(self?.userManager.user)
//            XCTAssertEqual(self?.userManager.user?.name, "Danbo-Tanaka")
//
//            // ①
//            exp.fulfill()
//        }
//
//        // ①
//        wait(for: [exp], timeout: 3.0)
//    }
//}
//
///*
// User.json
//
// {
//    "name":"Danbo-Tanaka"
// }
//
// */
