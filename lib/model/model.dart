class Model {
  String? name;
  Model({required this.name});

  Map<String, dynamic> toJson(docId) => {
        //agent

        "name": name,
      };
}
