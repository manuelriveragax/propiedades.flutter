// To parse this JSON data, do
//
//     final getDespachoModel = getDespachoModelFromJson(jsonString);

import 'dart:convert';

DespachoModel getDespachoModelFromJson(String str) => DespachoModel.fromJson(json.decode(str));

String getDespachoModelToJson(DespachoModel data) => json.encode(data.toJson());

class DespachoModel {
  DespachoModel({
    this.propiedades,
    this.tareas,
    this.catalogos,
  });

  List<Propiedade> propiedades;
  List<Tarea> tareas;
  List<Catalogo> catalogos;

  factory DespachoModel.fromJson(Map<String, dynamic> json) => DespachoModel(
        propiedades: List<Propiedade>.from(json["propiedades"].map((x) => Propiedade.fromJson(x))),
        tareas: List<Tarea>.from(json["tareas"].map((x) => Tarea.fromJson(x))),
        catalogos: List<Catalogo>.from(json["catalogos"].map((x) => Catalogo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "propiedades": List<dynamic>.from(propiedades.map((x) => x.toJson())),
        "tareas": List<dynamic>.from(tareas.map((x) => x.toJson())),
        "catalogos": List<dynamic>.from(catalogos.map((x) => x.toJson())),
      };
}

class Catalogo {
  Catalogo({
    this.idCatalogo,
    this.descripcion,
    this.accionesCatalogosDetalle,
  });

  int idCatalogo;
  String descripcion;
  List<AccionesCatalogosDetalle> accionesCatalogosDetalle;

  factory Catalogo.fromJson(Map<String, dynamic> json) => Catalogo(
        idCatalogo: json["Id_Catalogo"],
        descripcion: json["Descripcion"],
        accionesCatalogosDetalle: List<AccionesCatalogosDetalle>.from(
            json["AccionesCatalogosDetalle"].map((x) => AccionesCatalogosDetalle.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Id_Catalogo": idCatalogo,
        "Descripcion": descripcion,
        "AccionesCatalogosDetalle": List<dynamic>.from(accionesCatalogosDetalle.map((x) => x.toJson())),
      };
}

class AccionesCatalogosDetalle {
  AccionesCatalogosDetalle({
    this.idDetalle,
    this.catalogoId,
    this.descripcion,
  });

  int idDetalle;
  int catalogoId;
  String descripcion;

  factory AccionesCatalogosDetalle.fromJson(Map<String, dynamic> json) => AccionesCatalogosDetalle(
        idDetalle: json["IdDetalle"],
        catalogoId: json["Catalogo_Id"],
        descripcion: json["Descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "IdDetalle": idDetalle,
        "Catalogo_Id": catalogoId,
        "Descripcion": descripcion,
      };
}

class Propiedade {
  Propiedade({
    this.ordenId,
    this.propiedadId,
    this.alias,
    this.clienteId,
    this.calle,
    this.numero,
    this.colonia,
    this.ciudad,
    this.estado,
    this.pais,
    this.codPostal,
    this.latitud,
    this.longitud,
    this.observaciones,
    this.fechaHoraVisita,
    this.sucursalId,
    this.eMail,
    this.telFijo,
    this.telCel,
    this.validado,
    this.firmado,
    this.nombre,
    this.actividades,
  });

  int ordenId;
  int propiedadId;
  String alias;
  int clienteId;
  String calle;
  String numero;
  String colonia;
  String ciudad;
  String estado;
  String pais;
  String codPostal;
  double latitud;
  double longitud;
  String observaciones;
  DateTime fechaHoraVisita;
  int sucursalId;
  String eMail;
  String telFijo;
  String telCel;
  bool validado;
  bool firmado;
  String nombre;
  List<Actividade> actividades;

  factory Propiedade.fromJson(Map<String, dynamic> json) => Propiedade(
        ordenId: json["OrdenId"],
        propiedadId: json["PropiedadId"],
        alias: json["Alias"],
        clienteId: json["ClienteId"],
        calle: json["Calle"],
        numero: json["Numero"],
        colonia: json["Colonia"],
        ciudad: json["Ciudad"],
        estado: json["Estado"],
        pais: json["Pais"],
        codPostal: json["CodPostal"],
        latitud: json["Latitud"].toDouble(),
        longitud: json["Longitud"].toDouble(),
        observaciones: json["Observaciones"],
        fechaHoraVisita: DateTime.parse(json["FechaHoraVisita"]),
        sucursalId: json["SucursalId"],
        eMail: json["EMail"],
        telFijo: json["TelFijo"],
        telCel: json["TelCel"],
        validado: json["Validado"],
        firmado: json["Firmado"],
        nombre: json["Nombre"],
        actividades: List<Actividade>.from(json["actividades"].map((x) => Actividade.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "OrdenId": ordenId,
        "PropiedadId": propiedadId,
        "Alias": alias,
        "ClienteId": clienteId,
        "Calle": calle,
        "Numero": numero,
        "Colonia": colonia,
        "Ciudad": ciudad,
        "Estado": estado,
        "Pais": pais,
        "CodPostal": codPostal,
        "Latitud": latitud,
        "Longitud": longitud,
        "Observaciones": observaciones,
        "FechaHoraVisita": fechaHoraVisita.toIso8601String(),
        "SucursalId": sucursalId,
        "EMail": eMail,
        "TelFijo": telFijo,
        "TelCel": telCel,
        "Validado": validado,
        "Firmado": firmado,
        "Nombre": nombre,
        "actividades": List<dynamic>.from(actividades.map((x) => x.toJson())),
      };
}

class Actividade {
  Actividade({
    this.ordenId,
    this.oaId,
    this.actividadDesc,
    this.tareaId,
    this.tareaDesc,
  });

  int ordenId;
  int oaId;
  ActividadDesc actividadDesc;
  int tareaId;
  String tareaDesc;

  factory Actividade.fromJson(Map<String, dynamic> json) => Actividade(
        ordenId: json["OrdenId"],
        oaId: json["OAId"],
        actividadDesc: actividadDescValues.map[json["ActividadDesc"]],
        tareaId: json["TareaId"],
        tareaDesc: json["TareaDesc"],
      );

  Map<String, dynamic> toJson() => {
        "OrdenId": ordenId,
        "OAId": oaId,
        "ActividadDesc": actividadDescValues.reverse[actividadDesc],
        "TareaId": tareaId,
        "TareaDesc": tareaDesc,
      };
}

enum ActividadDesc {
  INICIO_DE_VISITA,
  REVISAR_INSTALACION_ELECTRICA,
  LIMPIEZA_DEL_AREA,
  MANTENIMIENTO_A_ALBERCA,
  FIN_DE_VISITA
}

final actividadDescValues = EnumValues({
  "FIN DE VISITA": ActividadDesc.FIN_DE_VISITA,
  "INICIO DE VISITA": ActividadDesc.INICIO_DE_VISITA,
  "LIMPIEZA DEL AREA": ActividadDesc.LIMPIEZA_DEL_AREA,
  "MANTENIMIENTO A ALBERCA": ActividadDesc.MANTENIMIENTO_A_ALBERCA,
  "REVISAR INSTALACION ELECTRICA": ActividadDesc.REVISAR_INSTALACION_ELECTRICA
});

class Tarea {
  Tarea({
    this.tareaId,
    this.tareaDesc,
    this.acciones,
    this.actarea,
    this.oActareas,
  });

  int tareaId;
  String tareaDesc;
  List<Accione> acciones;
  List<dynamic> actarea;
  List<dynamic> oActareas;

  factory Tarea.fromJson(Map<String, dynamic> json) => Tarea(
        tareaId: json["TareaId"],
        tareaDesc: json["TareaDesc"],
        acciones: List<Accione>.from(json["Acciones"].map((x) => Accione.fromJson(x))),
        actarea: List<dynamic>.from(json["Actarea"].map((x) => x)),
        oActareas: List<dynamic>.from(json["OActareas"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "TareaId": tareaId,
        "TareaDesc": tareaDesc,
        "Acciones": List<dynamic>.from(acciones.map((x) => x.toJson())),
        "Actarea": List<dynamic>.from(actarea.map((x) => x)),
        "OActareas": List<dynamic>.from(oActareas.map((x) => x)),
      };
}

class Accione {
  Accione({
    this.accionId,
    this.accionDesc,
    this.tipoId,
    this.valor,
    this.tareaId,
    this.posicion,
    this.catalogo,
    this.depende,
    this.predeterminado,
    this.opcional,
    this.regla,
    this.valorRegla,
    this.tipoDeDatos,
  });

  int accionId;
  String accionDesc;
  int tipoId;
  dynamic valor;
  int tareaId;
  int posicion;
  int catalogo;
  dynamic depende;
  dynamic predeterminado;
  bool opcional;
  dynamic regla;
  dynamic valorRegla;
  dynamic tipoDeDatos;

  factory Accione.fromJson(Map<String, dynamic> json) => Accione(
        accionId: json["AccionId"],
        accionDesc: json["AccionDesc"],
        tipoId: json["TipoId"],
        valor: json["Valor"],
        tareaId: json["TareaId"],
        posicion: json["posicion"],
        catalogo: json["catalogo"],
        depende: json["depende"],
        predeterminado: json["predeterminado"],
        opcional: json["opcional"] == null ? null : json["opcional"],
        regla: json["regla"],
        valorRegla: json["valor_regla"],
        tipoDeDatos: json["TipoDeDatos"],
      );

  Map<String, dynamic> toJson() => {
        "AccionId": accionId,
        "AccionDesc": accionDesc,
        "TipoId": tipoId,
        "Valor": valor,
        "TareaId": tareaId,
        "posicion": posicion,
        "catalogo": catalogo,
        "depende": depende,
        "predeterminado": predeterminado,
        "opcional": opcional == null ? null : opcional,
        "regla": regla,
        "valor_regla": valorRegla,
        "TipoDeDatos": tipoDeDatos,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
