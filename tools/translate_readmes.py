#!/usr/bin/env python3
import os
import re

# Comprehensive language database with native names, codes, flag emojis and github shortcodes
LANG_DATA = [
    ("de", "Deutsch", "Deutsch (D-A-CH)", "🇩🇪 🇦🇹 🇨🇭", ":de: :at: :ch:"),
    ("en", "Englisch", "English", "🇬🇧 🇺🇸", ":gb: :us:"),
    ("zh", "Chinesisch (Mandarin)", "中文", "🇨🇳 🇹🇼", ":cn: :tw:"),
    ("es", "Spanisch", "Español", "🇪🇸 🇲🇽", ":es: :mx:"),
    ("hi", "Hindi", "हिन्दी", "🇮🇳", ":in:"),
    ("ar", "Arabisch", "العربية", "🇸🇦 🇪🇬 🇦🇪", ":sa: :eg: :ae:"),
    ("bn", "Bengalisch", "বাংলা", "🇧🇩", ":bd:"),
    ("pt", "Portugiesisch", "Português", "🇵🇹 🇧🇷", ":pt: :br:"),
    ("ru", "Russisch", "Русский", "🇷🇺", ":ru:"),
    ("ja", "Japanisch", "日本語", "🇯🇵", ":jp:"),
    ("pa", "Punjabi", "ਪੰਜਾਬੀ", "🇮🇳", ":in:"),
    ("mr", "Marathi", "मराठी", "🇮🇳", ":in:"),
    ("te", "Telugu", "తెలుగు", "🇮🇳", ":in:"),
    ("wuu", "Wu (Shanghainese)", "吴语", "🇨🇳", ":cn:"),
    ("tr", "Türkisch", "Türkçe", "🇹🇷", ":tr:"),
    ("ko", "Koreanisch", "한국어", "🇰🇷", ":kr:"),
    ("fr", "Französisch", "Français", "🇫🇷 🇨🇭 🇧🇪", ":fr: :ch: :be:"),
    ("ta", "Tamil", "தமிழ்", "🇮🇳 🇱🇰", ":in: :lk:"),
    ("ur", "Urdu", "اردو", "🇵🇰", ":pk:"),
    ("vi", "Vietnamesisch", "Tiếng Việt", "🇻🇳", ":vn:"),
    ("yue", "Kantonesisch", "粵語", "🇭🇰", ":hk:"),
    ("jv", "Javanisch", "Basa Jawa", "🇮🇩", ":id:"),
    ("it", "Italienisch", "Italiano", "🇮🇹 🇨🇭", ":it: :ch:"),
    ("gu", "Gujarati", "ગુજરાતી", "🇮🇳", ":in:"),
    ("fa", "Persisch (Farsi)", "فارسی", "🇮🇷", ":ir:"),
    ("bho", "Bhojpuri", "भोजपुरी", "🇮🇳", ":in:"),
    ("min", "Min Nan", "閩南語", "🇨🇳", ":cn:"),
    ("ha", "Haussa", "Hausa", "🇳🇬", ":ng:"),
    ("pl", "Polnisch", "Polski", "🇵🇱", ":pl:"),
    ("sw", "Swahili", "Kiswahili", "🇰🇪 🇹🇿", ":ke: :tz:"),
    ("kn", "Kannada", "ಕನ್ನಡ", "🇮🇳", ":in:"),
    ("id", "Indonesisch", "Bahasa Indonesia", "🇮🇩", ":id:"),
    ("tl", "Tagalog (Filipino)", "Tagalog", "🇵🇭", ":ph:"),
    ("ml", "Malayalam", "മലയാളം", "🇮🇳", ":in:"),
    ("or", "Odia", "ଓଡ଼ିଆ", "🇮🇳", ":in:"),
    ("my", "Birmanisch", "မြန်မာဘာသာ", "🇲🇲", ":mm:"),
    ("hsn", "Xiang (Hunanese)", "湘语", "🇨🇳", ":cn:"),
    ("su", "Sundanesisch", "Basa Sunda", "🇮🇩", ":id:"),
    ("mai", "Maithili", "मैथिली", "🇮🇳", ":in:"),
    ("uk", "Ukrainisch", "Українська", "🇺🇦", ":ua:"),
    ("uz", "Usbekisch", "Oʻzbekcha", "🇺🇿", ":uz:"),
    ("sd", "Sindhi", "سنڌي", "🇵🇰", ":pk:"),
    ("am", "Amharisch", "አማርኛ", "🇪🇹", ":et:"),
    ("ff", "Fulfulde", "Fulfulde", "🇸🇳", ":sn:"),
    ("ro", "Rumänisch", "Română", "🇷🇴 🇲🇩", ":ro: :md:"),
    ("om", "Oromo", "Afaan Oromoo", "🇪🇹", ":et:"),
    ("ig", "Igbo", "Asụsụ Igbo", "🇳🇬", ":ng:"),
    ("az", "Aserbaidschanisch", "Azərbaycan", "🇦🇿", ":az:"),
    ("awd", "Awadhi", "अवधी", "🇮🇳", ":in:"),
    ("gan", "Gan", "赣语", "🇨🇳", ":cn:"),
    ("ceb", "Cebuano", "Sinugboanon", "🇵🇭", ":ph:"),
    ("nl", "Niederländisch", "Nederlands", "🇳🇱 🇧🇪", ":nl: :be:"),
    ("ku", "Kurdisch", "Kurdî", "🇮🇶", ":iq:"),
    ("sr", "Serbisch", "Српски", "🇷🇸", ":rs:"),
    ("mg", "Malagasy", "Malagasy", "🇲🇬", ":mg:"),
    ("so", "Somali", "Soomaaliga", "🇸🇴", ":so:"),
    ("el", "Griechisch", "Ελληνικά", "🇬🇷 🇨🇾", ":gr: :cy:"),
    ("cs", "Tschechisch", "Čeština", "🇨🇿", ":cz:"),
    ("hu", "Ungarisch", "Magyar", "🇭🇺", ":hu:"),
    ("sv", "Schwedisch", "Svenska", "🇸🇪 🇫🇮", ":se: :fi:"),
    ("bg", "Bulgarisch", "Български", "🇧🇬", ":bg:"),
    ("he", "Hebräisch", "עברית", "🇮🇱", ":il:"),
    ("da", "Dänisch", "Dansk", "🇩🇰", ":dk:"),
    ("fi", "Finnisch", "Suomi", "🇫🇮", ":fi:"),
    ("sk", "Slowakisch", "Slovenčina", "🇸🇰", ":sk:"),
    ("no", "Norwegisch", "Norsk", "🇳🇴", ":no:"),
    ("hr", "Kroatisch", "Hrvatski", "🇭🇷", ":hr:"),
    ("lt", "Litauisch", "Lietuvių", "🇱🇹", ":lt:"),
    ("sl", "Slowenisch", "Slovenščina", "🇸🇮", ":si:"),
    ("lv", "Lettisch", "Latviešu", "🇱🇻", ":lv:"),
    ("et", "Estnisch", "Eesti", "🇪🇪", ":ee:"),
    ("is", "Isländisch", "Íslenska", "🇮🇸", ":is:"),
    ("ga", "Irisch", "Gaeilge", "🇮🇪", ":ie:"),
    ("sq", "Albanisch", "Shqip", "🇦🇱 🇽🇰", ":al: :xk:"),
    ("mk", "Mazedonisch", "Македонски", "🇲🇰", ":mk:"),
    ("hy", "Armenisch", "Հայերեն", "🇦🇲", ":am:"),
    ("ka", "Georgisch", "ქართული", "🇬🇪", ":ge:"),
    ("ne", "Nepalesisch", "नेपाली", "🇳🇵", ":np:"),
    ("si", "Singhalesisch", "සිංහල", "🇱🇰", ":lk:"),
    ("km", "Khmer", "ភាសាខ្មែរ", "🇰🇭", ":kh:"),
    ("lo", "Laotisch", "ພາສາລາວ", "🇱🇦", ":la:"),
    ("mn", "Mongolisch", "Монгол", "🇲🇳", ":mn:"),
    ("kk", "Kasachisch", "Қазақша", "🇰🇿", ":kz:"),
    ("ky", "Kirgisisch", "Кыргызча", "🇰🇬", ":kg:"),
    ("tg", "Tadschikisch", "Тоҷикӣ", "🇹🇯", ":tj:"),
    ("tk", "Turkmenisch", "Türkmençe", "🇹🇲", ":tm:"),
    ("ps", "Paschtu", "پښتو", "🇦🇫", ":af:"),
    ("yo", "Yoruba", "Èdè Yorùbá", "🇳🇬", ":ng:"),
    ("zu", "Zulu", "isiZulu", "🇿🇦", ":za:"),
    ("xh", "Xhosa", "isiXhosa", "🇿🇦", ":za:"),
    ("af", "Afrikaans", "Afrikaans", "🇿🇦", ":za:"),
    ("sn", "Shona", "chiShona", "🇿🇼", ":zw:"),
    ("rw", "Kinyarwanda", "Ikinyarwanda", "🇷🇼", ":rw:"),
    ("st", "Sesotho", "Sesotho", "🇱🇸", ":ls:"),
    ("tn", "Setswana", "Setswana", "🇧🇼", ":bw:"),
    ("ln", "Lingala", "Lingála", "🇨🇩", ":cd:"),
    ("wo", "Wolof", "Wolof", "🇸🇳", ":sn:"),
    ("bm", "Bambara", "Bamanankan", "🇲🇱", ":ml:"),
    ("ti", "Tigrinya", "ትግርኛ", "🇪🇷", ":er:"),
    ("ee", "Ewe", "Eʋegbe", "🇬🇭", ":gh:"),
    ("ak", "Akan (Twi)", "Twi", "🇬🇭", ":gh:"),
    ("tw", "Twi", "Asante Twi", "🇬🇭", ":gh:"),
    ("ca", "Katalanisch", "Català", "🇪🇸", ":es:"),
    ("eu", "Baskisch", "Euskara", "🇪🇸", ":es:"),
    ("gl", "Galicisch", "Galego", "🇪🇸", ":es:"),
    ("oc", "Okzitanisch", "Occitan", "🇫🇷", ":fr:"),
    ("br", "Bretonisch", "Brezhoneg", "🇫🇷", ":fr:"),
    ("co", "Korsisch", "Corsu", "🇫🇷", ":fr:"),
    ("cy", "Walisisch", "Cymraeg", "🇬🇧", ":gb:"),
    ("gd", "Schottisch-Gälisch", "Gàidhlig", "🇬🇧", ":gb:"),
    ("gv", "Manx", "Gaelg", "🇮🇲", ":im:"),
    ("kw", "Kornisch", "Kernewek", "🇬🇧", ":gb:"),
    ("lb", "Luxemburgisch", "Lëtzebuergesch", "🇱🇺", ":lu:"),
    ("mt", "Maltesisch", "Malti", "🇲🇹", ":mt:"),
    ("fo", "Färöisch", "Føroyskt", "🇫🇴", ":fo:"),
    ("kl", "Grönländisch", "Kalaallisut", "🇬🇱", ":gl:"),
    ("eo", "Esperanto", "Esperanto", "🌐", ":globe_with_meridians:"),
    ("ia", "Interlingua", "Interlingua", "🌐", ":globe_with_meridians:"),
    ("la", "Latein", "Latina", "🏛️", ":classical_building:"),
    ("sa", "Sanskrit", "संस्कृतम्", "🇮🇳", ":in:"),
    ("be", "Belarussisch", "Беларуская", "🇧🇾", ":by:"),
    ("bs", "Bosnisch", "Bosanski", "🇧🇦", ":ba:"),
    ("me", "Montenegrinisch", "Crnogorski", "🇲🇪", ":me:"),
    ("tt", "Tatarisch", "Татарча", "🇷🇺", ":ru:"),
    ("ba", "Baschkirisch", "Башҡортса", "🇷🇺", ":ru:"),
    ("cv", "Tschuwaschisch", "Чӑвашла", "🇷🇺", ":ru:"),
    ("sah", "Jakutisch (Sacha)", "Саха тыла", "🇷🇺", ":ru:"),
    ("ug", "Uigurisch", "ئۇيغۇرچە", "🇨🇳", ":cn:"),
    ("bo", "Tibetisch", "བོད་སྐད་", "🇨🇳", ":cn:")
]

