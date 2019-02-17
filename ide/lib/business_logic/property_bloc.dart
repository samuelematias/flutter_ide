import 'package:flutter/material.dart';
import 'package:flutter_visual_builder/business_logic/server/generated/server.pb.dart';
import 'package:flutter_visual_builder/widgets/properties/converter.dart';
import 'package:flutter_visual_builder/widgets/properties/property.dart';
import 'package:ide/business_logic/client/client.dart';
import 'package:ide/widgets/property_editor.dart';
import 'package:ide/widgets/value_changers/alignment_changer.dart';
import 'package:ide/widgets/value_changers/bool_changer.dart';
import 'package:ide/widgets/value_changers/color_changer.dart';
import 'package:ide/widgets/value_changers/constraints_changer.dart';
import 'package:ide/widgets/value_changers/double_changer.dart';
import 'package:ide/widgets/value_changers/edge_insets_changer.dart';
import 'package:ide/widgets/value_changers/enum_changer.dart';
import 'package:ide/widgets/value_changers/int_changer.dart';
import 'package:ide/widgets/value_changers/string_changer.dart';
import 'package:rxdart/rxdart.dart';

class PropertyBloc {

  // TODO implement receiving widget removed events
  PropertyBloc._({this.editor, this.removedIds});

  factory PropertyBloc(VisualClient visualClient) {

    PublishSubject<String> removedIds = PublishSubject();

    Observable<SelectedWidgetWithProperties> widgetStream = Observable(visualClient.serverClient.streamSelected(SelectStream())
        .asBroadcastStream());

    return PropertyBloc._(
      editor: widgetStream,
      removedIds: removedIds,
    );
  }

  final Observable<SelectedWidgetWithProperties> editor;

  final Sink<String> removedIds;


}