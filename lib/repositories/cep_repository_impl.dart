
import 'package:cep_app/models/endereco_model.dart';
import 'package:dio/dio.dart';
import './cep_repository.dart';
import 'dart:developer';


class CepRepositoryImpl implements CepRepository{
  @override
  Future<EnderecoModel> getCep(String cep) async{
    try {
    final result = await Dio().get('https://viacep.com.br/ws/$cep/json/');
    return EnderecoModel.fromMap(result.data);
    } on DioException catch (e) {
      log('Erro ao buscar CEP', error: e);
      throw Exception('Erro ao buscar dados do CEP');

    }
  }
}