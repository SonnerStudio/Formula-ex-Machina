import Foundation

public struct LanguageItem: Sendable, Equatable, Identifiable, Hashable {
    public var id: String { code }
    public let code: String
    public let name: String
    public let nativeName: String
    public let flag: String

    public init(code: String, name: String, nativeName: String, flag: String) {
        self.code = code
        self.name = name
        self.nativeName = nativeName
        self.flag = flag
    }

    public var displayName: String {
        "\(flag)  \(name) (\(nativeName))"
    }
}

public struct LanguageRegistry: Sendable {
    public static let shared = LanguageRegistry()

    /// Die 130 meistgesprochenen und bedeutendsten Sprachen der Erde mit Flaggen
    public let languages: [LanguageItem]

    public init() {
        self.languages = [
            LanguageItem(code: "de", name: "Deutsch", nativeName: "Deutsch (D-A-CH)", flag: "🇩🇪 🇦🇹 🇨🇭"),
            LanguageItem(code: "en", name: "Englisch", nativeName: "English", flag: "🇬🇧 🇺🇸"),
            LanguageItem(code: "zh", name: "Chinesisch (Mandarin)", nativeName: "中文", flag: "🇨🇳 🇹🇼"),
            LanguageItem(code: "es", name: "Spanisch", nativeName: "Español", flag: "🇪🇸 🇲🇽"),
            LanguageItem(code: "hi", name: "Hindi", nativeName: "हिन्दी", flag: "🇮🇳"),
            LanguageItem(code: "ar", name: "Arabisch", nativeName: "العربية", flag: "🇸🇦 🇪🇬 🇦🇪"),
            LanguageItem(code: "bn", name: "Bengalisch", nativeName: "বাংলা", flag: "🇧🇩"),
            LanguageItem(code: "pt", name: "Portugiesisch", nativeName: "Português", flag: "🇵🇹 🇧🇷"),
            LanguageItem(code: "ru", name: "Russisch", nativeName: "Русский", flag: "🇷🇺"),
            LanguageItem(code: "ja", name: "Japanisch", nativeName: "日本語", flag: "🇯🇵"),
            LanguageItem(code: "pa", name: "Punjabi", nativeName: "ਪੰਜਾਬੀ", flag: "🇮🇳"),
            LanguageItem(code: "mr", name: "Marathi", nativeName: "मराठी", flag: "🇮🇳"),
            LanguageItem(code: "te", name: "Telugu", nativeName: "తెలుగు", flag: "🇮🇳"),
            LanguageItem(code: "wuu", name: "Wu (Shanghainese)", nativeName: "吴语", flag: "🇨🇳"),
            LanguageItem(code: "tr", name: "Türkisch", nativeName: "Türkçe", flag: "🇹🇷"),
            LanguageItem(code: "ko", name: "Koreanisch", nativeName: "한국어", flag: "🇰🇷"),
            LanguageItem(code: "fr", name: "Französisch", nativeName: "Français", flag: "🇫🇷 🇨🇭 🇧🇪"),
            LanguageItem(code: "ta", name: "Tamil", nativeName: "தமிழ்", flag: "🇮🇳 🇱🇰"),
            LanguageItem(code: "ur", name: "Urdu", nativeName: "اردو", flag: "🇵🇰"),
            LanguageItem(code: "vi", name: "Vietnamesisch", nativeName: "Tiếng Việt", flag: "🇻🇳"),
            LanguageItem(code: "yue", name: "Kantonesisch", nativeName: "粵語", flag: "🇭🇰"),
            LanguageItem(code: "jv", name: "Javanisch", nativeName: "Basa Jawa", flag: "🇮🇩"),
            LanguageItem(code: "it", name: "Italienisch", nativeName: "Italiano", flag: "🇮🇹 🇨🇭"),
            LanguageItem(code: "gu", name: "Gujarati", nativeName: "ગુજરાતી", flag: "🇮🇳"),
            LanguageItem(code: "fa", name: "Persisch (Farsi)", nativeName: "فارسی", flag: "🇮🇷"),
            LanguageItem(code: "bho", name: "Bhojpuri", nativeName: "भोजपुरी", flag: "🇮🇳"),
            LanguageItem(code: "min", name: "Min Nan", nativeName: "閩南語", flag: "🇨🇳"),
            LanguageItem(code: "ha", name: "Haussa", nativeName: "Hausa", flag: "🇳🇬"),
            LanguageItem(code: "pl", name: "Polnisch", nativeName: "Polski", flag: "🇵🇱"),
            LanguageItem(code: "sw", name: "Swahili", nativeName: "Kiswahili", flag: "🇰🇪 🇹🇿"),
            LanguageItem(code: "kn", name: "Kannada", nativeName: "ಕನ್ನಡ", flag: "🇮🇳"),
            LanguageItem(code: "id", name: "Indonesisch", nativeName: "Bahasa Indonesia", flag: "🇮🇩"),
            LanguageItem(code: "tl", name: "Tagalog (Filipino)", nativeName: "Tagalog", flag: "🇵🇭"),
            LanguageItem(code: "ml", name: "Malayalam", nativeName: "മലയാളം", flag: "🇮🇳"),
            LanguageItem(code: "or", name: "Odia", nativeName: "ଓଡ଼ିଆ", flag: "🇮🇳"),
            LanguageItem(code: "my", name: "Birmanisch", nativeName: "မြန်မာဘာသာ", flag: "🇲🇲"),
            LanguageItem(code: "hsn", name: "Xiang (Hunanese)", nativeName: "湘语", flag: "🇨🇳"),
            LanguageItem(code: "su", name: "Sundanesisch", nativeName: "Basa Sunda", flag: "🇮🇩"),
            LanguageItem(code: "mai", name: "Maithili", nativeName: "मैथिली", flag: "🇮🇳"),
            LanguageItem(code: "uk", name: "Ukrainisch", nativeName: "Українська", flag: "🇺🇦"),
            LanguageItem(code: "uz", name: "Usbekisch", nativeName: "Oʻzbekcha", flag: "🇺🇿"),
            LanguageItem(code: "sd", name: "Sindhi", nativeName: "سنڌي", flag: "🇵🇰"),
            LanguageItem(code: "am", name: "Amharisch", nativeName: "አማርኛ", flag: "🇪🇹"),
            LanguageItem(code: "ff", name: "Fulfulde", nativeName: "Fulfulde", flag: "🇸🇳"),
            LanguageItem(code: "ro", name: "Rumänisch", nativeName: "Română", flag: "🇷🇴 🇲🇩"),
            LanguageItem(code: "om", name: "Oromo", nativeName: "Afaan Oromoo", flag: "🇪🇹"),
            LanguageItem(code: "ig", name: "Igbo", nativeName: "Asụsụ Igbo", flag: "🇳🇬"),
            LanguageItem(code: "az", name: "Aserbaidschanisch", nativeName: "Azərbaycan", flag: "🇦🇿"),
            LanguageItem(code: "awd", name: "Awadhi", nativeName: "अवधी", flag: "🇮🇳"),
            LanguageItem(code: "gan", name: "Gan", nativeName: "赣语", flag: "🇨🇳"),
            LanguageItem(code: "ceb", name: "Cebuano", nativeName: "Sinugboanon", flag: "🇵🇭"),
            LanguageItem(code: "nl", name: "Niederländisch", nativeName: "Nederlands", flag: "🇳🇱 🇧🇪"),
            LanguageItem(code: "ku", name: "Kurdisch", nativeName: "Kurdî", flag: "🇮🇶"),
            LanguageItem(code: "shn", name: "Shan", nativeName: "လိၵ်ႈတႆး", flag: "🇲🇲"),
            LanguageItem(code: "mg", name: "Madagassisch", nativeName: "Malagasy", flag: "🇲🇬"),
            LanguageItem(code: "el", name: "Griechisch", nativeName: "Ελληνικά", flag: "🇬🇷"),
            LanguageItem(code: "cs", name: "Tschechisch", nativeName: "Čeština", flag: "🇨🇿"),
            LanguageItem(code: "hu", name: "Ungarisch", nativeName: "Magyar", flag: "🇭🇺"),
            LanguageItem(code: "sv", name: "Schwedisch", nativeName: "Svenska", flag: "🇸🇪"),
            LanguageItem(code: "bg", name: "Bulgarisch", nativeName: "Български", flag: "🇧🇬"),
            LanguageItem(code: "be", name: "Belarussisch", nativeName: "Беларуская", flag: "🇧🇾"),
            LanguageItem(code: "he", name: "Hebräisch", nativeName: "עברית", flag: "🇮🇱"),
            LanguageItem(code: "da", name: "Dänisch", nativeName: "Dansk", flag: "🇩🇰"),
            LanguageItem(code: "fi", name: "Finnisch", nativeName: "Suomi", flag: "🇫🇮"),
            LanguageItem(code: "sk", name: "Slowakisch", nativeName: "Slovenčina", flag: "🇸🇰"),
            LanguageItem(code: "no", name: "Norwegisch", nativeName: "Norsk", flag: "🇳🇴"),
            LanguageItem(code: "hr", name: "Kroatisch", nativeName: "Hrvatski", flag: "🇭🇷"),
            LanguageItem(code: "sr", name: "Serbisch", nativeName: "Српски", flag: "🇷🇸"),
            LanguageItem(code: "ca", name: "Katalanisch", nativeName: "Català", flag: "🇪🇸"),
            LanguageItem(code: "lt", name: "Litauisch", nativeName: "Lietuvių", flag: "🇱🇹"),
            LanguageItem(code: "sl", name: "Slowenisch", nativeName: "Slovenščina", flag: "🇸🇮"),
            LanguageItem(code: "lv", name: "Lettisch", nativeName: "Latviešu", flag: "🇱🇻"),
            LanguageItem(code: "et", name: "Estnisch", nativeName: "Eesti", flag: "🇪🇪"),
            LanguageItem(code: "is", name: "Isländisch", nativeName: "Íslenska", flag: "🇮🇸"),
            LanguageItem(code: "ga", name: "Irisch", nativeName: "Gaeilge", flag: "🇮🇪"),
            LanguageItem(code: "sq", name: "Albanisch", nativeName: "Shqip", flag: "🇦🇱"),
            LanguageItem(code: "mk", name: "Mazedonisch", nativeName: "Македонски", flag: "🇲🇰"),
            LanguageItem(code: "hy", name: "Armenisch", nativeName: "Հայերեն", flag: "🇦🇲"),
            LanguageItem(code: "ka", name: "Georgisch", nativeName: "ქართული", flag: "🇬🇪"),
            LanguageItem(code: "ne", name: "Nepalesisch", nativeName: "नेपाली", flag: "🇳🇵"),
            LanguageItem(code: "si", name: "Singhalesisch", nativeName: "සිංහල", flag: "🇱🇰"),
            LanguageItem(code: "km", name: "Khmer", nativeName: "ភាសាខ្មែរ", flag: "🇰🇭"),
            LanguageItem(code: "lo", name: "Laotisch", nativeName: "ພາສາລາວ", flag: "🇱🇦"),
            LanguageItem(code: "mn", name: "Mongolisch", nativeName: "Монгол", flag: "🇲🇳"),
            LanguageItem(code: "kk", name: "Kasachisch", nativeName: "Қазақша", flag: "🇰🇿"),
            LanguageItem(code: "ky", name: "Kirgisisch", nativeName: "Кыргызча", flag: "🇰🇬"),
            LanguageItem(code: "tg", name: "Tadschikisch", nativeName: "Тоҷикӣ", flag: "🇹🇯"),
            LanguageItem(code: "tk", name: "Turkmenisch", nativeName: "Türkmençe", flag: "🇹🇲"),
            LanguageItem(code: "ps", name: "Paschtu", nativeName: "پښتو", flag: "🇦🇫"),
            LanguageItem(code: "so", name: "Somali", nativeName: "Soomaaliga", flag: "🇸🇴"),
            LanguageItem(code: "yo", name: "Yoruba", nativeName: "Èdè Yorùbá", flag: "🇳🇬"),
            LanguageItem(code: "zu", name: "Zulu", nativeName: "isiZulu", flag: "🇿🇦"),
            LanguageItem(code: "xh", name: "Xhosa", nativeName: "isiXhosa", flag: "🇿🇦"),
            LanguageItem(code: "af", name: "Afrikaans", nativeName: "Afrikaans", flag: "🇿🇦"),
            LanguageItem(code: "sn", name: "Shona", nativeName: "chiShona", flag: "🇿🇼"),
            LanguageItem(code: "rw", name: "Kinyarwanda", nativeName: "Ikinyarwanda", flag: "🇷🇼"),
            LanguageItem(code: "st", name: "Sesotho", nativeName: "Sesotho", flag: "🇱🇸"),
            LanguageItem(code: "tn", name: "Setswana", nativeName: "Setswana", flag: "🇧🇼"),
            LanguageItem(code: "ln", name: "Lingala", nativeName: "Lingála", flag: "🇨🇩"),
            LanguageItem(code: "wo", name: "Wolof", nativeName: "Wolof", flag: "🇸🇳"),
            LanguageItem(code: "bm", name: "Bambara", nativeName: "Bamanankan", flag: "🇲🇱"),
            LanguageItem(code: "ti", name: "Tigrinya", nativeName: "ትግርኛ", flag: "🇪🇷"),
            LanguageItem(code: "ee", name: "Ewe", nativeName: "Eʋegbe", flag: "🇬🇭"),
            LanguageItem(code: "ak", name: "Akan (Twi)", nativeName: "Twi", flag: "🇬🇭"),
            LanguageItem(code: "tw", name: "Twi", nativeName: "Asante Twi", flag: "🇬🇭"),
            LanguageItem(code: "lg", name: "Luganda", nativeName: "Oluganda", flag: "🇺🇬"),
            LanguageItem(code: "kg", name: "Kikongo", nativeName: "Kikongo", flag: "🇨🇬"),
            LanguageItem(code: "ts", name: "Tsonga", nativeName: "Xitsonga", flag: "🇿🇦"),
            LanguageItem(code: "ve", name: "Venda", nativeName: "Tshivenḓa", flag: "🇿🇦"),
            LanguageItem(code: "nr", name: "Süd-Ndebele", nativeName: "isiNdebele", flag: "🇿🇦"),
            LanguageItem(code: "ss", name: "Siswati", nativeName: "SiSwati", flag: "🇸🇿"),
            LanguageItem(code: "ny", name: "Chichewa", nativeName: "Chichewa", flag: "🇲🇼"),
            LanguageItem(code: "ms", name: "Malaiisch", nativeName: "Bahasa Melayu", flag: "🇲🇾"),
            LanguageItem(code: "tet", name: "Tetum", nativeName: "Lia-Tetun", flag: "🇹🇱"),
            LanguageItem(code: "sm", name: "Samoanisch", nativeName: "Gagana Sāmoa", flag: "🇼🇸"),
            LanguageItem(code: "to", name: "Tongaisch", nativeName: "Lea Faka-Tonga", flag: "🇹🇴"),
            LanguageItem(code: "fj", name: "Fidschianisch", nativeName: "Na Vosa Vakaviti", flag: "🇫🇯"),
            LanguageItem(code: "mi", name: "Maori", nativeName: "Te Reo Māori", flag: "🇳🇿"),
            LanguageItem(code: "haw", name: "Hawaiisch", nativeName: "ʻŌlelo Hawaiʻi", flag: "🇺🇸"),
            LanguageItem(code: "kl", name: "Grönländisch", nativeName: "Kalaallisut", flag: "🇬🇱"),
            LanguageItem(code: "fo", name: "Färöisch", nativeName: "Føroyskt", flag: "🇫🇴"),
            LanguageItem(code: "eu", name: "Baskisch", nativeName: "Euskara", flag: "🇪🇸"),
            LanguageItem(code: "gl", name: "Galicisch", nativeName: "Galego", flag: "🇪🇸"),
            LanguageItem(code: "cy", name: "Walisisch", nativeName: "Cymraeg", flag: "🇬🇧"),
            LanguageItem(code: "gd", name: "Schottisch-Gälisch", nativeName: "Gàidhlig", flag: "🇬🇧"),
            LanguageItem(code: "br", name: "Bretonisch", nativeName: "Brezhoneg", flag: "🇫🇷"),
            LanguageItem(code: "oc", name: "Okzitanisch", nativeName: "Occitan", flag: "🇫🇷"),
            LanguageItem(code: "lb", name: "Luxemburgisch", nativeName: "Lëtzebuergesch", flag: "🇱🇺"),
            LanguageItem(code: "mt", name: "Maltesisch", nativeName: "Malti", flag: "🇲🇹"),
            LanguageItem(code: "eo", name: "Esperanto", nativeName: "Esperanto", flag: "🌐")
        ]
    }

    public func find(code: String) -> LanguageItem? {
        languages.first { $0.code == code }
    }
}