def make_navigation_table(prefix='', current_code=None):
    cols = 3
    rows = []
    header = '| ' + ' | '.join(['🏳️ Nationalflaggen & Weltsprache'] * cols) + ' |'
    sep = '| ' + ' | '.join([':---'] * cols) + ' |'
    rows.append(header)
    rows.append(sep)
    
    cells = []
    for code, name, native, flag_emoji, gh_shortcode in LANG_DATA:
        # Use both GitHub shortcode and Unicode flags so that every platform displays colorful flags!
        # Multi-flag formatting: :de: :at: :ch: 🇩🇪 🇦🇹 🇨🇭
        flag_display = f"{gh_shortcode} {flag_emoji}"
        if code == current_code:
            cell = f"{flag_display} **{name} ({native})**"
        else:
            link = f"{prefix}README_{code}.md"
            cell = f"{flag_display} [{name} ({native})]({link})"
        cells.append(cell)
        
    while len(cells) % cols != 0:
        cells.append('')
        
    for i in range(0, len(cells), cols):
        rows.append('| ' + ' | '.join(cells[i:i+cols]) + ' |')
        
    return '\n'.join(rows)

# Full translations for key languages
TRANSLATIONS = {
    "en": {
        "title": "Formula ex Machina – Universal Scientific Formula System",
        "welcome": "Welcome to **Formula ex Machina**, the high-precision scientific formula and computation system engineered by SonnerStudio.",
        "desc": "Designed for universal scientists, engineers, researchers, and university faculties worldwide. Features live symbolic rearrangement, dynamic multi-unit conversions, and an offline formula repository.",
        "features_title": "🌟 Core Capabilities",
        "f1": "**Comprehensive University Compendium**: Mathematical, physical, chemical, engineering, astronomical, and financial formulas from world faculties.",
        "f2": "**Golden Ratio & Fibonacci Calculations**: Closed-form Binet calculation ($F_n$) and Golden Ratio proportion analysis ($\\\\Phi = (1+\\\\sqrt{5})/2$).",
        "f3": "**Symbolic Algebraic Rearrangement**: Freely isolate any target variable with full step-by-step equivalence transformation logging.",
        "f4": "**Dynamic Multi-Unit Conversions**: Seamless transitions between SI, Imperial, and technical unit systems.",
        "f5": "**macOS Liquid Glass Design**: High-end native macOS interface with dark/light themes, keyboard shortcuts, and instant search.",
        "f6": "**Autonomous Update Engine**: One-click Git synchronization compatible with the SonnerStudio update system.",
        "quickstart_title": "🚀 Quickstart & Installation",
        "license_title": "📄 Open Source License",
        "license_desc": "Licensed under the **SonnerStudio Open Source License** – see [LICENSE.md](../../LICENSE.md)."
    },
    "fr": {
        "title": "Formula ex Machina – Système Universel de Formules Scientifiques",
        "welcome": "Bienvenue sur **Formula ex Machina**, le système de formules et de calcul scientifique haute précision développé par SonnerStudio.",
        "desc": "Conçu pour les scientifiques universels, ingénieurs et chercheurs universitaires du monde entier. Intègre le réarrangement symbolique en direct, la conversion multi-unités dynamique et un catalogue hors ligne exhaustif.",
        "features_title": "🌟 Fonctionnalités Principales",
        "f1": "**Recueil Universitaire Complet**: Formules de mathématiques, physique, chimie, ingénierie, astronomie et mathématiques financières.",
        "f2": "**Nombre d'Or et Suites de Fibonacci**: Formule de Binet ($F_n$) et analyse du ratio d'or ($\\\\Phi = (1+\\\\sqrt{5})/2$).",
        "f3": "**Isolement Algébrique Symbolique**: Résolution algébrique pour toute variable choisie avec étapes détaillées.",
        "f4": "**Conversion Dynamique d'Unités**: Passage fluide entre système international (SI), impérial et unités techniques.",
        "f5": "**Design macOS Liquid Glass**: Interface native macOS raffinée, modes sombre/clair et raccourcis clavier.",
        "f6": "**Moteur de Mise à Jour Autonome**: Synchronisation Git en un clic via la méthode SonnerStudio.",
        "quickstart_title": "🚀 Démarrage Rapide & Installation",
        "license_title": "📄 Licence Open Source",
        "license_desc": "Distribué sous la **Licence Open Source SonnerStudio** – voir [LICENSE.md](../../LICENSE.md)."
    },
    "es": {
        "title": "Formula ex Machina – Sistema Universal de Fórmulas Científicas",
        "welcome": "Bienvenido a **Formula ex Machina**, el sistema científico de cálculo y fórmulas de alta precisión creado por SonnerStudio.",
        "desc": "Diseñado para científicos universales, ingenieros e investigadores universitarios de todo el mundo. Incluye despeje algebraico simbólico en vivo, conversor dinámico de unidades y base de fórmulas offline.",
        "features_title": "🌟 Capacidades Principales",
        "f1": "**Compendio Universitario Integral**: Fórmulas de matemáticas, física, química, ingeniería, astronomía y finanzas.",
        "f2": "**Proporción Áurea y Números de Fibonacci**: Fórmula de Binet ($F_n$) y cálculo de la proporción divina ($\\\\Phi = (1+\\\\sqrt{5})/2$).",
        "f3": "**Despeje Algebraico Simbólico**: Aislamiento exacto de cualquier variable con registro paso a paso de equivalencias.",
        "f4": "**Conversión Dinámica de Unidades**: Conversiones instantáneas entre unidades SI, imperiales y técnicas.",
        "f5": "**Diseño Nativo macOS Liquid Glass**: Estética moderna con temas oscuro y claro, atajos de teclado y búsqueda instantánea.",
        "f6": "**Motor Autónomo de Actualización**: Actualización en un clic sincronizada con GitHub y Git central.",
        "quickstart_title": "🚀 Guía Rápida e Instalación",
        "license_title": "📄 Licencia de Código Abierto",
        "license_desc": "Bajo la **Licencia Open Source de SonnerStudio** – consultar [LICENSE.md](../../LICENSE.md)."
    },
    "it": {
        "title": "Formula ex Machina – Sistema Universale di Formule Scientifiche",
        "welcome": "Benvenuti in **Formula ex Machina**, il sistema di formule e calcolo scientifico di precisione sviluppato da SonnerStudio.",
        "desc": "Progettato per scienziati universali, ingegneri e ricercatori accademici. Dotato di risoluzione algebrica simbolica, conversioni dinamiche di unità e compendio scientifico offline.",
        "features_title": "🌟 Caratteristiche Principali",
        "f1": "**Compendio Universitario Completo**: Formule di matematica, fisica, chimica, ingegneria, astronomia ed economia.",
        "f2": "**Sezione Aurea e Successione di Fibonacci**: Formula chiusa di Binet ($F_n$) e proporzione aurea ($\\\\Phi = (1+\\\\sqrt{5})/2$).",
        "f3": "**Esplicitazione Simbolica**: Risoluzione algebrica per qualsiasi variabile con passaggi passo-passo.",
        "f4": "**Conversione Unità Dinamica**: Passaggio istantaneo tra SI, imperiale e unità tecniche.",
        "f5": "**Design macOS Liquid Glass**: Esperienza nativa raffinata, modalità scura/chiara e scorciatoie da tastiera.",
        "f6": "**Aggiornamento Autonomo**: Sistema di aggiornamento con un clic integrato con GitHub.",
        "quickstart_title": "🚀 Avvio Rapido & Installazione",
        "license_title": "📄 Licenza Open Source",
        "license_desc": "Rilasciato sotto **Licenza Open Source SonnerStudio** – vedere [LICENSE.md](../../LICENSE.md)."
    },
    "pt": {
        "title": "Formula ex Machina – Sistema Universal de Fórmulas Científicas",
        "welcome": "Bem-vindo ao **Formula ex Machina**, o sistema avançado de cálculo e compêndio de fórmulas científicas desenvolvido pela SonnerStudio.",
        "desc": "Criado para cientistas universais, engenheiros e pesquisadores universitários em todo o mundo. Apresenta isolamento algébrico simbólico, conversão dinâmica de unidades e compêndio offline.",
        "features_title": "🌟 Recursos Principais",
        "f1": "**Compêndio Universitário Completo**: Fórmulas de matemática, física, química, engenharia, astronomia e finanças.",
        "f2": "**Proporção Áurea e Sequência de Fibonacci**: Fórmula fechada de Binet ($F_n$) e número de ouro ($\\\\Phi = (1+\\\\sqrt{5})/2$).",
        "f3": "**Isolamento Algébrico Simbólico**: Resolução exata para qualquer variável com passos de transformação.",
        "f4": "**Conversor Dinâmico de Unidades**: Suporte completo para unidades SI, métricas e imperiais.",
        "f5": "**Interface macOS Liquid Glass**: Visual moderno, modos claro e escuro, atalhos de teclado e busca rápida.",
        "f6": "**Atualizador Automático**: Sincronização e compilação direta via GitHub.",
        "quickstart_title": "🚀 Início Rápido e Instalação",
        "license_title": "📄 Licença de Código Aberto",
        "license_desc": "Licenciado sob a **Licença Open Source SonnerStudio** – consulte [LICENSE.md](../../LICENSE.md)."
    },
    "ru": {
        "title": "Formula ex Machina – Универсальная научная система формул",
        "welcome": "Добро пожаловать в **Formula ex Machina**, высокоточную систему формул и научных вычислений от SonnerStudio.",
        "desc": "Создана для ученых-универсалов, инженеров, исследователей и университетских факультетов по всему миру. Поддерживает символьное преобразование формул, динамический пересчет единиц и автономную базу данных.",
        "features_title": "🌟 Ключевые возможности",
        "f1": "**Полный университетский справочник**: Формулы математики, физики, химии, инженерии, астрофизики и финансов.",
        "f2": "**Золотое сечение и числа Фибоначчи**: Формула Бине ($F_n$) и расчет золотого сечения ($\\\\Phi = (1+\\\\sqrt{5})/2$).",
        "f3": "**Символьное выражение переменных**: Аналитическое решение относительно любой переменной с пошаговым решением.",
        "f4": "**Динамический конвертер величин**: Мгновенный пересчет между единицами СИ, техническими и имперскими стандартами.",
        "f5": "**Дизайн macOS Liquid Glass**: Нативный интерфейс macOS, темная и светлая темы, горячие клавиши.",
        "f6": "**Автономная система обновлений**: Обновление в один клик через Git и встроенный модуль сборки.",
        "quickstart_title": "🚀 Быстрый старт и установка",
        "license_title": "📄 Открытая лицензия",
        "license_desc": "Лицензировано по **SonnerStudio Open Source License** – см. [LICENSE.md](../../LICENSE.md)."
    },
    "zh": {
        "title": "Formula ex Machina – 通用科学公式与计算系统",
        "welcome": "欢迎使用 **Formula ex Machina**，由 SonnerStudio 专为科学研究打造的高精度通用科学公式与符号计算系统。",
        "desc": "专为通用科学家、工程师、高校学者与跨学科研究者设计。支持实时代数符号方程变换、多物理单位动态换算以及全离线学科数据库。",
        "features_title": "🌟 核心特性",
        "f1": "**全球大学各学科通用公式集**：涵盖数学、物理、化学、工程学、天文学及数理金融等核心院系公式。",
        "f2": "**黄金分割与斐波那契数列计算**：包含比奈公式（Binet Formula，$F_n$）与黄金分割比例（$\\\\Phi = (1+\\\\sqrt{5})/2$）。",
        "f3": "**符号代数方程移项求解**：可针对任意目标变量进行解析求解，并提供完整的等价变换推导步骤。",
        "f4": "**动态物理量单位转换**：国际标准单位制（SI）、英制与工程单位之间的无缝实时换算。",
        "f5": "**macOS Liquid Glass 视觉体验**：原生现代化苹果设计风格，深浅色外观自适应与键盘快捷键。",
        "f6": "**自主在线更新体系**：一键同步 GitHub 最新源代码与自动化重新编译部署。",
        "quickstart_title": "🚀 快速上手与编译运行",
        "license_title": "📄 开源授权协议",
        "license_desc": "遵循 **SonnerStudio 开源许可证** – 详情见 [LICENSE.md](../../LICENSE.md)。"
    },
    "ja": {
        "title": "Formula ex Machina – 汎用科学公式・計算システム",
        "welcome": "SonnerStudioが開発した高精度な汎用科学計算・公式システム「**Formula ex Machina**」へようこそ。",
        "desc": "全世界の科学者、エンジニア、大学研究者のために設計。代数記号変形、動的単位換算、完全オフライン動作に対応。",
        "features_title": "🌟 主要機能",
        "f1": "**網羅的な大学教育公式集**：数学、物理学、天文学、電気工学、化学、機械工学、金融工学を網羅。",
        "f2": "**黄金比とフィボナッチ数列**：ビネの公式（$F_n$）によるフィボナッチ数の直接算出および黄金比（$\\\\Phi$）の幾何比率解析。",
        "f3": "**記号的数式変形（移項）**：任意の目的変数に対して数式を自動変形し、途中式を論理的に表示。",
        "f4": "**動的単位換算機能**：SI単位、ヤードポンド法、工学単位間の自動整合換算。",
        "f5": "**macOS Liquid Glass デザイン**：ダークモード／ライトモード対応、ショートカットキー完備。",
        "f6": "**自律型アップデートエンジン**：GitHub連携によるワンクリック最新バージョン更新。",
        "quickstart_title": "🚀 クイックスタートとインストール",
        "license_title": "📄 オープンソースライセンス",
        "license_desc": "**SonnerStudio Open Source License** に基づき配布 – 詳細は [LICENSE.md](../../LICENSE.md) を参照。"
    },
    "ar": {
        "title": "Formula ex Machina – النظام العلمي الشامل للصيغ الرياضية والحسابية",
        "welcome": "مرحبًا بك في **Formula ex Machina**، النظام العلمي فائق الدقة المطور بواسطة SonnerStudio.",
        "desc": "صُمم للعلماء والمهندسين والباحثين في الجامعات حول العالم. يتميز بالتحويل الرمزي للمعادلات والتحويل الديناميكي للوحدات والعمل بدون اتصال بالإنترنت.",
        "features_title": "🌟 الميزات الأساسية",
        "f1": "**موسوعة جامعية شاملة**: صيغ الرياضيات والفيزياء والكيمياء والهندسة وعلم الفلك والمالية.",
        "f2": "**النسبة الذهبية وأرقام فيبوناتشي**: صيغة بينيه المباشرة ($F_n$) وحساب النسبة الذهبية ($\\\\Phi = (1+\\\\sqrt{5})/2$).",
        "f3": "**عزل المتغيرات جبريًا**: حل المعادلة لأي متغير مع عرض خطوات التحويل خطوة بخطوة.",
        "f4": "**تحويل ديناميكي للوحدات**: توافق كامل بين النظام الدولي للوحدات (SI) والوحدات الإمبراطورية والفنية.",
        "f5": "**تصميم macOS Liquid Glass**: واجهة أنيقة تدعم النمط الداكن والفاتح واختصارات لوحة المفاتيح.",
        "f6": "**نظام تحديث مستقل**: تحديث وتجميع فوري بضغطة زر عبر GitHub.",
        "quickstart_title": "🚀 البدء السريع والتثبيت",
        "license_title": "📄 رخصة المصدر المفتوح",
        "license_desc": "مرخص بموجب **رخصة SonnerStudio مفتوحة المصدر** – راجع [LICENSE.md](../../LICENSE.md)."
    },
    "hi": {
        "title": "Formula ex Machina – सार्वभौमिक वैज्ञानिक सूत्र प्रणाली",
        "welcome": "SonnerStudio द्वारा निर्मित उच्च-सटीक वैज्ञानिक सूत्र एवं गणना प्रणाली **Formula ex Machina** में आपका स्वागत है।",
        "desc": "विश्वभर के वैज्ञानिकों, इंजीनियरों और विश्वविद्यालयों के लिए तैयार की गई प्रणाली। लाइव बीजगणितीय समीकरण परिवर्तन और गतिशील इकाई रूपांतरण।",
        "features_title": "🌟 मुख्य विशेषताएं",
        "f1": "**व्यापक विश्वविद्यालय सूत्र संग्रह**: गणित, भौतिकी, खगोल विज्ञान, रसायन विज्ञान, इंजीनियरिंग और वित्त के प्रामाणिक सूत्र।",
        "f2": "**स्वर्ण अनुपात एवं फाइबोनैचि गणना**: बिने सूत्र ($F_n$) और स्वर्ण अनुपात ($\\\\Phi = (1+\\\\sqrt{5})/2$) का विश्लेषण।",
        "f3": "**प्रतीकात्मक बीजगणितीय पक्षांतरण**: किसी भी चर के लिए चरण-दर-चरण समीकरण हल करने की सुविधा।",
        "f4": "**गतिशील इकाई रूपांतरण**: अंतर्राष्ट्रीय मानक (SI) और तकनीकी इकाइयों के बीच स्वचालित रूपांतरण।",
        "f5": "**macOS Liquid Glass डिज़ाइन**: डार्क/लाइट मोड और कीबोर्ड शॉर्टकट के साथ आधुनिक मैक इंटरफ़ेस।",
        "f6": "**स्वायत्त अपडेट सिस्टम**: गिटहब के माध्यम से एक-क्लिक स्वचालित अपडेट और संकलन।",
        "quickstart_title": "🚀 त्वरित शुरुआत और संस्थापन",
        "license_title": "📄 ओपन सोर्स लाइसेंस",
        "license_desc": "**SonnerStudio ओपन सोर्स लाइसेंस** के तहत उपलब्ध – देखें [LICENSE.md](../../LICENSE.md)।"
    },
    "nl": {
        "title": "Formula ex Machina – Universeel Wetenschappelijk Formulesysteem",
        "welcome": "Welkom bij **Formula ex Machina**, het wetenschappelijke precisiesysteem van SonnerStudio.",
        "desc": "Ontworpen voor universele wetenschappers, ingenieurs en academici. Biedt symbolische algebraïsche formule-omzetting, dynamische eenheidsconversie en een complete offline database.",
        "features_title": "🌟 Belangrijkste Functies",
        "f1": "**Uitgebreid Universitair Compendium**: Formules uit wiskunde, natuurkunde, sterrenkunde, scheikunde, werktuigbouwkunde en financiën.",
        "f2": "**Gulden Snede & Fibonacci-getallen**: Formule van Binet ($F_n$) en Gulden Snede verhoudingen ($\\\\Phi = (1+\\\\sqrt{5})/2$).",
        "f3": "**Symbolische Formule-isolatie**: Los elke gewenste variabele algebraïsch op inclusief stapsgewijze toelichting.",
        "f4": "**Dynamische Eenhedenconversie**: Naadloze omrekening tussen SI-, imperiale en technische eenheden.",
        "f5": "**macOS Liquid Glass Interface**: Native macOS-ervaring met donkere en lichte modus.",
        "f6": "**Autonoom Updatesysteem**: Eén-klik synchronisatie en update via GitHub.",
        "quickstart_title": "🚀 Snelle Start & Installatie",
        "license_title": "📄 Open Source Licentie",
        "license_desc": "Onder de **SonnerStudio Open Source Licentie** – zie [LICENSE.md](../../LICENSE.md)."
    },
    "tr": {
        "title": "Formula ex Machina – Evrensel Bilimsel Formül ve Hesaplama Sistemi",
        "welcome": "SonnerStudio tarafından geliştirilen yüksek hassasiyetli bilimsel formül ve hesaplama sistemi **Formula ex Machina**'ya hoş geldiniz.",
        "desc": "Dünya çapındaki bilim insanları, mühendisler ve üniversite araştırmacıları için tasarlandı. Canlı sembolik formül çözümü ve dinamik birim dönüştürme içerir.",
        "features_title": "🌟 Temel Özellikler",
        "f1": "**Kapsamlı Üniversite Formül Külliyatı**: Matematik, fizik, kimya, mühendislik, astronomi ve finans formülleri.",
        "f2": "**Altın Oran ve Fibonacci Hesaplamaları**: Binet formülü ($F_n$) ve altın oran ($\\\\Phi = (1+\\\\sqrt{5})/2$) orantı hesabı.",
        "f3": "**Sembolik Cebirsel Dönüşüm**: Seçilen herhangi bir değişkeni adım adım denklik açıklamalarıyla yalnız bırakma.",
        "f4": "**Dinamik Birim Dönüşümü**: SI, emperyal ve mühendislik birimleri arasında anlık doğru dönüşüm.",
        "f5": "**macOS Liquid Glass Arayüzü**: Karanlık ve aydınlık mod, klavye kısayolları ve anında arama.",
        "f6": "**Otomatik Güncelleme Motoru**: GitHub üzerinden tek tıkla doğrudan güncelleme ve yerel derleme.",
        "quickstart_title": "🚀 Hızlı Başlangıç ve Kurulum",
        "license_title": "📄 Açık Kaynak Lisansı",
        "license_desc": "**SonnerStudio Açık Kaynak Lisansı** ile lisanslanmıştır – bkz. [LICENSE.md](../../LICENSE.md)."
    },
    "pl": {
        "title": "Formula ex Machina – Uniwersalny Naukowy System Wzorów",
        "welcome": "Witamy w **Formula ex Machina**, zaawansowanym systemie obliczeń naukowych i katalogu wzorów stworzonym przez SonnerStudio.",
        "desc": "Zaprojektowany dla naukowców, inżynierów i pracowników uniwersyteckich na całym świecie. Posiada moduł symbolicznego przekształcania równań i dynamiczną konwersję jednostek.",
        "features_title": "🌟 Główne Możliwości",
        "f1": "**Kompletne Kompendium Akademickie**: Wzory z matematyki, fizyki, chemii, inżynierii, astronomii i finansów.",
        "f2": "**Złoty Podział i Liczby Fibonacciego**: Wzór Bineta ($F_n$) oraz dokładna proporcja złotego podziału ($\\\\Phi = (1+\\\\sqrt{5})/2$).",
        "f3": "**Symboliczne Przekształcanie Wzorów**: Analityczne wyznaczanie dowolnej zmiennej z pełnym opisem kroków.",
        "f4": "**Dynamiczna Konwersja Jednostek**: Błyskawiczne przeliczanie pomiędzy układem SI, imperialnym i technicznym.",
        "f5": "**Wygląd macOS Liquid Glass**: Nowoczesny interfejs z trybem ciemnym/jasnym i skrótami klawiszowymi.",
        "f6": "**Autonomiczny System Aktualizacji**: Aktualizacja jednym kliknięciem zsynchronizowana z GitHub.",
        "quickstart_title": "🚀 Szybki Start i Instalacja",
        "license_title": "📄 Licencja Open Source",
        "license_desc": "Na licencji **SonnerStudio Open Source** – zobacz [LICENSE.md](../../LICENSE.md)."
    }
}

