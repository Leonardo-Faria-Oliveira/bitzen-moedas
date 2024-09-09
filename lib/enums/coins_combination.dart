
  enum CoinsCombination {
    USD_BRL, // USD to BRL
    USD_GBP,
    USD_EUR,
    EUR_BRL,
    EUR_USD,
    EUR_GBP,
    BRL_USD,
    BRL_EUR,
    BRL_GBP,
    GBP_USD,
    GBP_BRL,
  }

  extension CoinsCombinationExtension on CoinsCombination {
    String getLabel() {
      switch (this) {
        case CoinsCombination.USD_BRL:
          return 'dolar-real';
        case CoinsCombination.EUR_BRL:
          return 'euro-real';
        case CoinsCombination.GBP_BRL:
          return 'libra-real';
        case CoinsCombination.BRL_USD:
          return 'real-dolar';
        case CoinsCombination.BRL_EUR:
          return 'real-euro';
        case CoinsCombination.USD_EUR:
          return 'dolar-euro';
        case CoinsCombination.GBP_USD:
          return 'libra-dolar';
        case CoinsCombination.EUR_USD:
          return 'euro-dolar';
        case CoinsCombination.BRL_GBP:
          return 'real-libra';
        case CoinsCombination.USD_GBP:
          return 'dolar-libra';
        case CoinsCombination.EUR_GBP:
          return 'euro-libra';
        default:
          return '';
      }
    }

    String getCode() {
      switch (this) {
        case CoinsCombination.USD_BRL:
          return 'USD-BRL';
        case CoinsCombination.EUR_BRL:
          return 'EUR-BRL';
        case CoinsCombination.GBP_BRL:
          return 'GBP-BRL';
        case CoinsCombination.BRL_USD:
          return 'BRL-USD';
        case CoinsCombination.BRL_EUR:
          return 'BRL-EUR';
        case CoinsCombination.USD_EUR:
          return 'USD-EUR';
        case CoinsCombination.GBP_USD:
          return 'USD-GBP';
        case CoinsCombination.EUR_USD:
          return 'EUR-USD';
        case CoinsCombination.BRL_GBP:
          return 'BRL-GBP';
        case CoinsCombination.USD_GBP:
          return 'USD-GBP';
        case CoinsCombination.EUR_GBP:
          return 'GBP-EUR';
        default:
          return '';
      }
    }
  }