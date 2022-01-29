import 'package:dart_grpc_api/grpc_demo.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:grpc/grpc.dart';

var response;

void fetchingData() async {
  final channel = ClientChannel('localhost',
      port: 5000,
      options:
          const ChannelOptions(credentials: ChannelCredentials.insecure()));

  final stub = OwnerServiceClient(channel);

  response = await stub.getOwners(OwnerReq());
}

bool findOwnerByQrHAsh(String qr, String cin, String fullname) {
  var owner = Owner();
  var result = owners
      .where((element) =>
          element['qrhash'] == qr &&
          element['cin'] == cin &&
          element['fullname'] == fullname)
      .toList();

  if (result.isNotEmpty) {
    return true;
  }
  return false;
}
