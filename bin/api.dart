import 'buyload.dart';

class MposApi {
  /// parameter cotains [userAccount] [password]
  static final login = 'api/v1/user/login';
  static final loginResult = {
    'code': 200,
    'data': {
      'token': '27425379843464',
      'cashWallet': 1201,
      'loadWallet': 1826,
    },
    'message': 'success'
  };

  /// parameter cotains [token]
  static final queryUserInfo = 'api/v1/user/queryUserInfo';
  static final queryUserInfoResult = {
    'code': 200,
    'data': {
      'currency': 'PHP',
      'cashWallet': 900,
      'loadWallet': 1200,
    },
    'message': 'success'
  };

  /// parameter cotains [token]
  /// parameter cotains [businessType]
  /// 1.cashin 2.buy load 3.send 4.pay bills 5Cash Pick Up 6KYC
  static final channelList = 'api/v1/channel/channelList';
  static final channelListCashinResult = {
    'code': 200,
    'data': [
      {
        'largeChannel': 'E-Wallets',
        'channelList': [
          {
            'channelName': 'GCash',
            'hasEnabled': 1,
            'channelId': 1,
            'channelLogo': '/mposImage/gcash.png'
          }
        ]
      },
      {
        'largeChannel': 'Banks',
        'channelList': [
          {
            'channelName': 'BPI',
            'hasEnabled': 1,
            'channelId': 26,
            'channelLogo': '/mposImage/BPI.png'
          },
          {
            'channelName': 'BDO',
            'hasEnabled': 1,
            'channelId': 27,
            'channelLogo': '/mposImage/BDO.png'
          },
          {
            'channelName': 'Metrobank',
            'hasEnabled': 1,
            'channelId': 28,
            'channelLogo': '/mposImage/metrobank.png'
          },
          {
            'channelName': 'More',
            'hasEnabled': 1,
            'channelId': 29,
            'channelLogo': '/mposImage/more.png'
          }
        ]
      }
    ],
    'message': 'success'
  };
  static final channelListSendResult = {
    'code': 200,
    'data': [
      {
        'largeChannel': 'E-Wallets',
        'channelList': [
          {
            'channelName': 'GCash',
            'hasEnabled': 1,
            'channelId': 4,
            'channelLogo': '/mposImage/gcash.png'
          },
          {
            'channelName': 'PayMaya',
            'hasEnabled': 1,
            'channelId': 6,
            'channelLogo': '/mposImage/paymaya.png'
          },
          {
            'channelName': 'Coins.ph',
            'hasEnabled': 1,
            'channelId': 7,
            'channelLogo': '/mposImage/coins.png'
          },
          {
            'channelName': 'Grab Pay',
            'hasEnabled': 1,
            'channelId': 8,
            'channelLogo': '/mposImage/grabpay.png'
          }
        ]
      },
      {
        'largeChannel': 'Over the Counter',
        'channelList': [
          {
            'channelName': 'Cebuana Lhuillier',
            'hasEnabled': 1,
            'channelId': 30,
            'channelLogo': '/mposImage/Lhuillier.png'
          }
        ]
      },
      {
        'largeChannel': 'Banks',
        'channelList': [
          {
            'channelName': 'BPI',
            'hasEnabled': 1,
            'channelId': 17,
            'channelLogo': '/mposImage/BPI.png'
          },
          {
            'channelName': 'BDO',
            'hasEnabled': 1,
            'channelId': 18,
            'channelLogo': '/mposImage/BDO.png'
          },
          {
            'channelName': 'Metrobank',
            'hasEnabled': 1,
            'channelId': 19,
            'channelLogo': '/mposImage/metrobank.png'
          },
          {
            'channelName': 'More',
            'hasEnabled': 1,
            'channelId': 20,
            'channelLogo': '/mposImage/more.png'
          }
        ]
      }
    ],
    'message': 'success'
  };

