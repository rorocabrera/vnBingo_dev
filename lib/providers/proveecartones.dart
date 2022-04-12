import 'dart:convert';

Carton cartonFromJson(String str) => Carton.fromJson(json.decode(str));

String cartonToJson(Carton data) => json.encode(data.toJson());

class Carton {
  Carton({
    required this.b,
    required this.i,
    required this.n,
    required this.g,
    required this.o,
    required this.pressed,
  });

  List<int> b;
  List<int> i;
  List<int> n;
  List<int> g;
  List<int> o;
  List<bool> pressed;

  factory Carton.fromJson(Map<String, dynamic> json) => Carton(
        b: List<int>.from(json["B"].map((x) => x)),
        i: List<int>.from(json["I"].map((x) => x)),
        n: List<int>.from(json["N"].map((x) => x)),
        g: List<int>.from(json["G"].map((x) => x)),
        o: List<int>.from(json["O"].map((x) => x)),
        pressed: List<bool>.from(json["Pressed"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "B": List<dynamic>.from(b.map((x) => x)),
        "I": List<dynamic>.from(i.map((x) => x)),
        "N": List<dynamic>.from(n.map((x) => x)),
        "G": List<dynamic>.from(g.map((x) => x)),
        "O": List<dynamic>.from(o.map((x) => x)),
      };

  Map<String, dynamic> tofullJson() => {
        "B": List<dynamic>.from(b.map((x) => x)),
        "I": List<dynamic>.from(i.map((x) => x)),
        "N": List<dynamic>.from(n.map((x) => x)),
        "G": List<dynamic>.from(g.map((x) => x)),
        "O": List<dynamic>.from(o.map((x) => x)),
        "Pressed": List<dynamic>.from(pressed.map((x) => x)),
      };
}