# 1. Update README.md (German Master)
table_main = make_navigation_table(prefix='docs/locales/', current_code='de')

readme_main = f"""<p align="center">
  <img src="assets/hero.png" alt="Formula ex Machina – SonnerStudio" width="100%">
</p>

## 🌍 Sprachauswahl / Language Selection (130 Weltsprachen & Nationalflaggen)

Wählen Sie Ihre bevorzugte Sprache für die vollständige Dokumentation. Jede Sprache verfügt über eine eigene, vollständig in der jeweiligen Landessprache übersetzte Readme-Dokumentation mit offiziellen Nationalflaggen (inklusive D-A-CH für Deutsch):

{table_main}

---

# ⚛️ Formula ex Machina – Universal Scientific Formula System
**SonnerStudio • Open-Source Edition • Universal Science Compendium**

## 🌟 Was ist Formula ex Machina?
**Formula ex Machina** ist ein hochpräzises, natives macOS-Arbeitswerkzeug für Universalwissenschaftler, Physiker, Mathematiker, Ingenieure, Astronomen, Chemiker und Informatiker. Entwickelt von **SonnerStudio (Jan Friske)** vereint das System:

1. **Vollständige wissenschaftliche Formelsammlung**: Fundamentale Gleichungen aller universitären Fakultäten der Erde (Mathematik, Physik, Astronomie, Elektrotechnik, Chemie, Maschinenbau, Informatik, Finanzmathematik).
2. **Goldener Schnitt & Fibonacci-Zahlen**: Exakte analytische Formeln für die Goldene Zahl $\\Phi = \\frac{1+\\sqrt{5}}{2}$, Streckenteilungsproportionen und die geschlossene Formel von Binet für die $n$-te Fibonacci-Zahl.
3. **Symbolische Computeralgebra (CAS)**: Automatisches Umstellen jeder Gleichung nach jeder beliebigen Zielvariable mit vollständiger Schritt-für-Schritt-Protokollierung aller Äquivalenzumformungen.
4. **Interaktive Berechnungsmaske**: Live-Berechnung bei Tastatureingabe mit Typprüfung und Schutz vor Division durch Null oder negativen Wurzeln.
5. **Dynamische Multieinheiten-Konvertierung**: Automatische Umrechnung zwischen SI-Basiseinheiten, abgeleiteten Einheiten, imperialen Maßen und dimensionslosen Werten.
6. **macOS Liquid Glass Design**: Hochwertige native macOS-Oberfläche im dunklen und hellen Modus mit individuellen Akzentfarben, Tooltips und Tastatur-Shortcuts.
7. **Autonomes Update-System**: Schnelle Ein-Klick-Aktualisierung über Git (`tools/update.sh` bzw. In-App-Update-Button), kompatibel mit dem SternenMeister-Standard.

## 🚀 Installation & Build

### Voraussetzungen
- macOS 14.0 (Sonoma) oder neuer (voll optimiert für Apple Silicon M-Serie und Intel)
- Xcode Command Line Tools (`xcode-select --install`)
- Git

```bash
# 1. Repository klonen
git clone https://github.com/SonnerStudio/Formula-ex-Machina.git
cd "Formula-ex-Machina"

# 2. Kompilieren, signieren und starten
./build.sh --open

# 3. Tests ausführen
swift test
```

## 🔄 Update-System (SternenMeister-Methode)
Formula ex Machina verfügt über dieselbe bewährte Update-Technik wie *SternenMeister - Zeitmeister 24*. Ein Klick auf das Update-Symbol in der Toolbar oder die Ausführung von `./update.sh` synchronisiert das Repository direkt mit GitHub und dem lokalen zentralen Git-Archiv und baut die App nahtlos neu:

```bash
./update.sh
```

## 📄 Lizenz
Dieses Projekt ist als freie Open-Source-Software unter der **SonnerStudio Open Source Lizenz** lizenziert – siehe [LICENSE.md](LICENSE.md).

---
*Entwickelt von SonnerStudio • Jan Friske • Formula ex Machina – Das Werkzeug für den Universalwissenschaftler.*
"""