  /// parameter cotains [token]
  /// parameter cotains [businessType] [goodId] [goodAmount] [goodsName] [orderTmpId]
  static final panel = 'api/v1/payment/panel';
  static final panelResult = {
    'code': 200,
    'data': {
      'tmpId': 1618816234156679250,
      'paymentList': [
        {
          'methodId': 1,
          'methodName': 'Cash Wallet',
          'methodLogo': '/mposImage/gcash.png',
          'serviceFee': 5.0,
          'currency': 'PHP',
        }
      ]
    },
    'message': 'success'
  };

  /// parameter cotains [token]
  /// parameter cotains [tmpId] [methodId] [payPassword]
  static final orderPay = 'api/v1/payment/orderPay';
  static final orderPayResult = {
    'code': 200,
    'data': {
      'realAmount': 10.0,
      'serviceFee': 0.0,
      'orderId': 'CMSK21041900001',
      'orderClassify': 2,
      'orderStatus': 1,
      'failReason': null,
      'currency': 'PHP',
      'amountTotal': 10.0,
      'orderChannelDesc': 'Regular',
      'orderDesc': 'Buy Load'
    },
    'message': 'success'
  };

  /// parameter cotains [token]
  /// parameter cotains [orderId]
  static final queryOrderStatus = 'api/v1/order/queryOrderStatus';
  static final queryOrderStatusResult = {
    'code': 200,
    'data': {
      'realAmount': 10.0,
      'serviceFee': 0.0,
      'orderId': 'MPBL21041900001',
      'orderClassify': 2,
      'orderStatus': 1,
      'failReason': null,
      'currency': 'PHP',
      'amountTotal': 10.0,
      'orderChannelDesc': 'Regular',
      'orderDesc': 'Buy Load'
    },
    'message': 'success'
  };

