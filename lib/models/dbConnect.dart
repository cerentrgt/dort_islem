import 'dart:convert';

import 'package:dort_islem/models/blmeModel.dart';
import 'package:dort_islem/models/carpmaModel.dart';
import 'package:dort_islem/models/cikarmaModel.dart';
import 'package:dort_islem/models/questionModel.dart';
import 'package:dort_islem/models/toplamaModel.dart';
import 'package:dort_islem/models/truefalseModel.dart';
import 'package:http/http.dart' as http;

class DBConnect {
  final url = Uri.parse(
      'https://dortislem-f4cf2-default-rtdb.firebaseio.com/questions.json');

  Future<List<QuestionModel>> fetchQuestion() async {
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;

      List<QuestionModel> questions = [];

      data.forEach((key, value) {
        var newQuestion = QuestionModel(
          id: key,
          title: value['title'] as String,
          options: Map.castFrom(value['options']),
        );
        questions.add(newQuestion);
      });

      return questions;
    });
  }

  Future<void> addQuestion(QuestionModel questionModel) async {
    http.post(
      url,
      body: json.encode(
        {'title': questionModel.title, 'options': questionModel.options},
      ),
    );
  }

  //toplama kodları

  final urlTop = Uri.parse(
      'https://dortislem-f4cf2-default-rtdb.firebaseio.com/toplamaQuestions.json');

  Future<List<ToplamaModel>> fetchTopQuestion() async {
    return http.get(urlTop).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;

      List<ToplamaModel> questions = [];

      data.forEach((key, value) {
        var newQuestion = ToplamaModel(
          id: key,
          title: value['title'] as String,
          options: Map.castFrom(value['options']),
        );
        questions.add(newQuestion);
      });

      return questions;
    });
  }

  Future<void> addTopQuestion(ToplamaModel topModel) async {
    http.post(
      urlTop,
      body: json.encode(
        {'title': topModel.title, 'options': topModel.options},
      ),
    );
  }

  //çıkarma kodları

  final urlSub = Uri.parse(
      'https://dortislem-f4cf2-default-rtdb.firebaseio.com/cikarmaQuestions.json');

  Future<List<CikarmaModel>> fetchSubQuestion() async {
    return http.get(urlSub).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;

      List<CikarmaModel> questions = [];

      data.forEach((key, value) {
        var newQuestion = CikarmaModel(
          id: key,
          title: value['title'] as String,
          options: Map.castFrom(value['options']),
        );
        questions.add(newQuestion);
      });

      return questions;
    });
  }

  Future<void> addSubQuestion(CikarmaModel subModel) async {
    http.post(
      urlSub,
      body: json.encode(
        {'title': subModel.title, 'options': subModel.options},
      ),
    );
  }

  //carpma kod
  final urlCarp = Uri.parse(
      'https://dortislem-f4cf2-default-rtdb.firebaseio.com/carpmaQuestions.json');

  Future<List<CarpmaModel>> fetchCarpQuestion() async {
    return http.get(urlCarp).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;

      List<CarpmaModel> questions = [];

      data.forEach((key, value) {
        var newQuestion = CarpmaModel(
          id: key,
          title: value['title'] as String,
          options: Map.castFrom(value['options']),
        );
        questions.add(newQuestion);
      });

      return questions;
    });
  }

  Future<void> addCarpQuestion(CarpmaModel carpModel) async {
    http.post(
      urlCarp,
      body: json.encode(
        {'title': carpModel.title, 'options': carpModel.options},
      ),
    );
  }

  //blme

  final urlBol = Uri.parse(
      'https://dortislem-f4cf2-default-rtdb.firebaseio.com/bolmeQuestions.json');

  Future<List<BlmeModel>> fetchBolQuestion() async {
    return http.get(urlBol).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;

      List<BlmeModel> questions = [];

      data.forEach((key, value) {
        var newQuestion = BlmeModel(
          id: key,
          title: value['title'] as String,
          options: Map.castFrom(value['options']),
        );
        questions.add(newQuestion);
      });

      return questions;
    });
  }

  Future<void> addBolQuestion(BlmeModel bolModel) async {
    http.post(
      urlBol,
      body: json.encode(
        {'title': bolModel.title, 'options': bolModel.options},
      ),
    );
  }

  //true false sorular
  final urlTrueFalse = Uri.parse(
      'https://dortislem-f4cf2-default-rtdb.firebaseio.com/trueFalseQuestions.json');

  Future<List<TrueFalseModel>> fetchTrueFalseQuestion() async {
    return http.get(urlTrueFalse).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;

      List<TrueFalseModel> questions = [];

      data.forEach((key, value) {
        var newQuestion = TrueFalseModel(
          id: key,
          title: value['title'] as String,
          options: Map.castFrom(value['options']),
        );
        questions.add(newQuestion);
      });

      return questions;
    });
  }

  Future<void> addTrueFalseQuestion(TrueFalseModel tfModel) async {
    http.post(
      urlTrueFalse,
      body: json.encode(
        {'title': tfModel.title, 'options': tfModel.options},
      ),
    );
  }
}
