# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: "test@example.com", password: "adminlogin")

Customer.create!(
  [
    {email: 'guest@guest.com', last_name: 'ゲスト',first_name:'太郎',last_name_kana: 'ゲスト',first_name_kana:'タロウ', nick_name: 'ゲストユーザー', password: 'guestlogin', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/guest.jpeg"), filename:"guest.jpeg")},
    {email: 'shun@test.com', last_name: '加藤',first_name:'駿',last_name_kana: 'カトウ',first_name_kana:'シュン', nick_name: 'かっしゅ', password: '19910625', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/shun.jpeg"), filename:"shun.jpeg")},
    {email: 'mune@test.com',  last_name: '長澤',first_name:'心大',last_name_kana: 'ナガサワ',first_name_kana:'ムネヒロ', nick_name: 'なが', password: 'password'},
    {email: 'kuri@test.com',  last_name: '栗原',first_name:'隆太',last_name_kana: 'クリハラ',first_name_kana:'リュウタ', nick_name: 'くり', password: 'password'},
    {email: 'saburo@test.com',  last_name: '四十万',first_name:'三郎',last_name_kana: 'シジマ',first_name_kana:'サブロウ', nick_name: 'さぶろー', password: 'password'},
    {email: 'hepu@test.com',  last_name: '菊地',first_name:'雄太',last_name_kana: 'キクチ',first_name_kana:'ユウタ', nick_name: 'へぷ', password: 'password'},
    {email: 'ryota@test.com',  last_name: '斉藤',first_name:'亮太',last_name_kana: 'サイトウ',first_name_kana:'リョウタ', nick_name: 'さいとー', password: 'password'},
    {email: 'shin@test.com',  last_name: '布目',first_name:'普',last_name_kana: 'ヌノメ',first_name_kana:'シン', nick_name: 'しん', password: 'password'},
    {email: 'otoya@test.com',  last_name: '和泉',first_name:'音弥',last_name_kana: 'イズミ',first_name_kana:'オトヤ', nick_name: 'おとや', password: 'password'},
    {email: 'tsubasa@test.com',  last_name: '鈴木',first_name:'翔',last_name_kana: 'スズキ',first_name_kana:'ツバサ', nick_name: 'つー', password: 'password'},
    {email: 'koji@test.com',  last_name: '長澤',first_name:'浩二',last_name_kana: 'ナガサワ',first_name_kana:'コウジ', nick_name: 'こーちゃん', password: 'password'},
    {email: 'kono@test.com',  last_name: '河野',first_name:'幹久',last_name_kana: 'コウノ',first_name_kana:'ミキヒサ', nick_name: 'みっきー', password: 'password'},
    {email: 'rachi@test.com',  last_name: '良知',first_name:'陽翔',last_name_kana: 'ラチ',first_name_kana:'ヨウショウ', nick_name: 'らち', password: 'password'},
    {email: 'taiki@test.com',  last_name: '毛塚',first_name:'大貴',last_name_kana: 'ケヅカ',first_name_kana:'タイキ', nick_name: 'けづ', password: 'password'},
    {email: 'kei@test.com',  last_name: '岩澤',first_name:'圭',last_name_kana: 'イワサワ',first_name_kana:'ケイ', nick_name: 'けい', password: 'password'},
    {email: 'murakami@test.com',  last_name: '村上',first_name:'宗隆',last_name_kana: 'ムラカミ',first_name_kana:'ムネタカ', nick_name: '村神様', password: 'password'},
    {email: 'aoki@test.com',  last_name: '青木',first_name:'宣親',last_name_kana: 'アオキ',first_name_kana:'ノリチカ', nick_name: 'のりさん', password: 'password'},
    {email: 'siomi@test.com',  last_name: '塩見',first_name:'泰隆',last_name_kana: 'シオミ',first_name_kana:'ヤスタカ', nick_name: 'しおみ', password: 'password'},
    {email: 'yamada@test.com',  last_name: '山田',first_name:'哲人',last_name_kana: 'ヤマダ',first_name_kana:'テツト', nick_name: 'てっと', password: 'password'}
  ]
)

Post.create!(
  [
    {title: '江ノ島周辺（藤沢市）', access: '品川駅→藤沢駅→江ノ島駅　所要時間1時間程度', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/enoshima.webp"), filename:"enoshima.webp"),
    prefecture_id: '14', drone_type: 'DJI-AIR 2S', authorization: '湘南海上保安署(0466-00-0000)FAXで飛行計画書必要。藤沢警察署(0466-00-0000)', rate: '4.0', customer_id: '1',
    shooting_date: '2022/2/18', request: '該当なし', remarks: '江ノ島は、観光客が多い場所であるが、海岸が続いている為、飛行開始場所も確保しやすく、ドローンには寛容であり、許可取りもスムーズに進むと思います。江ノ島上空は飛行できないので注意。'},
    {title: '城ヶ島（三浦市）', access: '品川駅→三崎口駅→城ヶ島行バス（20分）　所要時間1時間半程度', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/jogashima.jpeg"), filename:"jogashima.jpeg"),
    prefecture_id: '14', drone_type: 'DJI-AIR 2S', authorization: '三崎警察署(0466-00-0000)', rate: '3.5', customer_id: '1',
    shooting_date: '2022/1/25', request: '該当なし', remarks: '城ヶ島は、特別許可取りなどはいりませんが、島内の県立城ヶ島公園内を飛行させたい場合は許可が必要です。人もまばらで場所も広く、島や海灯台などいろいろな空撮が行えます。'},
    {title: '丹沢湖（足柄上郡山北町）', access: '品川駅→国府津駅→谷峨駅→丹沢湖（富士急湘南バス）所要時間2時間程度', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/tanzawako.jpeg"), filename:"tanzawako.jpeg"),
    prefecture_id: '14', drone_type: 'DJI-AIR 2S', authorization: '三保ダム周辺は神奈川県公式HPでドローンが使用できる記載がある。法令遵守必須。', rate: '4.0', customer_id: '1',
    shooting_date: '2022/2/4', request: '該当なし', remarks: '湖上空にドローン映像で非常に確認しずらい電線があります。飛行前に目視で電線の位置を確認してください。'},
    {title: '真鶴半島・三ツ石（足柄下郡真鶴町）', access: '東京駅→真鶴駅→バス　所要時間2時間程度', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/manaduru.jpeg"), filename:"manaduru.jpeg"),
    prefecture_id: '14', drone_type: 'DJI-AIR 2S', authorization: '神奈川県立真鶴半島自然公園(0460-00-0000)', rate: '3.0', customer_id: '1',
    shooting_date: '2022/3/3', request: '該当なし', remarks: '特になし。'},
    {title: '立石公園（横須賀市）', access: '東京から車で1時間半程度', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/tateishi.jpeg"), filename:"tateishi.jpeg"),
    prefecture_id: '14', drone_type: 'DJI-AIR 2S', authorization: '環境政策部公園管理科', rate: '3.0', customer_id: '2',
    shooting_date: '2021/9/15', request: '該当なし', remarks: '公園上空は原則禁止。公園管理科に要相談。飛行ルートや目的などを提出。近くの秋谷海岸から俯瞰する形であれば原則問題ないので、そちらをオススメします。日没の時間帯がオススメ。緊急事態宣言が出ると駐車場はほとんど空いていない。'},
    {title: '屏風ヶ浦（銚子市）', access: '東京駅→千葉駅→銚子駅　所要時間2時間半程度', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/byoubugaura.jpeg"), filename:"byoubugaura.jpeg"),
    prefecture_id: '12', drone_type: 'DJI-AIR 2S', authorization: '屏風ヶ浦崖上を飛行する場合は私有地の為、管理会社：株式会社◯◯(0479-00-0000)に連絡が必要。遊歩道を飛行する場合は千葉県銚子土木事務所管理用地課(0479-00-0000)に連絡が必要。海上は特に許可取りは必要ない。', rate: '4.0', customer_id: '9',
    shooting_date: '2022/2/24', request: '該当なし', remarks: '屏風ヶ浦は外房に面しているため風が強い日が多いので晴れでも注意。また、広大な撮影スポットのため、遠くまで飛ばしてしまいがち。目視外飛行に気をつけ戻ってくるときのバッテリー残量もチェックが必要。'},
    {title: '石神菜の花畑（市原市）', access: '東京駅→蘇我駅→五井駅→養老渓谷駅→徒歩10分', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ichihara.jpeg"), filename:"ichihara.jpeg"),
    prefecture_id: '12', drone_type: 'DJI-AIR 2S', authorization: '小湊鐵道養老渓谷駅(0436-00-0000)電車と近距離で撮影したい場合は一報入れる。禁止はされていない。', rate: '4.5', customer_id: '2',
    shooting_date: '2022/3/24', request: '該当なし', remarks: '菜の花畑の最盛期は3月〜4月。近くには養老渓谷の滝や湖などもあり撮影スポットですが今回は撮影してない為、情報なし。'},
    {title: '鴨川・鴨川松島（鴨川市）', access: '東京駅から高速バス（アクシー号）で約2時間程度', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kamogawa.jpeg"), filename:"kamogawa.jpeg"),
    prefecture_id: '12', drone_type: 'DJI-AIR 2S', authorization: '特にドローン規制はないので法令遵守。鴨川警察署に連絡入れると良い。(04-0000-0000)', rate: '3', customer_id: '3',
    shooting_date: '2022/5/12', request: '該当なし', remarks: '特になし。'},
    {title: '富津岬（富津市）', access: '青堀駅から日東交通バスで15分富津公園前で下車すぐ。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/futtsumisaki.jpeg"), filename:"futtsumisaki.jpeg"),
    prefecture_id: '12', drone_type: 'DJI-AIR 2S', authorization: '富津公園管理事務所', rate: '2.5', customer_id: '4',
    shooting_date: '2021/10/8', request: '該当なし', remarks: '富津公園上空は原則禁止。地元の人が有志の見回りをしており、許可取りしていても注意される可能性が高い。少し離れるが許可取りをした上で富津海水浴場から離発着するといいかも。海水浴場からの俯瞰であれば許可取りはさらに簡素になる。海水浴場もサーファーが多いので注意。'},
    {title: '滝沢ダム（秩父市）・長瀞荒川（長瀞町）', access: '滝沢ダムは秩父駅から車で30分程度。長瀞荒川は東京から2時間程度。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/takizawa.jpeg"), filename:"takizawa.jpeg"),
    prefecture_id: '11', drone_type: 'DJI-AIR 2S', authorization: '滝沢ダム湖上空は飛行可能。ダム施設からの離発着は禁止。長瀞荒川は長瀞町に相談、届出すると協力を受けることができる。', rate: '3.5', customer_id: '14',
    shooting_date: '2022/4/23', request: '該当なし', remarks: '長瀞ホームページなどを確認。'},
    {title: '秩父の山々・豆焼橋（秩父市）', access: '東京駅周辺から車で約3時間（下道使用）', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/chichibu.jpeg"), filename:"chichibu.jpeg"),
    prefecture_id: '11', drone_type: 'DJI-AIR 2S', authorization: '埼玉県土整備部　県土整備政策課（048-000-0000）', rate: '3.5', customer_id: '2',
    shooting_date: '2022/4/23', request: '該当なし', remarks: '公道のため、近距離から撮りたい場合のみ管理課に要相談。距離をしっかりとった俯瞰の場合は法令遵守で問題なし。'},
    {title: '大洗神磯の鳥居（茨木郡大洗町）', access: '東京駅→水戸駅→大洗神社前駅（茨城交通バス）所要時間1時間半程度', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/torii.jpeg"), filename:"torii.jpeg"),
    prefecture_id: '8', drone_type: 'DJI-AIR 2S', authorization: '磯前神社の鳥居をくぐらせたり、近くを飛行したい場合は大洗磯前神社に電話連絡で確認。（029-000-0000）', rate: '4.0', customer_id: '5',
    shooting_date: '2022/3/9', request: '該当なし', remarks: '日の入り、日の出、潮の満ち引きによって映像が変わるので事前にチェックしたほうがいい。'},
    {title: '熱海（熱海市）', access: '東京駅→熱海駅　所要時間1時間40分程度', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/atami.jpeg"), filename:"atami.jpeg"),
    prefecture_id: '22', drone_type: 'DJI-AIR 2S', authorization: '熱海市役所維持管理室(0557-00-0000)。熱海警察署中央交(0557-00-0000)', rate: '3.0', customer_id: '3',
    shooting_date: '2022/3/3', request: '該当なし', remarks: '静岡県はきれいな海沿い空撮スポットがたくさんある。熱海や伊豆などは基本法令遵守で管理施設に連絡するだけで飛ばせるが海開き中は厳しくなる。飛行内容などを一旦審査されるため、海開き期間以外がおすすめ。'},
    {title: '伊豆半島（下田市）', access: '東京駅→熱海駅→伊豆急下田駅　約4時間程度', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/shirahama.jpeg"), filename:"shirahama.jpeg"),
    prefecture_id: '22', drone_type: 'DJI-AIR 2S', authorization: '海水浴場は海開き期間中以外は禁止されていない。石廊崎は下田海上保安部管理課に連絡。（0558-00-0000）', rate: '3.0', customer_id: '4',
    shooting_date: '2022/3/3', request: '該当なし', remarks: '海開き期間外でも海水浴やサーフィンをしている人が多いので注意。また繁忙期、バスや車の所要時間が倍近くかかる場合がある'},
    {title: '奥大井湖上駅（川根本町）', access: '東京から車で所要時間5時間程度', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/shizuoka.jpeg"), filename:"shizuoka.jpeg"),
    prefecture_id: '22', drone_type: 'DJI-AIR 2S', authorization: '大井川鐵道・長島ダム。', rate: '4.0', customer_id: '1',
    shooting_date: '2021/9/10', request: '該当なし', remarks: '湖は規制なし。大井川鐵道の電車が通る場面を撮影希望の場合は大井川鐵道に許可をもらい、立ち会いの元、撮影可能。鉄道撮影は原則禁止。昼間などは鉄道ファンが多いため、早朝がおすすめ。'},
    {title: '三島スカイウォーク（三島市）', access: '東京から車で2時間程度。三島駅から路線バスもあり。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/mishimaskywalk.jpeg"), filename:"mishimaskywalk.jpeg"),
    prefecture_id: '22', drone_type: 'DJI-AIR 2S', authorization: '三島スカイウォーク', rate: '4', customer_id: '4',
    shooting_date: '2021/8/24', request: '該当なし', remarks: '一般の方のドローン撮影は不可。企業、法人は柔軟に対応してもらえる。'},
    {title: '吹割の滝（沼田市）', access: 'JR沼田駅からバスで40分。車で関越自動車道沼田インター下車、国道120号線を尾瀬方面20分。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kamogawa.jpeg"), filename:"kamogawa.jpeg"),
    prefecture_id: '10', drone_type: 'DJI-AIR 2S', authorization: '沼田市観光協会', rate: '3.5', customer_id: '2',
    shooting_date: '2021/10/4', request: '該当なし', remarks: '規制は特にないが紅葉の季節や8月の暑い時期はとても人気のスポットなので観光協会などに事前確認をし撮影してください。'},
    {title: '湯ノ湖・湯滝（日光市）', access: '日光駅東武日光駅から湯本温泉行きバスで75分湯滝入り口下車。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/nikko.jpeg"), filename:"nikko.jpeg"),
    prefecture_id: '9', drone_type: 'DJI-AIR 2S', authorization: '日光湯元ビジターセンター', rate: '3', customer_id: '6',
    shooting_date: '2021/10/4', request: '該当なし', remarks: '湯滝はドローン離発着場所が限られている為、紅葉の時期などは厳しい可能性あり。'},
    {title: '金王八幡宮（渋谷区）', access: '渋谷駅より徒歩5分。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/shibuya.jpeg"), filename:"shibuya.jpeg"),
    prefecture_id: '13', drone_type: 'DJI Mavic Air 2', authorization: '土地の所有者、管理者。所轄警察への飛行通達', rate: '3', customer_id: '7',
    shooting_date: '2022/2/2', request: '人工集中地区の上空, 目視外飛行, 夜間飛行, 人・物・車等の30m未満飛行', remarks: '桜のシーズンのほうがオススメ。'},
  ]
)

PostComment.create!(
  [
    {customer_id: '10', post_id: '1', comment: '都内から車だと道混みますか？'},
    {customer_id: '1', post_id: '1', comment: '海開きシーズン外であれば、そうでもないと思います！'},
    {customer_id: '3', post_id: '1', comment: 'ここでドローンとばせるなんて意外です！'},
    {customer_id: '4', post_id: '1', comment: 'やってみよー'},
    {customer_id: '5', post_id: '2', comment: 'わかりにくい、もっとわかりやすくしろ'},
    {customer_id: '6', post_id: '16', comment: '都内からだと遠いですね'},
    {customer_id: '7', post_id: '17', comment: 'ここならいい動画が撮れそう'},
    {customer_id: '8', post_id: '15', comment: '素敵です！！'},
    {customer_id: '9', post_id: '14', comment: 'ふつうに行ってみたい！'},
    {customer_id: '10', post_id: '13', comment: 'すごくいい写真です'},
    {customer_id: '11', post_id: '12', comment: 'こんなの撮れるんですね'}
  ]
)

Favorite.create!(
  [
    {customer_id: '1', post_id: '10'},
    {customer_id: '1', post_id: '11'},
    {customer_id: '1', post_id: '12'},
    {customer_id: '1', post_id: '13'},
    {customer_id: '1', post_id: '14'},
    {customer_id: '2', post_id: '10'},
    {customer_id: '3', post_id: '10'},
    {customer_id: '4', post_id: '11'},
    {customer_id: '5', post_id: '7'},
    {customer_id: '6', post_id: '2'},
    {customer_id: '7', post_id: '1'},
    {customer_id: '8', post_id: '3'}
  ]
)