  /// parameter cotains [token]
  /// parameter cotains [orderClassify]
  /// parameter cotains [startTime] [endTime] [pageNum] [pageSize]
  /// 0.全部 1.cashin 2.buy load 3.send 4.pay bills 5Cash Pick Up 6.KYC 7.epin
  static final orderList = 'api/v1/order/orderList';
  static final orderListAllResult = {
    'code': 200,
    'data': {
      'totalItems': 1,
      'totalPages': 1,
      'pageNo': 1,
      'pageSize': 20,
      'pageItems': 1,
      'items': [
        {
          'orderId': 'MPBL21041900001',
          'amountTotal': null,
          'serviceFee': null,
          'discountTotal': null,
          'realAmount': 10.0,
          'orderStatus': 4,
          'statusDesc': 'Completed',
          'payTime': {
            'year': 2021,
            'monthValue': 4,
            'month': 'APRIL',
            'dayOfMonth': 19,
            'dayOfYear': 109,
            'dayOfWeek': 'MONDAY',
            'hour': 15,
            'minute': 17,
            'second': 18,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'endTime': {
            'year': 2021,
            'monthValue': 4,
            'month': 'APRIL',
            'dayOfMonth': 19,
            'dayOfYear': 109,
            'dayOfWeek': 'MONDAY',
            'hour': 15,
            'minute': 17,
            'second': 18,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'currency': 'PHP',
          'orderDesc': 'Buy Load',
          'orderClassify': 2,
          'walletType': null,
          'createTime': {
            'year': 2021,
            'monthValue': 4,
            'month': 'APRIL',
            'dayOfMonth': 19,
            'dayOfYear': 109,
            'dayOfWeek': 'MONDAY',
            'hour': 15,
            'minute': 17,
            'second': 18,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'updateTime': null,
          'orderFrom': null,
          'remark': ''
        }
      ],
      'sumItems': [
        {'orderCount': 1, 'orderCreateTime': '2021-04-19', 'totalAmount': 10.0},
        {
          'orderCount': 4,
          'orderCreateTime': '2021-03-11',
          'totalAmount': 1465.0
        },
        {
          'orderCount': 3,
          'orderCreateTime': '2021-03-16',
          'totalAmount': 719.0
        },
        {'orderCount': 2, 'orderCreateTime': '2021-03-09', 'totalAmount': 7.0},
        {
          'orderCount': 5,
          'orderCreateTime': '2021-03-15',
          'totalAmount': 1338.0
        },
        {
          'orderCount': 5,
          'orderCreateTime': '2021-03-17',
          'totalAmount': 1425.0
        },
        {
          'orderCount': 3,
          'orderCreateTime': '2021-03-12',
          'totalAmount': 295.0
        },
        {
          'orderCount': 1,
          'orderCreateTime': '2021-03-25',
          'totalAmount': 100.0
        },
        {
          'orderCount': 5,
          'orderCreateTime': '2021-03-18',
          'totalAmount': 454.0
        },
        {'orderCount': 2, 'orderCreateTime': '2021-04-01', 'totalAmount': 115.0}
      ]
    },
    'message': 'success'
  };
  static final queryOrderStatus30DaysResult = {
    'code': 200,
    'data': {
      'totalItems': 6,
      'totalPages': 1,
      'pageNo': 1,
      'pageSize': 20,
      'pageItems': 6,
      'items': [
        {
          'orderId': 'MPBL21041900001',
          'amountTotal': null,
          'serviceFee': null,
          'discountTotal': null,
          'realAmount': 10.0,
          'orderStatus': 4,
          'statusDesc': 'Completed',
          'payTime': {
            'year': 2021,
            'monthValue': 4,
            'month': 'APRIL',
            'dayOfMonth': 19,
            'dayOfYear': 109,
            'dayOfWeek': 'MONDAY',
            'hour': 15,
            'minute': 17,
            'second': 18,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'endTime': {
            'year': 2021,
            'monthValue': 4,
            'month': 'APRIL',
            'dayOfMonth': 19,
            'dayOfYear': 109,
            'dayOfWeek': 'MONDAY',
            'hour': 15,
            'minute': 17,
            'second': 18,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'currency': 'PHP',
          'orderDesc': 'Buy Load',
          'orderClassify': 2,
          'walletType': null,
          'createTime': {
            'year': 2021,
            'monthValue': 4,
            'month': 'APRIL',
            'dayOfMonth': 19,
            'dayOfYear': 109,
            'dayOfWeek': 'MONDAY',
            'hour': 15,
            'minute': 17,
            'second': 18,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'updateTime': null,
          'orderFrom': null,
          'remark': ''
        },
        {
          'orderId': 'FTKMPBL21040100003',
          'amountTotal': null,
          'serviceFee': null,
          'discountTotal': null,
          'realAmount': 105.0,
          'orderStatus': 4,
          'statusDesc': 'Completed',
          'payTime': {
            'year': 2021,
            'monthValue': 4,
            'month': 'APRIL',
            'dayOfMonth': 1,
            'dayOfYear': 91,
            'dayOfWeek': 'THURSDAY',
            'hour': 15,
            'minute': 38,
            'second': 23,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'endTime': {
            'year': 2021,
            'monthValue': 4,
            'month': 'APRIL',
            'dayOfMonth': 1,
            'dayOfYear': 91,
            'dayOfWeek': 'THURSDAY',
            'hour': 15,
            'minute': 38,
            'second': 23,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'currency': 'PHP',
          'orderDesc': 'Buy Load',
          'orderClassify': 2,
          'walletType': null,
          'createTime': {
            'year': 2021,
            'monthValue': 4,
            'month': 'APRIL',
            'dayOfMonth': 1,
            'dayOfYear': 91,
            'dayOfWeek': 'THURSDAY',
            'hour': 15,
            'minute': 38,
            'second': 23,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'updateTime': null,
          'orderFrom': null,
          'remark': ''
        },
        {
          'orderId': 'FTKMPBL21040100001',
          'amountTotal': null,
          'serviceFee': null,
          'discountTotal': null,
          'realAmount': 10.0,
          'orderStatus': 4,
          'statusDesc': 'Completed',
          'payTime': {
            'year': 2021,
            'monthValue': 4,
            'month': 'APRIL',
            'dayOfMonth': 1,
            'dayOfYear': 91,
            'dayOfWeek': 'THURSDAY',
            'hour': 15,
            'minute': 35,
            'second': 33,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'endTime': {
            'year': 2021,
            'monthValue': 4,
            'month': 'APRIL',
            'dayOfMonth': 1,
            'dayOfYear': 91,
            'dayOfWeek': 'THURSDAY',
            'hour': 15,
            'minute': 35,
            'second': 33,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'currency': 'PHP',
          'orderDesc': 'Buy Load',
          'orderClassify': 2,
          'walletType': null,
          'createTime': {
            'year': 2021,
            'monthValue': 4,
            'month': 'APRIL',
            'dayOfMonth': 1,
            'dayOfYear': 91,
            'dayOfWeek': 'THURSDAY',
            'hour': 15,
            'minute': 35,
            'second': 33,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'updateTime': null,
          'orderFrom': null,
          'remark': ''
        },
        {
          'orderId': 'MPCI21033000001',
          'amountTotal': null,
          'serviceFee': null,
          'discountTotal': null,
          'realAmount': 105.0,
          'orderStatus': 8,
          'statusDesc': 'Failed',
          'payTime': {
            'year': 2021,
            'monthValue': 3,
            'month': 'MARCH',
            'dayOfMonth': 30,
            'dayOfYear': 89,
            'dayOfWeek': 'TUESDAY',
            'hour': 11,
            'minute': 38,
            'second': 45,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'endTime': null,
          'currency': 'PHP',
          'orderDesc': 'Cash In',
          'orderClassify': 1,
          'walletType': null,
          'createTime': {
            'year': 2021,
            'monthValue': 3,
            'month': 'MARCH',
            'dayOfMonth': 30,
            'dayOfYear': 89,
            'dayOfWeek': 'TUESDAY',
            'hour': 11,
            'minute': 38,
            'second': 45,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'updateTime': null,
          'orderFrom': null,
          'remark': ''
        },
        {
          'orderId': 'MPBL21032500005',
          'amountTotal': null,
          'serviceFee': null,
          'discountTotal': null,
          'realAmount': 100.0,
          'orderStatus': 4,
          'statusDesc': 'Completed',
          'payTime': {
            'year': 2021,
            'monthValue': 3,
            'month': 'MARCH',
            'dayOfMonth': 25,
            'dayOfYear': 84,
            'dayOfWeek': 'THURSDAY',
            'hour': 16,
            'minute': 11,
            'second': 34,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'endTime': {
            'year': 2021,
            'monthValue': 3,
            'month': 'MARCH',
            'dayOfMonth': 25,
            'dayOfYear': 84,
            'dayOfWeek': 'THURSDAY',
            'hour': 16,
            'minute': 11,
            'second': 34,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'currency': 'PHP',
          'orderDesc': 'Buy Load',
          'orderClassify': 2,
          'walletType': null,
          'createTime': {
            'year': 2021,
            'monthValue': 3,
            'month': 'MARCH',
            'dayOfMonth': 25,
            'dayOfYear': 84,
            'dayOfWeek': 'THURSDAY',
            'hour': 16,
            'minute': 11,
            'second': 33,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'updateTime': null,
          'orderFrom': null,
          'remark': ''
        },
        {
          'orderId': 'MPSE21032400005',
          'amountTotal': null,
          'serviceFee': null,
          'discountTotal': null,
          'realAmount': 105.0,
          'orderStatus': 8,
          'statusDesc': 'Failed',
          'payTime': {
            'year': 2021,
            'monthValue': 3,
            'month': 'MARCH',
            'dayOfMonth': 24,
            'dayOfYear': 83,
            'dayOfWeek': 'WEDNESDAY',
            'hour': 17,
            'minute': 57,
            'second': 31,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'endTime': null,
          'currency': 'PHP',
          'orderDesc': 'Send',
          'orderClassify': 3,
          'walletType': null,
          'createTime': {
            'year': 2021,
            'monthValue': 3,
            'month': 'MARCH',
            'dayOfMonth': 24,
            'dayOfYear': 83,
            'dayOfWeek': 'WEDNESDAY',
            'hour': 17,
            'minute': 57,
            'second': 31,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'updateTime': null,
          'orderFrom': null,
          'remark': ''
        }
      ],
      'sumItems': [
        {'orderCount': 1, 'orderCreateTime': '2021-04-19', 'totalAmount': 10.0},
        {
          'orderCount': 4,
          'orderCreateTime': '2021-03-11',
          'totalAmount': 1465.0
        },
        {
          'orderCount': 3,
          'orderCreateTime': '2021-03-16',
          'totalAmount': 719.0
        },
        {'orderCount': 2, 'orderCreateTime': '2021-03-09', 'totalAmount': 7.0},
        {
          'orderCount': 5,
          'orderCreateTime': '2021-03-15',
          'totalAmount': 1338.0
        },
        {
          'orderCount': 5,
          'orderCreateTime': '2021-03-17',
          'totalAmount': 1425.0
        },
        {
          'orderCount': 3,
          'orderCreateTime': '2021-03-12',
          'totalAmount': 295.0
        },
        {
          'orderCount': 1,
          'orderCreateTime': '2021-03-25',
          'totalAmount': 100.0
        },
        {
          'orderCount': 5,
          'orderCreateTime': '2021-03-18',
          'totalAmount': 454.0
        },
        {'orderCount': 2, 'orderCreateTime': '2021-04-01', 'totalAmount': 115.0}
      ]
    },
    'message': 'success'
  };
  static final queryOrderStatusCashIn30DaysResult = {
    'code': 200,
    'data': {
      'totalItems': 1,
      'totalPages': 1,
      'pageNo': 1,
      'pageSize': 20,
      'pageItems': 1,
      'items': [
        {
          'orderId': 'MPCI21033000001',
          'amountTotal': null,
          'serviceFee': null,
          'discountTotal': null,
          'realAmount': 105.0,
          'orderStatus': 8,
          'statusDesc': 'Failed',
          'payTime': {
            'year': 2021,
            'monthValue': 3,
            'month': 'MARCH',
            'dayOfMonth': 30,
            'dayOfYear': 89,
            'dayOfWeek': 'TUESDAY',
            'hour': 11,
            'minute': 38,
            'second': 45,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'endTime': null,
          'currency': 'PHP',
          'orderDesc': 'Cash In',
          'orderClassify': 1,
          'walletType': null,
          'createTime': {
            'year': 2021,
            'monthValue': 3,
            'month': 'MARCH',
            'dayOfMonth': 30,
            'dayOfYear': 89,
            'dayOfWeek': 'TUESDAY',
            'hour': 11,
            'minute': 38,
            'second': 45,
            'nano': 0,
            'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
          },
          'updateTime': null,
          'orderFrom': null,
          'remark': ''
        }
      ],
      'sumItems': [
        {
          'orderCount': 4,
          'orderCreateTime': '2021-03-11',
          'totalAmount': 1465.0
        },
        {
          'orderCount': 1,
          'orderCreateTime': '2021-03-12',
          'totalAmount': 265.0
        },
        {
          'orderCount': 5,
          'orderCreateTime': '2021-03-15',
          'totalAmount': 1338.0
        },
        {
          'orderCount': 1,
          'orderCreateTime': '2021-03-16',
          'totalAmount': 105.0
        },
        {
          'orderCount': 3,
          'orderCreateTime': '2021-03-17',
          'totalAmount': 315.0
        },
        {'orderCount': 2, 'orderCreateTime': '2021-03-18', 'totalAmount': 233.0}
      ]
    },
    'message': 'success'
  };

  /// parameter cotains [token]
  /// parameter cotains [orderId] [password]
  static final orderDetails = 'api/v1/order/orderDetails';
  static final orderDetailsBuyLoadResult = {
    'code': 200,
    'data': {
      'orderId': 'MPBL21041900001',
      'userPhone': '9389685566',
      'loadCate': 'Regular',
      'loadType': '710_LD',
      'orderAmount': 10.0,
      'createTime': null,
      'serviceAmount': 0.0,
      'orderClassify': 2,
      'realAmount': 10.0,
      'orderStatus': 4,
      'store': '0001',
      'serialNo': 'MP00001',
      'staff': 'Maria Lourdes',
      'orderSource': 'MPOS',
      'telco': 3
    },
    'message': 'success'
  };
  static final orderDetailsCashInResult = {
    'code': 200,
    'data': {
      'orderId': 'MPCI21033000001',
      'userPhone': '9158069218',
      'orderAmount': 100.0,
      'createTime': null,
      'receiverChannel': 'GCASH',
      'serviceAmount': 5.0,
      'senderName': null,
      'receiverName': null,
      'orderClassify': 1,
      'realAmount': 105.0,
      'orderStatus': 8,
      'store': '0001',
      'serialNo': 'MP00001',
      'staff': 'Maria Lourdes',
      'orderSource': 'MPOS'
    },
    'message': 'success'
  };
  static final orderDetailsSendResult = {
    'code': 200,
    'data': {
      'orderId': 'MPSE21032400005',
      'userPhone': '0212345675',
      'orderAmount': 100.0,
      'createTime': null,
      'receiverChannel': 'Gcash',
      'serviceAmount': 5.0,
      'senderName': 'SkypayKIOSK',
      'receiverName': 'ZHANG KAI ZHANG',
      'orderClassify': 3,
      'realAmount': 105.0,
      'orderStatus': 8,
      'store': '0001',
      'serialNo': 'MP00001',
      'staff': 'Maria Lourdes',
      'orderSource': 'SkyPayKiosk'
    },
    'message': 'success'
  };

  /// parameter cotains [token]
  /// parameter cotains [userPhone] [operatorId]
  static final packageList = 'api/v1/buyLoad/packageList';
  static final packageListResult = PackageList.result;

  /// parameter cotains [token]
  static final initConfig = 'api/v1/init/initConfig';
  static final initConfigResult = {
    'code': 200,
    'data': {
      'initConfigList': [
        {
          'operatorId': 3,
          'operatorName': 'SMART',
          'operatorLogo': '/buyload/smart.png',
          'operatorSegment':
              '0922,0923,0925,0932,0933,0934,0942,0943,0903,0907,0908,0909,0910,0912,0918,0919,0920,0921,0928,0929,0930,0938,0939,0946,0947,0948,0949,0950,0958,0982,0989,0998,0999,0961'
        },
        {
          'operatorId': 2,
          'operatorName': 'GLOBE',
          'operatorLogo': '/buyload/globe.png',
          'operatorSegment':
              '0905,0906,0915,0916,0917,0926,0927,0935,0936,0937,0945,0955,0956,0965,0966,0967,0975,0976,0977,0991,0994,0995,0996,0997'
        }
      ]
    },
    'message': 'success'
  };

  /// parameter cotains [token]
  /// parameter cotains [orderId]
  static final orderInfo = 'api/v1/kyc/orderInfo';
  static final orderInfoResult = {
    'code': 200,
    'data': {'orderType': 1},
    'message': 'success'
  };

  /// parameter cotains [token]
  /// parameter cotains [orderId]
  static final kycInfo = 'api/v1/kyc/info';
  static final kycInfoResult = {
    'code': 200,
    'data': {
      'orderId': '123456',
      'userName': 'Maria Lourdes\r\n\r\n',
      'userAddr':
          '12 ADB Avenue, Ortigas Center, Brgy.\r\n\r\nWack-Wack Mandaluyong City 1550 Philippines',
      'gender': '2',
      'msisdn': '9399027848',
      'userBirthday': '2010-11-11',
      'placeOfBirth': '2010-11-11',
      'nationality': 'Philippines',
      'email': '22@qq.com\r\n\r\n',
      'companyName': 'Sino Tech Ltd.\r\n\r\n',
      'matureOfWork': 'Employed\r\n\r\n',
      'sourceOfFunds': 'Self-Employed\r\n\r\n',
      'idFrontside': '/kyc/160801010560749652.jpg',
      'idBackside': '/kyc/160801010560451672.jpg',
      'idHandle': '/kyc/160801010560265932.jpg',
      'signature': '/kyc/160801010560035608.jpg',
      'createTime': {
        'year': 2021,
        'monthValue': 3,
        'month': 'MARCH',
        'dayOfMonth': 9,
        'dayOfYear': 68,
        'dayOfWeek': 'TUESDAY',
        'hour': 18,
        'minute': 32,
        'second': 26,
        'nano': 0,
        'chronology': {'calendarType': 'iso8601', 'id': 'ISO'}
      }
    },
    'message': 'success'
  };
}
