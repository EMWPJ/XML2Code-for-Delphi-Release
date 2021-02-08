unit KMLTree;

interface

uses
  Windows, SysUtils, Types, Classes, Variants, Generics.Collections, Dialogs, Controls, ExtCtrls,
  XMLCore, XMLDoc, XMLIntf, XMLLeafTypes, TeeTree, Menus, XMLInspector,KMLFile;


type

  TKMLTree = class;

  TKMLTree = class(TXMLTree)
  private
    FTKMLFileObj: TKMLFile;
    procedure SetObj(const Value: TKMLFile);
  protected
    { Inherited from TXML }
    procedure FromXML(node: IXMLNode); override;
    function ToXML(par: IXMLNode; pt: string = ''): IXMLNode; override;
    function ToGeoObj: TObject; override;
    procedure FromGeoObj(const Obj: TObject); override;
    { TKMLFile }
    procedure TKMLFile_FromXML(Obj: TKMLFile; node: IXMLNode);
    procedure TKMLFile_ToXML(Obj: TKMLFile; par: IXMLNode; pt: string = 'kml');
    { TKMLDocument }
    procedure TKMLDocument_FromXML(Obj: TKMLDocument; node: IXMLNode);
    procedure TKMLDocument_ToXML(Obj: TKMLDocument; par: IXMLNode; pt: string = 'Document');
    { TKMLFolder }
    procedure TKMLFolder_FromXML(Obj: TKMLFolder; node: IXMLNode);
    procedure TKMLFolder_ToXML(Obj: TKMLFolder; par: IXMLNode; pt: string = 'Folder');
    { TKMLPlacemark }
    procedure TKMLPlacemark_FromXML(Obj: TKMLPlacemark; node: IXMLNode);
    procedure TKMLPlacemark_ToXML(Obj: TKMLPlacemark; par: IXMLNode; pt: string = 'Placemark');
    { TKMLGeometry }
    procedure TKMLGeometry_FromXML(Obj: TKMLGeometry; node: IXMLNode); virtual;
    procedure TKMLGeometry_ToXML(Obj: TKMLGeometry; par: IXMLNode; pt: string = '#Optional'); virtual;
    { TKMLMultiGeometry }
    procedure TKMLMultiGeometry_FromXML(Obj: TKMLMultiGeometry; node: IXMLNode);
    procedure TKMLMultiGeometry_ToXML(Obj: TKMLMultiGeometry; par: IXMLNode; pt: string = 'MultiGeometry');
    { TKMLPoint }
    procedure TKMLPoint_FromXML(Obj: TKMLPoint; node: IXMLNode);
    procedure TKMLPoint_ToXML(Obj: TKMLPoint; par: IXMLNode; pt: string = 'Point');
    { TKMLPolygon }
    procedure TKMLPolygon_FromXML(Obj: TKMLPolygon; node: IXMLNode);
    procedure TKMLPolygon_ToXML(Obj: TKMLPolygon; par: IXMLNode; pt: string = 'Polygon');
    { TKMLBoundary }
    procedure TKMLBoundary_FromXML(Obj: TKMLBoundary; node: IXMLNode);
    procedure TKMLBoundary_ToXML(Obj: TKMLBoundary; par: IXMLNode; pt: string = 'Boundary');
    { TKMLLinearRing }
    procedure TKMLLinearRing_FromXML(Obj: TKMLLinearRing; node: IXMLNode);
    procedure TKMLLinearRing_ToXML(Obj: TKMLLinearRing; par: IXMLNode; pt: string = 'LinearRing');
    { TKMLLineString }
    procedure TKMLLineString_FromXML(Obj: TKMLLineString; node: IXMLNode);
    procedure TKMLLineString_ToXML(Obj: TKMLLineString; par: IXMLNode; pt: string = 'LineString');
    { TKMLLookAt }
    procedure TKMLLookAt_FromXML(Obj: TKMLLookAt; node: IXMLNode);
    procedure TKMLLookAt_ToXML(Obj: TKMLLookAt; par: IXMLNode; pt: string = 'LookAt');
    { TKMLLatLonBox }
    procedure TKMLLatLonBox_FromXML(Obj: TKMLLatLonBox; node: IXMLNode);
    procedure TKMLLatLonBox_ToXML(Obj: TKMLLatLonBox; par: IXMLNode; pt: string = 'LatLonBox');
    { TKMLGroundOverlay }
    procedure TKMLGroundOverlay_FromXML(Obj: TKMLGroundOverlay; node: IXMLNode);
    procedure TKMLGroundOverlay_ToXML(Obj: TKMLGroundOverlay; par: IXMLNode; pt: string = 'GroundOverlay');
    { TKMLExtendedData }
    procedure TKMLExtendedData_FromXML(Obj: TKMLExtendedData; node: IXMLNode);
    procedure TKMLExtendedData_ToXML(Obj: TKMLExtendedData; par: IXMLNode; pt: string = 'ExtendedData');
    { TKMLData }
    procedure TKMLData_FromXML(Obj: TKMLData; node: IXMLNode);
    procedure TKMLData_ToXML(Obj: TKMLData; par: IXMLNode; pt: string = 'Data');
    { TKMLSize }
    procedure TKMLSize_FromXML(Obj: TKMLSize; node: IXMLNode);
    procedure TKMLSize_ToXML(Obj: TKMLSize; par: IXMLNode; pt: string = 'Size');
    { TKMLStyle }
    procedure TKMLStyle_FromXML(Obj: TKMLStyle; node: IXMLNode);
    procedure TKMLStyle_ToXML(Obj: TKMLStyle; par: IXMLNode; pt: string = 'Style');
    { TKMLIconStyle }
    procedure TKMLIconStyle_FromXML(Obj: TKMLIconStyle; node: IXMLNode);
    procedure TKMLIconStyle_ToXML(Obj: TKMLIconStyle; par: IXMLNode; pt: string = 'IconStyle');
    { TKMLIcon }
    procedure TKMLIcon_FromXML(Obj: TKMLIcon; node: IXMLNode);
    procedure TKMLIcon_ToXML(Obj: TKMLIcon; par: IXMLNode; pt: string = 'Icon');
    { TKMLLineStyle }
    procedure TKMLLineStyle_FromXML(Obj: TKMLLineStyle; node: IXMLNode);
    procedure TKMLLineStyle_ToXML(Obj: TKMLLineStyle; par: IXMLNode; pt: string = 'LineStyle');
    { TKMLBalloonStyle }
    procedure TKMLBalloonStyle_FromXML(Obj: TKMLBalloonStyle; node: IXMLNode);
    procedure TKMLBalloonStyle_ToXML(Obj: TKMLBalloonStyle; par: IXMLNode; pt: string = 'BalloonStyle');
    { TKMLStyleMap }
    procedure TKMLStyleMap_FromXML(Obj: TKMLStyleMap; node: IXMLNode);
    procedure TKMLStyleMap_ToXML(Obj: TKMLStyleMap; par: IXMLNode; pt: string = 'StyleMap');
    { TKMLScreenOverlay }
    procedure TKMLScreenOverlay_FromXML(Obj: TKMLScreenOverlay; node: IXMLNode);
    procedure TKMLScreenOverlay_ToXML(Obj: TKMLScreenOverlay; par: IXMLNode; pt: string = 'ScreenOverlay');
    { TKMLPair }
    procedure TKMLPair_FromXML(Obj: TKMLPair; node: IXMLNode);
    procedure TKMLPair_ToXML(Obj: TKMLPair; par: IXMLNode; pt: string = 'Pair');
  public
    { Inherited from TXMLTree }
    procedure ToTree(TreeNodeShape: TTreeNodeShape; obj: TObject = nil); override;
    procedure SetXMLProperty(obj: TObject; Index: Integer; _Value: String); override;
    procedure ToPopupMenu(Sender: TObject; obj: TObject = nil); override;
    procedure ToInspector(Sender: TObject; obj: TObject = nil); override;
    procedure ChildDeleteEvent(par, del: TObject); override;
    procedure PasteToEvent(items: TList<TObject>; const isCut: Boolean = False); override;
    { TKMLFile }
    procedure TKMLFile_ToTree(Obj: TKMLFile; TreeNodeShape: TTreeNodeShape);
    procedure TKMLFile_ToPopupMenu(obj: TKMLFile; Sender: TObject);
    procedure TKMLFile_ToInspector(obj: TKMLFile; ins: TObject);
    procedure TKMLFile_SetXMLProperty(obj: TKMLFile; Index: Integer; _Value: String);
    procedure TKMLFile_Copy(source, target: TKMLFile);
    procedure TKMLFile_PasteToEvent(obj: TKMLFile;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLFile_ChildDeleteEvent(obj: TKMLFile; del: TObject);
    procedure TKMLFile_AddXmlnsEvent(Sender: TObject);
    procedure TKMLFile_AddFolderEvent(Sender: TObject);
    procedure TKMLFile_FolderDeleteEvent(obj: TKMLFile; del: TObject);
    { TKMLDocument }
    procedure TKMLDocument_ToTree(Obj: TKMLDocument; TreeNodeShape: TTreeNodeShape);
    procedure TKMLDocument_ToPopupMenu(obj: TKMLDocument; Sender: TObject);
    procedure TKMLDocument_ToInspector(obj: TKMLDocument; ins: TObject);
    procedure TKMLDocument_SetXMLProperty(obj: TKMLDocument; Index: Integer; _Value: String);
    procedure TKMLDocument_Copy(source, target: TKMLDocument);
    procedure TKMLDocument_PasteToEvent(obj: TKMLDocument;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLDocument_ChildDeleteEvent(obj: TKMLDocument; del: TObject);
    procedure TKMLDocument_AddNameEvent(Sender: TObject);
    procedure TKMLDocument_AddOpenEvent(Sender: TObject);
    procedure TKMLDocument_AddVisibilityEvent(Sender: TObject);
    procedure TKMLDocument_AddDescriptionEvent(Sender: TObject);
    procedure TKMLDocument_AddLookAtEvent(Sender: TObject);
    procedure TKMLDocument_LookAtDeleteEvent(obj: TKMLDocument; del: TObject);
    procedure TKMLDocument_AddStyleMapEvent(Sender: TObject);
    procedure TKMLDocument_StyleMapDeleteEvent(obj: TKMLDocument; del: TObject);
    procedure TKMLDocument_AddStyleEvent(Sender: TObject);
    procedure TKMLDocument_StyleDeleteEvent(obj: TKMLDocument; del: TObject);
    procedure TKMLDocument_AddPlacemarkEvent(Sender: TObject);
    procedure TKMLDocument_PlacemarkDeleteEvent(obj: TKMLDocument; del: TObject);
    procedure TKMLDocument_AddFolderEvent(Sender: TObject);
    procedure TKMLDocument_FolderDeleteEvent(obj: TKMLDocument; del: TObject);
    { TKMLFolder }
    procedure TKMLFolder_ToTree(Obj: TKMLFolder; TreeNodeShape: TTreeNodeShape);
    procedure TKMLFolder_ToPopupMenu(obj: TKMLFolder; Sender: TObject);
    procedure TKMLFolder_ToInspector(obj: TKMLFolder; ins: TObject);
    procedure TKMLFolder_SetXMLProperty(obj: TKMLFolder; Index: Integer; _Value: String);
    procedure TKMLFolder_Copy(source, target: TKMLFolder);
    procedure TKMLFolder_PasteToEvent(obj: TKMLFolder;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLFolder_ChildDeleteEvent(obj: TKMLFolder; del: TObject);
    procedure TKMLFolder_AddNameEvent(Sender: TObject);
    procedure TKMLFolder_AddOpenEvent(Sender: TObject);
    procedure TKMLFolder_AddVisibilityEvent(Sender: TObject);
    procedure TKMLFolder_AddDescriptionEvent(Sender: TObject);
    procedure TKMLFolder_AddLookAtEvent(Sender: TObject);
    procedure TKMLFolder_LookAtDeleteEvent(obj: TKMLFolder; del: TObject);
    procedure TKMLFolder_AddDocumentEvent(Sender: TObject);
    procedure TKMLFolder_DocumentDeleteEvent(obj: TKMLFolder; del: TObject);
    procedure TKMLFolder_AddGroundOverlayEvent(Sender: TObject);
    procedure TKMLFolder_GroundOverlayDeleteEvent(obj: TKMLFolder; del: TObject);
    procedure TKMLFolder_AddPlacemarkEvent(Sender: TObject);
    procedure TKMLFolder_PlacemarkDeleteEvent(obj: TKMLFolder; del: TObject);
    procedure TKMLFolder_AddScreenOverlayEvent(Sender: TObject);
    procedure TKMLFolder_ScreenOverlayDeleteEvent(obj: TKMLFolder; del: TObject);
    procedure TKMLFolder_AddFolderEvent(Sender: TObject);
    procedure TKMLFolder_FolderDeleteEvent(obj: TKMLFolder; del: TObject);
    { TKMLPlacemark }
    procedure TKMLPlacemark_ToTree(Obj: TKMLPlacemark; TreeNodeShape: TTreeNodeShape);
    procedure TKMLPlacemark_ToPopupMenu(obj: TKMLPlacemark; Sender: TObject);
    procedure TKMLPlacemark_ToInspector(obj: TKMLPlacemark; ins: TObject);
    procedure TKMLPlacemark_SetXMLProperty(obj: TKMLPlacemark; Index: Integer; _Value: String);
    procedure TKMLPlacemark_Copy(source, target: TKMLPlacemark);
    procedure TKMLPlacemark_PasteToEvent(obj: TKMLPlacemark;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLPlacemark_ChildDeleteEvent(obj: TKMLPlacemark; del: TObject);
    procedure TKMLPlacemark_AddNameEvent(Sender: TObject);
    procedure TKMLPlacemark_AddVisibilityEvent(Sender: TObject);
    procedure TKMLPlacemark_AddDescriptionEvent(Sender: TObject);
    procedure TKMLPlacemark_AddLookAtEvent(Sender: TObject);
    procedure TKMLPlacemark_LookAtDeleteEvent(obj: TKMLPlacemark; del: TObject);
    procedure TKMLPlacemark_AddStyleUrlEvent(Sender: TObject);
    procedure TKMLPlacemark_AddPointEvent(Sender: TObject);
    procedure TKMLPlacemark_AddPolygonEvent(Sender: TObject);
    procedure TKMLPlacemark_AddLinearRingEvent(Sender: TObject);
    procedure TKMLPlacemark_AddLineStringEvent(Sender: TObject);
    procedure TKMLPlacemark_AddMultiGeometryEvent(Sender: TObject);
    procedure TKMLPlacemark_GeometryDeleteEvent(obj: TKMLPlacemark; del: TObject);
    procedure TKMLPlacemark_AddExtendedDataEvent(Sender: TObject);
    procedure TKMLPlacemark_ExtendedDataDeleteEvent(obj: TKMLPlacemark; del: TObject);
    { TKMLGeometry }
    procedure TKMLGeometry_ToTree(Obj: TKMLGeometry; TreeNodeShape: TTreeNodeShape);
    procedure TKMLGeometry_ToPopupMenu(obj: TKMLGeometry; Sender: TObject);
    procedure TKMLGeometry_ToInspector(obj: TKMLGeometry; ins: TObject);
    procedure TKMLGeometry_SetXMLProperty(obj: TKMLGeometry; Index: Integer; _Value: String);
    procedure TKMLGeometry_Copy(source, target: TKMLGeometry);
    procedure TKMLGeometry_PasteToEvent(obj: TKMLGeometry;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLGeometry_ChildDeleteEvent(obj: TKMLGeometry; del: TObject);
    { TKMLMultiGeometry }
    procedure TKMLMultiGeometry_ToTree(Obj: TKMLMultiGeometry; TreeNodeShape: TTreeNodeShape);
    procedure TKMLMultiGeometry_ToPopupMenu(obj: TKMLMultiGeometry; Sender: TObject);
    procedure TKMLMultiGeometry_ToInspector(obj: TKMLMultiGeometry; ins: TObject);
    procedure TKMLMultiGeometry_SetXMLProperty(obj: TKMLMultiGeometry; Index: Integer; _Value: String);
    procedure TKMLMultiGeometry_Copy(source, target: TKMLMultiGeometry);
    procedure TKMLMultiGeometry_PasteToEvent(obj: TKMLMultiGeometry;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLMultiGeometry_ChildDeleteEvent(obj: TKMLMultiGeometry; del: TObject);
    procedure TKMLMultiGeometry_AddPointEvent(Sender: TObject);
    procedure TKMLMultiGeometry_AddPolygonEvent(Sender: TObject);
    procedure TKMLMultiGeometry_AddLinearRingEvent(Sender: TObject);
    procedure TKMLMultiGeometry_AddLineStringEvent(Sender: TObject);
    procedure TKMLMultiGeometry_AddMultiGeometryEvent(Sender: TObject);
    procedure TKMLMultiGeometry_GeometryDeleteEvent(obj: TKMLMultiGeometry; del: TObject);
    { TKMLPoint }
    procedure TKMLPoint_ToTree(Obj: TKMLPoint; TreeNodeShape: TTreeNodeShape);
    procedure TKMLPoint_ToPopupMenu(obj: TKMLPoint; Sender: TObject);
    procedure TKMLPoint_ToInspector(obj: TKMLPoint; ins: TObject);
    procedure TKMLPoint_SetXMLProperty(obj: TKMLPoint; Index: Integer; _Value: String);
    procedure TKMLPoint_Copy(source, target: TKMLPoint);
    procedure TKMLPoint_PasteToEvent(obj: TKMLPoint;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLPoint_ChildDeleteEvent(obj: TKMLPoint; del: TObject);
    procedure TKMLPoint_AddExtrudeEvent(Sender: TObject);
    procedure TKMLPoint_AddAltitudeModeEvent(Sender: TObject);
    { TKMLPolygon }
    procedure TKMLPolygon_ToTree(Obj: TKMLPolygon; TreeNodeShape: TTreeNodeShape);
    procedure TKMLPolygon_ToPopupMenu(obj: TKMLPolygon; Sender: TObject);
    procedure TKMLPolygon_ToInspector(obj: TKMLPolygon; ins: TObject);
    procedure TKMLPolygon_SetXMLProperty(obj: TKMLPolygon; Index: Integer; _Value: String);
    procedure TKMLPolygon_Copy(source, target: TKMLPolygon);
    procedure TKMLPolygon_PasteToEvent(obj: TKMLPolygon;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLPolygon_ChildDeleteEvent(obj: TKMLPolygon; del: TObject);
    procedure TKMLPolygon_AddExtrudeEvent(Sender: TObject);
    procedure TKMLPolygon_AddAltitudeModeEvent(Sender: TObject);
    procedure TKMLPolygon_AddOuterBoundaryIsEvent(Sender: TObject);
    procedure TKMLPolygon_OuterBoundaryIsDeleteEvent(obj: TKMLPolygon; del: TObject);
    procedure TKMLPolygon_AddInnerBoundaryIsEvent(Sender: TObject);
    procedure TKMLPolygon_InnerBoundaryIsDeleteEvent(obj: TKMLPolygon; del: TObject);
    procedure TKMLPolygon_AddTessellateEvent(Sender: TObject);
    { TKMLBoundary }
    procedure TKMLBoundary_ToTree(Obj: TKMLBoundary; TreeNodeShape: TTreeNodeShape);
    procedure TKMLBoundary_ToPopupMenu(obj: TKMLBoundary; Sender: TObject);
    procedure TKMLBoundary_ToInspector(obj: TKMLBoundary; ins: TObject);
    procedure TKMLBoundary_SetXMLProperty(obj: TKMLBoundary; Index: Integer; _Value: String);
    procedure TKMLBoundary_Copy(source, target: TKMLBoundary);
    procedure TKMLBoundary_PasteToEvent(obj: TKMLBoundary;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLBoundary_ChildDeleteEvent(obj: TKMLBoundary; del: TObject);
    { TKMLLinearRing }
    procedure TKMLLinearRing_ToTree(Obj: TKMLLinearRing; TreeNodeShape: TTreeNodeShape);
    procedure TKMLLinearRing_ToPopupMenu(obj: TKMLLinearRing; Sender: TObject);
    procedure TKMLLinearRing_ToInspector(obj: TKMLLinearRing; ins: TObject);
    procedure TKMLLinearRing_SetXMLProperty(obj: TKMLLinearRing; Index: Integer; _Value: String);
    procedure TKMLLinearRing_Copy(source, target: TKMLLinearRing);
    procedure TKMLLinearRing_PasteToEvent(obj: TKMLLinearRing;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLLinearRing_ChildDeleteEvent(obj: TKMLLinearRing; del: TObject);
    { TKMLLineString }
    procedure TKMLLineString_ToTree(Obj: TKMLLineString; TreeNodeShape: TTreeNodeShape);
    procedure TKMLLineString_ToPopupMenu(obj: TKMLLineString; Sender: TObject);
    procedure TKMLLineString_ToInspector(obj: TKMLLineString; ins: TObject);
    procedure TKMLLineString_SetXMLProperty(obj: TKMLLineString; Index: Integer; _Value: String);
    procedure TKMLLineString_Copy(source, target: TKMLLineString);
    procedure TKMLLineString_PasteToEvent(obj: TKMLLineString;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLLineString_ChildDeleteEvent(obj: TKMLLineString; del: TObject);
    procedure TKMLLineString_AddTessellateEvent(Sender: TObject);
    procedure TKMLLineString_AddAltitudeModeEvent(Sender: TObject);
    procedure TKMLLineString_AddExtrudeEvent(Sender: TObject);
    { TKMLLookAt }
    procedure TKMLLookAt_ToTree(Obj: TKMLLookAt; TreeNodeShape: TTreeNodeShape);
    procedure TKMLLookAt_ToPopupMenu(obj: TKMLLookAt; Sender: TObject);
    procedure TKMLLookAt_ToInspector(obj: TKMLLookAt; ins: TObject);
    procedure TKMLLookAt_SetXMLProperty(obj: TKMLLookAt; Index: Integer; _Value: String);
    procedure TKMLLookAt_Copy(source, target: TKMLLookAt);
    procedure TKMLLookAt_PasteToEvent(obj: TKMLLookAt;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLLookAt_ChildDeleteEvent(obj: TKMLLookAt; del: TObject);
    procedure TKMLLookAt_AddLongitudeEvent(Sender: TObject);
    procedure TKMLLookAt_AddLatitudeEvent(Sender: TObject);
    procedure TKMLLookAt_AddAltitudeEvent(Sender: TObject);
    procedure TKMLLookAt_AddHeadingEvent(Sender: TObject);
    procedure TKMLLookAt_AddTiltEvent(Sender: TObject);
    procedure TKMLLookAt_AddRangeEvent(Sender: TObject);
    { TKMLLatLonBox }
    procedure TKMLLatLonBox_ToTree(Obj: TKMLLatLonBox; TreeNodeShape: TTreeNodeShape);
    procedure TKMLLatLonBox_ToPopupMenu(obj: TKMLLatLonBox; Sender: TObject);
    procedure TKMLLatLonBox_ToInspector(obj: TKMLLatLonBox; ins: TObject);
    procedure TKMLLatLonBox_SetXMLProperty(obj: TKMLLatLonBox; Index: Integer; _Value: String);
    procedure TKMLLatLonBox_Copy(source, target: TKMLLatLonBox);
    procedure TKMLLatLonBox_PasteToEvent(obj: TKMLLatLonBox;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLLatLonBox_ChildDeleteEvent(obj: TKMLLatLonBox; del: TObject);
    { TKMLGroundOverlay }
    procedure TKMLGroundOverlay_ToTree(Obj: TKMLGroundOverlay; TreeNodeShape: TTreeNodeShape);
    procedure TKMLGroundOverlay_ToPopupMenu(obj: TKMLGroundOverlay; Sender: TObject);
    procedure TKMLGroundOverlay_ToInspector(obj: TKMLGroundOverlay; ins: TObject);
    procedure TKMLGroundOverlay_SetXMLProperty(obj: TKMLGroundOverlay; Index: Integer; _Value: String);
    procedure TKMLGroundOverlay_Copy(source, target: TKMLGroundOverlay);
    procedure TKMLGroundOverlay_PasteToEvent(obj: TKMLGroundOverlay;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLGroundOverlay_ChildDeleteEvent(obj: TKMLGroundOverlay; del: TObject);
    procedure TKMLGroundOverlay_AddNameEvent(Sender: TObject);
    procedure TKMLGroundOverlay_AddVisibilityEvent(Sender: TObject);
    procedure TKMLGroundOverlay_AddDescriptionEvent(Sender: TObject);
    procedure TKMLGroundOverlay_AddLookAtEvent(Sender: TObject);
    procedure TKMLGroundOverlay_LookAtDeleteEvent(obj: TKMLGroundOverlay; del: TObject);
    procedure TKMLGroundOverlay_AddIconEvent(Sender: TObject);
    procedure TKMLGroundOverlay_IconDeleteEvent(obj: TKMLGroundOverlay; del: TObject);
    procedure TKMLGroundOverlay_AddLatLonBoxEvent(Sender: TObject);
    procedure TKMLGroundOverlay_LatLonBoxDeleteEvent(obj: TKMLGroundOverlay; del: TObject);
    { TKMLExtendedData }
    procedure TKMLExtendedData_ToTree(Obj: TKMLExtendedData; TreeNodeShape: TTreeNodeShape);
    procedure TKMLExtendedData_ToPopupMenu(obj: TKMLExtendedData; Sender: TObject);
    procedure TKMLExtendedData_ToInspector(obj: TKMLExtendedData; ins: TObject);
    procedure TKMLExtendedData_SetXMLProperty(obj: TKMLExtendedData; Index: Integer; _Value: String);
    procedure TKMLExtendedData_Copy(source, target: TKMLExtendedData);
    procedure TKMLExtendedData_PasteToEvent(obj: TKMLExtendedData;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLExtendedData_ChildDeleteEvent(obj: TKMLExtendedData; del: TObject);
    procedure TKMLExtendedData_AddDataEvent(Sender: TObject);
    procedure TKMLExtendedData_DataDeleteEvent(obj: TKMLExtendedData; del: TObject);
    { TKMLData }
    procedure TKMLData_ToTree(Obj: TKMLData; TreeNodeShape: TTreeNodeShape);
    procedure TKMLData_ToPopupMenu(obj: TKMLData; Sender: TObject);
    procedure TKMLData_ToInspector(obj: TKMLData; ins: TObject);
    procedure TKMLData_SetXMLProperty(obj: TKMLData; Index: Integer; _Value: String);
    procedure TKMLData_Copy(source, target: TKMLData);
    procedure TKMLData_PasteToEvent(obj: TKMLData;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLData_ChildDeleteEvent(obj: TKMLData; del: TObject);
    { TKMLSize }
    procedure TKMLSize_ToTree(Obj: TKMLSize; TreeNodeShape: TTreeNodeShape);
    procedure TKMLSize_ToPopupMenu(obj: TKMLSize; Sender: TObject);
    procedure TKMLSize_ToInspector(obj: TKMLSize; ins: TObject);
    procedure TKMLSize_SetXMLProperty(obj: TKMLSize; Index: Integer; _Value: String);
    procedure TKMLSize_Copy(source, target: TKMLSize);
    procedure TKMLSize_PasteToEvent(obj: TKMLSize;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLSize_ChildDeleteEvent(obj: TKMLSize; del: TObject);
    { TKMLStyle }
    procedure TKMLStyle_ToTree(Obj: TKMLStyle; TreeNodeShape: TTreeNodeShape);
    procedure TKMLStyle_ToPopupMenu(obj: TKMLStyle; Sender: TObject);
    procedure TKMLStyle_ToInspector(obj: TKMLStyle; ins: TObject);
    procedure TKMLStyle_SetXMLProperty(obj: TKMLStyle; Index: Integer; _Value: String);
    procedure TKMLStyle_Copy(source, target: TKMLStyle);
    procedure TKMLStyle_PasteToEvent(obj: TKMLStyle;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLStyle_ChildDeleteEvent(obj: TKMLStyle; del: TObject);
    procedure TKMLStyle_AddIconStyleEvent(Sender: TObject);
    procedure TKMLStyle_IconStyleDeleteEvent(obj: TKMLStyle; del: TObject);
    procedure TKMLStyle_AddLineStyleEvent(Sender: TObject);
    procedure TKMLStyle_LineStyleDeleteEvent(obj: TKMLStyle; del: TObject);
    procedure TKMLStyle_AddPolyStyleEvent(Sender: TObject);
    procedure TKMLStyle_PolyStyleDeleteEvent(obj: TKMLStyle; del: TObject);
    procedure TKMLStyle_AddBalloonStyleEvent(Sender: TObject);
    procedure TKMLStyle_BalloonStyleDeleteEvent(obj: TKMLStyle; del: TObject);
    { TKMLIconStyle }
    procedure TKMLIconStyle_ToTree(Obj: TKMLIconStyle; TreeNodeShape: TTreeNodeShape);
    procedure TKMLIconStyle_ToPopupMenu(obj: TKMLIconStyle; Sender: TObject);
    procedure TKMLIconStyle_ToInspector(obj: TKMLIconStyle; ins: TObject);
    procedure TKMLIconStyle_SetXMLProperty(obj: TKMLIconStyle; Index: Integer; _Value: String);
    procedure TKMLIconStyle_Copy(source, target: TKMLIconStyle);
    procedure TKMLIconStyle_PasteToEvent(obj: TKMLIconStyle;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLIconStyle_ChildDeleteEvent(obj: TKMLIconStyle; del: TObject);
    { TKMLIcon }
    procedure TKMLIcon_ToTree(Obj: TKMLIcon; TreeNodeShape: TTreeNodeShape);
    procedure TKMLIcon_ToPopupMenu(obj: TKMLIcon; Sender: TObject);
    procedure TKMLIcon_ToInspector(obj: TKMLIcon; ins: TObject);
    procedure TKMLIcon_SetXMLProperty(obj: TKMLIcon; Index: Integer; _Value: String);
    procedure TKMLIcon_Copy(source, target: TKMLIcon);
    procedure TKMLIcon_PasteToEvent(obj: TKMLIcon;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLIcon_ChildDeleteEvent(obj: TKMLIcon; del: TObject);
    { TKMLLineStyle }
    procedure TKMLLineStyle_ToTree(Obj: TKMLLineStyle; TreeNodeShape: TTreeNodeShape);
    procedure TKMLLineStyle_ToPopupMenu(obj: TKMLLineStyle; Sender: TObject);
    procedure TKMLLineStyle_ToInspector(obj: TKMLLineStyle; ins: TObject);
    procedure TKMLLineStyle_SetXMLProperty(obj: TKMLLineStyle; Index: Integer; _Value: String);
    procedure TKMLLineStyle_Copy(source, target: TKMLLineStyle);
    procedure TKMLLineStyle_PasteToEvent(obj: TKMLLineStyle;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLLineStyle_ChildDeleteEvent(obj: TKMLLineStyle; del: TObject);
    procedure TKMLLineStyle_AddcolorEvent(Sender: TObject);
    procedure TKMLLineStyle_AddwidthEvent(Sender: TObject);
    { TKMLBalloonStyle }
    procedure TKMLBalloonStyle_ToTree(Obj: TKMLBalloonStyle; TreeNodeShape: TTreeNodeShape);
    procedure TKMLBalloonStyle_ToPopupMenu(obj: TKMLBalloonStyle; Sender: TObject);
    procedure TKMLBalloonStyle_ToInspector(obj: TKMLBalloonStyle; ins: TObject);
    procedure TKMLBalloonStyle_SetXMLProperty(obj: TKMLBalloonStyle; Index: Integer; _Value: String);
    procedure TKMLBalloonStyle_Copy(source, target: TKMLBalloonStyle);
    procedure TKMLBalloonStyle_PasteToEvent(obj: TKMLBalloonStyle;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLBalloonStyle_ChildDeleteEvent(obj: TKMLBalloonStyle; del: TObject);
    { TKMLStyleMap }
    procedure TKMLStyleMap_ToTree(Obj: TKMLStyleMap; TreeNodeShape: TTreeNodeShape);
    procedure TKMLStyleMap_ToPopupMenu(obj: TKMLStyleMap; Sender: TObject);
    procedure TKMLStyleMap_ToInspector(obj: TKMLStyleMap; ins: TObject);
    procedure TKMLStyleMap_SetXMLProperty(obj: TKMLStyleMap; Index: Integer; _Value: String);
    procedure TKMLStyleMap_Copy(source, target: TKMLStyleMap);
    procedure TKMLStyleMap_PasteToEvent(obj: TKMLStyleMap;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLStyleMap_ChildDeleteEvent(obj: TKMLStyleMap; del: TObject);
    procedure TKMLStyleMap_AddPairEvent(Sender: TObject);
    procedure TKMLStyleMap_PairDeleteEvent(obj: TKMLStyleMap; del: TObject);
    { TKMLScreenOverlay }
    procedure TKMLScreenOverlay_ToTree(Obj: TKMLScreenOverlay; TreeNodeShape: TTreeNodeShape);
    procedure TKMLScreenOverlay_ToPopupMenu(obj: TKMLScreenOverlay; Sender: TObject);
    procedure TKMLScreenOverlay_ToInspector(obj: TKMLScreenOverlay; ins: TObject);
    procedure TKMLScreenOverlay_SetXMLProperty(obj: TKMLScreenOverlay; Index: Integer; _Value: String);
    procedure TKMLScreenOverlay_Copy(source, target: TKMLScreenOverlay);
    procedure TKMLScreenOverlay_PasteToEvent(obj: TKMLScreenOverlay;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLScreenOverlay_ChildDeleteEvent(obj: TKMLScreenOverlay; del: TObject);
    procedure TKMLScreenOverlay_AddNameEvent(Sender: TObject);
    procedure TKMLScreenOverlay_AddVisibilityEvent(Sender: TObject);
    procedure TKMLScreenOverlay_AddDescriptionEvent(Sender: TObject);
    procedure TKMLScreenOverlay_AddIconEvent(Sender: TObject);
    procedure TKMLScreenOverlay_IconDeleteEvent(obj: TKMLScreenOverlay; del: TObject);
    procedure TKMLScreenOverlay_AddOverlayXYEvent(Sender: TObject);
    procedure TKMLScreenOverlay_OverlayXYDeleteEvent(obj: TKMLScreenOverlay; del: TObject);
    procedure TKMLScreenOverlay_AddScreenXYEvent(Sender: TObject);
    procedure TKMLScreenOverlay_ScreenXYDeleteEvent(obj: TKMLScreenOverlay; del: TObject);
    procedure TKMLScreenOverlay_AddRotationXYEvent(Sender: TObject);
    procedure TKMLScreenOverlay_RotationXYDeleteEvent(obj: TKMLScreenOverlay; del: TObject);
    procedure TKMLScreenOverlay_AddSizeEvent(Sender: TObject);
    procedure TKMLScreenOverlay_SizeDeleteEvent(obj: TKMLScreenOverlay; del: TObject);
    { TKMLPair }
    procedure TKMLPair_ToTree(Obj: TKMLPair; TreeNodeShape: TTreeNodeShape);
    procedure TKMLPair_ToPopupMenu(obj: TKMLPair; Sender: TObject);
    procedure TKMLPair_ToInspector(obj: TKMLPair; ins: TObject);
    procedure TKMLPair_SetXMLProperty(obj: TKMLPair; Index: Integer; _Value: String);
    procedure TKMLPair_Copy(source, target: TKMLPair);
    procedure TKMLPair_PasteToEvent(obj: TKMLPair;items: TList<TObject>; const isCut: Boolean = False);
    procedure TKMLPair_ChildDeleteEvent(obj: TKMLPair; del: TObject);
    procedure TKMLPair_AddKeyEvent(Sender: TObject);
    procedure TKMLPair_AddStyleUrlEvent(Sender: TObject);
    property TKMLFileObj: TKMLFile read FTKMLFileObj write SetObj;
  end;

implementation

procedure TKMLTree.FromXML(node: IXMLNode);
begin
  inherited;
  if not Assigned(FTKMLFileObj) then
    FTKMLFileObj := TKMLFile.Create;
  TKMLFile_FromXML(FTKMLFileObj, node);
end;


function TKMLTree.ToXML(par: IXMLNode; pt: string): IXMLNode;
begin
  if Assigned(FTKMLFileObj) then
    TKMLFile_ToXML(FTKMLFileObj, par, pt);
end;


procedure TKMLTree.FromGeoObj(const Obj: TObject);
begin
  inherited;
  FTKMLFileObj := TKMLFile(Obj);
end;


function TKMLTree.ToGeoObj: TObject;
begin
  Result := FTKMLFileObj;
end;


procedure TKMLTree.SetObj(const Value: TKMLFile);
begin
  FTKMLFileObj := Value;
end;


procedure TKMLTree.ToTree(TreeNodeShape: TTreeNodeShape; obj: TObject = nil);
var
  tar: TObject;
begin
  inherited;
  if obj <> nil then
  begin
    tar := obj;
  end
  else
  begin
    tar := TargetObject;
  end;
  if tar is TKMLTree then
  begin
    TKMLFile_ToTree(TKMLTree(tar).FTKMLFileObj, TreeNodeShape);
  end
  else if tar is TKMLFile then
  begin
    TKMLFile_ToTree(TKMLFile(tar), TreeNodeShape);
  end  else if tar is TKMLDocument then
  begin
    TKMLDocument_ToTree(TKMLDocument(tar), TreeNodeShape);
  end  else if tar is TKMLFolder then
  begin
    TKMLFolder_ToTree(TKMLFolder(tar), TreeNodeShape);
  end  else if tar is TKMLPlacemark then
  begin
    TKMLPlacemark_ToTree(TKMLPlacemark(tar), TreeNodeShape);
  end  else if tar is TKMLGeometry then
  begin
    TKMLGeometry_ToTree(TKMLGeometry(tar), TreeNodeShape);
  end  else if tar is TKMLMultiGeometry then
  begin
    TKMLMultiGeometry_ToTree(TKMLMultiGeometry(tar), TreeNodeShape);
  end  else if tar is TKMLPoint then
  begin
    TKMLPoint_ToTree(TKMLPoint(tar), TreeNodeShape);
  end  else if tar is TKMLPolygon then
  begin
    TKMLPolygon_ToTree(TKMLPolygon(tar), TreeNodeShape);
  end  else if tar is TKMLBoundary then
  begin
    TKMLBoundary_ToTree(TKMLBoundary(tar), TreeNodeShape);
  end  else if tar is TKMLLinearRing then
  begin
    TKMLLinearRing_ToTree(TKMLLinearRing(tar), TreeNodeShape);
  end  else if tar is TKMLLineString then
  begin
    TKMLLineString_ToTree(TKMLLineString(tar), TreeNodeShape);
  end  else if tar is TKMLLookAt then
  begin
    TKMLLookAt_ToTree(TKMLLookAt(tar), TreeNodeShape);
  end  else if tar is TKMLLatLonBox then
  begin
    TKMLLatLonBox_ToTree(TKMLLatLonBox(tar), TreeNodeShape);
  end  else if tar is TKMLGroundOverlay then
  begin
    TKMLGroundOverlay_ToTree(TKMLGroundOverlay(tar), TreeNodeShape);
  end  else if tar is TKMLExtendedData then
  begin
    TKMLExtendedData_ToTree(TKMLExtendedData(tar), TreeNodeShape);
  end  else if tar is TKMLData then
  begin
    TKMLData_ToTree(TKMLData(tar), TreeNodeShape);
  end  else if tar is TKMLSize then
  begin
    TKMLSize_ToTree(TKMLSize(tar), TreeNodeShape);
  end  else if tar is TKMLStyle then
  begin
    TKMLStyle_ToTree(TKMLStyle(tar), TreeNodeShape);
  end  else if tar is TKMLIconStyle then
  begin
    TKMLIconStyle_ToTree(TKMLIconStyle(tar), TreeNodeShape);
  end  else if tar is TKMLIcon then
  begin
    TKMLIcon_ToTree(TKMLIcon(tar), TreeNodeShape);
  end  else if tar is TKMLLineStyle then
  begin
    TKMLLineStyle_ToTree(TKMLLineStyle(tar), TreeNodeShape);
  end  else if tar is TKMLBalloonStyle then
  begin
    TKMLBalloonStyle_ToTree(TKMLBalloonStyle(tar), TreeNodeShape);
  end  else if tar is TKMLStyleMap then
  begin
    TKMLStyleMap_ToTree(TKMLStyleMap(tar), TreeNodeShape);
  end  else if tar is TKMLScreenOverlay then
  begin
    TKMLScreenOverlay_ToTree(TKMLScreenOverlay(tar), TreeNodeShape);
  end  else if tar is TKMLPair then
  begin
    TKMLPair_ToTree(TKMLPair(tar), TreeNodeShape);
  end;
end;

procedure TKMLTree.SetXMLProperty(obj: TObject; Index: Integer; _Value: String);
begin
  inherited;
  if obj is TKMLFile then
  begin
    TKMLFile_SetXMLProperty(TKMLFile(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLDocument then
  begin
    TKMLDocument_SetXMLProperty(TKMLDocument(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLFolder then
  begin
    TKMLFolder_SetXMLProperty(TKMLFolder(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLPlacemark then
  begin
    TKMLPlacemark_SetXMLProperty(TKMLPlacemark(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLGeometry then
  begin
    TKMLGeometry_SetXMLProperty(TKMLGeometry(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLMultiGeometry then
  begin
    TKMLMultiGeometry_SetXMLProperty(TKMLMultiGeometry(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLPoint then
  begin
    TKMLPoint_SetXMLProperty(TKMLPoint(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLPolygon then
  begin
    TKMLPolygon_SetXMLProperty(TKMLPolygon(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLBoundary then
  begin
    TKMLBoundary_SetXMLProperty(TKMLBoundary(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLLinearRing then
  begin
    TKMLLinearRing_SetXMLProperty(TKMLLinearRing(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLLineString then
  begin
    TKMLLineString_SetXMLProperty(TKMLLineString(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLLookAt then
  begin
    TKMLLookAt_SetXMLProperty(TKMLLookAt(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLLatLonBox then
  begin
    TKMLLatLonBox_SetXMLProperty(TKMLLatLonBox(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLGroundOverlay then
  begin
    TKMLGroundOverlay_SetXMLProperty(TKMLGroundOverlay(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLExtendedData then
  begin
    TKMLExtendedData_SetXMLProperty(TKMLExtendedData(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLData then
  begin
    TKMLData_SetXMLProperty(TKMLData(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLSize then
  begin
    TKMLSize_SetXMLProperty(TKMLSize(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLStyle then
  begin
    TKMLStyle_SetXMLProperty(TKMLStyle(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLIconStyle then
  begin
    TKMLIconStyle_SetXMLProperty(TKMLIconStyle(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLIcon then
  begin
    TKMLIcon_SetXMLProperty(TKMLIcon(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLLineStyle then
  begin
    TKMLLineStyle_SetXMLProperty(TKMLLineStyle(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLBalloonStyle then
  begin
    TKMLBalloonStyle_SetXMLProperty(TKMLBalloonStyle(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLStyleMap then
  begin
    TKMLStyleMap_SetXMLProperty(TKMLStyleMap(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLScreenOverlay then
  begin
    TKMLScreenOverlay_SetXMLProperty(TKMLScreenOverlay(obj), Index, _Value);
	  Exit;
  end;
  if obj is TKMLPair then
  begin
    TKMLPair_SetXMLProperty(TKMLPair(obj), Index, _Value);
	  Exit;
  end;
end;

procedure TKMLTree.ToPopupMenu(Sender: TObject; obj: TObject = nil);
var
  tar: TObject;
begin
  inherited;
  if obj <> nil then
  begin
    tar := obj;
  end
  else
  begin
    tar := TargetObject;
  end;
  if tar is TKMLFile then
  begin
    TKMLFile_ToPopupMenu(TKMLFile(tar), Sender);
	  Exit;
  end;
  if tar is TKMLDocument then
  begin
    TKMLDocument_ToPopupMenu(TKMLDocument(tar), Sender);
	  Exit;
  end;
  if tar is TKMLFolder then
  begin
    TKMLFolder_ToPopupMenu(TKMLFolder(tar), Sender);
	  Exit;
  end;
  if tar is TKMLPlacemark then
  begin
    TKMLPlacemark_ToPopupMenu(TKMLPlacemark(tar), Sender);
	  Exit;
  end;
  if tar is TKMLGeometry then
  begin
    TKMLGeometry_ToPopupMenu(TKMLGeometry(tar), Sender);
	  Exit;
  end;
  if tar is TKMLMultiGeometry then
  begin
    TKMLMultiGeometry_ToPopupMenu(TKMLMultiGeometry(tar), Sender);
	  Exit;
  end;
  if tar is TKMLPoint then
  begin
    TKMLPoint_ToPopupMenu(TKMLPoint(tar), Sender);
	  Exit;
  end;
  if tar is TKMLPolygon then
  begin
    TKMLPolygon_ToPopupMenu(TKMLPolygon(tar), Sender);
	  Exit;
  end;
  if tar is TKMLBoundary then
  begin
    TKMLBoundary_ToPopupMenu(TKMLBoundary(tar), Sender);
	  Exit;
  end;
  if tar is TKMLLinearRing then
  begin
    TKMLLinearRing_ToPopupMenu(TKMLLinearRing(tar), Sender);
	  Exit;
  end;
  if tar is TKMLLineString then
  begin
    TKMLLineString_ToPopupMenu(TKMLLineString(tar), Sender);
	  Exit;
  end;
  if tar is TKMLLookAt then
  begin
    TKMLLookAt_ToPopupMenu(TKMLLookAt(tar), Sender);
	  Exit;
  end;
  if tar is TKMLLatLonBox then
  begin
    TKMLLatLonBox_ToPopupMenu(TKMLLatLonBox(tar), Sender);
	  Exit;
  end;
  if tar is TKMLGroundOverlay then
  begin
    TKMLGroundOverlay_ToPopupMenu(TKMLGroundOverlay(tar), Sender);
	  Exit;
  end;
  if tar is TKMLExtendedData then
  begin
    TKMLExtendedData_ToPopupMenu(TKMLExtendedData(tar), Sender);
	  Exit;
  end;
  if tar is TKMLData then
  begin
    TKMLData_ToPopupMenu(TKMLData(tar), Sender);
	  Exit;
  end;
  if tar is TKMLSize then
  begin
    TKMLSize_ToPopupMenu(TKMLSize(tar), Sender);
	  Exit;
  end;
  if tar is TKMLStyle then
  begin
    TKMLStyle_ToPopupMenu(TKMLStyle(tar), Sender);
	  Exit;
  end;
  if tar is TKMLIconStyle then
  begin
    TKMLIconStyle_ToPopupMenu(TKMLIconStyle(tar), Sender);
	  Exit;
  end;
  if tar is TKMLIcon then
  begin
    TKMLIcon_ToPopupMenu(TKMLIcon(tar), Sender);
	  Exit;
  end;
  if tar is TKMLLineStyle then
  begin
    TKMLLineStyle_ToPopupMenu(TKMLLineStyle(tar), Sender);
	  Exit;
  end;
  if tar is TKMLBalloonStyle then
  begin
    TKMLBalloonStyle_ToPopupMenu(TKMLBalloonStyle(tar), Sender);
	  Exit;
  end;
  if tar is TKMLStyleMap then
  begin
    TKMLStyleMap_ToPopupMenu(TKMLStyleMap(tar), Sender);
	  Exit;
  end;
  if tar is TKMLScreenOverlay then
  begin
    TKMLScreenOverlay_ToPopupMenu(TKMLScreenOverlay(tar), Sender);
	  Exit;
  end;
  if tar is TKMLPair then
  begin
    TKMLPair_ToPopupMenu(TKMLPair(tar), Sender);
	  Exit;
  end;
end;

procedure TKMLTree.ToInspector(Sender: TObject; obj: TObject = nil);
var
  tar: TObject;
begin
  inherited;
  if obj <> nil then
  begin
    tar := obj;
  end
  else
  begin
    tar := TargetObject;
  end;
  if tar is TKMLFile then
  begin
    TKMLFile_ToInspector(TKMLFile(tar), Sender);
	  Exit;
  end;
  if tar is TKMLDocument then
  begin
    TKMLDocument_ToInspector(TKMLDocument(tar), Sender);
	  Exit;
  end;
  if tar is TKMLFolder then
  begin
    TKMLFolder_ToInspector(TKMLFolder(tar), Sender);
	  Exit;
  end;
  if tar is TKMLPlacemark then
  begin
    TKMLPlacemark_ToInspector(TKMLPlacemark(tar), Sender);
	  Exit;
  end;
  if tar is TKMLGeometry then
  begin
    TKMLGeometry_ToInspector(TKMLGeometry(tar), Sender);
	  Exit;
  end;
  if tar is TKMLMultiGeometry then
  begin
    TKMLMultiGeometry_ToInspector(TKMLMultiGeometry(tar), Sender);
	  Exit;
  end;
  if tar is TKMLPoint then
  begin
    TKMLPoint_ToInspector(TKMLPoint(tar), Sender);
	  Exit;
  end;
  if tar is TKMLPolygon then
  begin
    TKMLPolygon_ToInspector(TKMLPolygon(tar), Sender);
	  Exit;
  end;
  if tar is TKMLBoundary then
  begin
    TKMLBoundary_ToInspector(TKMLBoundary(tar), Sender);
	  Exit;
  end;
  if tar is TKMLLinearRing then
  begin
    TKMLLinearRing_ToInspector(TKMLLinearRing(tar), Sender);
	  Exit;
  end;
  if tar is TKMLLineString then
  begin
    TKMLLineString_ToInspector(TKMLLineString(tar), Sender);
	  Exit;
  end;
  if tar is TKMLLookAt then
  begin
    TKMLLookAt_ToInspector(TKMLLookAt(tar), Sender);
	  Exit;
  end;
  if tar is TKMLLatLonBox then
  begin
    TKMLLatLonBox_ToInspector(TKMLLatLonBox(tar), Sender);
	  Exit;
  end;
  if tar is TKMLGroundOverlay then
  begin
    TKMLGroundOverlay_ToInspector(TKMLGroundOverlay(tar), Sender);
	  Exit;
  end;
  if tar is TKMLExtendedData then
  begin
    TKMLExtendedData_ToInspector(TKMLExtendedData(tar), Sender);
	  Exit;
  end;
  if tar is TKMLData then
  begin
    TKMLData_ToInspector(TKMLData(tar), Sender);
	  Exit;
  end;
  if tar is TKMLSize then
  begin
    TKMLSize_ToInspector(TKMLSize(tar), Sender);
	  Exit;
  end;
  if tar is TKMLStyle then
  begin
    TKMLStyle_ToInspector(TKMLStyle(tar), Sender);
	  Exit;
  end;
  if tar is TKMLIconStyle then
  begin
    TKMLIconStyle_ToInspector(TKMLIconStyle(tar), Sender);
	  Exit;
  end;
  if tar is TKMLIcon then
  begin
    TKMLIcon_ToInspector(TKMLIcon(tar), Sender);
	  Exit;
  end;
  if tar is TKMLLineStyle then
  begin
    TKMLLineStyle_ToInspector(TKMLLineStyle(tar), Sender);
	  Exit;
  end;
  if tar is TKMLBalloonStyle then
  begin
    TKMLBalloonStyle_ToInspector(TKMLBalloonStyle(tar), Sender);
	  Exit;
  end;
  if tar is TKMLStyleMap then
  begin
    TKMLStyleMap_ToInspector(TKMLStyleMap(tar), Sender);
	  Exit;
  end;
  if tar is TKMLScreenOverlay then
  begin
    TKMLScreenOverlay_ToInspector(TKMLScreenOverlay(tar), Sender);
	  Exit;
  end;
  if tar is TKMLPair then
  begin
    TKMLPair_ToInspector(TKMLPair(tar), Sender);
	  Exit;
  end;
end;

procedure TKMLTree.ChildDeleteEvent(par, del: TObject);
begin
  if TargetObject is TKMLFile then
  begin
    TKMLFile_ChildDeleteEvent(TKMLFile(par), del);
	  Exit;
  end;
  if TargetObject is TKMLDocument then
  begin
    TKMLDocument_ChildDeleteEvent(TKMLDocument(par), del);
	  Exit;
  end;
  if TargetObject is TKMLFolder then
  begin
    TKMLFolder_ChildDeleteEvent(TKMLFolder(par), del);
	  Exit;
  end;
  if TargetObject is TKMLPlacemark then
  begin
    TKMLPlacemark_ChildDeleteEvent(TKMLPlacemark(par), del);
	  Exit;
  end;
  if TargetObject is TKMLGeometry then
  begin
    TKMLGeometry_ChildDeleteEvent(TKMLGeometry(par), del);
	  Exit;
  end;
  if TargetObject is TKMLMultiGeometry then
  begin
    TKMLMultiGeometry_ChildDeleteEvent(TKMLMultiGeometry(par), del);
	  Exit;
  end;
  if TargetObject is TKMLPoint then
  begin
    TKMLPoint_ChildDeleteEvent(TKMLPoint(par), del);
	  Exit;
  end;
  if TargetObject is TKMLPolygon then
  begin
    TKMLPolygon_ChildDeleteEvent(TKMLPolygon(par), del);
	  Exit;
  end;
  if TargetObject is TKMLBoundary then
  begin
    TKMLBoundary_ChildDeleteEvent(TKMLBoundary(par), del);
	  Exit;
  end;
  if TargetObject is TKMLLinearRing then
  begin
    TKMLLinearRing_ChildDeleteEvent(TKMLLinearRing(par), del);
	  Exit;
  end;
  if TargetObject is TKMLLineString then
  begin
    TKMLLineString_ChildDeleteEvent(TKMLLineString(par), del);
	  Exit;
  end;
  if TargetObject is TKMLLookAt then
  begin
    TKMLLookAt_ChildDeleteEvent(TKMLLookAt(par), del);
	  Exit;
  end;
  if TargetObject is TKMLLatLonBox then
  begin
    TKMLLatLonBox_ChildDeleteEvent(TKMLLatLonBox(par), del);
	  Exit;
  end;
  if TargetObject is TKMLGroundOverlay then
  begin
    TKMLGroundOverlay_ChildDeleteEvent(TKMLGroundOverlay(par), del);
	  Exit;
  end;
  if TargetObject is TKMLExtendedData then
  begin
    TKMLExtendedData_ChildDeleteEvent(TKMLExtendedData(par), del);
	  Exit;
  end;
  if TargetObject is TKMLData then
  begin
    TKMLData_ChildDeleteEvent(TKMLData(par), del);
	  Exit;
  end;
  if TargetObject is TKMLSize then
  begin
    TKMLSize_ChildDeleteEvent(TKMLSize(par), del);
	  Exit;
  end;
  if TargetObject is TKMLStyle then
  begin
    TKMLStyle_ChildDeleteEvent(TKMLStyle(par), del);
	  Exit;
  end;
  if TargetObject is TKMLIconStyle then
  begin
    TKMLIconStyle_ChildDeleteEvent(TKMLIconStyle(par), del);
	  Exit;
  end;
  if TargetObject is TKMLIcon then
  begin
    TKMLIcon_ChildDeleteEvent(TKMLIcon(par), del);
	  Exit;
  end;
  if TargetObject is TKMLLineStyle then
  begin
    TKMLLineStyle_ChildDeleteEvent(TKMLLineStyle(par), del);
	  Exit;
  end;
  if TargetObject is TKMLBalloonStyle then
  begin
    TKMLBalloonStyle_ChildDeleteEvent(TKMLBalloonStyle(par), del);
	  Exit;
  end;
  if TargetObject is TKMLStyleMap then
  begin
    TKMLStyleMap_ChildDeleteEvent(TKMLStyleMap(par), del);
	  Exit;
  end;
  if TargetObject is TKMLScreenOverlay then
  begin
    TKMLScreenOverlay_ChildDeleteEvent(TKMLScreenOverlay(par), del);
	  Exit;
  end;
  if TargetObject is TKMLPair then
  begin
    TKMLPair_ChildDeleteEvent(TKMLPair(par), del);
	  Exit;
  end;
end;

procedure TKMLTree.PasteToEvent(items: TList<TObject>; const isCut: Boolean = False);
begin
  if TargetObject is TKMLFile then
  begin
    TKMLFile_PasteToEvent(TKMLFile(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLDocument then
  begin
    TKMLDocument_PasteToEvent(TKMLDocument(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLFolder then
  begin
    TKMLFolder_PasteToEvent(TKMLFolder(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLPlacemark then
  begin
    TKMLPlacemark_PasteToEvent(TKMLPlacemark(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLGeometry then
  begin
    TKMLGeometry_PasteToEvent(TKMLGeometry(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLMultiGeometry then
  begin
    TKMLMultiGeometry_PasteToEvent(TKMLMultiGeometry(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLPoint then
  begin
    TKMLPoint_PasteToEvent(TKMLPoint(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLPolygon then
  begin
    TKMLPolygon_PasteToEvent(TKMLPolygon(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLBoundary then
  begin
    TKMLBoundary_PasteToEvent(TKMLBoundary(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLLinearRing then
  begin
    TKMLLinearRing_PasteToEvent(TKMLLinearRing(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLLineString then
  begin
    TKMLLineString_PasteToEvent(TKMLLineString(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLLookAt then
  begin
    TKMLLookAt_PasteToEvent(TKMLLookAt(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLLatLonBox then
  begin
    TKMLLatLonBox_PasteToEvent(TKMLLatLonBox(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLGroundOverlay then
  begin
    TKMLGroundOverlay_PasteToEvent(TKMLGroundOverlay(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLExtendedData then
  begin
    TKMLExtendedData_PasteToEvent(TKMLExtendedData(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLData then
  begin
    TKMLData_PasteToEvent(TKMLData(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLSize then
  begin
    TKMLSize_PasteToEvent(TKMLSize(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLStyle then
  begin
    TKMLStyle_PasteToEvent(TKMLStyle(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLIconStyle then
  begin
    TKMLIconStyle_PasteToEvent(TKMLIconStyle(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLIcon then
  begin
    TKMLIcon_PasteToEvent(TKMLIcon(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLLineStyle then
  begin
    TKMLLineStyle_PasteToEvent(TKMLLineStyle(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLBalloonStyle then
  begin
    TKMLBalloonStyle_PasteToEvent(TKMLBalloonStyle(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLStyleMap then
  begin
    TKMLStyleMap_PasteToEvent(TKMLStyleMap(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLScreenOverlay then
  begin
    TKMLScreenOverlay_PasteToEvent(TKMLScreenOverlay(TargetObject), items, isCut);
	  Exit;
  end;
  if TargetObject is TKMLPair then
  begin
    TKMLPair_PasteToEvent(TKMLPair(TargetObject), items, isCut);
	  Exit;
  end;
end;

procedure TKMLTree.TKMLFile_FromXML(Obj: TKMLFile; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
  FolderTmp: TKMLFolder;
begin
  try
    Obj.XmlnsExsit := False;
    Obj.FolderClear;
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'Document' then
      begin
        Obj.Document := TKMLDocument.Create;
        TKMLDocument_FromXML(Obj.Document, nodeTmp);
      end
      else if nodeTmp.NodeName = 'Folder' then
      begin
        FolderTmp := TKMLFolder.Create;
        TKMLFolder_FromXML(FolderTmp, nodeTmp);
        Obj.AddFolder(FolderTmp);
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
      if nodeTmp.NodeName = 'xmlns' then
      begin
        Obj.Xmlns := nodeTmp.Text;
        Obj.XmlnsExsit := True;
      end;
    end;
  except
    raise Exception.Create('KMLFile Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLFile_ToXML(Obj: TKMLFile; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  XmlnsTmp: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'kml';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    TKMLDocument_ToXML(Obj.Document, node, 'Document');
    for I := 0 to Obj.Folders.Count - 1 do
       TKMLFolder_ToXML(Obj.Folder[I], node, 'Folder');
    if Obj.XmlnsExsit then 
    begin
      XmlnsTmp := doc.CreateNode('xmlns', ntAttribute);
      XmlnsTmp.NodeValue := Obj.Xmlns;
      node.AttributeNodes.Add(XmlnsTmp);
    end;
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLDocument_FromXML(Obj: TKMLDocument; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
  StyleMapTmp: TKMLStyleMap;
  StyleTmp: TKMLStyle;
  PlacemarkTmp: TKMLPlacemark;
  FolderTmp: TKMLFolder;
begin
  try
    Obj.NameExsit := False;
    Obj.OpenExsit := False;
    Obj.VisibilityExsit := False;
    Obj.DescriptionExsit := False;
    Obj.LookAtExsit := False;
    Obj.StyleMapClear;
    Obj.StyleClear;
    Obj.PlacemarkClear;
    Obj.FolderClear;
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'name' then
      begin
        Obj.Name := nodeTmp.Text;
        Obj.NameExsit := True;
      end
      else if nodeTmp.NodeName = 'open' then
      begin
        Obj.Open := StrToIntDef(nodeTmp.Text, 0);;
        Obj.OpenExsit := True;
      end
      else if nodeTmp.NodeName = 'visibility' then
      begin
        Obj.Visibility := StrToIntDef(nodeTmp.Text, 0);;
        Obj.VisibilityExsit := True;
      end
      else if nodeTmp.NodeName = 'description' then
      begin
        Obj.Description := nodeTmp.Text;
        Obj.DescriptionExsit := True;
      end
      else if nodeTmp.NodeName = 'LookAt' then
      begin
        Obj.LookAt := TKMLLookAt.Create;
        TKMLLookAt_FromXML(Obj.LookAt, nodeTmp);
        Obj.LookAtExsit := True;
      end
      else if nodeTmp.NodeName = 'StyleMap' then
      begin
        StyleMapTmp := TKMLStyleMap.Create;
        TKMLStyleMap_FromXML(StyleMapTmp, nodeTmp);
        Obj.AddStyleMap(StyleMapTmp);
      end
      else if nodeTmp.NodeName = 'Style' then
      begin
        StyleTmp := TKMLStyle.Create;
        TKMLStyle_FromXML(StyleTmp, nodeTmp);
        Obj.AddStyle(StyleTmp);
      end
      else if nodeTmp.NodeName = 'Placemark' then
      begin
        PlacemarkTmp := TKMLPlacemark.Create;
        TKMLPlacemark_FromXML(PlacemarkTmp, nodeTmp);
        Obj.AddPlacemark(PlacemarkTmp);
      end
      else if nodeTmp.NodeName = 'Folder' then
      begin
        FolderTmp := TKMLFolder.Create;
        TKMLFolder_FromXML(FolderTmp, nodeTmp);
        Obj.AddFolder(FolderTmp);
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
;
    end;
  except
    raise Exception.Create('Document Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLDocument_ToXML(Obj: TKMLDocument; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  NameTmp: IXMLNode;
  OpenTmp: IXMLNode;
  VisibilityTmp: IXMLNode;
  DescriptionTmp: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'Document';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    if Obj.NameExsit then
    begin
      NameTmp := doc.CreateNode('name', ntElement);
      NameTmp.NodeValue := Obj.Name;
      node.ChildNodes.Add(NameTmp);
    end;
    if Obj.OpenExsit then
    begin
      OpenTmp := doc.CreateNode('open', ntElement);
      OpenTmp.NodeValue := IntToStr(Obj.Open);
      node.ChildNodes.Add(OpenTmp);
    end;
    if Obj.VisibilityExsit then
    begin
      VisibilityTmp := doc.CreateNode('visibility', ntElement);
      VisibilityTmp.NodeValue := IntToStr(Obj.Visibility);
      node.ChildNodes.Add(VisibilityTmp);
    end;
    if Obj.DescriptionExsit then
    begin
      DescriptionTmp := doc.CreateNode('description', ntElement);
      DescriptionTmp.NodeValue := Obj.Description;
      node.ChildNodes.Add(DescriptionTmp);
    end;
    if Obj.LookAtExsit then
      TKMLLookAt_ToXML(Obj.LookAt, node, 'LookAt');
    for I := 0 to Obj.StyleMaps.Count - 1 do
       TKMLStyleMap_ToXML(Obj.StyleMap[I], node, 'StyleMap');
    for I := 0 to Obj.Styles.Count - 1 do
       TKMLStyle_ToXML(Obj.Style[I], node, 'Style');
    for I := 0 to Obj.Placemarks.Count - 1 do
       TKMLPlacemark_ToXML(Obj.Placemark[I], node, 'Placemark');
    for I := 0 to Obj.Folders.Count - 1 do
       TKMLFolder_ToXML(Obj.Folder[I], node, 'Folder');
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLFolder_FromXML(Obj: TKMLFolder; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
  GroundOverlayTmp: TKMLGroundOverlay;
  PlacemarkTmp: TKMLPlacemark;
  ScreenOverlayTmp: TKMLScreenOverlay;
  FolderTmp: TKMLFolder;
begin
  try
    Obj.NameExsit := False;
    Obj.OpenExsit := False;
    Obj.VisibilityExsit := False;
    Obj.DescriptionExsit := False;
    Obj.LookAtExsit := False;
    Obj.DocumentExsit := False;
    Obj.GroundOverlayClear;
    Obj.PlacemarkClear;
    Obj.ScreenOverlayClear;
    Obj.FolderClear;
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'name' then
      begin
        Obj.Name := nodeTmp.Text;
        Obj.NameExsit := True;
      end
      else if nodeTmp.NodeName = 'open' then
      begin
        Obj.Open := StrToIntDef(nodeTmp.Text, 0);;
        Obj.OpenExsit := True;
      end
      else if nodeTmp.NodeName = 'visibility' then
      begin
        Obj.Visibility := StrToIntDef(nodeTmp.Text, 0);;
        Obj.VisibilityExsit := True;
      end
      else if nodeTmp.NodeName = 'description' then
      begin
        Obj.Description := nodeTmp.Text;
        Obj.DescriptionExsit := True;
      end
      else if nodeTmp.NodeName = 'LookAt' then
      begin
        Obj.LookAt := TKMLLookAt.Create;
        TKMLLookAt_FromXML(Obj.LookAt, nodeTmp);
        Obj.LookAtExsit := True;
      end
      else if nodeTmp.NodeName = 'Document' then
      begin
        Obj.Document := TKMLDocument.Create;
        TKMLDocument_FromXML(Obj.Document, nodeTmp);
        Obj.DocumentExsit := True;
      end
      else if nodeTmp.NodeName = 'GroundOverlay' then
      begin
        GroundOverlayTmp := TKMLGroundOverlay.Create;
        TKMLGroundOverlay_FromXML(GroundOverlayTmp, nodeTmp);
        Obj.AddGroundOverlay(GroundOverlayTmp);
      end
      else if nodeTmp.NodeName = 'Placemark' then
      begin
        PlacemarkTmp := TKMLPlacemark.Create;
        TKMLPlacemark_FromXML(PlacemarkTmp, nodeTmp);
        Obj.AddPlacemark(PlacemarkTmp);
      end
      else if nodeTmp.NodeName = 'ScreenOverlay' then
      begin
        ScreenOverlayTmp := TKMLScreenOverlay.Create;
        TKMLScreenOverlay_FromXML(ScreenOverlayTmp, nodeTmp);
        Obj.AddScreenOverlay(ScreenOverlayTmp);
      end
      else if nodeTmp.NodeName = 'Folder' then
      begin
        FolderTmp := TKMLFolder.Create;
        TKMLFolder_FromXML(FolderTmp, nodeTmp);
        Obj.AddFolder(FolderTmp);
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
;
    end;
  except
    raise Exception.Create('Folder Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLFolder_ToXML(Obj: TKMLFolder; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  NameTmp: IXMLNode;
  OpenTmp: IXMLNode;
  VisibilityTmp: IXMLNode;
  DescriptionTmp: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'Folder';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    if Obj.NameExsit then
    begin
      NameTmp := doc.CreateNode('name', ntElement);
      NameTmp.NodeValue := Obj.Name;
      node.ChildNodes.Add(NameTmp);
    end;
    if Obj.OpenExsit then
    begin
      OpenTmp := doc.CreateNode('open', ntElement);
      OpenTmp.NodeValue := IntToStr(Obj.Open);
      node.ChildNodes.Add(OpenTmp);
    end;
    if Obj.VisibilityExsit then
    begin
      VisibilityTmp := doc.CreateNode('visibility', ntElement);
      VisibilityTmp.NodeValue := IntToStr(Obj.Visibility);
      node.ChildNodes.Add(VisibilityTmp);
    end;
    if Obj.DescriptionExsit then
    begin
      DescriptionTmp := doc.CreateNode('description', ntElement);
      DescriptionTmp.NodeValue := Obj.Description;
      node.ChildNodes.Add(DescriptionTmp);
    end;
    if Obj.LookAtExsit then
      TKMLLookAt_ToXML(Obj.LookAt, node, 'LookAt');
    if Obj.DocumentExsit then
      TKMLDocument_ToXML(Obj.Document, node, 'Document');
    for I := 0 to Obj.GroundOverlays.Count - 1 do
       TKMLGroundOverlay_ToXML(Obj.GroundOverlay[I], node, 'GroundOverlay');
    for I := 0 to Obj.Placemarks.Count - 1 do
       TKMLPlacemark_ToXML(Obj.Placemark[I], node, 'Placemark');
    for I := 0 to Obj.ScreenOverlays.Count - 1 do
       TKMLScreenOverlay_ToXML(Obj.ScreenOverlay[I], node, 'ScreenOverlay');
    for I := 0 to Obj.Folders.Count - 1 do
       TKMLFolder_ToXML(Obj.Folder[I], node, 'Folder');
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLPlacemark_FromXML(Obj: TKMLPlacemark; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
begin
  try
    Obj.NameExsit := False;
    Obj.VisibilityExsit := False;
    Obj.DescriptionExsit := False;
    Obj.LookAtExsit := False;
    Obj.StyleUrlExsit := False;
    Obj.GeometryExsit := False;
    Obj.ExtendedDataExsit := False;
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'name' then
      begin
        Obj.Name := nodeTmp.Text;
        Obj.NameExsit := True;
      end
      else if nodeTmp.NodeName = 'visibility' then
      begin
        Obj.Visibility := StrToIntDef(nodeTmp.Text, 0);;
        Obj.VisibilityExsit := True;
      end
      else if nodeTmp.NodeName = 'description' then
      begin
        Obj.Description := nodeTmp.Text;
        Obj.DescriptionExsit := True;
      end
      else if nodeTmp.NodeName = 'LookAt' then
      begin
        Obj.LookAt := TKMLLookAt.Create;
        TKMLLookAt_FromXML(Obj.LookAt, nodeTmp);
        Obj.LookAtExsit := True;
      end
      else if nodeTmp.NodeName = 'styleUrl' then
      begin
        Obj.StyleUrl := nodeTmp.Text;
        Obj.StyleUrlExsit := True;
      end
      else if nodeTmp.NodeName = 'Point' then
      begin
        Obj.Geometry := TKMLPoint.Create;
        TKMLPoint_FromXML(TKMLPoint(Obj.Geometry), nodeTmp);
        Obj.GeometryExsit := True;
      end
      else if nodeTmp.NodeName = 'Polygon' then
      begin
        Obj.Geometry := TKMLPolygon.Create;
        TKMLPolygon_FromXML(TKMLPolygon(Obj.Geometry), nodeTmp);
        Obj.GeometryExsit := True;
      end
      else if nodeTmp.NodeName = 'LinearRing' then
      begin
        Obj.Geometry := TKMLLinearRing.Create;
        TKMLLinearRing_FromXML(TKMLLinearRing(Obj.Geometry), nodeTmp);
        Obj.GeometryExsit := True;
      end
      else if nodeTmp.NodeName = 'LineString' then
      begin
        Obj.Geometry := TKMLLineString.Create;
        TKMLLineString_FromXML(TKMLLineString(Obj.Geometry), nodeTmp);
        Obj.GeometryExsit := True;
      end
      else if nodeTmp.NodeName = 'MultiGeometry' then
      begin
        Obj.Geometry := TKMLMultiGeometry.Create;
        TKMLMultiGeometry_FromXML(TKMLMultiGeometry(Obj.Geometry), nodeTmp);
        Obj.GeometryExsit := True;
      end
      else if nodeTmp.NodeName = 'ExtendedData' then
      begin
        Obj.ExtendedData := TKMLExtendedData.Create;
        TKMLExtendedData_FromXML(Obj.ExtendedData, nodeTmp);
        Obj.ExtendedDataExsit := True;
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
;
    end;
  except
    raise Exception.Create('Placemark Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLPlacemark_ToXML(Obj: TKMLPlacemark; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  NameTmp: IXMLNode;
  VisibilityTmp: IXMLNode;
  DescriptionTmp: IXMLNode;
  StyleUrlTmp: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'Placemark';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    if Obj.NameExsit then
    begin
      NameTmp := doc.CreateNode('name', ntElement);
      NameTmp.NodeValue := Obj.Name;
      node.ChildNodes.Add(NameTmp);
    end;
    if Obj.VisibilityExsit then
    begin
      VisibilityTmp := doc.CreateNode('visibility', ntElement);
      VisibilityTmp.NodeValue := IntToStr(Obj.Visibility);
      node.ChildNodes.Add(VisibilityTmp);
    end;
    if Obj.DescriptionExsit then
    begin
      DescriptionTmp := doc.CreateNode('description', ntElement);
      DescriptionTmp.NodeValue := Obj.Description;
      node.ChildNodes.Add(DescriptionTmp);
    end;
    if Obj.LookAtExsit then
      TKMLLookAt_ToXML(Obj.LookAt, node, 'LookAt');
    if Obj.StyleUrlExsit then
    begin
      StyleUrlTmp := doc.CreateNode('styleUrl', ntElement);
      StyleUrlTmp.NodeValue := Obj.StyleUrl;
      node.ChildNodes.Add(StyleUrlTmp);
    end;
    if Obj.GeometryExsit then
      TKMLGeometry_ToXML(Obj.Geometry, node, '#Optional');
    if Obj.ExtendedDataExsit then
      TKMLExtendedData_ToXML(Obj.ExtendedData, node, 'ExtendedData');
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLGeometry_FromXML(Obj: TKMLGeometry; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
begin
  try
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
;
    end;
  except
    raise Exception.Create('Geometry Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLGeometry_ToXML(Obj: TKMLGeometry; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := '#Optional';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLMultiGeometry_FromXML(Obj: TKMLMultiGeometry; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
  GeometryTmp: TKMLGeometry;
begin
  try
    TKMLGeometry_FromXML(Obj, node);
    Obj.GeometryClear;
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'Point' then
      begin
        GeometryTmp := TKMLPoint.Create;
        TKMLPoint_FromXML(TKMLPoint(GeometryTmp), nodeTmp);
        Obj.AddGeometry(GeometryTmp);
      end
      else if nodeTmp.NodeName = 'Polygon' then
      begin
        GeometryTmp := TKMLPolygon.Create;
        TKMLPolygon_FromXML(TKMLPolygon(GeometryTmp), nodeTmp);
        Obj.AddGeometry(GeometryTmp);
      end
      else if nodeTmp.NodeName = 'LinearRing' then
      begin
        GeometryTmp := TKMLLinearRing.Create;
        TKMLLinearRing_FromXML(TKMLLinearRing(GeometryTmp), nodeTmp);
        Obj.AddGeometry(GeometryTmp);
      end
      else if nodeTmp.NodeName = 'LineString' then
      begin
        GeometryTmp := TKMLLineString.Create;
        TKMLLineString_FromXML(TKMLLineString(GeometryTmp), nodeTmp);
        Obj.AddGeometry(GeometryTmp);
      end
      else if nodeTmp.NodeName = 'MultiGeometry' then
      begin
        GeometryTmp := TKMLMultiGeometry.Create;
        TKMLMultiGeometry_FromXML(TKMLMultiGeometry(GeometryTmp), nodeTmp);
        Obj.AddGeometry(GeometryTmp);
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
;
    end;
  except
    raise Exception.Create('MultiGeometry Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLMultiGeometry_ToXML(Obj: TKMLMultiGeometry; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'MultiGeometry';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    TKMLGeometry_ToXML(Obj, node);
    for I := 0 to Obj.Geometrys.Count - 1 do
       TKMLGeometry_ToXML(Obj.Geometry[I], node, '#Optional');
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLPoint_FromXML(Obj: TKMLPoint; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
begin
  try
    TKMLGeometry_FromXML(Obj, node);
    Obj.ExtrudeExsit := False;
    Obj.AltitudeModeExsit := False;
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'extrude' then
      begin
        Obj.Extrude := nodeTmp.Text;
        Obj.ExtrudeExsit := True;
      end
      else if nodeTmp.NodeName = 'altitudeMode' then
      begin
        Obj.AltitudeMode := nodeTmp.Text;
        Obj.AltitudeModeExsit := True;
      end
      else if nodeTmp.NodeName = 'coordinates' then
      begin
        Obj.Coordinates := StringToCoordinates(nodeTmp.Text);
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
;
    end;
  except
    raise Exception.Create('Point Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLPoint_ToXML(Obj: TKMLPoint; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  ExtrudeTmp: IXMLNode;
  AltitudeModeTmp: IXMLNode;
  CoordinatesTmp: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'Point';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    TKMLGeometry_ToXML(Obj, node);
    if Obj.ExtrudeExsit then
    begin
      ExtrudeTmp := doc.CreateNode('extrude', ntElement);
      ExtrudeTmp.NodeValue := Obj.Extrude;
      node.ChildNodes.Add(ExtrudeTmp);
    end;
    if Obj.AltitudeModeExsit then
    begin
      AltitudeModeTmp := doc.CreateNode('altitudeMode', ntElement);
      AltitudeModeTmp.NodeValue := Obj.AltitudeMode;
      node.ChildNodes.Add(AltitudeModeTmp);
    end;
    CoordinatesTmp := doc.CreateNode('coordinates', ntElement);
    CoordinatesTmp.NodeValue := CoordinatesToString(Obj.Coordinates);
    node.ChildNodes.Add(CoordinatesTmp);
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLPolygon_FromXML(Obj: TKMLPolygon; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
  OuterBoundaryIsTmp: TKMLBoundary;
  InnerBoundaryIsTmp: TKMLBoundary;
begin
  try
    TKMLGeometry_FromXML(Obj, node);
    Obj.ExtrudeExsit := False;
    Obj.AltitudeModeExsit := False;
    Obj.OuterBoundaryIsClear;
    Obj.InnerBoundaryIsClear;
    Obj.TessellateExsit := False;
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'extrude' then
      begin
        Obj.Extrude := nodeTmp.Text;
        Obj.ExtrudeExsit := True;
      end
      else if nodeTmp.NodeName = 'altitudeMode' then
      begin
        Obj.AltitudeMode := nodeTmp.Text;
        Obj.AltitudeModeExsit := True;
      end
      else if nodeTmp.NodeName = 'outerBoundaryIs' then
      begin
        OuterBoundaryIsTmp := TKMLBoundary.Create;
        TKMLBoundary_FromXML(OuterBoundaryIsTmp, nodeTmp);
        Obj.AddOuterBoundaryIs(OuterBoundaryIsTmp);
      end
      else if nodeTmp.NodeName = 'innerBoundaryIs' then
      begin
        InnerBoundaryIsTmp := TKMLBoundary.Create;
        TKMLBoundary_FromXML(InnerBoundaryIsTmp, nodeTmp);
        Obj.AddInnerBoundaryIs(InnerBoundaryIsTmp);
      end
      else if nodeTmp.NodeName = 'tessellate' then
      begin
        Obj.Tessellate := nodeTmp.Text;
        Obj.TessellateExsit := True;
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
;
    end;
  except
    raise Exception.Create('Polygon Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLPolygon_ToXML(Obj: TKMLPolygon; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  ExtrudeTmp: IXMLNode;
  AltitudeModeTmp: IXMLNode;
  TessellateTmp: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'Polygon';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    TKMLGeometry_ToXML(Obj, node);
    if Obj.ExtrudeExsit then
    begin
      ExtrudeTmp := doc.CreateNode('extrude', ntElement);
      ExtrudeTmp.NodeValue := Obj.Extrude;
      node.ChildNodes.Add(ExtrudeTmp);
    end;
    if Obj.AltitudeModeExsit then
    begin
      AltitudeModeTmp := doc.CreateNode('altitudeMode', ntElement);
      AltitudeModeTmp.NodeValue := Obj.AltitudeMode;
      node.ChildNodes.Add(AltitudeModeTmp);
    end;
    for I := 0 to Obj.OuterBoundaryIss.Count - 1 do
       TKMLBoundary_ToXML(Obj.OuterBoundaryIs[I], node, 'outerBoundaryIs');
    for I := 0 to Obj.InnerBoundaryIss.Count - 1 do
       TKMLBoundary_ToXML(Obj.InnerBoundaryIs[I], node, 'innerBoundaryIs');
    if Obj.TessellateExsit then
    begin
      TessellateTmp := doc.CreateNode('tessellate', ntElement);
      TessellateTmp.NodeValue := Obj.Tessellate;
      node.ChildNodes.Add(TessellateTmp);
    end;
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLBoundary_FromXML(Obj: TKMLBoundary; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
begin
  try
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'LinearRing' then
      begin
        Obj.LinearRing := TKMLLinearRing.Create;
        TKMLLinearRing_FromXML(Obj.LinearRing, nodeTmp);
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
;
    end;
  except
    raise Exception.Create('Boundary Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLBoundary_ToXML(Obj: TKMLBoundary; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'Boundary';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    TKMLLinearRing_ToXML(Obj.LinearRing, node, 'LinearRing');
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLLinearRing_FromXML(Obj: TKMLLinearRing; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
begin
  try
    TKMLGeometry_FromXML(Obj, node);
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'coordinates' then
      begin
        Obj.Coordinates := StringToCoordinates(nodeTmp.Text);
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
;
    end;
  except
    raise Exception.Create('LinearRing Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLLinearRing_ToXML(Obj: TKMLLinearRing; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  CoordinatesTmp: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'LinearRing';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    TKMLGeometry_ToXML(Obj, node);
    CoordinatesTmp := doc.CreateNode('coordinates', ntElement);
    CoordinatesTmp.NodeValue := CoordinatesToString(Obj.Coordinates);
    node.ChildNodes.Add(CoordinatesTmp);
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLLineString_FromXML(Obj: TKMLLineString; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
begin
  try
    TKMLGeometry_FromXML(Obj, node);
    Obj.TessellateExsit := False;
    Obj.AltitudeModeExsit := False;
    Obj.ExtrudeExsit := False;
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'tessellate' then
      begin
        Obj.Tessellate := nodeTmp.Text;
        Obj.TessellateExsit := True;
      end
      else if nodeTmp.NodeName = 'altitudeMode' then
      begin
        Obj.AltitudeMode := nodeTmp.Text;
        Obj.AltitudeModeExsit := True;
      end
      else if nodeTmp.NodeName = 'extrude' then
      begin
        Obj.Extrude := nodeTmp.Text;
        Obj.ExtrudeExsit := True;
      end
      else if nodeTmp.NodeName = 'coordinates' then
      begin
        Obj.Coordinates := StringToCoordinates(nodeTmp.Text);
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
;
    end;
  except
    raise Exception.Create('LineString Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLLineString_ToXML(Obj: TKMLLineString; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  TessellateTmp: IXMLNode;
  AltitudeModeTmp: IXMLNode;
  ExtrudeTmp: IXMLNode;
  CoordinatesTmp: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'LineString';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    TKMLGeometry_ToXML(Obj, node);
    if Obj.TessellateExsit then
    begin
      TessellateTmp := doc.CreateNode('tessellate', ntElement);
      TessellateTmp.NodeValue := Obj.Tessellate;
      node.ChildNodes.Add(TessellateTmp);
    end;
    if Obj.AltitudeModeExsit then
    begin
      AltitudeModeTmp := doc.CreateNode('altitudeMode', ntElement);
      AltitudeModeTmp.NodeValue := Obj.AltitudeMode;
      node.ChildNodes.Add(AltitudeModeTmp);
    end;
    if Obj.ExtrudeExsit then
    begin
      ExtrudeTmp := doc.CreateNode('extrude', ntElement);
      ExtrudeTmp.NodeValue := Obj.Extrude;
      node.ChildNodes.Add(ExtrudeTmp);
    end;
    CoordinatesTmp := doc.CreateNode('coordinates', ntElement);
    CoordinatesTmp.NodeValue := CoordinatesToString(Obj.Coordinates);
    node.ChildNodes.Add(CoordinatesTmp);
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLLookAt_FromXML(Obj: TKMLLookAt; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
begin
  try
    Obj.LongitudeExsit := False;
    Obj.LatitudeExsit := False;
    Obj.AltitudeExsit := False;
    Obj.HeadingExsit := False;
    Obj.TiltExsit := False;
    Obj.RangeExsit := False;
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'longitude' then
      begin
        Obj.Longitude := StrToFloatDef(nodeTmp.Text, 0);;
        Obj.LongitudeExsit := True;
      end
      else if nodeTmp.NodeName = 'latitude' then
      begin
        Obj.Latitude := StrToFloatDef(nodeTmp.Text, 0);;
        Obj.LatitudeExsit := True;
      end
      else if nodeTmp.NodeName = 'altitude' then
      begin
        Obj.Altitude := StrToFloatDef(nodeTmp.Text, 0);;
        Obj.AltitudeExsit := True;
      end
      else if nodeTmp.NodeName = 'heading' then
      begin
        Obj.Heading := StrToFloatDef(nodeTmp.Text, 0);;
        Obj.HeadingExsit := True;
      end
      else if nodeTmp.NodeName = 'tilt' then
      begin
        Obj.Tilt := StrToFloatDef(nodeTmp.Text, 0);;
        Obj.TiltExsit := True;
      end
      else if nodeTmp.NodeName = 'range' then
      begin
        Obj.Range := StrToFloatDef(nodeTmp.Text, 0);;
        Obj.RangeExsit := True;
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
;
    end;
  except
    raise Exception.Create('LookAt Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLLookAt_ToXML(Obj: TKMLLookAt; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  LongitudeTmp: IXMLNode;
  LatitudeTmp: IXMLNode;
  AltitudeTmp: IXMLNode;
  HeadingTmp: IXMLNode;
  TiltTmp: IXMLNode;
  RangeTmp: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'LookAt';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    if Obj.LongitudeExsit then
    begin
      LongitudeTmp := doc.CreateNode('longitude', ntElement);
      LongitudeTmp.NodeValue := FloatToStr(Obj.Longitude);
      node.ChildNodes.Add(LongitudeTmp);
    end;
    if Obj.LatitudeExsit then
    begin
      LatitudeTmp := doc.CreateNode('latitude', ntElement);
      LatitudeTmp.NodeValue := FloatToStr(Obj.Latitude);
      node.ChildNodes.Add(LatitudeTmp);
    end;
    if Obj.AltitudeExsit then
    begin
      AltitudeTmp := doc.CreateNode('altitude', ntElement);
      AltitudeTmp.NodeValue := FloatToStr(Obj.Altitude);
      node.ChildNodes.Add(AltitudeTmp);
    end;
    if Obj.HeadingExsit then
    begin
      HeadingTmp := doc.CreateNode('heading', ntElement);
      HeadingTmp.NodeValue := FloatToStr(Obj.Heading);
      node.ChildNodes.Add(HeadingTmp);
    end;
    if Obj.TiltExsit then
    begin
      TiltTmp := doc.CreateNode('tilt', ntElement);
      TiltTmp.NodeValue := FloatToStr(Obj.Tilt);
      node.ChildNodes.Add(TiltTmp);
    end;
    if Obj.RangeExsit then
    begin
      RangeTmp := doc.CreateNode('range', ntElement);
      RangeTmp.NodeValue := FloatToStr(Obj.Range);
      node.ChildNodes.Add(RangeTmp);
    end;
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLLatLonBox_FromXML(Obj: TKMLLatLonBox; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
begin
  try
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'north' then
      begin
        Obj.North := StrToFloatDef(nodeTmp.Text, 0);;
      end
      else if nodeTmp.NodeName = 'south' then
      begin
        Obj.South := StrToFloatDef(nodeTmp.Text, 0);;
      end
      else if nodeTmp.NodeName = 'east' then
      begin
        Obj.East := StrToFloatDef(nodeTmp.Text, 0);;
      end
      else if nodeTmp.NodeName = 'west' then
      begin
        Obj.West := StrToFloatDef(nodeTmp.Text, 0);;
      end
      else if nodeTmp.NodeName = 'rotation' then
      begin
        Obj.Rotation := StrToFloatDef(nodeTmp.Text, 0);;
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
;
    end;
  except
    raise Exception.Create('LatLonBox Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLLatLonBox_ToXML(Obj: TKMLLatLonBox; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  NorthTmp: IXMLNode;
  SouthTmp: IXMLNode;
  EastTmp: IXMLNode;
  WestTmp: IXMLNode;
  RotationTmp: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'LatLonBox';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    NorthTmp := doc.CreateNode('north', ntElement);
    NorthTmp.NodeValue := FloatToStr(Obj.North);
    node.ChildNodes.Add(NorthTmp);
    SouthTmp := doc.CreateNode('south', ntElement);
    SouthTmp.NodeValue := FloatToStr(Obj.South);
    node.ChildNodes.Add(SouthTmp);
    EastTmp := doc.CreateNode('east', ntElement);
    EastTmp.NodeValue := FloatToStr(Obj.East);
    node.ChildNodes.Add(EastTmp);
    WestTmp := doc.CreateNode('west', ntElement);
    WestTmp.NodeValue := FloatToStr(Obj.West);
    node.ChildNodes.Add(WestTmp);
    RotationTmp := doc.CreateNode('rotation', ntElement);
    RotationTmp.NodeValue := FloatToStr(Obj.Rotation);
    node.ChildNodes.Add(RotationTmp);
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLGroundOverlay_FromXML(Obj: TKMLGroundOverlay; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
begin
  try
    Obj.NameExsit := False;
    Obj.VisibilityExsit := False;
    Obj.DescriptionExsit := False;
    Obj.LookAtExsit := False;
    Obj.IconExsit := False;
    Obj.LatLonBoxExsit := False;
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'name' then
      begin
        Obj.Name := nodeTmp.Text;
        Obj.NameExsit := True;
      end
      else if nodeTmp.NodeName = 'visibility' then
      begin
        Obj.Visibility := StrToIntDef(nodeTmp.Text, 0);;
        Obj.VisibilityExsit := True;
      end
      else if nodeTmp.NodeName = 'description' then
      begin
        Obj.Description := nodeTmp.Text;
        Obj.DescriptionExsit := True;
      end
      else if nodeTmp.NodeName = 'LookAt' then
      begin
        Obj.LookAt := TKMLLookAt.Create;
        TKMLLookAt_FromXML(Obj.LookAt, nodeTmp);
        Obj.LookAtExsit := True;
      end
      else if nodeTmp.NodeName = 'Icon' then
      begin
        Obj.Icon := TKMLIcon.Create;
        TKMLIcon_FromXML(Obj.Icon, nodeTmp);
        Obj.IconExsit := True;
      end
      else if nodeTmp.NodeName = 'LatLonBox' then
      begin
        Obj.LatLonBox := TKMLLatLonBox.Create;
        TKMLLatLonBox_FromXML(Obj.LatLonBox, nodeTmp);
        Obj.LatLonBoxExsit := True;
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
;
    end;
  except
    raise Exception.Create('GroundOverlay Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLGroundOverlay_ToXML(Obj: TKMLGroundOverlay; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  NameTmp: IXMLNode;
  VisibilityTmp: IXMLNode;
  DescriptionTmp: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'GroundOverlay';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    if Obj.NameExsit then
    begin
      NameTmp := doc.CreateNode('name', ntElement);
      NameTmp.NodeValue := Obj.Name;
      node.ChildNodes.Add(NameTmp);
    end;
    if Obj.VisibilityExsit then
    begin
      VisibilityTmp := doc.CreateNode('visibility', ntElement);
      VisibilityTmp.NodeValue := IntToStr(Obj.Visibility);
      node.ChildNodes.Add(VisibilityTmp);
    end;
    if Obj.DescriptionExsit then
    begin
      DescriptionTmp := doc.CreateNode('description', ntElement);
      DescriptionTmp.NodeValue := Obj.Description;
      node.ChildNodes.Add(DescriptionTmp);
    end;
    if Obj.LookAtExsit then
      TKMLLookAt_ToXML(Obj.LookAt, node, 'LookAt');
    if Obj.IconExsit then
      TKMLIcon_ToXML(Obj.Icon, node, 'Icon');
    if Obj.LatLonBoxExsit then
      TKMLLatLonBox_ToXML(Obj.LatLonBox, node, 'LatLonBox');
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLExtendedData_FromXML(Obj: TKMLExtendedData; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
  DataTmp: TKMLData;
begin
  try
    Obj.DataClear;
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'Data' then
      begin
        DataTmp := TKMLData.Create;
        TKMLData_FromXML(DataTmp, nodeTmp);
        Obj.AddData(DataTmp);
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
;
    end;
  except
    raise Exception.Create('ExtendedData Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLExtendedData_ToXML(Obj: TKMLExtendedData; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'ExtendedData';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    for I := 0 to Obj.Datas.Count - 1 do
       TKMLData_ToXML(Obj.Data[I], node, 'Data');
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLData_FromXML(Obj: TKMLData; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
begin
  try
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'value' then
      begin
        Obj.Value := nodeTmp.Text;
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
      if nodeTmp.NodeName = 'name' then
      begin
        Obj.Name := nodeTmp.Text;
      end;
    end;
  except
    raise Exception.Create('Data Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLData_ToXML(Obj: TKMLData; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  NameTmp: IXMLNode;
  ValueTmp: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'Data';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    ValueTmp := doc.CreateNode('value', ntElement);
    ValueTmp.NodeValue := Obj.Value;
    node.ChildNodes.Add(ValueTmp);
    NameTmp := doc.CreateNode('name', ntAttribute);
    NameTmp.NodeValue := Obj.Name;
    node.AttributeNodes.Add(NameTmp);
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLSize_FromXML(Obj: TKMLSize; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
begin
  try
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
      if nodeTmp.NodeName = 'x' then
      begin
        Obj.X := StrToFloatDef(nodeTmp.Text, 0);;
      end
      else if nodeTmp.NodeName = 'y' then
      begin
        Obj.Y := StrToFloatDef(nodeTmp.Text, 0);;
      end
      else if nodeTmp.NodeName = 'xunits' then
      begin
        Obj.XUnits := nodeTmp.Text;
      end
      else if nodeTmp.NodeName = 'yunits' then
      begin
        Obj.YUnits := nodeTmp.Text;
      end;
    end;
  except
    raise Exception.Create('Size Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLSize_ToXML(Obj: TKMLSize; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  XTmp: IXMLNode;
  YTmp: IXMLNode;
  XUnitsTmp: IXMLNode;
  YUnitsTmp: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'Size';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    XTmp := doc.CreateNode('x', ntAttribute);
    XTmp.NodeValue := FloatToStr(Obj.X);
    node.AttributeNodes.Add(XTmp);
    YTmp := doc.CreateNode('y', ntAttribute);
    YTmp.NodeValue := FloatToStr(Obj.Y);
    node.AttributeNodes.Add(YTmp);
    XUnitsTmp := doc.CreateNode('xunits', ntAttribute);
    XUnitsTmp.NodeValue := Obj.XUnits;
    node.AttributeNodes.Add(XUnitsTmp);
    YUnitsTmp := doc.CreateNode('yunits', ntAttribute);
    YUnitsTmp.NodeValue := Obj.YUnits;
    node.AttributeNodes.Add(YUnitsTmp);
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLStyle_FromXML(Obj: TKMLStyle; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
begin
  try
    Obj.IconStyleExsit := False;
    Obj.LineStyleExsit := False;
    Obj.PolyStyleExsit := False;
    Obj.BalloonStyleExsit := False;
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'IconStyle' then
      begin
        Obj.IconStyle := TKMLIconStyle.Create;
        TKMLIconStyle_FromXML(Obj.IconStyle, nodeTmp);
        Obj.IconStyleExsit := True;
      end
      else if nodeTmp.NodeName = 'LineStyle' then
      begin
        Obj.LineStyle := TKMLLineStyle.Create;
        TKMLLineStyle_FromXML(Obj.LineStyle, nodeTmp);
        Obj.LineStyleExsit := True;
      end
      else if nodeTmp.NodeName = 'PolyStyle' then
      begin
        Obj.PolyStyle := TKMLLineStyle.Create;
        TKMLLineStyle_FromXML(Obj.PolyStyle, nodeTmp);
        Obj.PolyStyleExsit := True;
      end
      else if nodeTmp.NodeName = 'BalloonStyle' then
      begin
        Obj.BalloonStyle := TKMLBalloonStyle.Create;
        TKMLBalloonStyle_FromXML(Obj.BalloonStyle, nodeTmp);
        Obj.BalloonStyleExsit := True;
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
      if nodeTmp.NodeName = 'id' then
      begin
        Obj.ID := nodeTmp.Text;
      end;
    end;
  except
    raise Exception.Create('Style Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLStyle_ToXML(Obj: TKMLStyle; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  IDTmp: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'Style';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    if Obj.IconStyleExsit then
      TKMLIconStyle_ToXML(Obj.IconStyle, node, 'IconStyle');
    if Obj.LineStyleExsit then
      TKMLLineStyle_ToXML(Obj.LineStyle, node, 'LineStyle');
    if Obj.PolyStyleExsit then
      TKMLLineStyle_ToXML(Obj.PolyStyle, node, 'PolyStyle');
    if Obj.BalloonStyleExsit then
      TKMLBalloonStyle_ToXML(Obj.BalloonStyle, node, 'BalloonStyle');
    IDTmp := doc.CreateNode('id', ntAttribute);
    IDTmp.NodeValue := Obj.ID;
    node.AttributeNodes.Add(IDTmp);
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLIconStyle_FromXML(Obj: TKMLIconStyle; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
begin
  try
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'Icon' then
      begin
        Obj.Icon := TKMLIcon.Create;
        TKMLIcon_FromXML(Obj.Icon, nodeTmp);
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
;
    end;
  except
    raise Exception.Create('IconStyle Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLIconStyle_ToXML(Obj: TKMLIconStyle; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'IconStyle';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    TKMLIcon_ToXML(Obj.Icon, node, 'Icon');
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLIcon_FromXML(Obj: TKMLIcon; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
begin
  try
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'href' then
      begin
        Obj.href := nodeTmp.Text;
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
;
    end;
  except
    raise Exception.Create('Icon Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLIcon_ToXML(Obj: TKMLIcon; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  hrefTmp: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'Icon';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    hrefTmp := doc.CreateNode('href', ntElement);
    hrefTmp.NodeValue := Obj.href;
    node.ChildNodes.Add(hrefTmp);
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLLineStyle_FromXML(Obj: TKMLLineStyle; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
begin
  try
    Obj.colorExsit := False;
    Obj.widthExsit := False;
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'color' then
      begin
        Obj.color := nodeTmp.Text;
        Obj.colorExsit := True;
      end
      else if nodeTmp.NodeName = 'width' then
      begin
        Obj.width := StrToFloatDef(nodeTmp.Text, 0);;
        Obj.widthExsit := True;
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
;
    end;
  except
    raise Exception.Create('LineStyle Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLLineStyle_ToXML(Obj: TKMLLineStyle; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  colorTmp: IXMLNode;
  widthTmp: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'LineStyle';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    if Obj.colorExsit then
    begin
      colorTmp := doc.CreateNode('color', ntElement);
      colorTmp.NodeValue := Obj.color;
      node.ChildNodes.Add(colorTmp);
    end;
    if Obj.widthExsit then
    begin
      widthTmp := doc.CreateNode('width', ntElement);
      widthTmp.NodeValue := FloatToStr(Obj.width);
      node.ChildNodes.Add(widthTmp);
    end;
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLBalloonStyle_FromXML(Obj: TKMLBalloonStyle; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
begin
  try
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = '~text' then
      begin
        Obj.text := nodeTmp.Text;
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
;
    end;
  except
    raise Exception.Create('BalloonStyle Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLBalloonStyle_ToXML(Obj: TKMLBalloonStyle; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  textTmp: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'BalloonStyle';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    textTmp := doc.CreateNode('text', ntCData);
    textTmp.NodeValue := Obj.text;
    node.ChildNodes.Add(textTmp);
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLStyleMap_FromXML(Obj: TKMLStyleMap; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
  PairTmp: TKMLPair;
begin
  try
    Obj.PairClear;
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'Pair' then
      begin
        PairTmp := TKMLPair.Create;
        TKMLPair_FromXML(PairTmp, nodeTmp);
        Obj.AddPair(PairTmp);
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
      if nodeTmp.NodeName = 'id' then
      begin
        Obj.ID := nodeTmp.Text;
      end;
    end;
  except
    raise Exception.Create('StyleMap Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLStyleMap_ToXML(Obj: TKMLStyleMap; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  IDTmp: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'StyleMap';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    for I := 0 to Obj.Pairs.Count - 1 do
       TKMLPair_ToXML(Obj.Pair[I], node, 'Pair');
    IDTmp := doc.CreateNode('id', ntAttribute);
    IDTmp.NodeValue := Obj.ID;
    node.AttributeNodes.Add(IDTmp);
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLScreenOverlay_FromXML(Obj: TKMLScreenOverlay; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
begin
  try
    Obj.NameExsit := False;
    Obj.VisibilityExsit := False;
    Obj.DescriptionExsit := False;
    Obj.IconExsit := False;
    Obj.OverlayXYExsit := False;
    Obj.ScreenXYExsit := False;
    Obj.RotationXYExsit := False;
    Obj.SizeExsit := False;
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'name' then
      begin
        Obj.Name := nodeTmp.Text;
        Obj.NameExsit := True;
      end
      else if nodeTmp.NodeName = 'visibility' then
      begin
        Obj.Visibility := StrToIntDef(nodeTmp.Text, 0);;
        Obj.VisibilityExsit := True;
      end
      else if nodeTmp.NodeName = 'description' then
      begin
        Obj.Description := nodeTmp.Text;
        Obj.DescriptionExsit := True;
      end
      else if nodeTmp.NodeName = 'Icon' then
      begin
        Obj.Icon := TKMLIcon.Create;
        TKMLIcon_FromXML(Obj.Icon, nodeTmp);
        Obj.IconExsit := True;
      end
      else if nodeTmp.NodeName = 'overlayXY' then
      begin
        Obj.OverlayXY := TKMLSize.Create;
        TKMLSize_FromXML(Obj.OverlayXY, nodeTmp);
        Obj.OverlayXYExsit := True;
      end
      else if nodeTmp.NodeName = 'screenXY' then
      begin
        Obj.ScreenXY := TKMLSize.Create;
        TKMLSize_FromXML(Obj.ScreenXY, nodeTmp);
        Obj.ScreenXYExsit := True;
      end
      else if nodeTmp.NodeName = 'rotationXY' then
      begin
        Obj.RotationXY := TKMLSize.Create;
        TKMLSize_FromXML(Obj.RotationXY, nodeTmp);
        Obj.RotationXYExsit := True;
      end
      else if nodeTmp.NodeName = 'size' then
      begin
        Obj.Size := TKMLSize.Create;
        TKMLSize_FromXML(Obj.Size, nodeTmp);
        Obj.SizeExsit := True;
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
;
    end;
  except
    raise Exception.Create('ScreenOverlay Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLScreenOverlay_ToXML(Obj: TKMLScreenOverlay; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  NameTmp: IXMLNode;
  VisibilityTmp: IXMLNode;
  DescriptionTmp: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'ScreenOverlay';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    if Obj.NameExsit then
    begin
      NameTmp := doc.CreateNode('name', ntElement);
      NameTmp.NodeValue := Obj.Name;
      node.ChildNodes.Add(NameTmp);
    end;
    if Obj.VisibilityExsit then
    begin
      VisibilityTmp := doc.CreateNode('visibility', ntElement);
      VisibilityTmp.NodeValue := IntToStr(Obj.Visibility);
      node.ChildNodes.Add(VisibilityTmp);
    end;
    if Obj.DescriptionExsit then
    begin
      DescriptionTmp := doc.CreateNode('description', ntElement);
      DescriptionTmp.NodeValue := Obj.Description;
      node.ChildNodes.Add(DescriptionTmp);
    end;
    if Obj.IconExsit then
      TKMLIcon_ToXML(Obj.Icon, node, 'Icon');
    if Obj.OverlayXYExsit then
      TKMLSize_ToXML(Obj.OverlayXY, node, 'overlayXY');
    if Obj.ScreenXYExsit then
      TKMLSize_ToXML(Obj.ScreenXY, node, 'screenXY');
    if Obj.RotationXYExsit then
      TKMLSize_ToXML(Obj.RotationXY, node, 'rotationXY');
    if Obj.SizeExsit then
      TKMLSize_ToXML(Obj.Size, node, 'size');
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

procedure TKMLTree.TKMLPair_FromXML(Obj: TKMLPair; node: IXMLNode);
var
  I: Integer;
  nodeTmp: IXMLNode;
begin
  try
    Obj.KeyExsit := False;
    Obj.StyleUrlExsit := False;
    for I := 0 to node.ChildNodes.Count - 1 do
    begin
      nodeTmp := node.ChildNodes.Get(I);
      if nodeTmp.NodeName = 'key' then
      begin
        Obj.Key := nodeTmp.Text;
        Obj.KeyExsit := True;
      end
      else if nodeTmp.NodeName = 'styleUrl' then
      begin
        Obj.StyleUrl := nodeTmp.Text;
        Obj.StyleUrlExsit := True;
      end;
    end;
    for I := 0 to node.AttributeNodes.Count - 1 do
    begin
      nodeTmp := node.AttributeNodes.Get(I);
;
    end;
  except
    raise Exception.Create('Pair Read XML Error!' + node.Xml);
  end;
end;

procedure TKMLTree.TKMLPair_ToXML(Obj: TKMLPair; par: IXMLNode; pt: string);
var
  doc: IXMLDocument;
  node: IXMLNode;
  KeyTmp: IXMLNode;
  StyleUrlTmp: IXMLNode;
  I: Integer;
begin
  try
    doc := par.OwnerDocument;
  if (pt = '') or (pt[1] = '#') then
    pt := 'Pair';
    node := doc.CreateNode(pt);
    par.ChildNodes.Add(node);
    if Obj.KeyExsit then
    begin
      KeyTmp := doc.CreateNode('key', ntElement);
      KeyTmp.NodeValue := Obj.Key;
      node.ChildNodes.Add(KeyTmp);
    end;
    if Obj.StyleUrlExsit then
    begin
      StyleUrlTmp := doc.CreateNode('styleUrl', ntElement);
      StyleUrlTmp.NodeValue := Obj.StyleUrl;
      node.ChildNodes.Add(StyleUrlTmp);
    end;
  except
    raise Exception.Create('XML2Code Write XML Error!');
  end;
end;

    { TKMLFile }
procedure TKMLTree.TKMLFile_ToTree(Obj: TKMLFile; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('KMLFile');
  if Obj.XmlnsExsit then
    TreeNodeShape.AddChild('Xmlns:' + Obj.Xmlns);
  TKMLDocument_ToTree(obj.Document, TreeNodeShape.AddChildObject('Document', obj.Document));
  for I := 0 to obj.FolderCount - 1 do
  begin
    TKMLFolder_ToTree(obj.Folder[I], TreeNodeShape.AddChildObject('Folder', obj.Folder[I]));
  end;
end;

procedure TKMLTree.TKMLFile_ToPopupMenu(obj: TKMLFile; Sender: TObject);
var
  pop: TPopupMenu;
  XmlnsAddMenu: TMenuItem;
  FolderAddMenu: TMenuItem;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
    XmlnsAddMenu := TMenuItem.Create(pop);
    XmlnsAddMenu.Caption := 'Add Xmlns';
    XmlnsAddMenu.OnClick := TKMLFile_AddXmlnsEvent;
    pop.Items.Add(XmlnsAddMenu);
    FolderAddMenu := TMenuItem.Create(pop);
    FolderAddMenu.Caption := 'Add Folder';
    FolderAddMenu.OnClick := TKMLFile_AddFolderEvent;
    pop.Items.Add(FolderAddMenu);
  end;
end;

procedure TKMLTree.TKMLFile_ToInspector(obj: TKMLFile; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  Names_Value.Add('Xmlns');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.Xmlns);
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLFile_SetXMLProperty(obj: TKMLFile; Index: Integer; _Value: String);
begin
  case index of
    0:
      begin
        obj.Xmlns := _Value;
      end;
  end;
  TKMLFile_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLFile_Copy(source, target: TKMLFile);
var
  I:Integer;
begin
  target.Xmlns := source.Xmlns;
  target.XmlnsExsit := source.XmlnsExsit;
      TKMLDocument_Copy(source.Document, target.Document);
  target.FolderClear;
  for I := 0 to source.FolderCount - 1 do
  begin
      TKMLFolder_Copy(source.Folder[I], target. AddNewFolder);
  end;
  TKMLFile_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLFile_PasteToEvent(obj: TKMLFile; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
  tmpFolder: TKMLFolder;
begin
  if (items.Count = 1) and (items[0] is TKMLFile) and (not isCut) then
  begin
    TKMLFile_Copy(TKMLFile(items[0]), obj);
    TKMLFile_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
    if items[I] is TKMLFolder then
    begin
      tmpFolder := TKMLFolder(items[I]);
      if isCut then
      begin
      end
      else
      begin
        TKMLFolder_Copy(tmpFolder, obj.AddNewFolder);
      end;
    end;
  end;
  TKMLFile_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLFile_ChildDeleteEvent(obj: TKMLFile; del: TObject);
begin
  if del is TKMLFolder then
  begin
    TKMLFile(obj).RemoveFolder(TKMLFolder(del));
    TKMLFile_ToTree(TKMLFile(obj), TargetNode);
  end;
end;
procedure TKMLTree.TKMLFile_AddXmlnsEvent(Sender: TObject);
begin
  TKMLFile(TargetObject).AddXmlns;
  TKMLFile_ToTree(TKMLFile(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLFile_AddFolderEvent(Sender: TObject);
begin
  TKMLFile(TargetObject).AddNewFolder;
  TKMLFile_ToTree(TKMLFile(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLFile_FolderDeleteEvent(obj: TKMLFile; del: TObject);
begin
  if del is TKMLFolder then
  begin
    TKMLFile(obj).RemoveFolder(TKMLFolder(del));
    TKMLFile_ToTree(TKMLFile(obj), TargetNode);
  end;
end;

    { TKMLDocument }
procedure TKMLTree.TKMLDocument_ToTree(Obj: TKMLDocument; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('Document');
  if Obj.NameExsit then
    TreeNodeShape.AddChild('Name:' + Obj.Name);
  if Obj.OpenExsit then
    TreeNodeShape.AddChild('Open:' + IntToStr(Obj.Open));
  if Obj.VisibilityExsit then
    TreeNodeShape.AddChild('Visibility:' + IntToStr(Obj.Visibility));
  if Obj.DescriptionExsit then
    TreeNodeShape.AddChild('Description:' + Obj.Description);
  if Obj.LookAtExsit then
  begin
    TKMLLookAt_ToTree(obj.LookAt, TreeNodeShape.AddChildObject('LookAt', obj.LookAt));
  end;
  for I := 0 to obj.StyleMapCount - 1 do
  begin
    TKMLStyleMap_ToTree(obj.StyleMap[I], TreeNodeShape.AddChildObject('StyleMap', obj.StyleMap[I]));
  end;
  for I := 0 to obj.StyleCount - 1 do
  begin
    TKMLStyle_ToTree(obj.Style[I], TreeNodeShape.AddChildObject('Style', obj.Style[I]));
  end;
  for I := 0 to obj.PlacemarkCount - 1 do
  begin
    TKMLPlacemark_ToTree(obj.Placemark[I], TreeNodeShape.AddChildObject('Placemark', obj.Placemark[I]));
  end;
  for I := 0 to obj.FolderCount - 1 do
  begin
    TKMLFolder_ToTree(obj.Folder[I], TreeNodeShape.AddChildObject('Folder', obj.Folder[I]));
  end;
end;

procedure TKMLTree.TKMLDocument_ToPopupMenu(obj: TKMLDocument; Sender: TObject);
var
  pop: TPopupMenu;
  NameAddMenu: TMenuItem;
  OpenAddMenu: TMenuItem;
  VisibilityAddMenu: TMenuItem;
  DescriptionAddMenu: TMenuItem;
  LookAtAddMenu: TMenuItem;
  StyleMapAddMenu: TMenuItem;
  StyleAddMenu: TMenuItem;
  PlacemarkAddMenu: TMenuItem;
  FolderAddMenu: TMenuItem;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
    NameAddMenu := TMenuItem.Create(pop);
    NameAddMenu.Caption := 'Add Name';
    NameAddMenu.OnClick := TKMLDocument_AddNameEvent;
    pop.Items.Add(NameAddMenu);
    OpenAddMenu := TMenuItem.Create(pop);
    OpenAddMenu.Caption := 'Add Open';
    OpenAddMenu.OnClick := TKMLDocument_AddOpenEvent;
    pop.Items.Add(OpenAddMenu);
    VisibilityAddMenu := TMenuItem.Create(pop);
    VisibilityAddMenu.Caption := 'Add Visibility';
    VisibilityAddMenu.OnClick := TKMLDocument_AddVisibilityEvent;
    pop.Items.Add(VisibilityAddMenu);
    DescriptionAddMenu := TMenuItem.Create(pop);
    DescriptionAddMenu.Caption := 'Add Description';
    DescriptionAddMenu.OnClick := TKMLDocument_AddDescriptionEvent;
    pop.Items.Add(DescriptionAddMenu);
    LookAtAddMenu := TMenuItem.Create(pop);
    LookAtAddMenu.Caption := 'Add LookAt';
    LookAtAddMenu.OnClick := TKMLDocument_AddLookAtEvent;
    pop.Items.Add(LookAtAddMenu);
    StyleMapAddMenu := TMenuItem.Create(pop);
    StyleMapAddMenu.Caption := 'Add StyleMap';
    StyleMapAddMenu.OnClick := TKMLDocument_AddStyleMapEvent;
    pop.Items.Add(StyleMapAddMenu);
    StyleAddMenu := TMenuItem.Create(pop);
    StyleAddMenu.Caption := 'Add Style';
    StyleAddMenu.OnClick := TKMLDocument_AddStyleEvent;
    pop.Items.Add(StyleAddMenu);
    PlacemarkAddMenu := TMenuItem.Create(pop);
    PlacemarkAddMenu.Caption := 'Add Placemark';
    PlacemarkAddMenu.OnClick := TKMLDocument_AddPlacemarkEvent;
    pop.Items.Add(PlacemarkAddMenu);
    FolderAddMenu := TMenuItem.Create(pop);
    FolderAddMenu.Caption := 'Add Folder';
    FolderAddMenu.OnClick := TKMLDocument_AddFolderEvent;
    pop.Items.Add(FolderAddMenu);
  end;
end;

procedure TKMLTree.TKMLDocument_ToInspector(obj: TKMLDocument; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  Names_Value.Add('Name');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.Name);
  Names_Value.Add('Open');
  Types_Value.Add(xs_integer);
  _Values_Value.Add(IntToStr(Obj.Open));
  Names_Value.Add('Visibility');
  Types_Value.Add(xs_integer);
  _Values_Value.Add(IntToStr(Obj.Visibility));
  Names_Value.Add('Description');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.Description);
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLDocument_SetXMLProperty(obj: TKMLDocument; Index: Integer; _Value: String);
begin
  case index of
    0:
      begin
        obj.Name := _Value;
      end;
    1:
      begin
        obj.Open := StrToIntDef(_Value, 0);;
      end;
    2:
      begin
        obj.Visibility := StrToIntDef(_Value, 0);;
      end;
    3:
      begin
        obj.Description := _Value;
      end;
  end;
  TKMLDocument_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLDocument_Copy(source, target: TKMLDocument);
var
  I:Integer;
begin
  target.Name := source.Name;
  target.NameExsit := source.NameExsit;
  target.Open := source.Open;
  target.OpenExsit := source.OpenExsit;
  target.Visibility := source.Visibility;
  target.VisibilityExsit := source.VisibilityExsit;
  target.Description := source.Description;
  target.DescriptionExsit := source.DescriptionExsit;
  target.LookAtExsit := source.LookAtExsit;
  if source.LookAtExsit then
  begin
      TKMLLookAt_Copy(source.LookAt, target.AddLookAt);
  end;
  target.StyleMapClear;
  for I := 0 to source.StyleMapCount - 1 do
  begin
      TKMLStyleMap_Copy(source.StyleMap[I], target. AddNewStyleMap);
  end;
  target.StyleClear;
  for I := 0 to source.StyleCount - 1 do
  begin
      TKMLStyle_Copy(source.Style[I], target. AddNewStyle);
  end;
  target.PlacemarkClear;
  for I := 0 to source.PlacemarkCount - 1 do
  begin
      TKMLPlacemark_Copy(source.Placemark[I], target. AddNewPlacemark);
  end;
  target.FolderClear;
  for I := 0 to source.FolderCount - 1 do
  begin
      TKMLFolder_Copy(source.Folder[I], target. AddNewFolder);
  end;
  TKMLDocument_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLDocument_PasteToEvent(obj: TKMLDocument; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
  tmpStyleMap: TKMLStyleMap;
  tmpStyle: TKMLStyle;
  tmpPlacemark: TKMLPlacemark;
  tmpFolder: TKMLFolder;
begin
  if (items.Count = 1) and (items[0] is TKMLDocument) and (not isCut) then
  begin
    TKMLDocument_Copy(TKMLDocument(items[0]), obj);
    TKMLDocument_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
    if items[I] is TKMLStyleMap then
    begin
      tmpStyleMap := TKMLStyleMap(items[I]);
      if isCut then
      begin
      end
      else
      begin
        TKMLStyleMap_Copy(tmpStyleMap, obj.AddNewStyleMap);
      end;
    end;
    if items[I] is TKMLStyle then
    begin
      tmpStyle := TKMLStyle(items[I]);
      if isCut then
      begin
      end
      else
      begin
        TKMLStyle_Copy(tmpStyle, obj.AddNewStyle);
      end;
    end;
    if items[I] is TKMLPlacemark then
    begin
      tmpPlacemark := TKMLPlacemark(items[I]);
      if isCut then
      begin
      end
      else
      begin
        TKMLPlacemark_Copy(tmpPlacemark, obj.AddNewPlacemark);
      end;
    end;
    if items[I] is TKMLFolder then
    begin
      tmpFolder := TKMLFolder(items[I]);
      if isCut then
      begin
      end
      else
      begin
        TKMLFolder_Copy(tmpFolder, obj.AddNewFolder);
      end;
    end;
  end;
  TKMLDocument_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLDocument_ChildDeleteEvent(obj: TKMLDocument; del: TObject);
begin
  if del is TKMLStyleMap then
  begin
    TKMLDocument(obj).RemoveStyleMap(TKMLStyleMap(del));
    TKMLDocument_ToTree(TKMLDocument(obj), TargetNode);
  end;
  if del is TKMLStyle then
  begin
    TKMLDocument(obj).RemoveStyle(TKMLStyle(del));
    TKMLDocument_ToTree(TKMLDocument(obj), TargetNode);
  end;
  if del is TKMLPlacemark then
  begin
    TKMLDocument(obj).RemovePlacemark(TKMLPlacemark(del));
    TKMLDocument_ToTree(TKMLDocument(obj), TargetNode);
  end;
  if del is TKMLFolder then
  begin
    TKMLDocument(obj).RemoveFolder(TKMLFolder(del));
    TKMLDocument_ToTree(TKMLDocument(obj), TargetNode);
  end;
end;
procedure TKMLTree.TKMLDocument_AddNameEvent(Sender: TObject);
begin
  TKMLDocument(TargetObject).AddName;
  TKMLDocument_ToTree(TKMLDocument(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLDocument_AddOpenEvent(Sender: TObject);
begin
  TKMLDocument(TargetObject).AddOpen;
  TKMLDocument_ToTree(TKMLDocument(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLDocument_AddVisibilityEvent(Sender: TObject);
begin
  TKMLDocument(TargetObject).AddVisibility;
  TKMLDocument_ToTree(TKMLDocument(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLDocument_AddDescriptionEvent(Sender: TObject);
begin
  TKMLDocument(TargetObject).AddDescription;
  TKMLDocument_ToTree(TKMLDocument(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLDocument_AddLookAtEvent(Sender: TObject);
begin
  TKMLDocument(TargetObject).AddLookAt;
  TKMLDocument_ToTree(TKMLDocument(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLDocument_LookAtDeleteEvent(obj: TKMLDocument; del: TObject);
begin
  if del is TKMLLookAt then
  begin
    TKMLDocument(obj).LookAtRemove;
    TKMLDocument_ToTree(TKMLDocument(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLDocument_AddStyleMapEvent(Sender: TObject);
begin
  TKMLDocument(TargetObject).AddNewStyleMap;
  TKMLDocument_ToTree(TKMLDocument(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLDocument_StyleMapDeleteEvent(obj: TKMLDocument; del: TObject);
begin
  if del is TKMLStyleMap then
  begin
    TKMLDocument(obj).RemoveStyleMap(TKMLStyleMap(del));
    TKMLDocument_ToTree(TKMLDocument(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLDocument_AddStyleEvent(Sender: TObject);
begin
  TKMLDocument(TargetObject).AddNewStyle;
  TKMLDocument_ToTree(TKMLDocument(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLDocument_StyleDeleteEvent(obj: TKMLDocument; del: TObject);
begin
  if del is TKMLStyle then
  begin
    TKMLDocument(obj).RemoveStyle(TKMLStyle(del));
    TKMLDocument_ToTree(TKMLDocument(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLDocument_AddPlacemarkEvent(Sender: TObject);
begin
  TKMLDocument(TargetObject).AddNewPlacemark;
  TKMLDocument_ToTree(TKMLDocument(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLDocument_PlacemarkDeleteEvent(obj: TKMLDocument; del: TObject);
begin
  if del is TKMLPlacemark then
  begin
    TKMLDocument(obj).RemovePlacemark(TKMLPlacemark(del));
    TKMLDocument_ToTree(TKMLDocument(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLDocument_AddFolderEvent(Sender: TObject);
begin
  TKMLDocument(TargetObject).AddNewFolder;
  TKMLDocument_ToTree(TKMLDocument(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLDocument_FolderDeleteEvent(obj: TKMLDocument; del: TObject);
begin
  if del is TKMLFolder then
  begin
    TKMLDocument(obj).RemoveFolder(TKMLFolder(del));
    TKMLDocument_ToTree(TKMLDocument(obj), TargetNode);
  end;
end;

    { TKMLFolder }
procedure TKMLTree.TKMLFolder_ToTree(Obj: TKMLFolder; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('Folder');
  if Obj.NameExsit then
    TreeNodeShape.AddChild('Name:' + Obj.Name);
  if Obj.OpenExsit then
    TreeNodeShape.AddChild('Open:' + IntToStr(Obj.Open));
  if Obj.VisibilityExsit then
    TreeNodeShape.AddChild('Visibility:' + IntToStr(Obj.Visibility));
  if Obj.DescriptionExsit then
    TreeNodeShape.AddChild('Description:' + Obj.Description);
  if Obj.LookAtExsit then
  begin
    TKMLLookAt_ToTree(obj.LookAt, TreeNodeShape.AddChildObject('LookAt', obj.LookAt));
  end;
  if Obj.DocumentExsit then
  begin
    TKMLDocument_ToTree(obj.Document, TreeNodeShape.AddChildObject('Document', obj.Document));
  end;
  for I := 0 to obj.GroundOverlayCount - 1 do
  begin
    TKMLGroundOverlay_ToTree(obj.GroundOverlay[I], TreeNodeShape.AddChildObject('GroundOverlay', obj.GroundOverlay[I]));
  end;
  for I := 0 to obj.PlacemarkCount - 1 do
  begin
    TKMLPlacemark_ToTree(obj.Placemark[I], TreeNodeShape.AddChildObject('Placemark', obj.Placemark[I]));
  end;
  for I := 0 to obj.ScreenOverlayCount - 1 do
  begin
    TKMLScreenOverlay_ToTree(obj.ScreenOverlay[I], TreeNodeShape.AddChildObject('ScreenOverlay', obj.ScreenOverlay[I]));
  end;
  for I := 0 to obj.FolderCount - 1 do
  begin
    TKMLFolder_ToTree(obj.Folder[I], TreeNodeShape.AddChildObject('Folder', obj.Folder[I]));
  end;
end;

procedure TKMLTree.TKMLFolder_ToPopupMenu(obj: TKMLFolder; Sender: TObject);
var
  pop: TPopupMenu;
  NameAddMenu: TMenuItem;
  OpenAddMenu: TMenuItem;
  VisibilityAddMenu: TMenuItem;
  DescriptionAddMenu: TMenuItem;
  LookAtAddMenu: TMenuItem;
  DocumentAddMenu: TMenuItem;
  GroundOverlayAddMenu: TMenuItem;
  PlacemarkAddMenu: TMenuItem;
  ScreenOverlayAddMenu: TMenuItem;
  FolderAddMenu: TMenuItem;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
    NameAddMenu := TMenuItem.Create(pop);
    NameAddMenu.Caption := 'Add Name';
    NameAddMenu.OnClick := TKMLFolder_AddNameEvent;
    pop.Items.Add(NameAddMenu);
    OpenAddMenu := TMenuItem.Create(pop);
    OpenAddMenu.Caption := 'Add Open';
    OpenAddMenu.OnClick := TKMLFolder_AddOpenEvent;
    pop.Items.Add(OpenAddMenu);
    VisibilityAddMenu := TMenuItem.Create(pop);
    VisibilityAddMenu.Caption := 'Add Visibility';
    VisibilityAddMenu.OnClick := TKMLFolder_AddVisibilityEvent;
    pop.Items.Add(VisibilityAddMenu);
    DescriptionAddMenu := TMenuItem.Create(pop);
    DescriptionAddMenu.Caption := 'Add Description';
    DescriptionAddMenu.OnClick := TKMLFolder_AddDescriptionEvent;
    pop.Items.Add(DescriptionAddMenu);
    LookAtAddMenu := TMenuItem.Create(pop);
    LookAtAddMenu.Caption := 'Add LookAt';
    LookAtAddMenu.OnClick := TKMLFolder_AddLookAtEvent;
    pop.Items.Add(LookAtAddMenu);
    DocumentAddMenu := TMenuItem.Create(pop);
    DocumentAddMenu.Caption := 'Add Document';
    DocumentAddMenu.OnClick := TKMLFolder_AddDocumentEvent;
    pop.Items.Add(DocumentAddMenu);
    GroundOverlayAddMenu := TMenuItem.Create(pop);
    GroundOverlayAddMenu.Caption := 'Add GroundOverlay';
    GroundOverlayAddMenu.OnClick := TKMLFolder_AddGroundOverlayEvent;
    pop.Items.Add(GroundOverlayAddMenu);
    PlacemarkAddMenu := TMenuItem.Create(pop);
    PlacemarkAddMenu.Caption := 'Add Placemark';
    PlacemarkAddMenu.OnClick := TKMLFolder_AddPlacemarkEvent;
    pop.Items.Add(PlacemarkAddMenu);
    ScreenOverlayAddMenu := TMenuItem.Create(pop);
    ScreenOverlayAddMenu.Caption := 'Add ScreenOverlay';
    ScreenOverlayAddMenu.OnClick := TKMLFolder_AddScreenOverlayEvent;
    pop.Items.Add(ScreenOverlayAddMenu);
    FolderAddMenu := TMenuItem.Create(pop);
    FolderAddMenu.Caption := 'Add Folder';
    FolderAddMenu.OnClick := TKMLFolder_AddFolderEvent;
    pop.Items.Add(FolderAddMenu);
  end;
end;

procedure TKMLTree.TKMLFolder_ToInspector(obj: TKMLFolder; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  Names_Value.Add('Name');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.Name);
  Names_Value.Add('Open');
  Types_Value.Add(xs_integer);
  _Values_Value.Add(IntToStr(Obj.Open));
  Names_Value.Add('Visibility');
  Types_Value.Add(xs_integer);
  _Values_Value.Add(IntToStr(Obj.Visibility));
  Names_Value.Add('Description');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.Description);
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLFolder_SetXMLProperty(obj: TKMLFolder; Index: Integer; _Value: String);
begin
  case index of
    0:
      begin
        obj.Name := _Value;
      end;
    1:
      begin
        obj.Open := StrToIntDef(_Value, 0);;
      end;
    2:
      begin
        obj.Visibility := StrToIntDef(_Value, 0);;
      end;
    3:
      begin
        obj.Description := _Value;
      end;
  end;
  TKMLFolder_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLFolder_Copy(source, target: TKMLFolder);
var
  I:Integer;
begin
  target.Name := source.Name;
  target.NameExsit := source.NameExsit;
  target.Open := source.Open;
  target.OpenExsit := source.OpenExsit;
  target.Visibility := source.Visibility;
  target.VisibilityExsit := source.VisibilityExsit;
  target.Description := source.Description;
  target.DescriptionExsit := source.DescriptionExsit;
  target.LookAtExsit := source.LookAtExsit;
  if source.LookAtExsit then
  begin
      TKMLLookAt_Copy(source.LookAt, target.AddLookAt);
  end;
  target.DocumentExsit := source.DocumentExsit;
  if source.DocumentExsit then
  begin
      TKMLDocument_Copy(source.Document, target.AddDocument);
  end;
  target.GroundOverlayClear;
  for I := 0 to source.GroundOverlayCount - 1 do
  begin
      TKMLGroundOverlay_Copy(source.GroundOverlay[I], target. AddNewGroundOverlay);
  end;
  target.PlacemarkClear;
  for I := 0 to source.PlacemarkCount - 1 do
  begin
      TKMLPlacemark_Copy(source.Placemark[I], target. AddNewPlacemark);
  end;
  target.ScreenOverlayClear;
  for I := 0 to source.ScreenOverlayCount - 1 do
  begin
      TKMLScreenOverlay_Copy(source.ScreenOverlay[I], target. AddNewScreenOverlay);
  end;
  target.FolderClear;
  for I := 0 to source.FolderCount - 1 do
  begin
      TKMLFolder_Copy(source.Folder[I], target. AddNewFolder);
  end;
  TKMLFolder_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLFolder_PasteToEvent(obj: TKMLFolder; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
  tmpGroundOverlay: TKMLGroundOverlay;
  tmpPlacemark: TKMLPlacemark;
  tmpScreenOverlay: TKMLScreenOverlay;
  tmpFolder: TKMLFolder;
begin
  if (items.Count = 1) and (items[0] is TKMLFolder) and (not isCut) then
  begin
    TKMLFolder_Copy(TKMLFolder(items[0]), obj);
    TKMLFolder_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
    if items[I] is TKMLGroundOverlay then
    begin
      tmpGroundOverlay := TKMLGroundOverlay(items[I]);
      if isCut then
      begin
      end
      else
      begin
        TKMLGroundOverlay_Copy(tmpGroundOverlay, obj.AddNewGroundOverlay);
      end;
    end;
    if items[I] is TKMLPlacemark then
    begin
      tmpPlacemark := TKMLPlacemark(items[I]);
      if isCut then
      begin
      end
      else
      begin
        TKMLPlacemark_Copy(tmpPlacemark, obj.AddNewPlacemark);
      end;
    end;
    if items[I] is TKMLScreenOverlay then
    begin
      tmpScreenOverlay := TKMLScreenOverlay(items[I]);
      if isCut then
      begin
      end
      else
      begin
        TKMLScreenOverlay_Copy(tmpScreenOverlay, obj.AddNewScreenOverlay);
      end;
    end;
    if items[I] is TKMLFolder then
    begin
      tmpFolder := TKMLFolder(items[I]);
      if isCut then
      begin
      end
      else
      begin
        TKMLFolder_Copy(tmpFolder, obj.AddNewFolder);
      end;
    end;
  end;
  TKMLFolder_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLFolder_ChildDeleteEvent(obj: TKMLFolder; del: TObject);
begin
  if del is TKMLGroundOverlay then
  begin
    TKMLFolder(obj).RemoveGroundOverlay(TKMLGroundOverlay(del));
    TKMLFolder_ToTree(TKMLFolder(obj), TargetNode);
  end;
  if del is TKMLPlacemark then
  begin
    TKMLFolder(obj).RemovePlacemark(TKMLPlacemark(del));
    TKMLFolder_ToTree(TKMLFolder(obj), TargetNode);
  end;
  if del is TKMLScreenOverlay then
  begin
    TKMLFolder(obj).RemoveScreenOverlay(TKMLScreenOverlay(del));
    TKMLFolder_ToTree(TKMLFolder(obj), TargetNode);
  end;
  if del is TKMLFolder then
  begin
    TKMLFolder(obj).RemoveFolder(TKMLFolder(del));
    TKMLFolder_ToTree(TKMLFolder(obj), TargetNode);
  end;
end;
procedure TKMLTree.TKMLFolder_AddNameEvent(Sender: TObject);
begin
  TKMLFolder(TargetObject).AddName;
  TKMLFolder_ToTree(TKMLFolder(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLFolder_AddOpenEvent(Sender: TObject);
begin
  TKMLFolder(TargetObject).AddOpen;
  TKMLFolder_ToTree(TKMLFolder(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLFolder_AddVisibilityEvent(Sender: TObject);
begin
  TKMLFolder(TargetObject).AddVisibility;
  TKMLFolder_ToTree(TKMLFolder(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLFolder_AddDescriptionEvent(Sender: TObject);
begin
  TKMLFolder(TargetObject).AddDescription;
  TKMLFolder_ToTree(TKMLFolder(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLFolder_AddLookAtEvent(Sender: TObject);
begin
  TKMLFolder(TargetObject).AddLookAt;
  TKMLFolder_ToTree(TKMLFolder(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLFolder_LookAtDeleteEvent(obj: TKMLFolder; del: TObject);
begin
  if del is TKMLLookAt then
  begin
    TKMLFolder(obj).LookAtRemove;
    TKMLFolder_ToTree(TKMLFolder(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLFolder_AddDocumentEvent(Sender: TObject);
begin
  TKMLFolder(TargetObject).AddDocument;
  TKMLFolder_ToTree(TKMLFolder(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLFolder_DocumentDeleteEvent(obj: TKMLFolder; del: TObject);
begin
  if del is TKMLDocument then
  begin
    TKMLFolder(obj).DocumentRemove;
    TKMLFolder_ToTree(TKMLFolder(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLFolder_AddGroundOverlayEvent(Sender: TObject);
begin
  TKMLFolder(TargetObject).AddNewGroundOverlay;
  TKMLFolder_ToTree(TKMLFolder(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLFolder_GroundOverlayDeleteEvent(obj: TKMLFolder; del: TObject);
begin
  if del is TKMLGroundOverlay then
  begin
    TKMLFolder(obj).RemoveGroundOverlay(TKMLGroundOverlay(del));
    TKMLFolder_ToTree(TKMLFolder(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLFolder_AddPlacemarkEvent(Sender: TObject);
begin
  TKMLFolder(TargetObject).AddNewPlacemark;
  TKMLFolder_ToTree(TKMLFolder(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLFolder_PlacemarkDeleteEvent(obj: TKMLFolder; del: TObject);
begin
  if del is TKMLPlacemark then
  begin
    TKMLFolder(obj).RemovePlacemark(TKMLPlacemark(del));
    TKMLFolder_ToTree(TKMLFolder(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLFolder_AddScreenOverlayEvent(Sender: TObject);
begin
  TKMLFolder(TargetObject).AddNewScreenOverlay;
  TKMLFolder_ToTree(TKMLFolder(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLFolder_ScreenOverlayDeleteEvent(obj: TKMLFolder; del: TObject);
begin
  if del is TKMLScreenOverlay then
  begin
    TKMLFolder(obj).RemoveScreenOverlay(TKMLScreenOverlay(del));
    TKMLFolder_ToTree(TKMLFolder(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLFolder_AddFolderEvent(Sender: TObject);
begin
  TKMLFolder(TargetObject).AddNewFolder;
  TKMLFolder_ToTree(TKMLFolder(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLFolder_FolderDeleteEvent(obj: TKMLFolder; del: TObject);
begin
  if del is TKMLFolder then
  begin
    TKMLFolder(obj).RemoveFolder(TKMLFolder(del));
    TKMLFolder_ToTree(TKMLFolder(obj), TargetNode);
  end;
end;

    { TKMLPlacemark }
procedure TKMLTree.TKMLPlacemark_ToTree(Obj: TKMLPlacemark; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('Placemark');
  if Obj.NameExsit then
    TreeNodeShape.AddChild('Name:' + Obj.Name);
  if Obj.VisibilityExsit then
    TreeNodeShape.AddChild('Visibility:' + IntToStr(Obj.Visibility));
  if Obj.DescriptionExsit then
    TreeNodeShape.AddChild('Description:' + Obj.Description);
  if Obj.LookAtExsit then
  begin
    TKMLLookAt_ToTree(obj.LookAt, TreeNodeShape.AddChildObject('LookAt', obj.LookAt));
  end;
  if Obj.StyleUrlExsit then
    TreeNodeShape.AddChild('StyleUrl:' + Obj.StyleUrl);
  if Obj.GeometryExsit then
  begin
    TKMLGeometry_ToTree(obj.Geometry, TreeNodeShape.AddChildObject('Geometry', obj.Geometry));
  end;
  if Obj.ExtendedDataExsit then
  begin
    TKMLExtendedData_ToTree(obj.ExtendedData, TreeNodeShape.AddChildObject('ExtendedData', obj.ExtendedData));
  end;
end;

procedure TKMLTree.TKMLPlacemark_ToPopupMenu(obj: TKMLPlacemark; Sender: TObject);
var
  pop: TPopupMenu;
  NameAddMenu: TMenuItem;
  VisibilityAddMenu: TMenuItem;
  DescriptionAddMenu: TMenuItem;
  LookAtAddMenu: TMenuItem;
  StyleUrlAddMenu: TMenuItem;
  GeometryAddMenu: TMenuItem;
  PointAddMenu: TMenuItem;
  PolygonAddMenu: TMenuItem;
  LinearRingAddMenu: TMenuItem;
  LineStringAddMenu: TMenuItem;
  MultiGeometryAddMenu: TMenuItem;
  ExtendedDataAddMenu: TMenuItem;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
    NameAddMenu := TMenuItem.Create(pop);
    NameAddMenu.Caption := 'Add Name';
    NameAddMenu.OnClick := TKMLPlacemark_AddNameEvent;
    pop.Items.Add(NameAddMenu);
    VisibilityAddMenu := TMenuItem.Create(pop);
    VisibilityAddMenu.Caption := 'Add Visibility';
    VisibilityAddMenu.OnClick := TKMLPlacemark_AddVisibilityEvent;
    pop.Items.Add(VisibilityAddMenu);
    DescriptionAddMenu := TMenuItem.Create(pop);
    DescriptionAddMenu.Caption := 'Add Description';
    DescriptionAddMenu.OnClick := TKMLPlacemark_AddDescriptionEvent;
    pop.Items.Add(DescriptionAddMenu);
    LookAtAddMenu := TMenuItem.Create(pop);
    LookAtAddMenu.Caption := 'Add LookAt';
    LookAtAddMenu.OnClick := TKMLPlacemark_AddLookAtEvent;
    pop.Items.Add(LookAtAddMenu);
    StyleUrlAddMenu := TMenuItem.Create(pop);
    StyleUrlAddMenu.Caption := 'Add StyleUrl';
    StyleUrlAddMenu.OnClick := TKMLPlacemark_AddStyleUrlEvent;
    pop.Items.Add(StyleUrlAddMenu);
    GeometryAddMenu := TMenuItem.Create(pop);
    GeometryAddMenu.Caption := 'Add Geometry';
    pop.Items.Add(GeometryAddMenu);
    PointAddMenu := TMenuItem.Create(GeometryAddMenu);
    PointAddMenu.Caption := 'Point';
    PointAddMenu.OnClick := TKMLPlacemark_AddPointEvent;
    GeometryAddMenu.Add(PointAddMenu);
    PolygonAddMenu := TMenuItem.Create(GeometryAddMenu);
    PolygonAddMenu.Caption := 'Polygon';
    PolygonAddMenu.OnClick := TKMLPlacemark_AddPolygonEvent;
    GeometryAddMenu.Add(PolygonAddMenu);
    LinearRingAddMenu := TMenuItem.Create(GeometryAddMenu);
    LinearRingAddMenu.Caption := 'LinearRing';
    LinearRingAddMenu.OnClick := TKMLPlacemark_AddLinearRingEvent;
    GeometryAddMenu.Add(LinearRingAddMenu);
    LineStringAddMenu := TMenuItem.Create(GeometryAddMenu);
    LineStringAddMenu.Caption := 'LineString';
    LineStringAddMenu.OnClick := TKMLPlacemark_AddLineStringEvent;
    GeometryAddMenu.Add(LineStringAddMenu);
    MultiGeometryAddMenu := TMenuItem.Create(GeometryAddMenu);
    MultiGeometryAddMenu.Caption := 'MultiGeometry';
    MultiGeometryAddMenu.OnClick := TKMLPlacemark_AddMultiGeometryEvent;
    GeometryAddMenu.Add(MultiGeometryAddMenu);
    ExtendedDataAddMenu := TMenuItem.Create(pop);
    ExtendedDataAddMenu.Caption := 'Add ExtendedData';
    ExtendedDataAddMenu.OnClick := TKMLPlacemark_AddExtendedDataEvent;
    pop.Items.Add(ExtendedDataAddMenu);
  end;
end;

procedure TKMLTree.TKMLPlacemark_ToInspector(obj: TKMLPlacemark; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  Names_Value.Add('Name');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.Name);
  Names_Value.Add('Visibility');
  Types_Value.Add(xs_integer);
  _Values_Value.Add(IntToStr(Obj.Visibility));
  Names_Value.Add('Description');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.Description);
  Names_Value.Add('StyleUrl');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.StyleUrl);
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLPlacemark_SetXMLProperty(obj: TKMLPlacemark; Index: Integer; _Value: String);
begin
  case index of
    0:
      begin
        obj.Name := _Value;
      end;
    1:
      begin
        obj.Visibility := StrToIntDef(_Value, 0);;
      end;
    2:
      begin
        obj.Description := _Value;
      end;
    3:
      begin
        obj.StyleUrl := _Value;
      end;
  end;
  TKMLPlacemark_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLPlacemark_Copy(source, target: TKMLPlacemark);
var
  I:Integer;
begin
  target.Name := source.Name;
  target.NameExsit := source.NameExsit;
  target.Visibility := source.Visibility;
  target.VisibilityExsit := source.VisibilityExsit;
  target.Description := source.Description;
  target.DescriptionExsit := source.DescriptionExsit;
  target.LookAtExsit := source.LookAtExsit;
  if source.LookAtExsit then
  begin
      TKMLLookAt_Copy(source.LookAt, target.AddLookAt);
  end;
  target.StyleUrl := source.StyleUrl;
  target.StyleUrlExsit := source.StyleUrlExsit;
  target.GeometryExsit := source.GeometryExsit;
  if source.GeometryExsit then
  begin
    if source.Geometry is TKMLPoint then
      TKMLGeometry_Copy(source.Geometry, target.AddPoint);
    if source.Geometry is TKMLPolygon then
      TKMLGeometry_Copy(source.Geometry, target.AddPolygon);
    if source.Geometry is TKMLLinearRing then
      TKMLGeometry_Copy(source.Geometry, target.AddLinearRing);
    if source.Geometry is TKMLLineString then
      TKMLGeometry_Copy(source.Geometry, target.AddLineString);
    if source.Geometry is TKMLMultiGeometry then
      TKMLGeometry_Copy(source.Geometry, target.AddMultiGeometry);
  end;
  target.ExtendedDataExsit := source.ExtendedDataExsit;
  if source.ExtendedDataExsit then
  begin
      TKMLExtendedData_Copy(source.ExtendedData, target.AddExtendedData);
  end;
  TKMLPlacemark_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLPlacemark_PasteToEvent(obj: TKMLPlacemark; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
begin
  if (items.Count = 1) and (items[0] is TKMLPlacemark) and (not isCut) then
  begin
    TKMLPlacemark_Copy(TKMLPlacemark(items[0]), obj);
    TKMLPlacemark_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
  end;
  TKMLPlacemark_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLPlacemark_ChildDeleteEvent(obj: TKMLPlacemark; del: TObject);
begin
end;
procedure TKMLTree.TKMLPlacemark_AddNameEvent(Sender: TObject);
begin
  TKMLPlacemark(TargetObject).AddName;
  TKMLPlacemark_ToTree(TKMLPlacemark(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLPlacemark_AddVisibilityEvent(Sender: TObject);
begin
  TKMLPlacemark(TargetObject).AddVisibility;
  TKMLPlacemark_ToTree(TKMLPlacemark(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLPlacemark_AddDescriptionEvent(Sender: TObject);
begin
  TKMLPlacemark(TargetObject).AddDescription;
  TKMLPlacemark_ToTree(TKMLPlacemark(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLPlacemark_AddLookAtEvent(Sender: TObject);
begin
  TKMLPlacemark(TargetObject).AddLookAt;
  TKMLPlacemark_ToTree(TKMLPlacemark(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLPlacemark_LookAtDeleteEvent(obj: TKMLPlacemark; del: TObject);
begin
  if del is TKMLLookAt then
  begin
    TKMLPlacemark(obj).LookAtRemove;
    TKMLPlacemark_ToTree(TKMLPlacemark(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLPlacemark_AddStyleUrlEvent(Sender: TObject);
begin
  TKMLPlacemark(TargetObject).AddStyleUrl;
  TKMLPlacemark_ToTree(TKMLPlacemark(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLPlacemark_AddPointEvent(Sender: TObject);
begin
  TKMLPlacemark(TargetObject).AddPoint;
  TKMLPlacemark_ToTree(TKMLPlacemark(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLPlacemark_AddPolygonEvent(Sender: TObject);
begin
  TKMLPlacemark(TargetObject).AddPolygon;
  TKMLPlacemark_ToTree(TKMLPlacemark(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLPlacemark_AddLinearRingEvent(Sender: TObject);
begin
  TKMLPlacemark(TargetObject).AddLinearRing;
  TKMLPlacemark_ToTree(TKMLPlacemark(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLPlacemark_AddLineStringEvent(Sender: TObject);
begin
  TKMLPlacemark(TargetObject).AddLineString;
  TKMLPlacemark_ToTree(TKMLPlacemark(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLPlacemark_AddMultiGeometryEvent(Sender: TObject);
begin
  TKMLPlacemark(TargetObject).AddMultiGeometry;
  TKMLPlacemark_ToTree(TKMLPlacemark(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLPlacemark_GeometryDeleteEvent(obj: TKMLPlacemark; del: TObject);
begin
  if del is TKMLGeometry then
  begin
    TKMLPlacemark(obj).GeometryRemove;
    TKMLPlacemark_ToTree(TKMLPlacemark(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLPlacemark_AddExtendedDataEvent(Sender: TObject);
begin
  TKMLPlacemark(TargetObject).AddExtendedData;
  TKMLPlacemark_ToTree(TKMLPlacemark(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLPlacemark_ExtendedDataDeleteEvent(obj: TKMLPlacemark; del: TObject);
begin
  if del is TKMLExtendedData then
  begin
    TKMLPlacemark(obj).ExtendedDataRemove;
    TKMLPlacemark_ToTree(TKMLPlacemark(obj), TargetNode);
  end;
end;

    { TKMLGeometry }
procedure TKMLTree.TKMLGeometry_ToTree(Obj: TKMLGeometry; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('Geometry');
end;

procedure TKMLTree.TKMLGeometry_ToPopupMenu(obj: TKMLGeometry; Sender: TObject);
var
  pop: TPopupMenu;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
  end;
end;

procedure TKMLTree.TKMLGeometry_ToInspector(obj: TKMLGeometry; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLGeometry_SetXMLProperty(obj: TKMLGeometry; Index: Integer; _Value: String);
begin
end;

procedure TKMLTree.TKMLGeometry_Copy(source, target: TKMLGeometry);
var
  I:Integer;
begin
  TKMLGeometry_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLGeometry_PasteToEvent(obj: TKMLGeometry; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
begin
  if (items.Count = 1) and (items[0] is TKMLGeometry) and (not isCut) then
  begin
    TKMLGeometry_Copy(TKMLGeometry(items[0]), obj);
    TKMLGeometry_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
  end;
  TKMLGeometry_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLGeometry_ChildDeleteEvent(obj: TKMLGeometry; del: TObject);
begin
end;
    { TKMLMultiGeometry }
procedure TKMLTree.TKMLMultiGeometry_ToTree(Obj: TKMLMultiGeometry; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('MultiGeometry');
  for I := 0 to obj.GeometryCount - 1 do
  begin
    TKMLGeometry_ToTree(obj.Geometry[I], TreeNodeShape.AddChildObject('Geometry', obj.Geometry[I]));
  end;
end;

procedure TKMLTree.TKMLMultiGeometry_ToPopupMenu(obj: TKMLMultiGeometry; Sender: TObject);
var
  pop: TPopupMenu;
  GeometryAddMenu: TMenuItem;
  PointAddMenu: TMenuItem;
  PolygonAddMenu: TMenuItem;
  LinearRingAddMenu: TMenuItem;
  LineStringAddMenu: TMenuItem;
  MultiGeometryAddMenu: TMenuItem;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
    GeometryAddMenu := TMenuItem.Create(pop);
    GeometryAddMenu.Caption := 'Add Geometry';
    pop.Items.Add(GeometryAddMenu);
    PointAddMenu := TMenuItem.Create(GeometryAddMenu);
    PointAddMenu.Caption := 'Point';
    PointAddMenu.OnClick := TKMLMultiGeometry_AddPointEvent;
    GeometryAddMenu.Add(PointAddMenu);
    PolygonAddMenu := TMenuItem.Create(GeometryAddMenu);
    PolygonAddMenu.Caption := 'Polygon';
    PolygonAddMenu.OnClick := TKMLMultiGeometry_AddPolygonEvent;
    GeometryAddMenu.Add(PolygonAddMenu);
    LinearRingAddMenu := TMenuItem.Create(GeometryAddMenu);
    LinearRingAddMenu.Caption := 'LinearRing';
    LinearRingAddMenu.OnClick := TKMLMultiGeometry_AddLinearRingEvent;
    GeometryAddMenu.Add(LinearRingAddMenu);
    LineStringAddMenu := TMenuItem.Create(GeometryAddMenu);
    LineStringAddMenu.Caption := 'LineString';
    LineStringAddMenu.OnClick := TKMLMultiGeometry_AddLineStringEvent;
    GeometryAddMenu.Add(LineStringAddMenu);
    MultiGeometryAddMenu := TMenuItem.Create(GeometryAddMenu);
    MultiGeometryAddMenu.Caption := 'MultiGeometry';
    MultiGeometryAddMenu.OnClick := TKMLMultiGeometry_AddMultiGeometryEvent;
    GeometryAddMenu.Add(MultiGeometryAddMenu);
  end;
end;

procedure TKMLTree.TKMLMultiGeometry_ToInspector(obj: TKMLMultiGeometry; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLMultiGeometry_SetXMLProperty(obj: TKMLMultiGeometry; Index: Integer; _Value: String);
begin
end;

procedure TKMLTree.TKMLMultiGeometry_Copy(source, target: TKMLMultiGeometry);
var
  I:Integer;
begin
  target.GeometryClear;
  for I := 0 to source.GeometryCount - 1 do
  begin
    if source.Geometry[I] is TKMLPoint then
      TKMLGeometry_Copy(source.Geometry[I], target.AddNewPoint);
    if source.Geometry[I] is TKMLPolygon then
      TKMLGeometry_Copy(source.Geometry[I], target.AddNewPolygon);
    if source.Geometry[I] is TKMLLinearRing then
      TKMLGeometry_Copy(source.Geometry[I], target.AddNewLinearRing);
    if source.Geometry[I] is TKMLLineString then
      TKMLGeometry_Copy(source.Geometry[I], target.AddNewLineString);
    if source.Geometry[I] is TKMLMultiGeometry then
      TKMLGeometry_Copy(source.Geometry[I], target.AddNewMultiGeometry);
  end;
  TKMLMultiGeometry_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLMultiGeometry_PasteToEvent(obj: TKMLMultiGeometry; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
  tmpGeometry: TKMLGeometry;
begin
  if (items.Count = 1) and (items[0] is TKMLMultiGeometry) and (not isCut) then
  begin
    TKMLMultiGeometry_Copy(TKMLMultiGeometry(items[0]), obj);
    TKMLMultiGeometry_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
    if items[I] is TKMLGeometry then
    begin
      tmpGeometry := TKMLGeometry(items[I]);
      if isCut then
      begin
      end
      else
      begin
        if tmpGeometry is TKMLPoint then
          TKMLPoint_Copy(TKMLPoint(tmpGeometry), obj.AddNewPoint);
        if tmpGeometry is TKMLPolygon then
          TKMLPolygon_Copy(TKMLPolygon(tmpGeometry), obj.AddNewPolygon);
        if tmpGeometry is TKMLLinearRing then
          TKMLLinearRing_Copy(TKMLLinearRing(tmpGeometry), obj.AddNewLinearRing);
        if tmpGeometry is TKMLLineString then
          TKMLLineString_Copy(TKMLLineString(tmpGeometry), obj.AddNewLineString);
        if tmpGeometry is TKMLMultiGeometry then
          TKMLMultiGeometry_Copy(TKMLMultiGeometry(tmpGeometry), obj.AddNewMultiGeometry);
      end;
    end;
  end;
  TKMLMultiGeometry_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLMultiGeometry_ChildDeleteEvent(obj: TKMLMultiGeometry; del: TObject);
begin
  if del is TKMLGeometry then
  begin
    TKMLMultiGeometry(obj).RemoveGeometry(TKMLGeometry(del));
    TKMLMultiGeometry_ToTree(TKMLMultiGeometry(obj), TargetNode);
  end;
end;
procedure TKMLTree.TKMLMultiGeometry_AddPointEvent(Sender: TObject);
begin
  TKMLMultiGeometry(TargetObject).AddNewPoint;
  TKMLMultiGeometry_ToTree(TKMLMultiGeometry(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLMultiGeometry_AddPolygonEvent(Sender: TObject);
begin
  TKMLMultiGeometry(TargetObject).AddNewPolygon;
  TKMLMultiGeometry_ToTree(TKMLMultiGeometry(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLMultiGeometry_AddLinearRingEvent(Sender: TObject);
begin
  TKMLMultiGeometry(TargetObject).AddNewLinearRing;
  TKMLMultiGeometry_ToTree(TKMLMultiGeometry(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLMultiGeometry_AddLineStringEvent(Sender: TObject);
begin
  TKMLMultiGeometry(TargetObject).AddNewLineString;
  TKMLMultiGeometry_ToTree(TKMLMultiGeometry(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLMultiGeometry_AddMultiGeometryEvent(Sender: TObject);
begin
  TKMLMultiGeometry(TargetObject).AddNewMultiGeometry;
  TKMLMultiGeometry_ToTree(TKMLMultiGeometry(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLMultiGeometry_GeometryDeleteEvent(obj: TKMLMultiGeometry; del: TObject);
begin
  if del is TKMLGeometry then
  begin
    TKMLMultiGeometry(obj).RemoveGeometry(TKMLGeometry(del));
    TKMLMultiGeometry_ToTree(TKMLMultiGeometry(obj), TargetNode);
  end;
end;

    { TKMLPoint }
procedure TKMLTree.TKMLPoint_ToTree(Obj: TKMLPoint; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('Point');
  if Obj.ExtrudeExsit then
    TreeNodeShape.AddChild('Extrude:' + Obj.Extrude);
  if Obj.AltitudeModeExsit then
    TreeNodeShape.AddChild('AltitudeMode:' + Obj.AltitudeMode);
  TreeNodeShape.AddChild('Coordinates:' + CoordinatesToString(Obj.Coordinates));
end;

procedure TKMLTree.TKMLPoint_ToPopupMenu(obj: TKMLPoint; Sender: TObject);
var
  pop: TPopupMenu;
  ExtrudeAddMenu: TMenuItem;
  AltitudeModeAddMenu: TMenuItem;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
    ExtrudeAddMenu := TMenuItem.Create(pop);
    ExtrudeAddMenu.Caption := 'Add Extrude';
    ExtrudeAddMenu.OnClick := TKMLPoint_AddExtrudeEvent;
    pop.Items.Add(ExtrudeAddMenu);
    AltitudeModeAddMenu := TMenuItem.Create(pop);
    AltitudeModeAddMenu.Caption := 'Add AltitudeMode';
    AltitudeModeAddMenu.OnClick := TKMLPoint_AddAltitudeModeEvent;
    pop.Items.Add(AltitudeModeAddMenu);
  end;
end;

procedure TKMLTree.TKMLPoint_ToInspector(obj: TKMLPoint; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  Names_Value.Add('Extrude');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.Extrude);
  Names_Value.Add('AltitudeMode');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.AltitudeMode);
  Names_Value.Add('Coordinates');
  Types_Value.Add(xml_ArrayCoordinates);
  _Values_Value.Add(CoordinatesToString(Obj.Coordinates));
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLPoint_SetXMLProperty(obj: TKMLPoint; Index: Integer; _Value: String);
begin
  case index of
    0:
      begin
        obj.Extrude := _Value;
      end;
    1:
      begin
        obj.AltitudeMode := _Value;
      end;
    2:
      begin
        obj.Coordinates := StringToCoordinates(_Value);
      end;
  end;
  TKMLPoint_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLPoint_Copy(source, target: TKMLPoint);
var
  I:Integer;
begin
  target.Extrude := source.Extrude;
  target.ExtrudeExsit := source.ExtrudeExsit;
  target.AltitudeMode := source.AltitudeMode;
  target.AltitudeModeExsit := source.AltitudeModeExsit;
  target.Coordinates := source.Coordinates;
  TKMLPoint_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLPoint_PasteToEvent(obj: TKMLPoint; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
begin
  if (items.Count = 1) and (items[0] is TKMLPoint) and (not isCut) then
  begin
    TKMLPoint_Copy(TKMLPoint(items[0]), obj);
    TKMLPoint_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
  end;
  TKMLPoint_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLPoint_ChildDeleteEvent(obj: TKMLPoint; del: TObject);
begin
end;
procedure TKMLTree.TKMLPoint_AddExtrudeEvent(Sender: TObject);
begin
  TKMLPoint(TargetObject).AddExtrude;
  TKMLPoint_ToTree(TKMLPoint(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLPoint_AddAltitudeModeEvent(Sender: TObject);
begin
  TKMLPoint(TargetObject).AddAltitudeMode;
  TKMLPoint_ToTree(TKMLPoint(TargetObject), TargetNode);
end;

    { TKMLPolygon }
procedure TKMLTree.TKMLPolygon_ToTree(Obj: TKMLPolygon; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('Polygon');
  if Obj.ExtrudeExsit then
    TreeNodeShape.AddChild('Extrude:' + Obj.Extrude);
  if Obj.AltitudeModeExsit then
    TreeNodeShape.AddChild('AltitudeMode:' + Obj.AltitudeMode);
  for I := 0 to obj.OuterBoundaryIsCount - 1 do
  begin
    TKMLBoundary_ToTree(obj.OuterBoundaryIs[I], TreeNodeShape.AddChildObject('OuterBoundaryIs', obj.OuterBoundaryIs[I]));
  end;
  for I := 0 to obj.InnerBoundaryIsCount - 1 do
  begin
    TKMLBoundary_ToTree(obj.InnerBoundaryIs[I], TreeNodeShape.AddChildObject('InnerBoundaryIs', obj.InnerBoundaryIs[I]));
  end;
  if Obj.TessellateExsit then
    TreeNodeShape.AddChild('Tessellate:' + Obj.Tessellate);
end;

procedure TKMLTree.TKMLPolygon_ToPopupMenu(obj: TKMLPolygon; Sender: TObject);
var
  pop: TPopupMenu;
  ExtrudeAddMenu: TMenuItem;
  AltitudeModeAddMenu: TMenuItem;
  OuterBoundaryIsAddMenu: TMenuItem;
  InnerBoundaryIsAddMenu: TMenuItem;
  TessellateAddMenu: TMenuItem;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
    ExtrudeAddMenu := TMenuItem.Create(pop);
    ExtrudeAddMenu.Caption := 'Add Extrude';
    ExtrudeAddMenu.OnClick := TKMLPolygon_AddExtrudeEvent;
    pop.Items.Add(ExtrudeAddMenu);
    AltitudeModeAddMenu := TMenuItem.Create(pop);
    AltitudeModeAddMenu.Caption := 'Add AltitudeMode';
    AltitudeModeAddMenu.OnClick := TKMLPolygon_AddAltitudeModeEvent;
    pop.Items.Add(AltitudeModeAddMenu);
    OuterBoundaryIsAddMenu := TMenuItem.Create(pop);
    OuterBoundaryIsAddMenu.Caption := 'Add OuterBoundaryIs';
    OuterBoundaryIsAddMenu.OnClick := TKMLPolygon_AddOuterBoundaryIsEvent;
    pop.Items.Add(OuterBoundaryIsAddMenu);
    InnerBoundaryIsAddMenu := TMenuItem.Create(pop);
    InnerBoundaryIsAddMenu.Caption := 'Add InnerBoundaryIs';
    InnerBoundaryIsAddMenu.OnClick := TKMLPolygon_AddInnerBoundaryIsEvent;
    pop.Items.Add(InnerBoundaryIsAddMenu);
    TessellateAddMenu := TMenuItem.Create(pop);
    TessellateAddMenu.Caption := 'Add Tessellate';
    TessellateAddMenu.OnClick := TKMLPolygon_AddTessellateEvent;
    pop.Items.Add(TessellateAddMenu);
  end;
end;

procedure TKMLTree.TKMLPolygon_ToInspector(obj: TKMLPolygon; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  Names_Value.Add('Extrude');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.Extrude);
  Names_Value.Add('AltitudeMode');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.AltitudeMode);
  Names_Value.Add('Tessellate');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.Tessellate);
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLPolygon_SetXMLProperty(obj: TKMLPolygon; Index: Integer; _Value: String);
begin
  case index of
    0:
      begin
        obj.Extrude := _Value;
      end;
    1:
      begin
        obj.AltitudeMode := _Value;
      end;
    2:
      begin
        obj.Tessellate := _Value;
      end;
  end;
  TKMLPolygon_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLPolygon_Copy(source, target: TKMLPolygon);
var
  I:Integer;
begin
  target.Extrude := source.Extrude;
  target.ExtrudeExsit := source.ExtrudeExsit;
  target.AltitudeMode := source.AltitudeMode;
  target.AltitudeModeExsit := source.AltitudeModeExsit;
  target.OuterBoundaryIsClear;
  for I := 0 to source.OuterBoundaryIsCount - 1 do
  begin
      TKMLBoundary_Copy(source.OuterBoundaryIs[I], target. AddNewOuterBoundaryIs);
  end;
  target.InnerBoundaryIsClear;
  for I := 0 to source.InnerBoundaryIsCount - 1 do
  begin
      TKMLBoundary_Copy(source.InnerBoundaryIs[I], target. AddNewInnerBoundaryIs);
  end;
  target.Tessellate := source.Tessellate;
  target.TessellateExsit := source.TessellateExsit;
  TKMLPolygon_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLPolygon_PasteToEvent(obj: TKMLPolygon; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
  tmpOuterBoundaryIs: TKMLBoundary;
  tmpInnerBoundaryIs: TKMLBoundary;
begin
  if (items.Count = 1) and (items[0] is TKMLPolygon) and (not isCut) then
  begin
    TKMLPolygon_Copy(TKMLPolygon(items[0]), obj);
    TKMLPolygon_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
    if items[I] is TKMLBoundary then
    begin
      tmpOuterBoundaryIs := TKMLBoundary(items[I]);
      if isCut then
      begin
      end
      else
      begin
        TKMLBoundary_Copy(tmpOuterBoundaryIs, obj.AddNewOuterBoundaryIs);
      end;
    end;
    if items[I] is TKMLBoundary then
    begin
      tmpInnerBoundaryIs := TKMLBoundary(items[I]);
      if isCut then
      begin
      end
      else
      begin
        TKMLBoundary_Copy(tmpInnerBoundaryIs, obj.AddNewInnerBoundaryIs);
      end;
    end;
  end;
  TKMLPolygon_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLPolygon_ChildDeleteEvent(obj: TKMLPolygon; del: TObject);
begin
  if del is TKMLBoundary then
  begin
    TKMLPolygon(obj).RemoveOuterBoundaryIs(TKMLBoundary(del));
    TKMLPolygon_ToTree(TKMLPolygon(obj), TargetNode);
  end;
  if del is TKMLBoundary then
  begin
    TKMLPolygon(obj).RemoveInnerBoundaryIs(TKMLBoundary(del));
    TKMLPolygon_ToTree(TKMLPolygon(obj), TargetNode);
  end;
end;
procedure TKMLTree.TKMLPolygon_AddExtrudeEvent(Sender: TObject);
begin
  TKMLPolygon(TargetObject).AddExtrude;
  TKMLPolygon_ToTree(TKMLPolygon(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLPolygon_AddAltitudeModeEvent(Sender: TObject);
begin
  TKMLPolygon(TargetObject).AddAltitudeMode;
  TKMLPolygon_ToTree(TKMLPolygon(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLPolygon_AddOuterBoundaryIsEvent(Sender: TObject);
begin
  TKMLPolygon(TargetObject).AddNewOuterBoundaryIs;
  TKMLPolygon_ToTree(TKMLPolygon(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLPolygon_OuterBoundaryIsDeleteEvent(obj: TKMLPolygon; del: TObject);
begin
  if del is TKMLBoundary then
  begin
    TKMLPolygon(obj).RemoveOuterBoundaryIs(TKMLBoundary(del));
    TKMLPolygon_ToTree(TKMLPolygon(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLPolygon_AddInnerBoundaryIsEvent(Sender: TObject);
begin
  TKMLPolygon(TargetObject).AddNewInnerBoundaryIs;
  TKMLPolygon_ToTree(TKMLPolygon(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLPolygon_InnerBoundaryIsDeleteEvent(obj: TKMLPolygon; del: TObject);
begin
  if del is TKMLBoundary then
  begin
    TKMLPolygon(obj).RemoveInnerBoundaryIs(TKMLBoundary(del));
    TKMLPolygon_ToTree(TKMLPolygon(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLPolygon_AddTessellateEvent(Sender: TObject);
begin
  TKMLPolygon(TargetObject).AddTessellate;
  TKMLPolygon_ToTree(TKMLPolygon(TargetObject), TargetNode);
end;

    { TKMLBoundary }
procedure TKMLTree.TKMLBoundary_ToTree(Obj: TKMLBoundary; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('Boundary');
  TKMLLinearRing_ToTree(obj.LinearRing, TreeNodeShape.AddChildObject('LinearRing', obj.LinearRing));
end;

procedure TKMLTree.TKMLBoundary_ToPopupMenu(obj: TKMLBoundary; Sender: TObject);
var
  pop: TPopupMenu;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
  end;
end;

procedure TKMLTree.TKMLBoundary_ToInspector(obj: TKMLBoundary; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLBoundary_SetXMLProperty(obj: TKMLBoundary; Index: Integer; _Value: String);
begin
end;

procedure TKMLTree.TKMLBoundary_Copy(source, target: TKMLBoundary);
var
  I:Integer;
begin
      TKMLLinearRing_Copy(source.LinearRing, target.LinearRing);
  TKMLBoundary_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLBoundary_PasteToEvent(obj: TKMLBoundary; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
begin
  if (items.Count = 1) and (items[0] is TKMLBoundary) and (not isCut) then
  begin
    TKMLBoundary_Copy(TKMLBoundary(items[0]), obj);
    TKMLBoundary_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
  end;
  TKMLBoundary_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLBoundary_ChildDeleteEvent(obj: TKMLBoundary; del: TObject);
begin
end;
    { TKMLLinearRing }
procedure TKMLTree.TKMLLinearRing_ToTree(Obj: TKMLLinearRing; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('LinearRing');
  TreeNodeShape.AddChild('Coordinates:' + CoordinatesToString(Obj.Coordinates));
end;

procedure TKMLTree.TKMLLinearRing_ToPopupMenu(obj: TKMLLinearRing; Sender: TObject);
var
  pop: TPopupMenu;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
  end;
end;

procedure TKMLTree.TKMLLinearRing_ToInspector(obj: TKMLLinearRing; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  Names_Value.Add('Coordinates');
  Types_Value.Add(xml_ArrayCoordinates);
  _Values_Value.Add(CoordinatesToString(Obj.Coordinates));
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLLinearRing_SetXMLProperty(obj: TKMLLinearRing; Index: Integer; _Value: String);
begin
  case index of
    0:
      begin
        obj.Coordinates := StringToCoordinates(_Value);
      end;
  end;
  TKMLLinearRing_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLLinearRing_Copy(source, target: TKMLLinearRing);
var
  I:Integer;
begin
  target.Coordinates := source.Coordinates;
  TKMLLinearRing_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLLinearRing_PasteToEvent(obj: TKMLLinearRing; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
begin
  if (items.Count = 1) and (items[0] is TKMLLinearRing) and (not isCut) then
  begin
    TKMLLinearRing_Copy(TKMLLinearRing(items[0]), obj);
    TKMLLinearRing_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
  end;
  TKMLLinearRing_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLLinearRing_ChildDeleteEvent(obj: TKMLLinearRing; del: TObject);
begin
end;
    { TKMLLineString }
procedure TKMLTree.TKMLLineString_ToTree(Obj: TKMLLineString; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('LineString');
  if Obj.TessellateExsit then
    TreeNodeShape.AddChild('Tessellate:' + Obj.Tessellate);
  if Obj.AltitudeModeExsit then
    TreeNodeShape.AddChild('AltitudeMode:' + Obj.AltitudeMode);
  if Obj.ExtrudeExsit then
    TreeNodeShape.AddChild('Extrude:' + Obj.Extrude);
  TreeNodeShape.AddChild('Coordinates:' + CoordinatesToString(Obj.Coordinates));
end;

procedure TKMLTree.TKMLLineString_ToPopupMenu(obj: TKMLLineString; Sender: TObject);
var
  pop: TPopupMenu;
  TessellateAddMenu: TMenuItem;
  AltitudeModeAddMenu: TMenuItem;
  ExtrudeAddMenu: TMenuItem;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
    TessellateAddMenu := TMenuItem.Create(pop);
    TessellateAddMenu.Caption := 'Add Tessellate';
    TessellateAddMenu.OnClick := TKMLLineString_AddTessellateEvent;
    pop.Items.Add(TessellateAddMenu);
    AltitudeModeAddMenu := TMenuItem.Create(pop);
    AltitudeModeAddMenu.Caption := 'Add AltitudeMode';
    AltitudeModeAddMenu.OnClick := TKMLLineString_AddAltitudeModeEvent;
    pop.Items.Add(AltitudeModeAddMenu);
    ExtrudeAddMenu := TMenuItem.Create(pop);
    ExtrudeAddMenu.Caption := 'Add Extrude';
    ExtrudeAddMenu.OnClick := TKMLLineString_AddExtrudeEvent;
    pop.Items.Add(ExtrudeAddMenu);
  end;
end;

procedure TKMLTree.TKMLLineString_ToInspector(obj: TKMLLineString; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  Names_Value.Add('Tessellate');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.Tessellate);
  Names_Value.Add('AltitudeMode');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.AltitudeMode);
  Names_Value.Add('Extrude');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.Extrude);
  Names_Value.Add('Coordinates');
  Types_Value.Add(xml_ArrayCoordinates);
  _Values_Value.Add(CoordinatesToString(Obj.Coordinates));
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLLineString_SetXMLProperty(obj: TKMLLineString; Index: Integer; _Value: String);
begin
  case index of
    0:
      begin
        obj.Tessellate := _Value;
      end;
    1:
      begin
        obj.AltitudeMode := _Value;
      end;
    2:
      begin
        obj.Extrude := _Value;
      end;
    3:
      begin
        obj.Coordinates := StringToCoordinates(_Value);
      end;
  end;
  TKMLLineString_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLLineString_Copy(source, target: TKMLLineString);
var
  I:Integer;
begin
  target.Tessellate := source.Tessellate;
  target.TessellateExsit := source.TessellateExsit;
  target.AltitudeMode := source.AltitudeMode;
  target.AltitudeModeExsit := source.AltitudeModeExsit;
  target.Extrude := source.Extrude;
  target.ExtrudeExsit := source.ExtrudeExsit;
  target.Coordinates := source.Coordinates;
  TKMLLineString_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLLineString_PasteToEvent(obj: TKMLLineString; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
begin
  if (items.Count = 1) and (items[0] is TKMLLineString) and (not isCut) then
  begin
    TKMLLineString_Copy(TKMLLineString(items[0]), obj);
    TKMLLineString_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
  end;
  TKMLLineString_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLLineString_ChildDeleteEvent(obj: TKMLLineString; del: TObject);
begin
end;
procedure TKMLTree.TKMLLineString_AddTessellateEvent(Sender: TObject);
begin
  TKMLLineString(TargetObject).AddTessellate;
  TKMLLineString_ToTree(TKMLLineString(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLLineString_AddAltitudeModeEvent(Sender: TObject);
begin
  TKMLLineString(TargetObject).AddAltitudeMode;
  TKMLLineString_ToTree(TKMLLineString(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLLineString_AddExtrudeEvent(Sender: TObject);
begin
  TKMLLineString(TargetObject).AddExtrude;
  TKMLLineString_ToTree(TKMLLineString(TargetObject), TargetNode);
end;

    { TKMLLookAt }
procedure TKMLTree.TKMLLookAt_ToTree(Obj: TKMLLookAt; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('LookAt');
  if Obj.LongitudeExsit then
    TreeNodeShape.AddChild('Longitude:' + FloatToStr(Obj.Longitude));
  if Obj.LatitudeExsit then
    TreeNodeShape.AddChild('Latitude:' + FloatToStr(Obj.Latitude));
  if Obj.AltitudeExsit then
    TreeNodeShape.AddChild('Altitude:' + FloatToStr(Obj.Altitude));
  if Obj.HeadingExsit then
    TreeNodeShape.AddChild('Heading:' + FloatToStr(Obj.Heading));
  if Obj.TiltExsit then
    TreeNodeShape.AddChild('Tilt:' + FloatToStr(Obj.Tilt));
  if Obj.RangeExsit then
    TreeNodeShape.AddChild('Range:' + FloatToStr(Obj.Range));
end;

procedure TKMLTree.TKMLLookAt_ToPopupMenu(obj: TKMLLookAt; Sender: TObject);
var
  pop: TPopupMenu;
  LongitudeAddMenu: TMenuItem;
  LatitudeAddMenu: TMenuItem;
  AltitudeAddMenu: TMenuItem;
  HeadingAddMenu: TMenuItem;
  TiltAddMenu: TMenuItem;
  RangeAddMenu: TMenuItem;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
    LongitudeAddMenu := TMenuItem.Create(pop);
    LongitudeAddMenu.Caption := 'Add Longitude';
    LongitudeAddMenu.OnClick := TKMLLookAt_AddLongitudeEvent;
    pop.Items.Add(LongitudeAddMenu);
    LatitudeAddMenu := TMenuItem.Create(pop);
    LatitudeAddMenu.Caption := 'Add Latitude';
    LatitudeAddMenu.OnClick := TKMLLookAt_AddLatitudeEvent;
    pop.Items.Add(LatitudeAddMenu);
    AltitudeAddMenu := TMenuItem.Create(pop);
    AltitudeAddMenu.Caption := 'Add Altitude';
    AltitudeAddMenu.OnClick := TKMLLookAt_AddAltitudeEvent;
    pop.Items.Add(AltitudeAddMenu);
    HeadingAddMenu := TMenuItem.Create(pop);
    HeadingAddMenu.Caption := 'Add Heading';
    HeadingAddMenu.OnClick := TKMLLookAt_AddHeadingEvent;
    pop.Items.Add(HeadingAddMenu);
    TiltAddMenu := TMenuItem.Create(pop);
    TiltAddMenu.Caption := 'Add Tilt';
    TiltAddMenu.OnClick := TKMLLookAt_AddTiltEvent;
    pop.Items.Add(TiltAddMenu);
    RangeAddMenu := TMenuItem.Create(pop);
    RangeAddMenu.Caption := 'Add Range';
    RangeAddMenu.OnClick := TKMLLookAt_AddRangeEvent;
    pop.Items.Add(RangeAddMenu);
  end;
end;

procedure TKMLTree.TKMLLookAt_ToInspector(obj: TKMLLookAt; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  Names_Value.Add('Longitude');
  Types_Value.Add(xs_double);
  _Values_Value.Add(FloatToStr(Obj.Longitude));
  Names_Value.Add('Latitude');
  Types_Value.Add(xs_double);
  _Values_Value.Add(FloatToStr(Obj.Latitude));
  Names_Value.Add('Altitude');
  Types_Value.Add(xs_double);
  _Values_Value.Add(FloatToStr(Obj.Altitude));
  Names_Value.Add('Heading');
  Types_Value.Add(xs_double);
  _Values_Value.Add(FloatToStr(Obj.Heading));
  Names_Value.Add('Tilt');
  Types_Value.Add(xs_double);
  _Values_Value.Add(FloatToStr(Obj.Tilt));
  Names_Value.Add('Range');
  Types_Value.Add(xs_double);
  _Values_Value.Add(FloatToStr(Obj.Range));
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLLookAt_SetXMLProperty(obj: TKMLLookAt; Index: Integer; _Value: String);
begin
  case index of
    0:
      begin
        obj.Longitude := StrToFloatDef(_Value, 0);;
      end;
    1:
      begin
        obj.Latitude := StrToFloatDef(_Value, 0);;
      end;
    2:
      begin
        obj.Altitude := StrToFloatDef(_Value, 0);;
      end;
    3:
      begin
        obj.Heading := StrToFloatDef(_Value, 0);;
      end;
    4:
      begin
        obj.Tilt := StrToFloatDef(_Value, 0);;
      end;
    5:
      begin
        obj.Range := StrToFloatDef(_Value, 0);;
      end;
  end;
  TKMLLookAt_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLLookAt_Copy(source, target: TKMLLookAt);
var
  I:Integer;
begin
  target.Longitude := source.Longitude;
  target.LongitudeExsit := source.LongitudeExsit;
  target.Latitude := source.Latitude;
  target.LatitudeExsit := source.LatitudeExsit;
  target.Altitude := source.Altitude;
  target.AltitudeExsit := source.AltitudeExsit;
  target.Heading := source.Heading;
  target.HeadingExsit := source.HeadingExsit;
  target.Tilt := source.Tilt;
  target.TiltExsit := source.TiltExsit;
  target.Range := source.Range;
  target.RangeExsit := source.RangeExsit;
  TKMLLookAt_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLLookAt_PasteToEvent(obj: TKMLLookAt; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
begin
  if (items.Count = 1) and (items[0] is TKMLLookAt) and (not isCut) then
  begin
    TKMLLookAt_Copy(TKMLLookAt(items[0]), obj);
    TKMLLookAt_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
  end;
  TKMLLookAt_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLLookAt_ChildDeleteEvent(obj: TKMLLookAt; del: TObject);
begin
end;
procedure TKMLTree.TKMLLookAt_AddLongitudeEvent(Sender: TObject);
begin
  TKMLLookAt(TargetObject).AddLongitude;
  TKMLLookAt_ToTree(TKMLLookAt(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLLookAt_AddLatitudeEvent(Sender: TObject);
begin
  TKMLLookAt(TargetObject).AddLatitude;
  TKMLLookAt_ToTree(TKMLLookAt(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLLookAt_AddAltitudeEvent(Sender: TObject);
begin
  TKMLLookAt(TargetObject).AddAltitude;
  TKMLLookAt_ToTree(TKMLLookAt(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLLookAt_AddHeadingEvent(Sender: TObject);
begin
  TKMLLookAt(TargetObject).AddHeading;
  TKMLLookAt_ToTree(TKMLLookAt(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLLookAt_AddTiltEvent(Sender: TObject);
begin
  TKMLLookAt(TargetObject).AddTilt;
  TKMLLookAt_ToTree(TKMLLookAt(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLLookAt_AddRangeEvent(Sender: TObject);
begin
  TKMLLookAt(TargetObject).AddRange;
  TKMLLookAt_ToTree(TKMLLookAt(TargetObject), TargetNode);
end;

    { TKMLLatLonBox }
procedure TKMLTree.TKMLLatLonBox_ToTree(Obj: TKMLLatLonBox; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('LatLonBox');
  TreeNodeShape.AddChild('North:' + FloatToStr(Obj.North));
  TreeNodeShape.AddChild('South:' + FloatToStr(Obj.South));
  TreeNodeShape.AddChild('East:' + FloatToStr(Obj.East));
  TreeNodeShape.AddChild('West:' + FloatToStr(Obj.West));
  TreeNodeShape.AddChild('Rotation:' + FloatToStr(Obj.Rotation));
end;

procedure TKMLTree.TKMLLatLonBox_ToPopupMenu(obj: TKMLLatLonBox; Sender: TObject);
var
  pop: TPopupMenu;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
  end;
end;

procedure TKMLTree.TKMLLatLonBox_ToInspector(obj: TKMLLatLonBox; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  Names_Value.Add('North');
  Types_Value.Add(xs_double);
  _Values_Value.Add(FloatToStr(Obj.North));
  Names_Value.Add('South');
  Types_Value.Add(xs_double);
  _Values_Value.Add(FloatToStr(Obj.South));
  Names_Value.Add('East');
  Types_Value.Add(xs_double);
  _Values_Value.Add(FloatToStr(Obj.East));
  Names_Value.Add('West');
  Types_Value.Add(xs_double);
  _Values_Value.Add(FloatToStr(Obj.West));
  Names_Value.Add('Rotation');
  Types_Value.Add(xs_double);
  _Values_Value.Add(FloatToStr(Obj.Rotation));
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLLatLonBox_SetXMLProperty(obj: TKMLLatLonBox; Index: Integer; _Value: String);
begin
  case index of
    0:
      begin
        obj.North := StrToFloatDef(_Value, 0);;
      end;
    1:
      begin
        obj.South := StrToFloatDef(_Value, 0);;
      end;
    2:
      begin
        obj.East := StrToFloatDef(_Value, 0);;
      end;
    3:
      begin
        obj.West := StrToFloatDef(_Value, 0);;
      end;
    4:
      begin
        obj.Rotation := StrToFloatDef(_Value, 0);;
      end;
  end;
  TKMLLatLonBox_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLLatLonBox_Copy(source, target: TKMLLatLonBox);
var
  I:Integer;
begin
  target.North := source.North;
  target.South := source.South;
  target.East := source.East;
  target.West := source.West;
  target.Rotation := source.Rotation;
  TKMLLatLonBox_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLLatLonBox_PasteToEvent(obj: TKMLLatLonBox; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
begin
  if (items.Count = 1) and (items[0] is TKMLLatLonBox) and (not isCut) then
  begin
    TKMLLatLonBox_Copy(TKMLLatLonBox(items[0]), obj);
    TKMLLatLonBox_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
  end;
  TKMLLatLonBox_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLLatLonBox_ChildDeleteEvent(obj: TKMLLatLonBox; del: TObject);
begin
end;
    { TKMLGroundOverlay }
procedure TKMLTree.TKMLGroundOverlay_ToTree(Obj: TKMLGroundOverlay; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('GroundOverlay');
  if Obj.NameExsit then
    TreeNodeShape.AddChild('Name:' + Obj.Name);
  if Obj.VisibilityExsit then
    TreeNodeShape.AddChild('Visibility:' + IntToStr(Obj.Visibility));
  if Obj.DescriptionExsit then
    TreeNodeShape.AddChild('Description:' + Obj.Description);
  if Obj.LookAtExsit then
  begin
    TKMLLookAt_ToTree(obj.LookAt, TreeNodeShape.AddChildObject('LookAt', obj.LookAt));
  end;
  if Obj.IconExsit then
  begin
    TKMLIcon_ToTree(obj.Icon, TreeNodeShape.AddChildObject('Icon', obj.Icon));
  end;
  if Obj.LatLonBoxExsit then
  begin
    TKMLLatLonBox_ToTree(obj.LatLonBox, TreeNodeShape.AddChildObject('LatLonBox', obj.LatLonBox));
  end;
end;

procedure TKMLTree.TKMLGroundOverlay_ToPopupMenu(obj: TKMLGroundOverlay; Sender: TObject);
var
  pop: TPopupMenu;
  NameAddMenu: TMenuItem;
  VisibilityAddMenu: TMenuItem;
  DescriptionAddMenu: TMenuItem;
  LookAtAddMenu: TMenuItem;
  IconAddMenu: TMenuItem;
  LatLonBoxAddMenu: TMenuItem;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
    NameAddMenu := TMenuItem.Create(pop);
    NameAddMenu.Caption := 'Add Name';
    NameAddMenu.OnClick := TKMLGroundOverlay_AddNameEvent;
    pop.Items.Add(NameAddMenu);
    VisibilityAddMenu := TMenuItem.Create(pop);
    VisibilityAddMenu.Caption := 'Add Visibility';
    VisibilityAddMenu.OnClick := TKMLGroundOverlay_AddVisibilityEvent;
    pop.Items.Add(VisibilityAddMenu);
    DescriptionAddMenu := TMenuItem.Create(pop);
    DescriptionAddMenu.Caption := 'Add Description';
    DescriptionAddMenu.OnClick := TKMLGroundOverlay_AddDescriptionEvent;
    pop.Items.Add(DescriptionAddMenu);
    LookAtAddMenu := TMenuItem.Create(pop);
    LookAtAddMenu.Caption := 'Add LookAt';
    LookAtAddMenu.OnClick := TKMLGroundOverlay_AddLookAtEvent;
    pop.Items.Add(LookAtAddMenu);
    IconAddMenu := TMenuItem.Create(pop);
    IconAddMenu.Caption := 'Add Icon';
    IconAddMenu.OnClick := TKMLGroundOverlay_AddIconEvent;
    pop.Items.Add(IconAddMenu);
    LatLonBoxAddMenu := TMenuItem.Create(pop);
    LatLonBoxAddMenu.Caption := 'Add LatLonBox';
    LatLonBoxAddMenu.OnClick := TKMLGroundOverlay_AddLatLonBoxEvent;
    pop.Items.Add(LatLonBoxAddMenu);
  end;
end;

procedure TKMLTree.TKMLGroundOverlay_ToInspector(obj: TKMLGroundOverlay; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  Names_Value.Add('Name');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.Name);
  Names_Value.Add('Visibility');
  Types_Value.Add(xs_integer);
  _Values_Value.Add(IntToStr(Obj.Visibility));
  Names_Value.Add('Description');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.Description);
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLGroundOverlay_SetXMLProperty(obj: TKMLGroundOverlay; Index: Integer; _Value: String);
begin
  case index of
    0:
      begin
        obj.Name := _Value;
      end;
    1:
      begin
        obj.Visibility := StrToIntDef(_Value, 0);;
      end;
    2:
      begin
        obj.Description := _Value;
      end;
  end;
  TKMLGroundOverlay_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLGroundOverlay_Copy(source, target: TKMLGroundOverlay);
var
  I:Integer;
begin
  target.Name := source.Name;
  target.NameExsit := source.NameExsit;
  target.Visibility := source.Visibility;
  target.VisibilityExsit := source.VisibilityExsit;
  target.Description := source.Description;
  target.DescriptionExsit := source.DescriptionExsit;
  target.LookAtExsit := source.LookAtExsit;
  if source.LookAtExsit then
  begin
      TKMLLookAt_Copy(source.LookAt, target.AddLookAt);
  end;
  target.IconExsit := source.IconExsit;
  if source.IconExsit then
  begin
      TKMLIcon_Copy(source.Icon, target.AddIcon);
  end;
  target.LatLonBoxExsit := source.LatLonBoxExsit;
  if source.LatLonBoxExsit then
  begin
      TKMLLatLonBox_Copy(source.LatLonBox, target.AddLatLonBox);
  end;
  TKMLGroundOverlay_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLGroundOverlay_PasteToEvent(obj: TKMLGroundOverlay; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
begin
  if (items.Count = 1) and (items[0] is TKMLGroundOverlay) and (not isCut) then
  begin
    TKMLGroundOverlay_Copy(TKMLGroundOverlay(items[0]), obj);
    TKMLGroundOverlay_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
  end;
  TKMLGroundOverlay_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLGroundOverlay_ChildDeleteEvent(obj: TKMLGroundOverlay; del: TObject);
begin
end;
procedure TKMLTree.TKMLGroundOverlay_AddNameEvent(Sender: TObject);
begin
  TKMLGroundOverlay(TargetObject).AddName;
  TKMLGroundOverlay_ToTree(TKMLGroundOverlay(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLGroundOverlay_AddVisibilityEvent(Sender: TObject);
begin
  TKMLGroundOverlay(TargetObject).AddVisibility;
  TKMLGroundOverlay_ToTree(TKMLGroundOverlay(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLGroundOverlay_AddDescriptionEvent(Sender: TObject);
begin
  TKMLGroundOverlay(TargetObject).AddDescription;
  TKMLGroundOverlay_ToTree(TKMLGroundOverlay(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLGroundOverlay_AddLookAtEvent(Sender: TObject);
begin
  TKMLGroundOverlay(TargetObject).AddLookAt;
  TKMLGroundOverlay_ToTree(TKMLGroundOverlay(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLGroundOverlay_LookAtDeleteEvent(obj: TKMLGroundOverlay; del: TObject);
begin
  if del is TKMLLookAt then
  begin
    TKMLGroundOverlay(obj).LookAtRemove;
    TKMLGroundOverlay_ToTree(TKMLGroundOverlay(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLGroundOverlay_AddIconEvent(Sender: TObject);
begin
  TKMLGroundOverlay(TargetObject).AddIcon;
  TKMLGroundOverlay_ToTree(TKMLGroundOverlay(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLGroundOverlay_IconDeleteEvent(obj: TKMLGroundOverlay; del: TObject);
begin
  if del is TKMLIcon then
  begin
    TKMLGroundOverlay(obj).IconRemove;
    TKMLGroundOverlay_ToTree(TKMLGroundOverlay(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLGroundOverlay_AddLatLonBoxEvent(Sender: TObject);
begin
  TKMLGroundOverlay(TargetObject).AddLatLonBox;
  TKMLGroundOverlay_ToTree(TKMLGroundOverlay(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLGroundOverlay_LatLonBoxDeleteEvent(obj: TKMLGroundOverlay; del: TObject);
begin
  if del is TKMLLatLonBox then
  begin
    TKMLGroundOverlay(obj).LatLonBoxRemove;
    TKMLGroundOverlay_ToTree(TKMLGroundOverlay(obj), TargetNode);
  end;
end;

    { TKMLExtendedData }
procedure TKMLTree.TKMLExtendedData_ToTree(Obj: TKMLExtendedData; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('ExtendedData');
  for I := 0 to obj.DataCount - 1 do
  begin
    TKMLData_ToTree(obj.Data[I], TreeNodeShape.AddChildObject('Data', obj.Data[I]));
  end;
end;

procedure TKMLTree.TKMLExtendedData_ToPopupMenu(obj: TKMLExtendedData; Sender: TObject);
var
  pop: TPopupMenu;
  DataAddMenu: TMenuItem;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
    DataAddMenu := TMenuItem.Create(pop);
    DataAddMenu.Caption := 'Add Data';
    DataAddMenu.OnClick := TKMLExtendedData_AddDataEvent;
    pop.Items.Add(DataAddMenu);
  end;
end;

procedure TKMLTree.TKMLExtendedData_ToInspector(obj: TKMLExtendedData; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLExtendedData_SetXMLProperty(obj: TKMLExtendedData; Index: Integer; _Value: String);
begin
end;

procedure TKMLTree.TKMLExtendedData_Copy(source, target: TKMLExtendedData);
var
  I:Integer;
begin
  target.DataClear;
  for I := 0 to source.DataCount - 1 do
  begin
      TKMLData_Copy(source.Data[I], target. AddNewData);
  end;
  TKMLExtendedData_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLExtendedData_PasteToEvent(obj: TKMLExtendedData; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
  tmpData: TKMLData;
begin
  if (items.Count = 1) and (items[0] is TKMLExtendedData) and (not isCut) then
  begin
    TKMLExtendedData_Copy(TKMLExtendedData(items[0]), obj);
    TKMLExtendedData_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
    if items[I] is TKMLData then
    begin
      tmpData := TKMLData(items[I]);
      if isCut then
      begin
      end
      else
      begin
        TKMLData_Copy(tmpData, obj.AddNewData);
      end;
    end;
  end;
  TKMLExtendedData_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLExtendedData_ChildDeleteEvent(obj: TKMLExtendedData; del: TObject);
begin
  if del is TKMLData then
  begin
    TKMLExtendedData(obj).RemoveData(TKMLData(del));
    TKMLExtendedData_ToTree(TKMLExtendedData(obj), TargetNode);
  end;
end;
procedure TKMLTree.TKMLExtendedData_AddDataEvent(Sender: TObject);
begin
  TKMLExtendedData(TargetObject).AddNewData;
  TKMLExtendedData_ToTree(TKMLExtendedData(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLExtendedData_DataDeleteEvent(obj: TKMLExtendedData; del: TObject);
begin
  if del is TKMLData then
  begin
    TKMLExtendedData(obj).RemoveData(TKMLData(del));
    TKMLExtendedData_ToTree(TKMLExtendedData(obj), TargetNode);
  end;
end;

    { TKMLData }
procedure TKMLTree.TKMLData_ToTree(Obj: TKMLData; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('Data');
  TreeNodeShape.AddChild('Name:' + Obj.Name);
  TreeNodeShape.AddChild('Value:' + Obj.Value);
end;

procedure TKMLTree.TKMLData_ToPopupMenu(obj: TKMLData; Sender: TObject);
var
  pop: TPopupMenu;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
  end;
end;

procedure TKMLTree.TKMLData_ToInspector(obj: TKMLData; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  Names_Value.Add('Name');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.Name);
  Names_Value.Add('Value');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.Value);
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLData_SetXMLProperty(obj: TKMLData; Index: Integer; _Value: String);
begin
  case index of
    0:
      begin
        obj.Name := _Value;
      end;
    1:
      begin
        obj.Value := _Value;
      end;
  end;
  TKMLData_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLData_Copy(source, target: TKMLData);
var
  I:Integer;
begin
  target.Name := source.Name;
  target.Value := source.Value;
  TKMLData_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLData_PasteToEvent(obj: TKMLData; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
begin
  if (items.Count = 1) and (items[0] is TKMLData) and (not isCut) then
  begin
    TKMLData_Copy(TKMLData(items[0]), obj);
    TKMLData_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
  end;
  TKMLData_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLData_ChildDeleteEvent(obj: TKMLData; del: TObject);
begin
end;
    { TKMLSize }
procedure TKMLTree.TKMLSize_ToTree(Obj: TKMLSize; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('Size');
  TreeNodeShape.AddChild('X:' + FloatToStr(Obj.X));
  TreeNodeShape.AddChild('Y:' + FloatToStr(Obj.Y));
  TreeNodeShape.AddChild('XUnits:' + Obj.XUnits);
  TreeNodeShape.AddChild('YUnits:' + Obj.YUnits);
end;

procedure TKMLTree.TKMLSize_ToPopupMenu(obj: TKMLSize; Sender: TObject);
var
  pop: TPopupMenu;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
  end;
end;

procedure TKMLTree.TKMLSize_ToInspector(obj: TKMLSize; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  Names_Value.Add('X');
  Types_Value.Add(xs_double);
  _Values_Value.Add(FloatToStr(Obj.X));
  Names_Value.Add('Y');
  Types_Value.Add(xs_double);
  _Values_Value.Add(FloatToStr(Obj.Y));
  Names_Value.Add('XUnits');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.XUnits);
  Names_Value.Add('YUnits');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.YUnits);
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLSize_SetXMLProperty(obj: TKMLSize; Index: Integer; _Value: String);
begin
  case index of
    0:
      begin
        obj.X := StrToFloatDef(_Value, 0);;
      end;
    1:
      begin
        obj.Y := StrToFloatDef(_Value, 0);;
      end;
    2:
      begin
        obj.XUnits := _Value;
      end;
    3:
      begin
        obj.YUnits := _Value;
      end;
  end;
  TKMLSize_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLSize_Copy(source, target: TKMLSize);
var
  I:Integer;
begin
  target.X := source.X;
  target.Y := source.Y;
  target.XUnits := source.XUnits;
  target.YUnits := source.YUnits;
  TKMLSize_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLSize_PasteToEvent(obj: TKMLSize; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
begin
  if (items.Count = 1) and (items[0] is TKMLSize) and (not isCut) then
  begin
    TKMLSize_Copy(TKMLSize(items[0]), obj);
    TKMLSize_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
  end;
  TKMLSize_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLSize_ChildDeleteEvent(obj: TKMLSize; del: TObject);
begin
end;
    { TKMLStyle }
procedure TKMLTree.TKMLStyle_ToTree(Obj: TKMLStyle; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('Style');
  TreeNodeShape.AddChild('ID:' + Obj.ID);
  if Obj.IconStyleExsit then
  begin
    TKMLIconStyle_ToTree(obj.IconStyle, TreeNodeShape.AddChildObject('IconStyle', obj.IconStyle));
  end;
  if Obj.LineStyleExsit then
  begin
    TKMLLineStyle_ToTree(obj.LineStyle, TreeNodeShape.AddChildObject('LineStyle', obj.LineStyle));
  end;
  if Obj.PolyStyleExsit then
  begin
    TKMLLineStyle_ToTree(obj.PolyStyle, TreeNodeShape.AddChildObject('PolyStyle', obj.PolyStyle));
  end;
  if Obj.BalloonStyleExsit then
  begin
    TKMLBalloonStyle_ToTree(obj.BalloonStyle, TreeNodeShape.AddChildObject('BalloonStyle', obj.BalloonStyle));
  end;
end;

procedure TKMLTree.TKMLStyle_ToPopupMenu(obj: TKMLStyle; Sender: TObject);
var
  pop: TPopupMenu;
  IconStyleAddMenu: TMenuItem;
  LineStyleAddMenu: TMenuItem;
  PolyStyleAddMenu: TMenuItem;
  BalloonStyleAddMenu: TMenuItem;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
    IconStyleAddMenu := TMenuItem.Create(pop);
    IconStyleAddMenu.Caption := 'Add IconStyle';
    IconStyleAddMenu.OnClick := TKMLStyle_AddIconStyleEvent;
    pop.Items.Add(IconStyleAddMenu);
    LineStyleAddMenu := TMenuItem.Create(pop);
    LineStyleAddMenu.Caption := 'Add LineStyle';
    LineStyleAddMenu.OnClick := TKMLStyle_AddLineStyleEvent;
    pop.Items.Add(LineStyleAddMenu);
    PolyStyleAddMenu := TMenuItem.Create(pop);
    PolyStyleAddMenu.Caption := 'Add PolyStyle';
    PolyStyleAddMenu.OnClick := TKMLStyle_AddPolyStyleEvent;
    pop.Items.Add(PolyStyleAddMenu);
    BalloonStyleAddMenu := TMenuItem.Create(pop);
    BalloonStyleAddMenu.Caption := 'Add BalloonStyle';
    BalloonStyleAddMenu.OnClick := TKMLStyle_AddBalloonStyleEvent;
    pop.Items.Add(BalloonStyleAddMenu);
  end;
end;

procedure TKMLTree.TKMLStyle_ToInspector(obj: TKMLStyle; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  Names_Value.Add('ID');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.ID);
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLStyle_SetXMLProperty(obj: TKMLStyle; Index: Integer; _Value: String);
begin
  case index of
    0:
      begin
        obj.ID := _Value;
      end;
  end;
  TKMLStyle_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLStyle_Copy(source, target: TKMLStyle);
var
  I:Integer;
begin
  target.ID := source.ID;
  target.IconStyleExsit := source.IconStyleExsit;
  if source.IconStyleExsit then
  begin
      TKMLIconStyle_Copy(source.IconStyle, target.AddIconStyle);
  end;
  target.LineStyleExsit := source.LineStyleExsit;
  if source.LineStyleExsit then
  begin
      TKMLLineStyle_Copy(source.LineStyle, target.AddLineStyle);
  end;
  target.PolyStyleExsit := source.PolyStyleExsit;
  if source.PolyStyleExsit then
  begin
      TKMLLineStyle_Copy(source.PolyStyle, target.AddPolyStyle);
  end;
  target.BalloonStyleExsit := source.BalloonStyleExsit;
  if source.BalloonStyleExsit then
  begin
      TKMLBalloonStyle_Copy(source.BalloonStyle, target.AddBalloonStyle);
  end;
  TKMLStyle_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLStyle_PasteToEvent(obj: TKMLStyle; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
begin
  if (items.Count = 1) and (items[0] is TKMLStyle) and (not isCut) then
  begin
    TKMLStyle_Copy(TKMLStyle(items[0]), obj);
    TKMLStyle_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
  end;
  TKMLStyle_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLStyle_ChildDeleteEvent(obj: TKMLStyle; del: TObject);
begin
end;
procedure TKMLTree.TKMLStyle_AddIconStyleEvent(Sender: TObject);
begin
  TKMLStyle(TargetObject).AddIconStyle;
  TKMLStyle_ToTree(TKMLStyle(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLStyle_IconStyleDeleteEvent(obj: TKMLStyle; del: TObject);
begin
  if del is TKMLIconStyle then
  begin
    TKMLStyle(obj).IconStyleRemove;
    TKMLStyle_ToTree(TKMLStyle(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLStyle_AddLineStyleEvent(Sender: TObject);
begin
  TKMLStyle(TargetObject).AddLineStyle;
  TKMLStyle_ToTree(TKMLStyle(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLStyle_LineStyleDeleteEvent(obj: TKMLStyle; del: TObject);
begin
  if del is TKMLLineStyle then
  begin
    TKMLStyle(obj).LineStyleRemove;
    TKMLStyle_ToTree(TKMLStyle(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLStyle_AddPolyStyleEvent(Sender: TObject);
begin
  TKMLStyle(TargetObject).AddPolyStyle;
  TKMLStyle_ToTree(TKMLStyle(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLStyle_PolyStyleDeleteEvent(obj: TKMLStyle; del: TObject);
begin
  if del is TKMLLineStyle then
  begin
    TKMLStyle(obj).PolyStyleRemove;
    TKMLStyle_ToTree(TKMLStyle(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLStyle_AddBalloonStyleEvent(Sender: TObject);
begin
  TKMLStyle(TargetObject).AddBalloonStyle;
  TKMLStyle_ToTree(TKMLStyle(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLStyle_BalloonStyleDeleteEvent(obj: TKMLStyle; del: TObject);
begin
  if del is TKMLBalloonStyle then
  begin
    TKMLStyle(obj).BalloonStyleRemove;
    TKMLStyle_ToTree(TKMLStyle(obj), TargetNode);
  end;
end;

    { TKMLIconStyle }
procedure TKMLTree.TKMLIconStyle_ToTree(Obj: TKMLIconStyle; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('IconStyle');
  TKMLIcon_ToTree(obj.Icon, TreeNodeShape.AddChildObject('Icon', obj.Icon));
end;

procedure TKMLTree.TKMLIconStyle_ToPopupMenu(obj: TKMLIconStyle; Sender: TObject);
var
  pop: TPopupMenu;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
  end;
end;

procedure TKMLTree.TKMLIconStyle_ToInspector(obj: TKMLIconStyle; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLIconStyle_SetXMLProperty(obj: TKMLIconStyle; Index: Integer; _Value: String);
begin
end;

procedure TKMLTree.TKMLIconStyle_Copy(source, target: TKMLIconStyle);
var
  I:Integer;
begin
      TKMLIcon_Copy(source.Icon, target.Icon);
  TKMLIconStyle_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLIconStyle_PasteToEvent(obj: TKMLIconStyle; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
begin
  if (items.Count = 1) and (items[0] is TKMLIconStyle) and (not isCut) then
  begin
    TKMLIconStyle_Copy(TKMLIconStyle(items[0]), obj);
    TKMLIconStyle_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
  end;
  TKMLIconStyle_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLIconStyle_ChildDeleteEvent(obj: TKMLIconStyle; del: TObject);
begin
end;
    { TKMLIcon }
procedure TKMLTree.TKMLIcon_ToTree(Obj: TKMLIcon; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('Icon');
  TreeNodeShape.AddChild('href:' + Obj.href);
end;

procedure TKMLTree.TKMLIcon_ToPopupMenu(obj: TKMLIcon; Sender: TObject);
var
  pop: TPopupMenu;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
  end;
end;

procedure TKMLTree.TKMLIcon_ToInspector(obj: TKMLIcon; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  Names_Value.Add('href');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.href);
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLIcon_SetXMLProperty(obj: TKMLIcon; Index: Integer; _Value: String);
begin
  case index of
    0:
      begin
        obj.href := _Value;
      end;
  end;
  TKMLIcon_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLIcon_Copy(source, target: TKMLIcon);
var
  I:Integer;
begin
  target.href := source.href;
  TKMLIcon_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLIcon_PasteToEvent(obj: TKMLIcon; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
begin
  if (items.Count = 1) and (items[0] is TKMLIcon) and (not isCut) then
  begin
    TKMLIcon_Copy(TKMLIcon(items[0]), obj);
    TKMLIcon_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
  end;
  TKMLIcon_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLIcon_ChildDeleteEvent(obj: TKMLIcon; del: TObject);
begin
end;
    { TKMLLineStyle }
procedure TKMLTree.TKMLLineStyle_ToTree(Obj: TKMLLineStyle; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('LineStyle');
  if Obj.colorExsit then
    TreeNodeShape.AddChild('color:' + Obj.color);
  if Obj.widthExsit then
    TreeNodeShape.AddChild('width:' + FloatToStr(Obj.width));
end;

procedure TKMLTree.TKMLLineStyle_ToPopupMenu(obj: TKMLLineStyle; Sender: TObject);
var
  pop: TPopupMenu;
  colorAddMenu: TMenuItem;
  widthAddMenu: TMenuItem;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
    colorAddMenu := TMenuItem.Create(pop);
    colorAddMenu.Caption := 'Add color';
    colorAddMenu.OnClick := TKMLLineStyle_AddcolorEvent;
    pop.Items.Add(colorAddMenu);
    widthAddMenu := TMenuItem.Create(pop);
    widthAddMenu.Caption := 'Add width';
    widthAddMenu.OnClick := TKMLLineStyle_AddwidthEvent;
    pop.Items.Add(widthAddMenu);
  end;
end;

procedure TKMLTree.TKMLLineStyle_ToInspector(obj: TKMLLineStyle; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  Names_Value.Add('color');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.color);
  Names_Value.Add('width');
  Types_Value.Add(xs_double);
  _Values_Value.Add(FloatToStr(Obj.width));
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLLineStyle_SetXMLProperty(obj: TKMLLineStyle; Index: Integer; _Value: String);
begin
  case index of
    0:
      begin
        obj.color := _Value;
      end;
    1:
      begin
        obj.width := StrToFloatDef(_Value, 0);;
      end;
  end;
  TKMLLineStyle_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLLineStyle_Copy(source, target: TKMLLineStyle);
var
  I:Integer;
begin
  target.color := source.color;
  target.colorExsit := source.colorExsit;
  target.width := source.width;
  target.widthExsit := source.widthExsit;
  TKMLLineStyle_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLLineStyle_PasteToEvent(obj: TKMLLineStyle; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
begin
  if (items.Count = 1) and (items[0] is TKMLLineStyle) and (not isCut) then
  begin
    TKMLLineStyle_Copy(TKMLLineStyle(items[0]), obj);
    TKMLLineStyle_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
  end;
  TKMLLineStyle_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLLineStyle_ChildDeleteEvent(obj: TKMLLineStyle; del: TObject);
begin
end;
procedure TKMLTree.TKMLLineStyle_AddcolorEvent(Sender: TObject);
begin
  TKMLLineStyle(TargetObject).Addcolor;
  TKMLLineStyle_ToTree(TKMLLineStyle(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLLineStyle_AddwidthEvent(Sender: TObject);
begin
  TKMLLineStyle(TargetObject).Addwidth;
  TKMLLineStyle_ToTree(TKMLLineStyle(TargetObject), TargetNode);
end;

    { TKMLBalloonStyle }
procedure TKMLTree.TKMLBalloonStyle_ToTree(Obj: TKMLBalloonStyle; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('BalloonStyle');
  TreeNodeShape.AddChild('text:' + Obj.text);
end;

procedure TKMLTree.TKMLBalloonStyle_ToPopupMenu(obj: TKMLBalloonStyle; Sender: TObject);
var
  pop: TPopupMenu;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
  end;
end;

procedure TKMLTree.TKMLBalloonStyle_ToInspector(obj: TKMLBalloonStyle; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  Names_Value.Add('text');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.text);
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLBalloonStyle_SetXMLProperty(obj: TKMLBalloonStyle; Index: Integer; _Value: String);
begin
  case index of
    0:
      begin
        obj.text := _Value;
      end;
  end;
  TKMLBalloonStyle_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLBalloonStyle_Copy(source, target: TKMLBalloonStyle);
var
  I:Integer;
begin
  target.text := source.text;
  TKMLBalloonStyle_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLBalloonStyle_PasteToEvent(obj: TKMLBalloonStyle; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
begin
  if (items.Count = 1) and (items[0] is TKMLBalloonStyle) and (not isCut) then
  begin
    TKMLBalloonStyle_Copy(TKMLBalloonStyle(items[0]), obj);
    TKMLBalloonStyle_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
  end;
  TKMLBalloonStyle_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLBalloonStyle_ChildDeleteEvent(obj: TKMLBalloonStyle; del: TObject);
begin
end;
    { TKMLStyleMap }
procedure TKMLTree.TKMLStyleMap_ToTree(Obj: TKMLStyleMap; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('StyleMap');
  for I := 0 to obj.PairCount - 1 do
  begin
    TKMLPair_ToTree(obj.Pair[I], TreeNodeShape.AddChildObject('Pair', obj.Pair[I]));
  end;
  TreeNodeShape.AddChild('ID:' + Obj.ID);
end;

procedure TKMLTree.TKMLStyleMap_ToPopupMenu(obj: TKMLStyleMap; Sender: TObject);
var
  pop: TPopupMenu;
  PairAddMenu: TMenuItem;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
    PairAddMenu := TMenuItem.Create(pop);
    PairAddMenu.Caption := 'Add Pair';
    PairAddMenu.OnClick := TKMLStyleMap_AddPairEvent;
    pop.Items.Add(PairAddMenu);
  end;
end;

procedure TKMLTree.TKMLStyleMap_ToInspector(obj: TKMLStyleMap; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  Names_Value.Add('ID');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.ID);
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLStyleMap_SetXMLProperty(obj: TKMLStyleMap; Index: Integer; _Value: String);
begin
  case index of
    0:
      begin
        obj.ID := _Value;
      end;
  end;
  TKMLStyleMap_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLStyleMap_Copy(source, target: TKMLStyleMap);
var
  I:Integer;
begin
  target.PairClear;
  for I := 0 to source.PairCount - 1 do
  begin
      TKMLPair_Copy(source.Pair[I], target. AddNewPair);
  end;
  target.ID := source.ID;
  TKMLStyleMap_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLStyleMap_PasteToEvent(obj: TKMLStyleMap; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
  tmpPair: TKMLPair;
begin
  if (items.Count = 1) and (items[0] is TKMLStyleMap) and (not isCut) then
  begin
    TKMLStyleMap_Copy(TKMLStyleMap(items[0]), obj);
    TKMLStyleMap_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
    if items[I] is TKMLPair then
    begin
      tmpPair := TKMLPair(items[I]);
      if isCut then
      begin
      end
      else
      begin
        TKMLPair_Copy(tmpPair, obj.AddNewPair);
      end;
    end;
  end;
  TKMLStyleMap_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLStyleMap_ChildDeleteEvent(obj: TKMLStyleMap; del: TObject);
begin
  if del is TKMLPair then
  begin
    TKMLStyleMap(obj).RemovePair(TKMLPair(del));
    TKMLStyleMap_ToTree(TKMLStyleMap(obj), TargetNode);
  end;
end;
procedure TKMLTree.TKMLStyleMap_AddPairEvent(Sender: TObject);
begin
  TKMLStyleMap(TargetObject).AddNewPair;
  TKMLStyleMap_ToTree(TKMLStyleMap(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLStyleMap_PairDeleteEvent(obj: TKMLStyleMap; del: TObject);
begin
  if del is TKMLPair then
  begin
    TKMLStyleMap(obj).RemovePair(TKMLPair(del));
    TKMLStyleMap_ToTree(TKMLStyleMap(obj), TargetNode);
  end;
end;

    { TKMLScreenOverlay }
procedure TKMLTree.TKMLScreenOverlay_ToTree(Obj: TKMLScreenOverlay; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('ScreenOverlay');
  if Obj.NameExsit then
    TreeNodeShape.AddChild('Name:' + Obj.Name);
  if Obj.VisibilityExsit then
    TreeNodeShape.AddChild('Visibility:' + IntToStr(Obj.Visibility));
  if Obj.DescriptionExsit then
    TreeNodeShape.AddChild('Description:' + Obj.Description);
  if Obj.IconExsit then
  begin
    TKMLIcon_ToTree(obj.Icon, TreeNodeShape.AddChildObject('Icon', obj.Icon));
  end;
  if Obj.OverlayXYExsit then
  begin
    TKMLSize_ToTree(obj.OverlayXY, TreeNodeShape.AddChildObject('OverlayXY', obj.OverlayXY));
  end;
  if Obj.ScreenXYExsit then
  begin
    TKMLSize_ToTree(obj.ScreenXY, TreeNodeShape.AddChildObject('ScreenXY', obj.ScreenXY));
  end;
  if Obj.RotationXYExsit then
  begin
    TKMLSize_ToTree(obj.RotationXY, TreeNodeShape.AddChildObject('RotationXY', obj.RotationXY));
  end;
  if Obj.SizeExsit then
  begin
    TKMLSize_ToTree(obj.Size, TreeNodeShape.AddChildObject('Size', obj.Size));
  end;
end;

procedure TKMLTree.TKMLScreenOverlay_ToPopupMenu(obj: TKMLScreenOverlay; Sender: TObject);
var
  pop: TPopupMenu;
  NameAddMenu: TMenuItem;
  VisibilityAddMenu: TMenuItem;
  DescriptionAddMenu: TMenuItem;
  IconAddMenu: TMenuItem;
  OverlayXYAddMenu: TMenuItem;
  ScreenXYAddMenu: TMenuItem;
  RotationXYAddMenu: TMenuItem;
  SizeAddMenu: TMenuItem;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
    NameAddMenu := TMenuItem.Create(pop);
    NameAddMenu.Caption := 'Add Name';
    NameAddMenu.OnClick := TKMLScreenOverlay_AddNameEvent;
    pop.Items.Add(NameAddMenu);
    VisibilityAddMenu := TMenuItem.Create(pop);
    VisibilityAddMenu.Caption := 'Add Visibility';
    VisibilityAddMenu.OnClick := TKMLScreenOverlay_AddVisibilityEvent;
    pop.Items.Add(VisibilityAddMenu);
    DescriptionAddMenu := TMenuItem.Create(pop);
    DescriptionAddMenu.Caption := 'Add Description';
    DescriptionAddMenu.OnClick := TKMLScreenOverlay_AddDescriptionEvent;
    pop.Items.Add(DescriptionAddMenu);
    IconAddMenu := TMenuItem.Create(pop);
    IconAddMenu.Caption := 'Add Icon';
    IconAddMenu.OnClick := TKMLScreenOverlay_AddIconEvent;
    pop.Items.Add(IconAddMenu);
    OverlayXYAddMenu := TMenuItem.Create(pop);
    OverlayXYAddMenu.Caption := 'Add OverlayXY';
    OverlayXYAddMenu.OnClick := TKMLScreenOverlay_AddOverlayXYEvent;
    pop.Items.Add(OverlayXYAddMenu);
    ScreenXYAddMenu := TMenuItem.Create(pop);
    ScreenXYAddMenu.Caption := 'Add ScreenXY';
    ScreenXYAddMenu.OnClick := TKMLScreenOverlay_AddScreenXYEvent;
    pop.Items.Add(ScreenXYAddMenu);
    RotationXYAddMenu := TMenuItem.Create(pop);
    RotationXYAddMenu.Caption := 'Add RotationXY';
    RotationXYAddMenu.OnClick := TKMLScreenOverlay_AddRotationXYEvent;
    pop.Items.Add(RotationXYAddMenu);
    SizeAddMenu := TMenuItem.Create(pop);
    SizeAddMenu.Caption := 'Add Size';
    SizeAddMenu.OnClick := TKMLScreenOverlay_AddSizeEvent;
    pop.Items.Add(SizeAddMenu);
  end;
end;

procedure TKMLTree.TKMLScreenOverlay_ToInspector(obj: TKMLScreenOverlay; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  Names_Value.Add('Name');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.Name);
  Names_Value.Add('Visibility');
  Types_Value.Add(xs_integer);
  _Values_Value.Add(IntToStr(Obj.Visibility));
  Names_Value.Add('Description');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.Description);
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLScreenOverlay_SetXMLProperty(obj: TKMLScreenOverlay; Index: Integer; _Value: String);
begin
  case index of
    0:
      begin
        obj.Name := _Value;
      end;
    1:
      begin
        obj.Visibility := StrToIntDef(_Value, 0);;
      end;
    2:
      begin
        obj.Description := _Value;
      end;
  end;
  TKMLScreenOverlay_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLScreenOverlay_Copy(source, target: TKMLScreenOverlay);
var
  I:Integer;
begin
  target.Name := source.Name;
  target.NameExsit := source.NameExsit;
  target.Visibility := source.Visibility;
  target.VisibilityExsit := source.VisibilityExsit;
  target.Description := source.Description;
  target.DescriptionExsit := source.DescriptionExsit;
  target.IconExsit := source.IconExsit;
  if source.IconExsit then
  begin
      TKMLIcon_Copy(source.Icon, target.AddIcon);
  end;
  target.OverlayXYExsit := source.OverlayXYExsit;
  if source.OverlayXYExsit then
  begin
      TKMLSize_Copy(source.OverlayXY, target.AddOverlayXY);
  end;
  target.ScreenXYExsit := source.ScreenXYExsit;
  if source.ScreenXYExsit then
  begin
      TKMLSize_Copy(source.ScreenXY, target.AddScreenXY);
  end;
  target.RotationXYExsit := source.RotationXYExsit;
  if source.RotationXYExsit then
  begin
      TKMLSize_Copy(source.RotationXY, target.AddRotationXY);
  end;
  target.SizeExsit := source.SizeExsit;
  if source.SizeExsit then
  begin
      TKMLSize_Copy(source.Size, target.AddSize);
  end;
  TKMLScreenOverlay_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLScreenOverlay_PasteToEvent(obj: TKMLScreenOverlay; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
begin
  if (items.Count = 1) and (items[0] is TKMLScreenOverlay) and (not isCut) then
  begin
    TKMLScreenOverlay_Copy(TKMLScreenOverlay(items[0]), obj);
    TKMLScreenOverlay_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
  end;
  TKMLScreenOverlay_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLScreenOverlay_ChildDeleteEvent(obj: TKMLScreenOverlay; del: TObject);
begin
end;
procedure TKMLTree.TKMLScreenOverlay_AddNameEvent(Sender: TObject);
begin
  TKMLScreenOverlay(TargetObject).AddName;
  TKMLScreenOverlay_ToTree(TKMLScreenOverlay(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLScreenOverlay_AddVisibilityEvent(Sender: TObject);
begin
  TKMLScreenOverlay(TargetObject).AddVisibility;
  TKMLScreenOverlay_ToTree(TKMLScreenOverlay(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLScreenOverlay_AddDescriptionEvent(Sender: TObject);
begin
  TKMLScreenOverlay(TargetObject).AddDescription;
  TKMLScreenOverlay_ToTree(TKMLScreenOverlay(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLScreenOverlay_AddIconEvent(Sender: TObject);
begin
  TKMLScreenOverlay(TargetObject).AddIcon;
  TKMLScreenOverlay_ToTree(TKMLScreenOverlay(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLScreenOverlay_IconDeleteEvent(obj: TKMLScreenOverlay; del: TObject);
begin
  if del is TKMLIcon then
  begin
    TKMLScreenOverlay(obj).IconRemove;
    TKMLScreenOverlay_ToTree(TKMLScreenOverlay(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLScreenOverlay_AddOverlayXYEvent(Sender: TObject);
begin
  TKMLScreenOverlay(TargetObject).AddOverlayXY;
  TKMLScreenOverlay_ToTree(TKMLScreenOverlay(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLScreenOverlay_OverlayXYDeleteEvent(obj: TKMLScreenOverlay; del: TObject);
begin
  if del is TKMLSize then
  begin
    TKMLScreenOverlay(obj).OverlayXYRemove;
    TKMLScreenOverlay_ToTree(TKMLScreenOverlay(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLScreenOverlay_AddScreenXYEvent(Sender: TObject);
begin
  TKMLScreenOverlay(TargetObject).AddScreenXY;
  TKMLScreenOverlay_ToTree(TKMLScreenOverlay(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLScreenOverlay_ScreenXYDeleteEvent(obj: TKMLScreenOverlay; del: TObject);
begin
  if del is TKMLSize then
  begin
    TKMLScreenOverlay(obj).ScreenXYRemove;
    TKMLScreenOverlay_ToTree(TKMLScreenOverlay(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLScreenOverlay_AddRotationXYEvent(Sender: TObject);
begin
  TKMLScreenOverlay(TargetObject).AddRotationXY;
  TKMLScreenOverlay_ToTree(TKMLScreenOverlay(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLScreenOverlay_RotationXYDeleteEvent(obj: TKMLScreenOverlay; del: TObject);
begin
  if del is TKMLSize then
  begin
    TKMLScreenOverlay(obj).RotationXYRemove;
    TKMLScreenOverlay_ToTree(TKMLScreenOverlay(obj), TargetNode);
  end;
end;

procedure TKMLTree.TKMLScreenOverlay_AddSizeEvent(Sender: TObject);
begin
  TKMLScreenOverlay(TargetObject).AddSize;
  TKMLScreenOverlay_ToTree(TKMLScreenOverlay(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLScreenOverlay_SizeDeleteEvent(obj: TKMLScreenOverlay; del: TObject);
begin
  if del is TKMLSize then
  begin
    TKMLScreenOverlay(obj).SizeRemove;
    TKMLScreenOverlay_ToTree(TKMLScreenOverlay(obj), TargetNode);
  end;
end;

    { TKMLPair }
procedure TKMLTree.TKMLPair_ToTree(Obj: TKMLPair; TreeNodeShape: TTreeNodeShape);
var
  I: Integer;
begin
  if not Assigned(TreeNodeShape) then
  begin
    Exit;
  end;
  TreeNodeShape.Clear;
  TreeNodeShape.Data := Obj;
  TreeNodeShape.Text.Clear;
  TreeNodeShape.Text.Add('Pair');
  if Obj.KeyExsit then
    TreeNodeShape.AddChild('Key:' + Obj.Key);
  if Obj.StyleUrlExsit then
    TreeNodeShape.AddChild('StyleUrl:' + Obj.StyleUrl);
end;

procedure TKMLTree.TKMLPair_ToPopupMenu(obj: TKMLPair; Sender: TObject);
var
  pop: TPopupMenu;
  KeyAddMenu: TMenuItem;
  StyleUrlAddMenu: TMenuItem;
begin
  if Assigned(Sender) and (Sender is TPopupMenu) then
  begin
    pop := TPopupMenu(Sender);
    pop.Items.Clear;
    KeyAddMenu := TMenuItem.Create(pop);
    KeyAddMenu.Caption := 'Add Key';
    KeyAddMenu.OnClick := TKMLPair_AddKeyEvent;
    pop.Items.Add(KeyAddMenu);
    StyleUrlAddMenu := TMenuItem.Create(pop);
    StyleUrlAddMenu.Caption := 'Add StyleUrl';
    StyleUrlAddMenu.OnClick := TKMLPair_AddStyleUrlEvent;
    pop.Items.Add(StyleUrlAddMenu);
  end;
end;

procedure TKMLTree.TKMLPair_ToInspector(obj: TKMLPair; ins: TObject);
var
  Names_Value: TStringList;
  Types_Value: TList<XMLTypes>;
  _Values_Value: TStringList;
begin
  if not Assigned(ins) then
    Exit;
  Names_Value := TStringList.Create;
  Types_Value := TList<XMLTypes>.Create;
  _Values_Value := TStringList.Create;
  Names_Value.Add('Key');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.Key);
  Names_Value.Add('StyleUrl');
  Types_Value.Add(xs_string);
  _Values_Value.Add(Obj.StyleUrl);
  TXMLInspector(ins).SetData(Names_Value, _Values_Value, Types_Value, Obj, Self);
end;

procedure TKMLTree.TKMLPair_SetXMLProperty(obj: TKMLPair; Index: Integer; _Value: String);
begin
  case index of
    0:
      begin
        obj.Key := _Value;
      end;
    1:
      begin
        obj.StyleUrl := _Value;
      end;
  end;
  TKMLPair_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLPair_Copy(source, target: TKMLPair);
var
  I:Integer;
begin
  target.Key := source.Key;
  target.KeyExsit := source.KeyExsit;
  target.StyleUrl := source.StyleUrl;
  target.StyleUrlExsit := source.StyleUrlExsit;
  TKMLPair_ToTree(target, TargetNode);
end;

procedure TKMLTree.TKMLPair_PasteToEvent(obj: TKMLPair; items: TList<TObject>; const isCut: Boolean = False);
var
  I: Integer;
begin
  if (items.Count = 1) and (items[0] is TKMLPair) and (not isCut) then
  begin
    TKMLPair_Copy(TKMLPair(items[0]), obj);
    TKMLPair_ToTree(obj, TargetNode);
    Exit;
  end;
  for I := 0 to items.Count - 1 do
  begin
  end;
  TKMLPair_ToTree(obj, TargetNode);
end;

procedure TKMLTree.TKMLPair_ChildDeleteEvent(obj: TKMLPair; del: TObject);
begin
end;
procedure TKMLTree.TKMLPair_AddKeyEvent(Sender: TObject);
begin
  TKMLPair(TargetObject).AddKey;
  TKMLPair_ToTree(TKMLPair(TargetObject), TargetNode);
end;

procedure TKMLTree.TKMLPair_AddStyleUrlEvent(Sender: TObject);
begin
  TKMLPair(TargetObject).AddStyleUrl;
  TKMLPair_ToTree(TKMLPair(TargetObject), TargetNode);
end;


end.
