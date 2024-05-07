import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env{
  @EnviedField(varName: 'OpenAI_Key',obfuscate: true)
  static final String OpenAI_Key = _Env.OpenAI_Key;
}