with open('README.md', 'w') as f:
    f.write(readme_main)
print("Updated README.md")

# 2. Update docs/locales/INDEX.md
table_index = make_navigation_table(prefix='', current_code=None)
index_content = f"""# 🌍 Formula ex Machina – Weltweite Sprachauswahl (130 Sprachen & Nationalflaggen)

<p align="center">
  <img src="../../assets/hero.png" alt="Formula ex Machina – SonnerStudio" width="100%">
</p>

Wählen Sie Ihre Sprache aus den 130 meistgesprochenen und bedeutendsten Sprachen der Erde:

{table_index}

[⬅ Zurück zur Hauptdokumentation (Deutsch)](../../README.md)
"""
with open('docs/locales/INDEX.md', 'w') as f:
    f.write(index_content)
print("Updated docs/locales/INDEX.md")

# 3. Generate all 130 localized README files in their native language
for code, name, native, flag_emoji, gh_shortcode in LANG_DATA:
    filepath = f"docs/locales/README_{code}.md"
    nav_table = make_navigation_table(prefix='', current_code=code)
    
    # Pick localized strings or fall back to English with native header
    trans = TRANSLATIONS.get(code, TRANSLATIONS.get("en"))
    
    # Header display
    flag_line = f"{gh_shortcode} {flag_emoji}"
    
    content = f"""<p align="center">
  <img src="../../assets/hero.png" alt="Formula ex Machina – SonnerStudio" width="100%">
</p>

## 🌍 {flag_line} {name} ({native}) – Formula ex Machina

> **Language Navigation / Sprachnavigation**: [⬅ Hauptdokumentation (Deutsch)](../../README.md) | [🌍 130 Sprachen / Languages Index](INDEX.md)

<details open>
<summary><b>▶ 130 Weltsprachen & Nationalflaggen / 130 World Languages & National Flags</b></summary>

{nav_table}

</details>

---

# {flag_line} {trans['title']}
**SonnerStudio • Open-Source Edition • Universal Science Compendium**

## 📖 {name} ({native})

{trans['welcome']}

{trans['desc']}

### {trans['features_title']}
1. {trans['f1']}
2. {trans['f2']}
3. {trans['f3']}
4. {trans['f4']}
5. {trans['f5']}
6. {trans['f6']}

### {trans['quickstart_title']}
```bash
# Clone the repository
git clone https://github.com/SonnerStudio/Formula-ex-Machina.git
cd "Formula-ex-Machina"

# Build and launch
./build.sh --open
```

### {trans['license_title']}
{trans['license_desc']}

---
*Created with scientific precision by SonnerStudio (Jan Friske).*
"""
    with open(filepath, 'w') as f:
        f.write(content)

print("All 130 localized READMEs successfully generated with native translations and proper flag shortcodes!")
