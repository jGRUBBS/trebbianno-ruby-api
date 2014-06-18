module Trebbianno
  class Country

    COUNTRY_MAP = {
      'MQ' => 'MQ',  # MARTINIQUE
      'ES' => 'SP',  # SPAIN
      'UA' => 'UA',  # UKRAINE
      'MN' => 'MO',  # MONGOLIA
      'AI' => 'AN',  # ANGUILLA
      'AU' => 'AU',  # AUSTRALIA
      'BS' => 'BH',  # BAHAMAS
      'BB' => 'BB',  # BARBADOS
      'BM' => 'BE',  # BERMUDA
      'BE' => 'BG',  # BELGIUM
      'BZ' => 'BL',  # BELIZE
      'BO' => 'BO',  # BOLIVIA
      'CL' => 'CH',  # CHILE
      'CR' => 'CR',  # COSTA RICA
      'EE' => 'ES',  # ESTONIA
      'DE' => 'GE',  # GERMANY
      'GT' => 'GM',  # GUATEMALA
      'GD' => 'GR',  # GRENADA
      'HT' => 'HA',  # HAITI
      'IS' => 'IC',  # ICELAND
      'IL' => 'IS',  # ISRAEL
      'JM' => 'JM',  # JAMAICA
      'US' => 'US',  # UNITED STATES
      'AE' => 'AE',  # UNITED ARAB EMIRATES
      'BD' => 'BD',  # BANGLADESH
      'EG' => 'EG',  # EGYPT
      'HK' => 'HK',  # HONG KONG
      'ID' => 'ID',  # INDONESIA
      'IN' => 'IN',  # INDIA
      'LK' => 'LK',  # SRI LANKA
      'OM' => 'OM',  # OMAN
      'PH' => 'PH',  # PHILIPPINES
      'PK' => 'PK',  # PAKISTAN
      'ZA' => 'SA',  # SOUTH AFRICA
      'SZ' => 'SW',  # SWAZILAND
      'TH' => 'TH',  # THAILAND
      'TW' => 'TW',  # TAIWAN
      'KH' => 'CB',  # CAMBODIA
      'LS' => 'LE',  # LESOTHO
      'QA' => 'QT',  # QATAR
      'SA' => 'SD',  # SAUDI ARABIA
      'BH' => 'BA',  # BAHRAIN
      'HN' => 'HO',  # HONDURAS
      'CA' => 'CA',  # CANADA 
      'JP' => 'JP',  # JAPAN
      'KW' => 'KU',  # KUWAIT
      'LB' => 'LB',  # LEBANON
      'MH' => 'MH',  # MARSHALL ISLANDS
      'MX' => 'MX',  # MEXICO
      'AN' => 'NA',  # NETHERLANDS ANTILLES
      'NG' => 'NI',  # NIGERIA
      'NI' => 'NR',  # NICARAGUA
      'PA' => 'PN',  # PANAMA
      'PR' => 'PR',  # PUERTO RICO
      'PE' => 'PU',  # PERU
      'RO' => 'RO',  # ROMANIA
      'VE' => 'VZ',  # VENEZUELA
      'GU' => 'GU',  # GUAM
      'PW' => 'PW',  # PALAU
      'BW' => 'BW',  # BOTSWANA
      'GH' => 'GH',  # GHANA
      'IT' => 'IT',  # ITALY
      'BG' => 'BU',  # BULGARIA
      'HU' => 'HU',  # HUNGARY
      'PL' => 'PO',  # POLAND
      'TR' => 'TR',  # TURKEY
      'MU' => 'MT',  # MAURITIUS
      'MV' => 'MV',  # MALDIVES
      'MY' => 'MY',  # MALAYSIA
      'SG' => 'SG',  # SINGAPORE
      'UY' => 'UR',  # URUGUAY
      'GR' => 'GC',  # GREECE
      'MW' => 'MA',  # MALAWI
      'FI' => 'FN',  # FINLAND
      'TM' => 'TM',  # TURKMENISTAN
      'CH' => 'ST',  # SWITZERLAND
      'KZ' => 'KZ',  # KAZAKHSTAN
      'PY' => 'PY',  # PARAGUAY
      'FR' => 'FR',  # FRANCE
      'GB' => 'UK',  # UNITED KINGDOM
      'AR' => 'AR',  # ARGENTINA
      'GT' => 'GT',  # GUATEMALA
      'SV' => 'EL',  # EL SALVADOR
      'KR' => 'SK',  # SOUTH KOREA - REPUBLIC OF KOREA
      'IE' => 'IRL', # IRELAND
      'GY' => 'GY',  # GUYANA
      'BR' => 'BR',  # BRAZIL
      'CN' => 'CN',  # CHINA
      'VN' => 'VN',  # VIETNAM
      'MO' => 'MC',  # MACAU
      'KP' => 'KR',  # NORTH KOREA - DEMOCRATIC PEOPLE'S REPUBLIC OF KOREA
      'AG' => 'AT',  # ANTIGUA,
      'CO' => 'CO',  # COLOMBIA
      'DO' => 'DR',  # DOMINICAN REPUBLIC
      'EC' => 'EQ',  # ECUADOR
      'SY' => 'SY',  # SYRIAN ARAB REPUBLIC
      'MP' => 'MP',  # MARIANA ISLANDS
      'RU' => 'RU',  # RUSSIA
      'SR' => 'SR',  # SURINAME
      'TT' => 'TD',  # TRINIDAD AND TOBAGO
      'VI' => 'VI',  # U.S. VIRGIN ISLANDS
      'CZ' => 'CZ',  # CZECH REPUBLIC
      'CY' => 'CP'   # CYPRUS
    }

    def self.map(code)
      COUNTRY_MAP[code] || code
    end

  end
end
