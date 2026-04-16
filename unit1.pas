unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  RichMemo, ListFilterEdit, RTTICtrls, UGlobales, UMyUtils, UfdeFile, LCLIntf,
  Buttons, ExtCtrls, Menus, Grids, LCLType, ComCtrls, IniPropStorage, EditBtn,
  ActnList, UMyApps, LazFileUtils, SynEdit, SynHighlighterXML, UMyGridString,
  UniqueInstance, atshapeline, CalendarLite, ShellApi, UMyXml, lazutf8, UMyWin,
  DateUtils, DOM, XMLRead, Masks, UMyRCS, IniFiles,
{$IFDEF UNIX}{$IFDEF UseCThreads}
cthreads,
{$ENDIF}{$ENDIF}
// FPC 3.0 fileinfo reads exe resources as long as you register the appropriate units
fileinfo
, winpeimagereader {need this for reading exe info}
, elfreader {needed for reading ELF executables}
, machoreader {needed for reading MACH-O executables}
, Types;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    BtnsaveDS: TBitBtn;
    BitBtnPRUEBA: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BtnApp1: TBitBtn;
    BitBtn3: TBitBtn;
    BtnApp10: TBitBtn;
    BtnApp11: TBitBtn;
    BtnApp12: TBitBtn;
    BtnApp13: TBitBtn;
    BtnApp14: TBitBtn;
    BtnApp15: TBitBtn;
    BtnApp16: TBitBtn;
    BtnApp17: TBitBtn;
    BtnApp18: TBitBtn;
    BtnApp19: TBitBtn;
    BtnApp2: TBitBtn;
    BtnApp20: TBitBtn;
    BtnApp3: TBitBtn;
    BtnApp4: TBitBtn;
    BtnApp5: TBitBtn;
    BtnApp6: TBitBtn;
    BtnApp7: TBitBtn;
    BtnApp8: TBitBtn;
    BtnApp9: TBitBtn;
    CalendarLite1: TCalendarLite;
    CheckBox1: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    ComboBox1: TComboBox;
    ComboBoxModo: TComboBox;
    ComboBoxPRUEBA: TComboBox;
    ComboBoxDsCopyFrom: TComboBox;
    DATASOURCEPRUEBA: TEdit;
    EditDisplayName: TEdit;
    Editwebxml: TEdit;
    EditFolderApp: TEdit;
    EditModuleName: TEdit;
    EditClientCfg: TEdit;
    EditWar: TEdit;
    Image2: TImage;
    Label26: TLabel;
    Label27: TLabel;
    RESREFNAMEPRUEBA: TEdit;
    EditDSRestype: TEdit;
    EditDSResAuth: TEdit;
    EditDSUseJdbcDataSource: TEdit;
    EditEJJdbcDatasource: TEdit;
    EditJdbcDatasource: TEdit;
    EditEJResRefName: TEdit;
    EditResRefName: TEdit;
    EditDSDescription: TEdit;
    EditModulo: TEdit;
    EditVersion: TEdit;
    EditFechaVersion: TEdit;
    EditPDFReport: TEdit;
    EDRutaFonts: TEdit;
    Edit6: TEdit;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    GroupBoxINFO: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox9: TGroupBox;
    haycambios: TCheckBox;
    Image1: TImage;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    linkwebxml: TLabel;
    linkFolderApp: TLabel;
    linkClientCfg: TLabel;
    linkwar: TLabel;
    LblAdminRequired: TLabel;
    LblPdfReportIni: TLabel;
    LblFullInfo: TLabel;
    linkPDFReport: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListFilterEdit2: TListFilterEdit;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    MenuItem1: TMenuItem;
    MenuItem14: TMenuItem;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    Edit5: TEdit;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    ImgApp10: TImage;
    ImgApp11: TImage;
    ImgApp12: TImage;
    ImgApp13: TImage;
    ImgApp14: TImage;
    ImgApp15: TImage;
    ImgApp16: TImage;
    ImgApp17: TImage;
    ImgApp18: TImage;
    ImgApp19: TImage;
    ImgApp20: TImage;
    ImgApp6: TImage;
    ImgApp7: TImage;
    ImgApp8: TImage;
    ImgApp9: TImage;
    IniPropStorage1: TIniPropStorage;
    Label8: TLabel;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem16: TMenuItem;
    ItemCOPIAR: TMenuItem;
    ItemCopyWar: TMenuItem;
    ItemCopyRuta: TMenuItem;
    ItemVerArchivos: TMenuItem;
    ItemWebXml: TMenuItem;
    ItemPDFReportIni: TMenuItem;
    ItemClientCfg: TMenuItem;
    ItemSeleccionar: TMenuItem;
    ItemSelTodo: TMenuItem;
    ItemCopiarConsola: TMenuItem;
    ItemSelNada: TMenuItem;
    ItemInvertirSel: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem6: TMenuItem;
    MenuTrayClose: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MinAppRun: TCheckBox;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    ImgApp1: TImage;
    ImgApp2: TImage;
    ImgApp3: TImage;
    ImgApp4: TImage;
    ImgApp5: TImage;
    ItemAjustar: TMenuItem;
    MinScriptFDE: TCheckBox;
    MinGenWar: TCheckBox;
    GroupBox1: TGroupBox;
    ItemVerWin: TMenuItem;
    OpenDialog2: TOpenDialog;
    EditScript: TPage;
    PageControl1: TPageControl;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Principal: TPage;
    Panel1: TPanel;
    PopupMenu3: TPopupMenu;
    PopupMenuConsola: TPopupMenu;
    RichMemo1: TRichMemo;
    RichMemo3: TRichMemo;
    ShapeLine1: TShapeLine;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    StatusBar1: TStatusBar;
    StringGrid1: TStringGrid;
    StringGrid4: TStringGrid;
    StringGrid5: TStringGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    PRUEBAS: TTabSheet;
    TabSheet6: TTabSheet;
    TrayPopMenu: TPopupMenu;
    ToTray: TCheckBox;
    LblOriginalFilename: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LblProductName: TLabel;
    LblProductVersion: TLabel;
    MainMenu1: TMainMenu;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ListFilterEdit1: TListFilterEdit;
    ItemCheck_Uncheck: TMenuItem;
    Notebook1: TNotebook;
    OpenDialog1: TOpenDialog;
    RunFDE: TPage;
    About: TPage;
    Opciones: TPage;
    PopupMenu1: TPopupMenu;
    SaveDialog1: TSaveDialog;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    Shape3: TShape;
    Timer1: TTimer;
    Timer2: TTimer;
    TrayIcon1: TTrayIcon;
    UniqueInstance1: TUniqueInstance;

    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtnPRUEBAClick(Sender: TObject);
    procedure BtnApp10Click(Sender: TObject);
    procedure BtnApp10MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnApp11Click(Sender: TObject);
    procedure BtnApp11MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnApp12Click(Sender: TObject);
    procedure BtnApp12MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnApp13Click(Sender: TObject);
    procedure BtnApp13MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnApp14Click(Sender: TObject);
    procedure BtnApp14MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnApp15Click(Sender: TObject);
    procedure BtnApp15MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnApp16Click(Sender: TObject);
    procedure BtnApp16MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnApp17Click(Sender: TObject);
    procedure BtnApp17MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnApp18Click(Sender: TObject);
    procedure BtnApp18MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnApp19Click(Sender: TObject);
    procedure BtnApp19MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnApp1Click(Sender: TObject);
    procedure BtnApp1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnApp20Click(Sender: TObject);
    procedure BtnApp20MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnApp2Click(Sender: TObject);
    procedure BtnApp2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnApp3Click(Sender: TObject);
    procedure BtnApp3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnApp4Click(Sender: TObject);
    procedure BtnApp4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnApp5Click(Sender: TObject);
    procedure BtnApp5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnApp6Click(Sender: TObject);
    procedure BtnApp6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnApp7Click(Sender: TObject);
    procedure BtnApp7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnApp8Click(Sender: TObject);
    procedure BtnApp8MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnApp9Click(Sender: TObject);
    procedure BtnApp9MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnsaveDSClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CalendarLite1DateChange(Sender: TObject);
    procedure CheckBox10Change(Sender: TObject);
    procedure CheckBox11Change(Sender: TObject);
    procedure CheckBox12Change(Sender: TObject);
    procedure CheckBox13Change(Sender: TObject);
    procedure CheckBox14Change(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox4Change(Sender: TObject);
    procedure CheckBox5Change(Sender: TObject);
    procedure CheckBox6Change(Sender: TObject);
    procedure CheckBox7Change(Sender: TObject);
    procedure CheckBox8Change(Sender: TObject);
    procedure CheckBox9Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBoxModoChange(Sender: TObject);
    procedure ComboBoxDsCopyFromChange(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure EditFolderAppChange(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit6Click(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure EditDSDescriptionChange(Sender: TObject);
    procedure EditDSResAuthChange(Sender: TObject);
    procedure EditDSRestypeChange(Sender: TObject);
    procedure EditDSUseJdbcDataSourceChange(Sender: TObject);
    procedure EditDSUseJdbcDataSourceKeyPress(Sender: TObject; var Key: char);
    procedure EditFechaVersionChange(Sender: TObject);
    procedure EditFechaVersionKeyPress(Sender: TObject; var Key: char);
    procedure EditJdbcDatasourceChange(Sender: TObject);
    procedure EditModuloChange(Sender: TObject);
    procedure EditModuloKeyPress(Sender: TObject; var Key: char);
    procedure EditResRefNameChange(Sender: TObject);
    procedure EditScriptBeforeShow(ASender: TObject; ANewPage: TPage;
      ANewIndex: Integer);
    procedure EditVersionChange(Sender: TObject);
    procedure EditVersionKeyPress(Sender: TObject; var Key: char);
    procedure EditWebxmlBeforeShow(ASender: TObject; ANewPage: TPage;
      ANewIndex: Integer);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure haycambiosChange(Sender: TObject);
    procedure ImgApp10MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgApp1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgApp2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgApp3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgApp4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgApp5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgApp6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgApp7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgApp8MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgApp9MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ItemClientCfgClick(Sender: TObject);
    procedure ItemCopiarConsolaClick(Sender: TObject);
    procedure ItemCopyRutaClick(Sender: TObject);
    procedure ItemCopyWarClick(Sender: TObject);
    procedure ItemInvertirSelClick(Sender: TObject);
    procedure ItemPDFReportIniClick(Sender: TObject);
    procedure ItemSelNadaClick(Sender: TObject);
    procedure ItemSelTodoClick(Sender: TObject);
    procedure ItemWebXmlClick(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure Label18Click(Sender: TObject);
    procedure Label22Click(Sender: TObject);
    procedure Label23Click(Sender: TObject);
    procedure Label24Click(Sender: TObject);
    procedure Label25Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure LblPdfReportIniClick(Sender: TObject);
    procedure linkClientCfgClick(Sender: TObject);
    procedure linkFolderAppClick(Sender: TObject);
    procedure linkPDFReportClick(Sender: TObject);
    procedure linkwarClick(Sender: TObject);
    procedure linkwebxmlClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure ListFilterEdit2Change(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure ItemAjustarClick(Sender: TObject);
    procedure MenuItem23Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuTrayCloseClick(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MinAppRunChange(Sender: TObject);
    procedure MinGenWarChange(Sender: TObject);
    procedure MinScriptFDEChange(Sender: TObject);
    procedure FormWindowStateChange(Sender: TObject);
    procedure ItemCheck_UncheckClick(Sender: TObject);
    procedure ItemVerWinClick(Sender: TObject);
    procedure OpcionesBeforeShow(ASender: TObject; ANewPage: TPage;
      ANewIndex: Integer);
     procedure PrincipalBeforeShow(ASender: TObject; ANewPage: TPage;
      ANewIndex: Integer);
    procedure RichMemo3Change(Sender: TObject);
    procedure Splitter2CanOffset(Sender: TObject; var NewOffset: Integer;
      var Accept: Boolean);
    procedure StatusBar1Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGrid1Selection(Sender: TObject; aCol, aRow: Integer);
    procedure StringGrid4SelectEditor(Sender: TObject; aCol, aRow: Integer;
      var Editor: TWinControl);
    procedure StringGrid4SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure StringGrid5EditingDone(Sender: TObject);
    procedure StringGrid5KeyPress(Sender: TObject; var Key: char);
    procedure StringGrid5SelectEditor(Sender: TObject; aCol, aRow: Integer;
      var Editor: TWinControl);
    procedure StringGrid5SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure TabSheet3Show(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure TabSheet6Show(Sender: TObject);
    procedure ToTrayChange(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure ListFilterEdit1Change(Sender: TObject);
    procedure menuBtnClick(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure RunFDEBeforeShow(ASender: TObject; ANewPage: TPage;
      ANewIndex: Integer);
    procedure AboutBeforeShow(ASender: TObject; ANewPage: TPage;
      ANewIndex: Integer);
    procedure AboutExit(Sender: TObject);
    procedure SeleccionarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure UniqueInstance1OtherInstance(Sender: TObject;
      ParamCount: Integer; const Parameters: array of String);
  private
    Procedure HandleApplicationActivate(Sender: TObject);
    procedure Iniciar();
    procedure Procesar();
    procedure Refrescar();
    Procedure MinimizeToTray();
    Procedure ActivateMainWindow();
    Procedure RestoreFromTray();
    procedure RefreshAPPS();
    Procedure ChangeStringGrid1();
    procedure ApplyScanModeUI();
    procedure SetStatusMessage(const Msg: String);
    function IsArchiveScanMode(): Boolean;
    procedure ResetArchiveDataSourcePreview();
    procedure loadMemo3();
    procedure loadComboboxDataSources();
    procedure RefreshScanModeSelector();
    function CleanTempDirContent(): String;
    function DeleteTempDirOnFinish(): String;
    function BuildArchiveTempRoot(): String;
    function BuildArchiveTempDir(const ArchivePath: String): String;
    function BuildArchiveModuleName(const ArchivePath: String): String;
    function BuildArchiveId(const ArchivePath: String): String;
    function SanitizeArchiveName(const Value: String): String;
    function ExtractArchiveToTemp(const ArchivePath, TargetDir: String): String;
    function PlanArchiveSelectiveExtraction(const ArchivePath, AppDir: String;
      FilesToExtract, DirsToCreate, MarkerFilesToCreate, EntriesToDelete: TStrings; out NeedFullExtract,
      NeedsRepack: Boolean; out Reason: String): String;
    function ExtractArchiveSelectiveToTemp(const ArchivePath, TargetDir: String;
      FilesToExtract, DirsToCreate, MarkerFilesToCreate, EntriesToDelete: TStrings): String;
    function RepackTempToArchive(const SourceDir, ArchivePath: String): String;
    function FormatElapsedMs(const ElapsedMs: Int64): String;
    function NormalizeArchiveEntryPath(const Value: String): String;
    function ArchiveHasAnyEntry(const ArchiveEntries: TStrings; const Pattern: String): Boolean;
    function FindArchiveEntry(const ArchiveEntries: TStrings; const EntryPath: String; out ExactEntry: String): Boolean;
    procedure AddArchiveMatches(const ArchiveEntries: TStrings; const Pattern: String; Matches: TStrings);
    procedure AddFirstArchiveMatch(const ArchiveEntries: TStrings; const Pattern: String; Matches: TStrings);
    procedure AddMarkerFile(const EntryPath: String; MarkerFilesToCreate: TStrings);
    procedure AddArchiveDirEntries(const ArchiveEntries: TStrings; const DirPath: String; Matches: TStrings; IncludeDirEntry: Boolean);
    function ArchiveDirExists(const ArchiveEntries: TStrings; const DirPath: String): Boolean;
    function ArchiveDirHasFiles(const ArchiveEntries: TStrings; const DirPath: String): Boolean;
    procedure AddDirWithParents(const DirPath: String; Dirs: TStrings);
    procedure AddArchiveDirMatches(const ArchiveEntries: TStrings; const DirPath: String; Dirs: TStrings);
    function FindArchiveClientCfgEntry(const ArchiveEntries: TStrings; out ClientCfgEntry, Module, GxVersion: String): Boolean;
    procedure LoadArchiveDataSourcePreview(const ARow: Integer);
    procedure ApplyDataSourceWarZip();
    procedure ShowArchiveDisplayName();
    procedure ApplyDisplayNameWarZip();
    procedure LogWarZipFdeMessage(const Texto: String; MsgColor: TColor = clDefault);
    function LogArchiveWebAppsRules(const AppDir: String; const ArchiveEntries: TStrings): Integer;
    function BuildArchiveSelectivePlan(const AppDir: String; const ArchiveEntries,
      FilesToExtract, DirsToCreate, MarkerFilesToCreate, EntriesToDelete: TStrings; out NeedFullExtract, NeedsRepack: Boolean;
      out Reason: String): String;
    procedure ProcesaPDFReportWarZip(CopyFonts:Boolean; PathFonts:String; PDFReportTXT:String);
    procedure ProcesarWarZip();
    { private declarations }
  public
    { public declarations }
  end;

var
  Utils:TMyUtils;
  Form1: TForm1;
  varGlobales : TGlobales;
  fdedir:String;
  fdefilepath:String;
  POPAPP:String;
  MyApp:TMyApps;
  Firstload:Integer;

implementation

{$R *.lfm}

{ TForm1 }
Procedure TForm1.HandleApplicationActivate(Sender: TObject);
Begin
  StringGrid1.Repaint;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  FileVerInfo: TFileVersionInfo;
  X:Integer;
begin
  Firstload:=0;
  StatusBar1.SimplePanel:=True;
  Label16.Caption:=Utils.versionStr(EditModulo.Text,EditVersion.Text,EditFechaVersion.Text);
  Application.AddOnActivateHandler(@HandleApplicationActivate);
  //TrayIcon1.Hide;
  FileVerInfo:=TFileVersionInfo.Create(nil);
  If  TrayIcon1.Hide then TrayIcon1.Show;
  try
    FileVerInfo.ReadFileInfo;
    LblProductName.Caption:=FileVerInfo.VersionStrings.Values['ProductName'];
    LblProductVersion.Caption:='Ver.'+FileVerInfo.VersionStrings.Values['ProductVersion'];
    LblOriginalFilename.Caption:=FileVerInfo.VersionStrings.Values['OriginalFilename'];
  finally
    FileVerInfo.Free;
  end;
  //Opciones de Menu(Editor )
  RichMemo1.Clear;
  Utils:=TMyUtils.Create;
  MyApp:=TMyApps.Create;
  varGlobales:=TGlobales.Create;
  fdedir:=varGlobales.FdeDir;
  fdefilepath:=varGlobales.FdeFilePath;
  Edit1.Text:=varGlobales.WebAppsDir;
  SelectDirectoryDialog1.InitialDir:=Edit1.Text;
  OpenDialog1.InitialDir := fdedir;
  Edit2.Text:=fdefilepath;
  CheckBox13.Checked:=varGlobales.EnableWarZipMode;
  CheckBox14.Checked:=varGlobales.ConservarTmpAlFinalizar;
  RefreshScanModeSelector();
  //Pagina
  CheckBox2.Checked:=varGlobales.MostrarOK;
  CheckBox3.Checked:=varGlobales.MostrarERR;
  CheckBox4.Checked:=varGlobales.MostrarMSJ;
  CheckBox7.Checked:=varGlobales.ConfirmDel;
  CheckBox9.Checked:=varGlobales.ClearMemo;
  If (varGlobales.OpcSalir) then
     Notebook1.PageIndex:=varGlobales.PageIndex
  else Utils.goNotebookPage(RunFDE,Notebook1);
  //Opciones
  CheckBox1.Checked:=varGlobales.OcultarDirROOT;
  ToTray.Checked:=varGlobales.TrayMinimize;
  MinGenWar.Checked:=varGlobales.TrayGenWar;
  MinScriptFDE.Checked:=varGlobales.TrayScriptFDE;
  CheckBox5.Checked:=varGlobales.Beep;
  MinAppRun.Checked:=varGlobales.TrayRunAPP;
  CheckBox6.Checked:=varGlobales.OrderByUso;
  CheckBox8.Checked:=varGlobales.OpcSalir;
  CheckBox10.Checked:=varGlobales.DelWars;
  CheckBox12.Checked:=varGlobales.OcultaEjemplosDS;
  ToTray.Caption:='Al presionar Minimizar.';
  MinGenWar.Caption:='Al generar WAR';
  MinScriptFDE.Caption:='Al ejecutar script FDE.';
  MinAppRun.Caption:='Al abrir una aplicación (ejecutor).';
  CheckBox5.Caption:='''Beep'' al terminar de ejecutar un script.';
  CheckBox6.Caption:='Reordenar las aplicaciones por frecuencia de uso.';
  CheckBox8.Caption:='Recordar opción al salir.';
  CheckBox1.Caption:='Excluir ROOT, manager, host-manager, docs y probe.';
  CheckBox10.Caption:='Eliminar *.war antes de generar nuevo war';
  CheckBox12.Caption:='Ocultar plantillas de ejemplo en DataSources.';
  CheckBox13.Caption:='Habilitar modo War/Zip (experimental).';
  CheckBox14.Caption:='Conservar carpeta tmp al finalizar.';
  CheckBox2.Caption:='Muestra mensajes OK.';
  CheckBox2.Hint:='Muestra mensajes OK.';
  CheckBox3.Caption:='Muestra mensajes de error.';
  CheckBox3.Hint:='Muestra mensajes de error.';
  CheckBox4.Caption:='Muestra mensajes de usuario (MSGRUN).';
  CheckBox4.Hint:='Muestra mensajes de usuario (MSGRUN).';
  CheckBox7.Caption:='Pide confirmación antes de eliminar.';
  CheckBox7.Hint:='Pide confirmación antes de eliminar.';
  CheckBox9.Caption:='Limpia la consola antes de cada ejecución.';
  CheckBox9.Hint:='Limpia la consola antes de cada ejecución.';
  If (Not(FileExists(Utils.clearDirPath(varGlobales.JavaHome)+'bin\jar.exe'))) then
     begin
     Edit5.Text:=Utils.retJavaHome();
     varGlobales.JavaHome:=Edit5.Text
     end else Edit5.Text:=varGlobales.JavaHome;
  //WEB.XML (.FDE)
  PageControl1.ActivePage:=TabSheet1;
  TrayIcon1.BalloonTitle:=LblProductName.Caption;
  RefreshAPPS();
  Form1.Caption:=LblProductName.Caption+' '+LblProductVersion.Caption;
  LblAdminRequired.Visible:=(Not(Utils.isElevated()));
  LblAdminRequired.Color:=RGBToColor(176,32,32);
  LblAdminRequired.Font.Color:=clWhite;
  if LblAdminRequired.Visible then
    begin
    PageControl1.BorderSpacing.Top:=LblAdminRequired.Height+8;
    end
  else
    begin
    PageControl1.BorderSpacing.Top:=0;
    end;
  Timer2.Enabled:=LblAdminRequired.Visible;
  ApplyScanModeUI();
  //Web.Xml
  CalendarLite1.Date:=Date;
  EditFechaVersion.Text:=Utils.getFechaHoraForm(Date);
  //PDFREPORT
  ComboBox1.ItemIndex:=varGlobales.PDFReportselection;
  ComboBox1Change(nil);
  //DISPLAYNAME WEBXML
  ListBox1.Items.CommaText:=varGlobales.ListBoxModuloValues;
  ListBox2.Items.CommaText:=varGlobales.ListBoxVersionValues;
  CalendarLite1.DayNames:='do,lu,ma,mi,ju,vi,sá';
  //DATASOURCE
  EditDSDescription.Text:=varGlobales.DSDescription;
  EditDSRestype.Text:=varGlobales.DSResType;
  EditDSResAuth.Text:=varGlobales.DSResAuth;
  EditDSUseJdbcDataSource.Text:=varGlobales.DSUseJdbcDatasource.ToString();
  EditJdbcDatasource.Text:=varGlobales.DSJdbcDataSource;
  EditResRefName.Text:=varGlobales.DSResRefName;
  loadMemo3();
  loadComboboxDataSources;
  ComboBoxDsCopyFrom.ItemIndex:=0;
  if (varGlobales.OcultaEjemplosDS) then x:=1 else x:=4;
  BitBtn28.Enabled:=(ComboBoxDsCopyFrom.ItemIndex>X);
  //INFO
  Firstload:=1;
  ChangeStringGrid1();
end;
procedure TForm1.loadComboboxDataSources();
var DSSL:TStringList;
  i,x,p:Integer;
begin
  DSSL:=varGlobales.getAllDataSources();
  x:= ComboBoxDsCopyFrom.Items.Count-1;
  If (varGlobales.OcultaEjemplosDS) then p:=2 else p:=5;
  For i:=p to x do
   Begin
     ComboBoxDsCopyFrom.Items.Delete(ComboBoxDsCopyFrom.Items.Count-1);
   end;
  For i := 0 to DSSL.Count - 1 do ComboBoxDsCopyFrom.Items.Add(DSSL[i].Split('#')[0]);
  DSSL.Free;
  ComboBoxDsCopyFrom.ItemIndex:=ComboBoxDsCopyFrom.Items.Count-1;
  x:=4;
  If CheckBox12.Checked then X:=1;
  BitBtn28.Enabled:=(ComboBoxDsCopyFrom.ItemIndex>X);
end;

procedure TForm1.loadMemo3();
begin
  Memo3.Lines.Clear;
  Memo3.Lines.Add('client.cfg:');
  Memo3.Lines.Add('USE_JDBC_DATASOURCE='+EditDSUseJdbcDataSource.Text);
  Memo3.Lines.Add('');
  Memo3.Lines.Add('web.xml:');
  Memo3.Lines.Add('<description>'+EditDSDescription.Text+'</description>');
  Memo3.Lines.Add('<res-type>'+EditDSRestype.Text+'</res-type>');
  Memo3.Lines.Add('<res-auth>'+EditDSResAuth.Text+'</res-auth>');
end;

procedure TForm1.Button1Click(Sender: TObject);
var MyXml:TMyXml;
begin
    If OpenDialog1.Execute Then
    begin
      Edit2.Text:=OpenDialog1.FileName;
    end;

    MyXml:=TMyXml.Create(Edit2.Text);
    Label6.Visible:=True;
    IF (MyXml.Validaxml()=False) then
    begin
      Label6.Visible:=False;
      Application.MessageBox('Formato de Archivo [.fde] no válido u obsoleto','ERROR',(MB_ICONERROR+MB_OK));
      Edit2.SetFocus;
    end;
    MyXml.Free;
end;

procedure TForm1.SeleccionarClick(Sender: TObject);
begin
    If  SelectDirectoryDialog1.Execute Then
    begin
      Edit1.Text:=SelectDirectoryDialog1.FileName;
    end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var MyXml:TMyXml;
begin
    MyXml:=TMyXml.Create(Edit2.Text);
    IF (MyXml.Validaxml()=False) then
    begin
      Application.MessageBox('Archivo no válido','ERROR',(MB_ICONERROR+MB_OK));
      Edit2.SetFocus;
      MyXml.Free;
      Exit;
    end;
    MyXml.Free;

    If (Edit2.Text=Edit6.Text) and haycambios.Checked then
    case QuestionDlg ('Archivo Pendiente','Si continúa, se procesará SIN los últimos cambios.',mtWarning,[mrYes,'Continuar', mrNo, 'ir al Editor...', 'IsDefault'],'') of
        mrNo:
          begin
          Utils.goNotebookPage(EditScript,Notebook1);
          Exit;
          end;
        mrCancel: Exit;
    end;

   PageControl1.ActivePage:=TabSheet1;
   If (varGlobales.ClearMemo) Then RichMemo1.Clear;
   Iniciar();
   If (Form1.WindowState = wsMinimized)Or (Form1.ShowInTaskBar = stNever)  Then TrayIcon1.ShowBalloonHint;
end;

procedure TForm1.BitBtn20Click(Sender: TObject);
//NUEVO
var myxml:TMyXml;
  Resp:Integer;
begin
  Resp:=IDOK;
  If haycambios.Checked then
  Resp := Application.MessageBox('Advertencia: PERDERÁ los cambios actuales', 'ADVERTENCIA', (MB_ICONWARNING + MB_OKCANCEL));
  If (Resp<>IDOK) Then Exit;

  myxml:=TMyXml.Create('');
  myxml.ClearAll(Memo1,StringGrid4,StringGrid5);
  Edit6.Text:='';
  myxml.Free;
  haycambios.Checked:=False;
end;

procedure TForm1.BitBtn21Click(Sender: TObject);
var UG:TMyGridString;
begin
  ListFilterEdit2.Text:='';
  If (ListFilterEdit2.Text='') Then
  if (StringGrid4.Row>0) and (StringGrid4.Row<=StringGrid4.RowCount) then
  begin
    UG:=TMyGridString.Create;
    UG.delToGrid(StringGrid4,StringGrid4.Row);
    UG.Free;
    haycambios.Checked:=True;
  end;
end;

procedure TForm1.BitBtn22Click(Sender: TObject);
var UG:TMyGridString;
begin
  if (StringGrid5.Row>0) and (StringGrid5.Row<=StringGrid5.RowCount) then
  begin
    UG:=TMyGridString.Create;
    UG.delToGrid(StringGrid5,StringGrid5.Row);
    UG.Free;
    haycambios.Checked:=True;
  end;
end;

procedure TForm1.BitBtn23Click(Sender: TObject);
var utilGrid:TMyGridString;
begin
  ListFilterEdit2.Text:='';
  IF ListFilterEdit2.Text='' then
  Begin
    utilGrid:=TMyGridString.Create;
    utilGrid.addNewRow2Grid(['','MSGRUN',''],StringGrid4);
    utilGrid.Free;
  end;
  haycambios.checked:=True;
end;

procedure TForm1.BitBtn24Click(Sender: TObject);
var utilGrid:TMyGridString;
begin
  utilGrid:=TMyGridString.Create;
  //#;Etiqueta;Valor;Considerar;Se Encuentra;[X];Mensaje;Color Mensaje
  //N;PL      ;N    ;PL        ;PL          ; 0 ; CH    ;PL
  utilGrid.addNewRow2Grid(['',                   //NR:# (1)
      StringGrid5.Columns.Items[1].PickList[1],  //PL:Etiqueta (web-app)
      '',                                        //NR:Valor (hmenu)
      StringGrid5.Columns.Items[3].PickList[1],  //PL:Considerar (Etiqueta)
      StringGrid5.Columns.Items[4].PickList[0],  //PL:Se Encuentra ([X] veces)
      '1',                                       //0 :[X] (1)
      '',                                        //CH:Mensaje (Existe Valor)
      StringGrid5.Columns.Items[7].PickList[1]], //StringGrid5.Columns.Items[3].PickList[1],
      StringGrid5);
  utilGrid.Free;
  haycambios.checked:=True;
end;

procedure TForm1.BitBtn25Click(Sender: TObject);
var MG:TMyGridString;
begin
  MG:=TMyGridString.Create;
  MG.upInGrid(StringGrid5,haycambios);
  MG.Free;
end;

procedure TForm1.BitBtn26Click(Sender: TObject);
var MG:TMyGridString;
begin
  MG:=TMyGridString.Create;
  MG.downInGrid(StringGrid5,haycambios);
  MG.Free;
end;

procedure TForm1.BitBtn27Click(Sender: TObject);
begin
  varGlobales.DSJdbcDataSource:=EditJdbcDatasource.Text;
  VarGlobales.DSResRefName:=EditResRefName.Text;
  if IsArchiveScanMode() then
  begin
    ApplyDataSourceWarZip();
    Exit;
  end;
  Utils.updDataSource(StringGrid1);
  Utils.getDataSource(Utils.clearFilePath(StringGrid1.Rows[StringGrid1.Row][7]),StringGrid1.Rows[StringGrid1.Row][6],StringGrid1.Rows[StringGrid1.Row][8],StringGrid1.Rows[StringGrid1.Row][4],EditEJJdbcDatasource,EditEJResRefName);
end;

procedure TForm1.BitBtn28Click(Sender: TObject);
var x:integer;
begin
  if (varGlobales.OcultaEjemplosDS) then x:=1 else x:=4;
  If ComboBoxDsCopyFrom.ItemIndex>x then
  begin
    varGlobales.delDataSource(ComboBoxDsCopyFrom.Text);
    loadComboboxDataSources();
    ComboBoxDsCopyFrom.ItemIndex:=0
  end;
  BitBtn28.Enabled:=(ComboBoxDsCopyFrom.ItemIndex>X);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var PDFREP,texto:String;
  i:integer;
begin
  texto:='';
  PDFREP := 'pdfrepper';
  case Combobox1.Text of
       '[WINDOWS]': PDFREP:='pdfrepwin';
       '[LINUX]':   PDFREP:='pdfreplin';
       '[IBM_WAS]': PDFREP:='pdfrepwas';
    end;
  For I := 0 To Memo2.Lines.Count -1 DO texto := texto+Memo2.Lines[i]+'{CRLF}';
  varGlobales.setPDFReportTxt(PDFREP,texto);
  varGlobales.setPDFReportCopyFonts(PDFREP,CheckBox11.Checked);
end;

procedure TForm1.BitBtn10Click(Sender: TObject);
var myw:TMyWin;
    FileVerInfo: TFileVersionInfo;
    BabyMode:String;
begin
  Image2.Visible:=True;
   myw:=TMyWin.Create;
   FileVerInfo:=TFileVersionInfo.Create(nil);
   FileVerInfo.ReadFileInfo;
   Timer1.Enabled:=Not Timer1.Enabled;
   If Timer1.Enabled Then Beep;
      BabyMode:='::BABYMODE::';
   If (myw.IsElevated) Then BabyMode:='::FULL ACCESS::';

     Label7.Caption:='     o o o o o o o o o o o o o o o o o o ♫ o o o o o o o ☺ o o   '+LblProductName.Caption+' '+LblProductVersion.Caption+' '+LblOriginalFilename.Caption;
     LblFullInfo.Caption:=
           'IsAdministrator: '        + BoolToStr(myw.IsAdministrator, True) + sLineBreak +
           'IsAdministratorAccount: ' + BoolToStr(myw.IsAdministratorAccount, True) + sLineBreak +
           'IsUACEnabled: '           + BoolToStr(myw.IsUACEnabled, True) + sLineBreak +
           'IsElevated: '             + BoolToStr(myw.IsElevated, True)+ sLineBreak +
           'Company: '                + FileVerInfo.VersionStrings.Values['CompanyName']+ sLineBreak +
           'File description: '       + FileVerInfo.VersionStrings.Values['FileDescription'] + sLineBreak +
           'File version: '           + FileVerInfo.VersionStrings.Values['FileVersion'] + sLineBreak +
           'Internal name: '          + FileVerInfo.VersionStrings.Values['InternalName']+ sLineBreak +
           'Legal copyright: '        + FileVerInfo.VersionStrings.Values['LegalCopyright']+ sLineBreak +
           'Original filename: '      + FileVerInfo.VersionStrings.Values['OriginalFilename']+ sLineBreak +
           'Product name: '           + FileVerInfo.VersionStrings.Values['ProductName']+ sLineBreak +
           'Product version: '        + FileVerInfo.VersionStrings.Values['ProductVersion']+ sLineBreak +
            BabyMode;

   myw.Free;
   FileVerInfo.Free;
end;

procedure TForm1.BitBtn11Click(Sender: TObject);
begin
  RichMemo1.Clear;
  TrayIcon1.Hint:='';
  StatusBar1.SimpleText:='';
end;

procedure TForm1.BitBtn12Click(Sender: TObject);
begin
  Utils.delItemListBox(ListBox1,ListBox1.GetSelectedText);
  varGlobales.ListBoxModuloValues:=ListBox1.Items.CommaText;
end;

procedure TForm1.BitBtn13Click(Sender: TObject);
begin
  Utils.delItemListBox(ListBox2,ListBox2.GetSelectedText);
  varGlobales.ListBoxVersionValues:=ListBox2.Items.CommaText;
end;

procedure TForm1.BitBtn14Click(Sender: TObject);
var count,I,x:Integer;
    path,pathall:String;
    filcopy:String;
    Files:TStringList;
begin
  filcopy:='';
  pathall:='';
  count:=0;
  for I:=1 to StringGrid1.RowCount - 1 do
   Begin
        If StringGrid1.Cells[0,i]='1' then
        Begin
           Files:=TStringList.Create;
           FindAllFiles(Files,Utils.clearDirPath(StringGrid1.Rows[I][2]),'*.war',false);
           for x := 0 to Files.Count - 1 do
            Begin
             path:=Files[x];
             If FileExists(path) then
             begin
                count:=count+1;
                filcopy:=filcopy+#13#10+ExtractFileName(Files[x]);
                if pathall.IsEmpty then pathall:=path else pathall:=trim(pathall)+#0+path;
             end;
            end;
           Files.Free;
        end;
   end;
   Utils.FileToClipboard(pathall);
   ShowMessage('Se copiaron '+count.ToString+' archivo(s) al portapapeles:'+filcopy);
end;

procedure TForm1.BitBtn15Click(Sender: TObject);
begin
  Utils.applyDataSource(EditJdbcDatasource,EditResRefName,ComboBoxDsCopyFrom,EditEJJdbcDatasource.Text,EditEJResRefName.Text);
end;

procedure TForm1.BitBtn16Click(Sender: TObject);
//ABRIR
var MyXml:TMyXml;
  Resp:Integer;
begin
  Resp:=IDOK;
  If haycambios.Checked then
  Resp := Application.MessageBox('Advertencia: PERDERÁ los cambios actuales', 'ADVERTENCIA', (MB_ICONWARNING + MB_OKCANCEL));
  If (Resp<>IDOK) Then Exit;

  If OpenDialog1.Execute Then
  Begin
    MyXml:=TMyXml.Create(OpenDialog1.FileName);
    IF (MyXml.Validaxml()) then
    begin
    Edit6.Text:='';
    Edit6.Text:=OpenDialog1.FileName
    end
    else begin
     Edit6.Text:='';
     Application.MessageBox('Formato de archivo no válido','ERROR',(MB_ICONERROR+MB_OK));
    end;
    MyXml.Free;
  end;

end;

procedure TForm1.BitBtn17Click(Sender: TObject);
//GUARDAR
var myXml:TMyXml;
begin
  If (Trim(Edit6.Text)).IsEmpty then
  begin
    ShowMessage('Ingrese un Nombre de Archivo');
    exit;
  end;
  myxml:= tmyXml.create(Edit6.Text);
  If myXml.Validaxml() or (Not(FileExists(Edit6.Text))) then
  begin
    ListFilterEdit2.Text:='';
    myxml.Save2Grids(Memo1,StringGrid4,StringGrid5);
    StringGrid4.col:=0;
    StringGrid5.Col:=0;
    haycambios.Checked:=false;
    Application.MessageBox('Archivo Guardado','Guardar',(MB_ICONINFORMATION+MB_OK));
  end
  else
    ShowMessage('Error en Archivo XML');
  Myxml.Free;
end;

procedure TForm1.BitBtn18Click(Sender: TObject);
//GUARDAR COMO
var Resp:Integer;
  myxml:TMyXml;
begin
  if SaveDialog1.Execute then
  begin
    Resp:=IDOK;
    If FileExists(Utils.clearFilePath(SaveDialog1.FileName)) Then
    Begin
       Resp := Application.MessageBox('Archivo Existe'+sLineBreak+'¿Desea Sobreescribirlo?', '', (MB_ICONQUESTION + MB_OKCANCEL));
       If (Resp<>IDOK) Then Exit;
    end;
    If (Resp=IDOK) Then
    Begin
       myxml:=TMyXml.Create(Utils.clearFilePath(SaveDialog1.FileName));
       myxml.Save2Grids(Memo1,StringGrid4,StringGrid5);
       Memo1.SetFocus;
       Edit6.Text:=Utils.clearFilePath(SaveDialog1.FileName);
       ShowMessage('Archivo Grabado');
       myxml.Free;
    end;
  end;
end;

procedure TForm1.BitBtn19Click(Sender: TObject);
begin
   SelectDirectoryDialog1.InitialDir:=Edit5.Text;
   If  SelectDirectoryDialog1.Execute Then
   begin
    IF Edit5.Text<>SelectDirectoryDialog1.FileName then
       Edit5.Text:=SelectDirectoryDialog1.FileName;
   end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
     Utils.InvertStringGrid(StringGrid1);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var PDFREP,texto:String;
  I:Integer;
  ruta:String;
begin
  EDRutaFonts.Text:=Trim(EDRutaFonts.Text);
  If ComboBox1.Text='Personalizar...' Then
  Begin
     texto:='';
     PDFREP := 'pdfrepper';
     For I := 0 To Memo2.Lines.Count -1 DO texto := texto+Memo2.Lines[i]+'{CRLF}';
     varGlobales.setPDFReportTxt(PDFREP,texto);
     varGlobales.setPDFReportCopyFonts(PDFREP,CheckBox11.Checked);
     varGlobales.setPDFReportRutaFonts(PDFREP,EDRutaFonts.Text);
  end;
  Ruta:= EDRutaFonts.Text;
  Ruta:= Ruta.Trim;
  If ((CheckBox11.Checked) and (Ruta.IsEmpty)) then
  Begin
    ShowMessage('Ingrese Ruta Destino para copiar las fuentes');
    Exit;
  end;
  if IsArchiveScanMode() then
    ProcesaPDFReportWarZip(CheckBox11.Checked,EDRutaFonts.Text,Memo2.Text)
  else
    Utils.ProcesaPDFReport(StringGrid1, CheckBox11.Checked,EDRutaFonts.Text,Memo2.Text);
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
var Version:String;
  DirCount,i, Resp:Integer;
  myxml:TMyXml;
  isok:Boolean;
begin
  if IsArchiveScanMode() then
  begin
    ApplyDisplayNameWarZip();
    Exit;
  end;

   Label16.Caption:=Utils.versionStr(EditModulo.Text,EditVersion.Text,EditFechaVersion.Text);
   DirCount:=0;
   for I:= 1 to StringGrid1.RowCount - 1 do
   Begin
     If StringGrid1.Cells[0,i]='1' then
      Begin
        DirCount+=1;
      end;
   end;
   If DirCount=0 then Begin ShowMessage('Debe seleccionar al menos un war'); exit; end;
   If DirCount>2 Then
   Begin
     Resp:=Application.MessageBox(PChar('Tiene seleccionada '+DirCount.ToString+'  carpetas'+#13#10+
     ' ¿DESEA CONTINUAR?'),'ADVERTENCIA',(MB_ICONEXCLAMATION+MB_OKCANCEL));
     If (Resp=IDCANCEL) Then Exit;
   end;

  Version:=Utils.versionStr(EditModulo.Text,EditVersion.Text,EditFechaVersion.Text);
  Utils.addItemListBox(ListBox1,EditModulo.Text);
  Utils.addItemListBox(ListBox2,EditVersion.Text);
  //
  myxml:=TMyXml.create('');
  for I:= 1 to StringGrid1.RowCount - 1 do
   Begin
     If StringGrid1.Cells[0,i]='1' then
      Begin
        myxml.pathxml:=Utils.clearFilePath(StringGrid1.Cells[2,i]+'WEB-INF/web.xml');
        IsOk:=myxml.ReplaceValueTXT('<display-name>','</display-name>',version);
        If not isok then myxml.InsertWhitPrevRefTXT('metadata-complete="false">','<display-name>'+version+'</display-name>');
        StringGrid1.Cells[5,i]:=version;
      end;
   end;
  myxml.Free;
  //
  varGlobales.ListBoxModuloValues:=ListBox1.Items.CommaText;
  varGlobales.ListBoxVersionValues:=ListBox2.Items.CommaText;
  RichMemo3.Text:=StringGrid1.Rows[StringGrid1.Row][5];
  Label9.Caption:='display-name: ['+StringGrid1.Rows[StringGrid1.Row][3]+']';
  Label18.Caption:='['+StringGrid1.Rows[StringGrid1.Row][3]+']';
  Utils.getDataSource(Utils.clearFilePath(StringGrid1.Rows[StringGrid1.Row][7]),StringGrid1.Rows[StringGrid1.Row][6],StringGrid1.Rows[StringGrid1.Row][8],StringGrid1.Rows[StringGrid1.Row][4],EditEJJdbcDatasource,EditEJResRefName);
  MessageDlg ('', 'Actualización Completa', mtInformation, [mbOK],0);
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  CalendarLite1.date:=Date;
  EditFechaVersion.Text:=Utils.getFechaHoraForm(CalendarLite1.Date);
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
var MG:TMyGridString;
begin
  ListFilterEdit2.Text:='';
  If ListFilterEdit2.Text='' then
  begin
    MG:=TMyGridString.Create;
    MG.upInGrid(StringGrid4,haycambios);
    MG.Free;
  end;
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
var MG:TMyGridString;
begin
  ListFilterEdit2.Text:='';
  If ListFilterEdit2.Text='' then
  Begin
    MG:=TMyGridString.Create;
    MG.downInGrid(StringGrid4,haycambios);
    MG.Free;
  end;
end;

procedure TForm1.BitBtn9Click(Sender: TObject);
var
  rutajar,MensajeError:String;
begin
  if IsArchiveScanMode() then
  begin
    ShowMessage('La generación de WAR no está disponible en el modo War/Zip.');
    Exit;
  end;
  PageControl1.ActivePage:=TabSheet1;
  If (varGlobales.ClearMemo) Then RichMemo1.Clear;
  varGlobales.WebAppsDir:= Edit1.Text;
  TrayIcon1.BalloonHint:=TrayIcon1.Hint;
  rutajar:=Utils.clearDirPath(varGlobales.JavaHome)+'bin\jar.exe';
  If Not FileExists(rutajar) then
  begin
   Utils.addToRichMemo('No está correctamente definida la Ruta JDK, vaya a OPCIONES y en "Rutas" defina un JAVA_HOME válido.',RichMemo1,StatusBar1,clRed);
   exit;
  end;
  If (Not DirectoryExists(Utils.clearDirPath(Edit1.Text))) then
      MensajeError:=Label1.Caption+' No Valido.';

  If (Trim(MensajeError).IsEmpty) Then
     Begin
      If MinGenWar.Checked Then MinimizeToTray();
      Utils.GenWar(StringGrid1,varGlobales.JavaHome,RichMemo1,TrayIcon1,StatusBar1)
     end
  else
  begin
     ShowMessage(MensajeError);
     TrayIcon1.BalloonHint:=MensajeError;
  end;
  If (Form1.WindowState = wsMinimized)Or (Form1.ShowInTaskBar = stNever)  Then TrayIcon1.ShowBalloonHint;
  If (varGlobales.Beep) Then Beep;
end;

procedure TForm1.BitBtnPRUEBAClick(Sender: TObject);
var DSSL:TStringList;
  x,i:Integer;
  A: TStringArray;
begin
  DATASOURCEPRUEBA.Clear;
  RESREFNAMEPRUEBA.Clear;
  DSSL:=varGlobales.getAllDataSources();
  for i := 0 to DSSL.Count - 1 do
   begin
     A:= DSSL[i].Split('#');
     X:= length(A);
     if (X>0) and (A[0]=ComboBoxPRUEBA.Text) then
     begin
        DATASOURCEPRUEBA.Text:=A[0];
        If X>1 then RESREFNAMEPRUEBA.Text:=A[1];
     end;
   end;
  loadComboboxDataSources();
  DSSL.Free;
  ComboBoxPRUEBA.ItemIndex:=1;
  // if ComboBoxPRUEBA.Text = DSSL[i].Split('#')[0] then
  // begin
  // DATASOURCEPRUEBA.Text:=;
  // end;
end;

procedure TForm1.BtnApp10Click(Sender: TObject);
var FileName,param:String;
begin
    POPAPP:='APP10';
    FileName:=varGlobales.getApp(POPAPP);
    IF Not(FileExists(FileName)) then
     Begin
     If OpenDialog2.Execute Then
        Begin
        varGlobales.setApp(POPAPP,OpenDialog2.FileName);
        varGlobales.setAPPNombre(POPAPP,ExtractFileNameOnly(OpenDialog2.FileName));
        MyApp.addApp(POPAPP,BtnApp10,ImgApp10);
        end;
     end
    else
    Begin
      varGlobales.setAPPuso(POPAPP,(varGlobales.getAppUso(POPAPP)+1));
      param:=varGlobales.getAPPPar(POPAPP);
      ShellExecute(0,nil, PChar(FileName),PChar(param),PChar(extractfilepath(FileName)),1);
      If MinAppRun.Checked Then MinimizeToTray();
    end;
    RefreshAPPS();
end;

procedure TForm1.BtnApp10MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  Begin
   POPAPP:='APP10';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.BtnApp11Click(Sender: TObject);
var FileName,param:String;
begin
    POPAPP:='APP11';
    FileName:=varGlobales.getApp(POPAPP);
    IF Not(FileExists(FileName)) then
     Begin
     If OpenDialog2.Execute Then
        Begin
        varGlobales.setApp(POPAPP,OpenDialog2.FileName);
        varGlobales.setAPPNombre(POPAPP,ExtractFileNameOnly(OpenDialog2.FileName));
        MyApp.addApp(POPAPP,BtnApp11,ImgApp11);
        end;
     end
    else
    Begin
      varGlobales.setAPPuso(POPAPP,(varGlobales.getAppUso(POPAPP)+1));
      param:=varGlobales.getAPPPar(POPAPP);
      ShellExecute(0,nil, PChar(FileName),Pchar(param),PChar(extractfilepath(FileName)),1);
      If MinAppRun.Checked Then MinimizeToTray();
    end;
    RefreshAPPS();
end;

procedure TForm1.BtnApp11MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  Begin
   POPAPP:='APP11';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.BtnApp12Click(Sender: TObject);
var FileName,param:String;
begin
    POPAPP:='APP12';
    FileName:=varGlobales.getApp(POPAPP);
    IF Not(FileExists(FileName)) then
     Begin
     If OpenDialog2.Execute Then
        Begin
        varGlobales.setApp(POPAPP,OpenDialog2.FileName);
        varGlobales.setAPPNombre(POPAPP,ExtractFileNameOnly(OpenDialog2.FileName));
        MyApp.addApp(POPAPP,BtnApp12,ImgApp12);
        end;
     end
    else
    Begin
      varGlobales.setAPPuso(POPAPP,(varGlobales.getAppUso(POPAPP)+1));
      param:=varGlobales.getAPPPar(POPAPP);
      ShellExecute(0,nil, PChar(FileName),Pchar(param),PChar(extractfilepath(FileName)),1);
      If MinAppRun.Checked Then MinimizeToTray();
    end;
    RefreshAPPS();
end;

procedure TForm1.BtnApp12MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  Begin
   POPAPP:='APP12';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.BtnApp13Click(Sender: TObject);
var FileName,param:String;
begin
    POPAPP:='APP13';
    FileName:=varGlobales.getApp(POPAPP);
    IF Not(FileExists(FileName)) then
     Begin
     If OpenDialog2.Execute Then
        Begin
        varGlobales.setApp(POPAPP,OpenDialog2.FileName);
        varGlobales.setAPPNombre(POPAPP,ExtractFileNameOnly(OpenDialog2.FileName));
        MyApp.addApp(POPAPP,BtnApp13,ImgApp13);
        end;
     end
    else
    Begin
      varGlobales.setAPPuso(POPAPP,(varGlobales.getAppUso(POPAPP)+1));
      param:=varGlobales.getAPPPar(POPAPP);
      ShellExecute(0,nil, PChar(FileName),Pchar(param),PChar(extractfilepath(FileName)),1);
      If MinAppRun.Checked Then MinimizeToTray();
    end;
    RefreshAPPS();
end;

procedure TForm1.BtnApp13MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  Begin
   POPAPP:='APP13';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.BtnApp14Click(Sender: TObject);
var FileName,param:String;
begin
    POPAPP:='APP14';
    FileName:=varGlobales.getApp(POPAPP);
    IF Not(FileExists(FileName)) then
     Begin
     If OpenDialog2.Execute Then
        Begin
        varGlobales.setApp(POPAPP,OpenDialog2.FileName);
        varGlobales.setAPPNombre(POPAPP,ExtractFileNameOnly(OpenDialog2.FileName));
        MyApp.addApp(POPAPP,BtnApp14,ImgApp14);
        end;
     end
    else
    Begin
      varGlobales.setAPPuso(POPAPP,(varGlobales.getAppUso(POPAPP)+1));
      param:=varGlobales.getAPPPar(POPAPP);
      ShellExecute(0,nil, PChar(FileName),Pchar(param),PChar(extractfilepath(FileName)),1);
      If MinAppRun.Checked Then MinimizeToTray();
    end;
    RefreshAPPS();
end;

procedure TForm1.BtnApp14MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  Begin
   POPAPP:='APP14';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.BtnApp15Click(Sender: TObject);
var FileName,param:String;
begin
    POPAPP:='APP15';
    FileName:=varGlobales.getApp(POPAPP);
    IF Not(FileExists(FileName)) then
     Begin
     If OpenDialog2.Execute Then
        Begin
        varGlobales.setApp(POPAPP,OpenDialog2.FileName);
        varGlobales.setAPPNombre(POPAPP,ExtractFileNameOnly(OpenDialog2.FileName));
        MyApp.addApp(POPAPP,BtnApp15,ImgApp15);
        end;
     end
    else
    Begin
      varGlobales.setAPPuso(POPAPP,(varGlobales.getAppUso(POPAPP)+1));
      param:=varGlobales.getAPPPar(POPAPP);
      ShellExecute(0,nil, PChar(FileName),Pchar(param),PChar(extractfilepath(FileName)),1);
      If MinAppRun.Checked Then MinimizeToTray();
    end;
    RefreshAPPS();
end;

procedure TForm1.BtnApp15MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  Begin
   POPAPP:='APP15';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.BtnApp16Click(Sender: TObject);
var FileName,param:String;
begin
    POPAPP:='APP16';
    FileName:=varGlobales.getApp(POPAPP);
    IF Not(FileExists(FileName)) then
     Begin
     If OpenDialog2.Execute Then
        Begin
        varGlobales.setApp(POPAPP,OpenDialog2.FileName);
        varGlobales.setAPPNombre(POPAPP,ExtractFileNameOnly(OpenDialog2.FileName));
        MyApp.addApp(POPAPP,BtnApp16,ImgApp16);
        end;
     end
    else
    Begin
      varGlobales.setAPPuso(POPAPP,(varGlobales.getAppUso(POPAPP)+1));
      param:=varGlobales.getAPPPar(POPAPP);
      ShellExecute(0,nil, PChar(FileName),Pchar(param),PChar(extractfilepath(FileName)),1);
      If MinAppRun.Checked Then MinimizeToTray();
    end;
    RefreshAPPS();
end;

procedure TForm1.BtnApp16MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  Begin
   POPAPP:='APP16';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.BtnApp17Click(Sender: TObject);
var FileName,param:String;
begin
    POPAPP:='APP17';
    FileName:=varGlobales.getApp(POPAPP);
    IF Not(FileExists(FileName)) then
     Begin
     If OpenDialog2.Execute Then
        Begin
        varGlobales.setApp(POPAPP,OpenDialog2.FileName);
        varGlobales.setAPPNombre(POPAPP,ExtractFileNameOnly(OpenDialog2.FileName));
        MyApp.addApp(POPAPP,BtnApp17,ImgApp17);
        end;
     end
    else
    Begin
      varGlobales.setAPPuso(POPAPP,(varGlobales.getAppUso(POPAPP)+1));
      param:=varGlobales.getAPPPar(POPAPP);
      ShellExecute(0,nil, PChar(FileName),Pchar(param),PChar(extractfilepath(FileName)),1);
      If MinAppRun.Checked Then MinimizeToTray();
    end;
    RefreshAPPS();
end;

procedure TForm1.BtnApp17MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  Begin
   POPAPP:='APP17';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.BtnApp18Click(Sender: TObject);
var FileName,param:String;
begin
    POPAPP:='APP18';
    FileName:=varGlobales.getApp(POPAPP);
    IF Not(FileExists(FileName)) then
     Begin
     If OpenDialog2.Execute Then
        Begin
        varGlobales.setApp(POPAPP,OpenDialog2.FileName);
        varGlobales.setAPPNombre(POPAPP,ExtractFileNameOnly(OpenDialog2.FileName));
        MyApp.addApp(POPAPP,BtnApp18,ImgApp18);
        end;
     end
    else
    Begin
      varGlobales.setAPPuso(POPAPP,(varGlobales.getAppUso(POPAPP)+1));
      param:=varGlobales.getAPPPar(POPAPP);
      ShellExecute(0,nil, PChar(FileName),Pchar(param),PChar(extractfilepath(FileName)),1);
      If MinAppRun.Checked Then MinimizeToTray();
    end;
    RefreshAPPS();
end;

procedure TForm1.BtnApp18MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  Begin
   POPAPP:='APP18';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.BtnApp19Click(Sender: TObject);
var FileName,param:String;
begin
    POPAPP:='APP19';
    FileName:=varGlobales.getApp(POPAPP);
    IF Not(FileExists(FileName)) then
     Begin
     If OpenDialog2.Execute Then
        Begin
        varGlobales.setApp(POPAPP,OpenDialog2.FileName);
        varGlobales.setAPPNombre(POPAPP,ExtractFileNameOnly(OpenDialog2.FileName));
        MyApp.addApp(POPAPP,BtnApp19,ImgApp19);
        end;
     end
    else
    Begin
      varGlobales.setAPPuso(POPAPP,(varGlobales.getAppUso(POPAPP)+1));
      param:=varGlobales.getAPPPar(POPAPP);
      ShellExecute(0,nil, PChar(FileName),Pchar(param),PChar(extractfilepath(FileName)),1);
      If MinAppRun.Checked Then MinimizeToTray();
    end;
    RefreshAPPS();
end;

procedure TForm1.BtnApp19MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  Begin
   POPAPP:='APP19';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.BtnApp1Click(Sender: TObject);
var FileName,param:String;
begin
    POPAPP:='APP1';
    FileName:=varGlobales.getApp(POPAPP);
    IF Not(FileExists(FileName)) then
     Begin
     If OpenDialog2.Execute Then
        Begin
        varGlobales.setApp(POPAPP,OpenDialog2.FileName);
        varGlobales.setAPPNombre(POPAPP,ExtractFileNameOnly(OpenDialog2.FileName));
        MyApp.addApp(POPAPP,BtnApp1,ImgApp1);
        end;
     end
    else
    Begin
      varGlobales.setAPPuso(POPAPP,(varGlobales.getAppUso(POPAPP)+1));
      param:=varGlobales.getAPPPar(POPAPP);
      ShellExecute(0,nil, PChar(FileName),Pchar(param),PChar(extractfilepath(FileName)),1);
      If MinAppRun.Checked Then MinimizeToTray();
    end;
    RefreshAPPS();
end;

procedure TForm1.BtnApp1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  Begin
   POPAPP:='APP1';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.BtnApp20Click(Sender: TObject);
var FileName,param:String;
begin
    POPAPP:='APP20';
    FileName:=varGlobales.getApp(POPAPP);
    IF Not(FileExists(FileName)) then
     Begin
     If OpenDialog2.Execute Then
        Begin
        varGlobales.setApp(POPAPP,OpenDialog2.FileName);
        varGlobales.setAPPNombre(POPAPP,ExtractFileNameOnly(OpenDialog2.FileName));
        MyApp.addApp(POPAPP,BtnApp20,ImgApp20);
        end;
     end
    else
    Begin
      varGlobales.setAPPuso(POPAPP,(varGlobales.getAppUso(POPAPP)+1));
      param:=varGlobales.getAPPPar(POPAPP);
      ShellExecute(0,nil, PChar(FileName),Pchar(param),PChar(extractfilepath(FileName)),1);
      If MinAppRun.Checked Then MinimizeToTray();
    end;
    RefreshAPPS();
end;

procedure TForm1.BtnApp20MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  Begin
   POPAPP:='APP20';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.BtnApp2Click(Sender: TObject);
var FileName,param:String;
begin
    POPAPP:='APP2';
    FileName:=varGlobales.getApp(POPAPP);
    IF Not(FileExists(FileName)) then
     Begin
     If OpenDialog2.Execute Then
        Begin
        varGlobales.setApp(POPAPP,OpenDialog2.FileName);
        varGlobales.setAPPNombre(POPAPP,ExtractFileNameOnly(OpenDialog2.FileName));
        MyApp.addApp(POPAPP,BtnApp2,ImgApp2);
        end;
     end
    else
    Begin
      varGlobales.setAPPuso(POPAPP,(varGlobales.getAppUso(POPAPP)+1));
      param:=varGlobales.getAPPPar(POPAPP);
      ShellExecute(0,nil, PChar(FileName),PChar(param),PChar(extractfilepath(FileName)),1);
      If MinAppRun.Checked Then MinimizeToTray();
    end;
    RefreshAPPS();
end;

procedure TForm1.BtnApp2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    if Button = mbRight then
  Begin
   POPAPP:='APP2';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.BtnApp3Click(Sender: TObject);
var FileName,param:String;
begin
    POPAPP:='APP3';
    FileName:=varGlobales.getApp(POPAPP);
    IF Not(FileExists(FileName)) then
     Begin
     If OpenDialog2.Execute Then
        Begin
        varGlobales.setApp(POPAPP,OpenDialog2.FileName);
        varGlobales.setAPPNombre(POPAPP,ExtractFileNameOnly(OpenDialog2.FileName));
        MyApp.addApp(POPAPP,BtnApp3,ImgApp3);
        end;
     end
    else
    Begin
      varGlobales.setAPPuso(POPAPP,(varGlobales.getAppUso(POPAPP)+1));
      param:=varGlobales.getAPPPar(POPAPP);
      ShellExecute(0,nil, PChar(FileName),PChar(param),PChar(extractfilepath(FileName)),1);
      If MinAppRun.Checked Then MinimizeToTray();
    end;
    RefreshAPPS();
end;

procedure TForm1.BtnApp3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    if Button = mbRight then
  Begin
   POPAPP:='APP3';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.BtnApp4Click(Sender: TObject);
var FileName,param:String;
begin
    POPAPP:='APP4';
    FileName:=varGlobales.getApp(POPAPP);
    IF Not(FileExists(FileName)) then
     Begin
     If OpenDialog2.Execute Then
        Begin
        varGlobales.setApp(POPAPP,OpenDialog2.FileName);
        varGlobales.setAPPNombre(POPAPP,ExtractFileNameOnly(OpenDialog2.FileName));
        MyApp.addApp(POPAPP,BtnApp4,ImgApp4);
        end;
     end
    else
    Begin
      varGlobales.setAPPuso(POPAPP,(varGlobales.getAppUso(POPAPP)+1));
      param:=varGlobales.getAPPPar(POPAPP);
      ShellExecute(0,nil, PChar(FileName),PChar(param),PChar(extractfilepath(FileName)),1);
      If MinAppRun.Checked Then MinimizeToTray();
    end;
    RefreshAPPS();
end;

procedure TForm1.BtnApp4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    if Button = mbRight then
  Begin
   POPAPP:='APP4';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.BtnApp5Click(Sender: TObject);
var FileName,param:String;
begin
    POPAPP:='APP5';
    FileName:=varGlobales.getApp(POPAPP);
    IF Not(FileExists(FileName)) then
     Begin
     If OpenDialog2.Execute Then
        Begin
        varGlobales.setApp(POPAPP,OpenDialog2.FileName);
        varGlobales.setAPPNombre(POPAPP,ExtractFileNameOnly(OpenDialog2.FileName));
        MyApp.addApp(POPAPP,BtnApp5,ImgApp5);
        end;
     end
    else
    Begin
      varGlobales.setAPPuso(POPAPP,(varGlobales.getAppUso(POPAPP)+1));
      param:=varGlobales.getAPPPar(POPAPP);
      ShellExecute(0,nil, PChar(FileName),PChar(param),PChar(extractfilepath(FileName)),1);
      If MinAppRun.Checked Then MinimizeToTray();
    end;
    RefreshAPPS();
end;

procedure TForm1.BtnApp5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    if Button = mbRight then
  Begin
   POPAPP:='APP5';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.BtnApp6Click(Sender: TObject);
var FileName,param:String;
begin
    POPAPP:='APP6';
    FileName:=varGlobales.getApp(POPAPP);
    IF Not(FileExists(FileName)) then
     Begin
     If OpenDialog2.Execute Then
        Begin
        varGlobales.setApp(POPAPP,OpenDialog2.FileName);
        varGlobales.setAPPNombre(POPAPP,ExtractFileNameOnly(OpenDialog2.FileName));
        MyApp.addApp(POPAPP,BtnApp6,ImgApp6);
        end;
     end
    else
    Begin
      varGlobales.setAPPuso(POPAPP,(varGlobales.getAppUso(POPAPP)+1));
      param:=varGlobales.getAPPPar(POPAPP);
      ShellExecute(0,nil, PChar(FileName),PChar(param),PChar(extractfilepath(FileName)),1);
      If MinAppRun.Checked Then MinimizeToTray();
    end;
    RefreshAPPS();
end;

procedure TForm1.BtnApp6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    if Button = mbRight then
  Begin
   POPAPP:='APP6';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.BtnApp7Click(Sender: TObject);
var FileName,param:String;
begin
    POPAPP:='APP7';
    FileName:=varGlobales.getApp(POPAPP);
    IF Not(FileExists(FileName)) then
     Begin
     If OpenDialog2.Execute Then
        Begin
        varGlobales.setApp(POPAPP,OpenDialog2.FileName);
        varGlobales.setAPPNombre(POPAPP,ExtractFileNameOnly(OpenDialog2.FileName));
        MyApp.addApp(POPAPP,BtnApp7,ImgApp7);
        end;
     end
    else
    Begin
      varGlobales.setAPPuso(POPAPP,(varGlobales.getAppUso(POPAPP)+1));
      param:=varGlobales.getAPPPar(POPAPP);
      ShellExecute(0,nil, PChar(FileName),PChar(param),PChar(extractfilepath(FileName)),1);
      If MinAppRun.Checked Then MinimizeToTray();
    end;
    RefreshAPPS();
end;

procedure TForm1.BtnApp7MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    if Button = mbRight then
  Begin
   POPAPP:='APP7';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.BtnApp8Click(Sender: TObject);
var FileName,param:String;
begin
    POPAPP:='APP8';
    FileName:=varGlobales.getApp(POPAPP);
    IF Not(FileExists(FileName)) then
     Begin
     If OpenDialog2.Execute Then
        Begin
        varGlobales.setApp(POPAPP,OpenDialog2.FileName);
        varGlobales.setAPPNombre(POPAPP,ExtractFileNameOnly(OpenDialog2.FileName));
        MyApp.addApp(POPAPP,BtnApp8,ImgApp8);
        end;
     end
    else
    Begin
      varGlobales.setAPPuso(POPAPP,(varGlobales.getAppUso(POPAPP)+1));
      param:=varGlobales.getAPPPar(POPAPP);
      ShellExecute(0,nil, PChar(FileName),PChar(param),PChar(extractfilepath(FileName)),1);
      If MinAppRun.Checked Then MinimizeToTray();
    end;
    RefreshAPPS();
end;

procedure TForm1.BtnApp8MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    if Button = mbRight then
  Begin
   POPAPP:='APP8';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.BtnApp9Click(Sender: TObject);
var FileName,param:String;
begin
    POPAPP:='APP9';
    FileName:=varGlobales.getApp(POPAPP);
    IF Not(FileExists(FileName)) then
     Begin
     If OpenDialog2.Execute Then
        Begin
        varGlobales.setApp(POPAPP,OpenDialog2.FileName);
        varGlobales.setAPPNombre(POPAPP,ExtractFileNameOnly(OpenDialog2.FileName));
        MyApp.addApp(POPAPP,BtnApp9,ImgApp9);
        end;
     end
    else
    Begin
      varGlobales.setAPPuso(POPAPP,(varGlobales.getAppUso(POPAPP)+1));
      param:=varGlobales.getAPPPar(POPAPP);
      ShellExecute(0,nil, PChar(FileName),PChar(param),PChar(extractfilepath(FileName)),1);
      If MinAppRun.Checked Then MinimizeToTray();
    end;
    RefreshAPPS();
end;

procedure TForm1.BtnApp9MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    if Button = mbRight then
  Begin
   POPAPP:='APP9';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.BtnsaveDSClick(Sender: TObject);
begin
  varGlobales.setDataSource(EditJdbcDatasource.Text,EditResRefName.Text);
  loadComboboxDataSources();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  SelectDirectoryDialog1.InitialDir:=Edit1.Text;
  If  SelectDirectoryDialog1.Execute Then
  begin
   IF Edit1.Text<>SelectDirectoryDialog1.FileName then
      Edit1.Text:=SelectDirectoryDialog1.FileName;
  end;
end;

procedure TForm1.CalendarLite1DateChange(Sender: TObject);
begin
  EditFechaVersion.Text:=Utils.getFechaHoraForm(CalendarLite1.Date);
end;

procedure TForm1.CheckBox10Change(Sender: TObject);
begin
  varGlobales.DelWars:=CheckBox10.Checked;
end;

procedure TForm1.CheckBox11Change(Sender: TObject);
begin
  If ComboBox1.Text='Personalizar...' Then EDRutaFonts.Enabled:=CheckBox11.Checked;
end;

procedure TForm1.CheckBox12Change(Sender: TObject);
begin
    varGlobales.OcultaEjemplosDS:=CheckBox12.Checked;

    ComboBoxDsCopyFrom.Clear;
    ComboBoxDsCopyFrom.Items.Add('Último Aplicado... ');
    ComboBoxDsCopyFrom.Items.Add('Actual:['+StringGrid1.Rows[StringGrid1.Row][3]+']');
    ComboBoxDsCopyFrom.Items.Add('Ejemplo Oracle');
    ComboBoxDsCopyFrom.Items.Add('Ejemplo SQL');
    ComboBoxDsCopyFrom.Items.Add('Ejemplo PJUD');
    loadComboboxDataSources();
end;

procedure TForm1.CheckBox13Change(Sender: TObject);
begin
  varGlobales.EnableWarZipMode:=CheckBox13.Checked;
  RefreshScanModeSelector();
  ApplyScanModeUI();
  Refrescar();
  ChangeStringGrid1();
end;

procedure TForm1.CheckBox14Change(Sender: TObject);
begin
  varGlobales.ConservarTmpAlFinalizar:=CheckBox14.Checked;
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
  varGlobales.OcultarDirROOT:=CheckBox1.Checked;
    Utils.FilDirGrid(Utils.clearDirPath(varGlobales.WebAppsDir),
                       ListFilterEdit1.Text,varGlobales.ScanMode,StringGrid1);
//  StringGrid1.AutoSizeColumn(3);
end;

procedure Tform1.Refrescar();
begin
  Utils.FilDirGrid(Utils.clearDirPath(varGlobales.WebAppsDir),
  ListFilterEdit1.Text,varGlobales.ScanMode,StringGrid1);
  //StringGrid1.AutoSizeColumn(1);
 // StringGrid1.Cols[1].;
  //StringGrid1.AutoSizeColumn(3);
end;

procedure TForm1.CheckBox2Change(Sender: TObject);
begin
  varGlobales.MostrarOK:=CheckBox2.Checked;
end;

procedure TForm1.CheckBox3Change(Sender: TObject);
begin
  varGlobales.MostrarERR:=CheckBox3.Checked;
end;

procedure TForm1.CheckBox4Change(Sender: TObject);
begin
  varGlobales.MostrarMSJ:=CheckBox4.Checked;
end;

procedure TForm1.CheckBox5Change(Sender: TObject);
begin
  varGlobales.Beep:=CheckBox5.Checked;
end;

procedure TForm1.CheckBox6Change(Sender: TObject);
begin
  varGlobales.OrderByUso:=(CheckBox6.Checked);
  RefreshAPPS();
end;

procedure TForm1.CheckBox7Change(Sender: TObject);
begin
  varGlobales.ConfirmDel:=CheckBox7.Checked;
end;

procedure TForm1.CheckBox8Change(Sender: TObject);
begin
  varGlobales.OpcSalir:=(CheckBox8.Checked);
end;

procedure TForm1.CheckBox9Change(Sender: TObject);
begin
  varGlobales.ClearMemo:=CheckBox9.Checked;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var PDFREP:String;
begin
  If (ComboBox1.Text='Personalizar...') Then
  begin
    CheckBox11.Enabled := True;
    Memo2.Enabled:=True;
    EDRutaFonts.Enabled:=CheckBox11.Checked;
    PDFREP := 'pdfrepper';
  end else begin
    CheckBox11.Enabled:=False;
    Memo2.Enabled:=False;
    EDRutaFonts.Enabled:=False;
    case ComboBox1.Text of
       '[WINDOWS]': PDFREP:='pdfrepwin';
       '[LINUX]':   PDFREP:='pdfreplin';
       '[IBM_WAS]': PDFREP:='pdfrepwas';
    end;
  end;
  Memo2.Text:=StringReplace((varGlobales.getPDFReportTxt(PDFREP)),'{CRLF}',sLineBreak,[rfReplaceAll, rfIgnoreCase]);
  EDRutaFonts.Text:=varGlobales.getPDFReportRutafonts(PDFREP);
  CheckBox11.Checked:=varGlobales.getPDFReporCopyFonts(PDFREP);
  varGlobales.PDFReportselection:=(ComboBox1.ItemIndex);
end;

procedure TForm1.ComboBoxModoChange(Sender: TObject);
begin
  if Firstload=0 then Exit;
  if (ComboBoxModo.ItemIndex=1) and (not varGlobales.EnableWarZipMode) then
    ComboBoxModo.ItemIndex:=0;
  case ComboBoxModo.ItemIndex of
    1: varGlobales.ScanMode:='warzip';
  else
    varGlobales.ScanMode:='carpeta';
  end;
  ApplyScanModeUI();
  Refrescar();
  ChangeStringGrid1();
end;

procedure TForm1.RefreshScanModeSelector();
var
  PrevFirstLoad: Integer;
begin
  PrevFirstLoad:=Firstload;
  Firstload:=0;
  try
    if not varGlobales.EnableWarZipMode then
      varGlobales.ScanMode:='carpeta';
    ComboBoxModo.Items.Clear;
    ComboBoxModo.Items.Add('Carpeta');
    if varGlobales.EnableWarZipMode then
      ComboBoxModo.Items.Add('War/Zip');
    if (varGlobales.EnableWarZipMode) and (varGlobales.ScanMode='warzip') then
      ComboBoxModo.ItemIndex:=1
    else
      ComboBoxModo.ItemIndex:=0;
    Label35.Visible:=varGlobales.EnableWarZipMode;
    ComboBoxModo.Visible:=varGlobales.EnableWarZipMode;
    if varGlobales.EnableWarZipMode then
    begin
      StringGrid1.AnchorSideTop.Control:=ComboBoxModo;
      StringGrid1.BorderSpacing.Top:=13;
    end
    else
    begin
      StringGrid1.AnchorSideTop.Control:=ListFilterEdit1;
      StringGrid1.BorderSpacing.Top:=16;
    end;
    ApplyScanModeUI();
  finally
    Firstload:=PrevFirstLoad;
  end;
end;

procedure TForm1.ComboBoxDsCopyFromChange(Sender: TObject);
var x:integer;
begin
  if (varGlobales.OcultaEjemplosDS) then x:=1 else x:=4;
  BitBtn28.Enabled:=(ComboBoxDsCopyFrom.ItemIndex>X);
end;

procedure TForm1.Edit2Change(Sender: TObject);
var myxml:TMyXml;
begin
  try
  MyXml:=TMyXml.create(Edit2.Text);
  Label6.Visible:=MyXml.Validaxml();
  If Label6.Visible then varGlobales.FdeFilePath:=Edit2.Text;
  finally
  Myxml.Free;
  end;
end;

procedure TForm1.EditFolderAppChange(Sender: TObject);
var aRow:Integer;
  Pdfreportini,clientcfg,webxml:String;
  Files:TStringList;
begin

  if StringGrid1.RowCount<2 then Exit;
  aRow:=StringGrid1.Row;
  EditDisplayName.Text:=StringGrid1.Rows[aRow][5];
  EditModuleName.Text:=StringGrid1.Rows[aRow][4];
  if IsArchiveScanMode() then
  begin
    EditModuleName.Text:=StringGrid1.Rows[aRow][3];
    linkwar.Visible:=FileExistsUTF8(StringGrid1.Rows[aRow][2]);
    EditWar.Text:=StringGrid1.Rows[aRow][3];
    if StringGrid1.Rows[aRow][9]='1' then
      EditPDFReport.Text:='ENCONTRADO'
    else
      EditPDFReport.Text:='NO ENCONTRADO';
    EditClientCfg.Text:='NO APLICA';
    Editwebxml.Text:='NO APLICA';
    Label29.Visible:=True;
    EditModuleName.Visible:=True;
    Label34.Visible:=False;
    EditDisplayName.Visible:=False;
    Label32.Visible:=True;
    EditClientCfg.Visible:=True;
    Label33.Visible:=True;
    Editwebxml.Visible:=True;
    if StringGrid1.Rows[aRow][6]='1' then
      EditClientCfg.Text:='ENCONTRADO'
    else
      EditClientCfg.Text:='NO ENCONTRADO';
    if StringGrid1.Rows[aRow][7]='1' then
      Editwebxml.Text:='ENCONTRADO'
    else
    Editwebxml.Text:='NO ENCONTRADO';
    linkPDFReport.Visible:=False;
    linkClientCfg.Visible:=False;
    linkwebxml.Visible:=False;
    Exit;
  end;
  //WAR;
  Label29.Visible:=True;
  EditModuleName.Visible:=True;
  Label34.Visible:=True;
  EditDisplayName.Visible:=True;
  Label32.Visible:=True;
  EditClientCfg.Visible:=True;
  Label33.Visible:=True;
  Editwebxml.Visible:=True;
  Files:=TStringList.Create;
  FindAllFiles(Files, StringGrid1.Rows[aRow][2], '*.war', true);
  linkwar.Visible:=(Files.Count>0);
  If (linkwar.Visible) Then EditWar.Text:=ExtractFileName(Files[0]) else EditWar.Text:='NO ENCONTRADO';
  Files.Free;

  //PDFREPORT
  PdfReportini:=Utils.clearFilePath(StringGrid1.Rows[aRow][2]+'/WEB-INF/PDFReport.ini');
  linkPDFReport.Visible:=FileExistsUTF8(PdfReportini);
  If (linkPDFReport.Visible) then EditPDFReport.Text:= 'ENCONTRADO' else EditPDFReport.Text:= 'NO ENCONTRADO';

  //CLIENT
  clientcfg:=Utils.clearFilePath(StringGrid1.Rows[aRow][6]);
  linkClientCfg.Visible:=FileExistsUTF8(clientcfg);
  If (linkClientCfg.Visible) Then EditClientCfg.Text:='ENCONTRADO' else EditClientCfg.Text:='NO ENCONTRADO';

  //WEBXML
  webxml:=Utils.clearFilePath(StringGrid1.Rows[aRow][7]);
  linkwebxml.Visible:=FileExistsUTF8(webxml);
  If (linkwebxml.Visible) Then Editwebxml.Text:='ENCONTRADO' else Editwebxml.Text:='NO ENCONTRADO';

end;

procedure TForm1.Edit5Change(Sender: TObject);
begin
  if DirectoryExists(Edit5.Text) then varGlobales.JavaHome:=Edit5.Text;
end;

procedure TForm1.Edit6Change(Sender: TObject);
//RUTA
var myXml:TMyXml;
begin
 If Trim(Edit6.Text).IsEmpty then Exit;
 myxml:= tmyXml.create(Edit6.Text);
 If myXml.Validaxml() then myxml.load2Grids(Memo1,StringGrid4,StringGrid5,ListFilterEdit2.Text) else
  begin
      myxml.ClearAll(Memo1,StringGrid4,StringGrid5);
      ShowMessage('Error en Archivo FDE / Formato incorrecto');
  end;
  Myxml.Free;
  haycambios.Checked:=False;
end;

procedure TForm1.Edit6Click(Sender: TObject);
begin
  If FileExists(Edit6.Text) Then SysUtils.ExecuteProcess(UTF8ToSys('explorer.exe'), '/select,"'+Edit6.Text+'"', []);
end;

procedure TForm1.Edit7Change(Sender: TObject);
begin
  //Titulo
  haycambios.Checked:=True;
end;

procedure TForm1.EditDSDescriptionChange(Sender: TObject);
begin
  varGlobales.DSDescription:=EditDSDescription.Text;
  loadMemo3();
end;

procedure TForm1.EditDSResAuthChange(Sender: TObject);
begin
  varGlobales.DSResAuth:=EditDSResAuth.Text;
  loadMemo3();
end;

procedure TForm1.EditDSRestypeChange(Sender: TObject);
begin
  varGlobales.DSResType:=EditDSRestype.Text;
  loadMemo3();
end;

procedure TForm1.EditDSUseJdbcDataSourceChange(Sender: TObject);
begin
  varGlobales.DSUseJdbcDatasource:=StrToInt(EditDSUseJdbcDataSource.Text);
  loadMemo3();
end;

procedure TForm1.EditDSUseJdbcDataSourceKeyPress(Sender: TObject; var Key: char
  );
begin
  if not (key in ['0'..'9',#8]) then key:=#0;
end;

procedure TForm1.EditFechaVersionChange(Sender: TObject);
begin
  Label16.Caption:=Utils.versionStr(EditModulo.Text,EditVersion.Text,EditFechaVersion.Text);
end;

procedure TForm1.EditFechaVersionKeyPress(Sender: TObject; var Key: char);
begin
  if key in[',','"','<','>','/'] then key:=#0;
end;

procedure TForm1.EditJdbcDatasourceChange(Sender: TObject);
begin
  Utils.allowOnlyTxt(EditJdbcDatasource);
end;

procedure TForm1.EditModuloChange(Sender: TObject);
begin
     Label16.Caption:=Utils.versionStr(EditModulo.Text,EditVersion.Text,EditFechaVersion.Text);
end;

procedure TForm1.EditModuloKeyPress(Sender: TObject; var Key: char);
begin
  if key in[',','"','<','>','/'] then key:=#0;
end;

procedure TForm1.EditResRefNameChange(Sender: TObject);
begin
  Utils.allowOnlyTxt(EditResRefName);
end;

procedure TForm1.EditScriptBeforeShow(ASender: TObject; ANewPage: TPage;
  ANewIndex: Integer);
begin
  StatusBar1.SimpleText:='';
  Form1.Caption:=LblProductName.Caption+' '+LblProductVersion.Caption+' [EDIT SCRIPT]';
  varGlobales.PageIndex:=(Notebook1.PageIndex);
end;

procedure TForm1.EditVersionChange(Sender: TObject);
begin
  Label16.Caption:=Utils.versionStr(EditModulo.Text,EditVersion.Text,EditFechaVersion.Text);
end;

procedure TForm1.EditVersionKeyPress(Sender: TObject; var Key: char);
begin
//  if not (key in ['0'..'9','.',#8]) then key:=#0;
  if key in[',','"','<','>','/'] then key:=#0;
end;

procedure TForm1.EditWebxmlBeforeShow(ASender: TObject; ANewPage: TPage;
  ANewIndex: Integer);
begin
  StatusBar1.SimpleText:='';
  Form1.Caption:=LblProductName.Caption+': [EDITAR WEB.XML]';
  varGlobales.PageIndex:=(Notebook1.PageIndex);
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  ErrorMsg: String;
begin
  if not varGlobales.ConservarTmpAlFinalizar then
  begin
    ErrorMsg:=DeleteTempDirOnFinish();
    if not ErrorMsg.IsEmpty then
      SetStatusMessage(ErrorMsg);
  end;
  TrayIcon1.Hide;
end;

procedure TForm1.haycambiosChange(Sender: TObject);
begin
  BitBtn17.Enabled:=haycambios.Checked And (Not (Trim(Edit6.Text).IsEmpty));
end;

procedure TForm1.ImgApp10MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  Begin
   POPAPP:='APP10';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.ImgApp1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  Begin
   POPAPP:='APP1';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.ImgApp2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  Begin
   POPAPP:='APP2';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.ImgApp3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if Button = mbRight then
  Begin
   POPAPP:='APP3';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.ImgApp4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if Button = mbRight then
  Begin
   POPAPP:='APP4';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.ImgApp5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if Button = mbRight then
  Begin
   POPAPP:='APP5';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.ImgApp6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if Button = mbRight then
  Begin
   POPAPP:='APP6';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.ImgApp7MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if Button = mbRight then
  Begin
   POPAPP:='APP7';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.ImgApp8MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if Button = mbRight then
  Begin
   POPAPP:='APP8';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.ImgApp9MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if Button = mbRight then
  Begin
   POPAPP:='APP9';
   PopupMenu3.PopUp;
  end;
end;

procedure TForm1.ItemClientCfgClick(Sender: TObject);
var dir:String;
begin
  dir:=Utils.clearFilePath(StringGrid1.Rows[StringGrid1.Row][6]);
  If fileExists(dir) Then if ShellExecute(0,nil, PChar(dir),PChar(dir),nil,1)=0 then;
end;

procedure TForm1.ItemCopiarConsolaClick(Sender: TObject);
begin
  if not RichMemo1.SelText.IsEmpty then
    Utils.ClipboardCopy(RichMemo1.SelText);
end;

procedure TForm1.ItemCopyRutaClick(Sender: TObject);
begin
  if IsArchiveScanMode() then
    Utils.ClipboardCopy(StringGrid1.Rows[StringGrid1.Row][2])
  else
    Utils.ClipboardCopy(Utils.clearDirPath(StringGrid1.Rows[StringGrid1.Row][2]));
end;

procedure TForm1.ItemCopyWarClick(Sender: TObject);
var path:String;
begin
  if IsArchiveScanMode() then
    path:=StringGrid1.Rows[StringGrid1.Row][2]
  else
    path:=Utils.clearDirPath(StringGrid1.Rows[StringGrid1.Row][2])+StringGrid1.Rows[StringGrid1.Row][3]+'.war';
  if FileExists(path) then
  begin
   Utils.FileToClipboard(path)
  end else
  ShowMessage('NO EXISTE ARCHIVO ['+StringGrid1.Rows[StringGrid1.Row][3]+']');
end;

procedure TForm1.ItemInvertirSelClick(Sender: TObject);
begin
   Utils.InvertStringGrid(StringGrid1);
end;

procedure TForm1.ItemPDFReportIniClick(Sender: TObject);
var filePDF:String;
begin
  if IsArchiveScanMode() then
  begin
    ShowMessage('PDFReport.ini está dentro del archivo War/Zip y no se abre directamente.');
    Exit;
  end;
  filePDF:=Utils.clearDirPath(StringGrid1.Rows[StringGrid1.Row][2])+'WEB-INF\PDFReport.ini';
  if (Not(FileExists(filePDF))) Then ShowMessage('Archivo PDFReport.ini NO Existe');
  if FileExists(filePDF) then ShellExecute(0,nil, PChar(filePDF),PChar(filePDF),nil,1);
end;

procedure TForm1.ItemSelNadaClick(Sender: TObject);
begin
  Utils.SelNoneStringGrid(StringGrid1);
end;

procedure TForm1.ItemSelTodoClick(Sender: TObject);
begin
  Utils.SelAllStringGrid(StringGrid1);
end;

procedure TForm1.ItemWebXmlClick(Sender: TObject);
var dir:String;
begin
  If StringGrid1.RowCount<2 Then exit;
  dir:=Utils.clearDirPath(StringGrid1.Rows[StringGrid1.Row][2])+'WEB-INF\web.xml';
  if ShellExecute(0,nil, PChar(dir),PChar(dir),nil,1)=0 then;
end;

procedure TForm1.Label14Click(Sender: TObject);
begin
  EditVersion.Text:='';
end;

procedure TForm1.Label15Click(Sender: TObject);
begin
  EditFechaVersion.Text:='';
end;

procedure TForm1.Label18Click(Sender: TObject);
begin
  if IsArchiveScanMode() then
    LoadArchiveDataSourcePreview(StringGrid1.Row);
end;

procedure TForm1.Label22Click(Sender: TObject);
begin
  EditDSDescription.Enabled:=Not EditDSDescription.Enabled;
end;

procedure TForm1.Label23Click(Sender: TObject);
begin
  EditDSRestype.Enabled:=Not EditDSRestype.Enabled;
end;

procedure TForm1.Label24Click(Sender: TObject);
begin
  EditDSResAuth.Enabled:=Not EditDSResAuth.Enabled;
end;

procedure TForm1.Label25Click(Sender: TObject);
begin
  EditDSUseJdbcDataSource.Enabled:=Not EditDSUseJdbcDataSource.Enabled;
end;

procedure TForm1.Label4Click(Sender: TObject);
begin
  EditModulo.Text:='';
end;

procedure TForm1.Label5Click(Sender: TObject);
var dir:String;
begin
  If StringGrid1.RowCount<2 Then exit;
  if IsArchiveScanMode() then
  begin
    ShowArchiveDisplayName();
    Exit;
  end;
  dir:=Utils.clearDirPath(StringGrid1.Rows[StringGrid1.Row][2])+'WEB-INF\web.xml';
  If FileExists(dir) then ShellExecute(0,nil, PChar(dir),PChar(dir),nil,1) else showMessage('No se Encuentra web.xml');
end;

procedure TForm1.Label8Click(Sender: TObject);
begin
  Edit5.Enabled:=Not Edit5.Enabled;
  BitBtn19.Enabled:=Edit5.Enabled;
end;

procedure TForm1.LblPdfReportIniClick(Sender: TObject);
var PdfReport:String;
begin
  If StringGrid1.RowCount<2 Then exit;
  if IsArchiveScanMode() then
  begin
    ShowMessage('PDFReport.ini está dentro del archivo War/Zip y no se abre directamente.');
    Exit;
  end;
  PdfReport:=Utils.clearFilePath(StringGrid1.Rows[StringGrid1.Row][2]+'WEB-INF\PDFReport.ini');
  If FileExists(PdfReport) then ShellExecute(0,nil, PChar(PdfReport),PChar(PdfReport),nil,1) else showMessage('No se Encuentra PdfReport.ini');
end;

function TForm1.IsArchiveScanMode(): Boolean;
begin
  Result:=(varGlobales.ScanMode='warzip');
end;

procedure TForm1.ResetArchiveDataSourcePreview();
begin
  EditEJJdbcDatasource.Text:='';
  EditEJResRefName.Text:='';
  Label18.Caption:='mostrar actual';
  Label18.Cursor:=crHandPoint;
  Label18.Font.Color:=clBlue;
  Label18.Font.Style:=[fsUnderline];
end;

procedure TForm1.SetStatusMessage(const Msg: String);
begin
  StatusBar1.SimplePanel:=True;
  StatusBar1.SimpleText:=Msg;
  Application.ProcessMessages;
end;

function TForm1.CleanTempDirContent(): String;
var
  TempRoot, DriveRoot: String;
begin
  Result:='';
  TempRoot:=IncludeTrailingPathDelimiter(ExpandFileName(varGlobales.TempDir));
  DriveRoot:=IncludeTrailingPathDelimiter(ExtractFileDrive(TempRoot)+'\');

  if Trim(TempRoot).IsEmpty then
  begin
    Result:='TempDir vacío.';
    Exit;
  end;
  if SameText(TempRoot,IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))) then
  begin
    Result:='TempDir no puede ser la carpeta del ejecutable.';
    Exit;
  end;
  if (ExtractFileDrive(TempRoot)<>'') and SameText(TempRoot,DriveRoot) then
  begin
    Result:='TempDir no puede ser la raíz del disco.';
    Exit;
  end;

  if not DirectoryExists(TempRoot) then
  begin
    ForceDirectories(TempRoot);
    Exit;
  end;
  if not DeleteDirectory(TempRoot,True) then
  begin
    Result:='No se pudo limpiar TempDir: '+TempRoot;
    Exit;
  end;
  if not DirectoryExists(TempRoot) then
    ForceDirectories(TempRoot);
end;

function TForm1.DeleteTempDirOnFinish(): String;
var
  TempRoot, DriveRoot: String;
begin
  Result:='';
  TempRoot:=IncludeTrailingPathDelimiter(ExpandFileName(varGlobales.TempDir));
  DriveRoot:=IncludeTrailingPathDelimiter(ExtractFileDrive(TempRoot)+'\');

  if Trim(TempRoot).IsEmpty then
  begin
    Result:='TempDir vacío.';
    Exit;
  end;
  if SameText(TempRoot,IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))) then
  begin
    Result:='TempDir no puede ser la carpeta del ejecutable.';
    Exit;
  end;
  if (ExtractFileDrive(TempRoot)<>'') and SameText(TempRoot,DriveRoot) then
  begin
    Result:='TempDir no puede ser la raíz del disco.';
    Exit;
  end;

  if DirectoryExists(TempRoot) and (not DeleteDirectory(TempRoot,False)) then
    Result:='No se pudo eliminar TempDir: '+TempRoot;
end;

function TForm1.BuildArchiveTempRoot(): String;
begin
  Result:=IncludeTrailingPathDelimiter(varGlobales.TempDir)+'warzip\';
  if not DirectoryExists(Result) then
    ForceDirectories(Result);
end;

function TForm1.BuildArchiveId(const ArchivePath: String): String;
var
  HashValue: QWord;
  Input: String;
  I: Integer;
begin
  Input:=LowerCase(Trim(ArchivePath))+'|'+IntToStr(FileAge(ArchivePath))+'|'+IntToStr(FileSize(ArchivePath));
  HashValue:=5381;
  for I:=1 to Length(Input) do
    HashValue:=((HashValue shl 5)+HashValue) xor Ord(Input[I]);
  Result:=LowerCase(IntToHex(HashValue and $FFFFFF,6));
end;

function TForm1.SanitizeArchiveName(const Value: String): String;
var
  I: Integer;
  Ch: Char;
begin
  Result:='';
  for I:=1 to Length(Value) do
  begin
    Ch:=Value[I];
    if Ch in ['a'..'z','A'..'Z','0'..'9','-','_'] then
      Result:=Result+LowerCase(Ch)
    else
      Result:=Result+'_';
  end;
  while Pos('__',Result)>0 do
    Result:=StringReplace(Result,'__','_',[rfReplaceAll]);
  Result:=Trim(Result);
  while (Result<>'') and (Result[1]='_') do
    Delete(Result,1,1);
  while (Result<>'') and (Result[Length(Result)]='_') do
    Delete(Result,Length(Result),1);
  if Result='' then
    Result:='archivo';
end;

function TForm1.BuildArchiveTempDir(const ArchivePath: String): String;
var
  BaseName, FileType: String;
begin
  BaseName:=SanitizeArchiveName(ExtractFileNameOnly(ArchivePath));
  FileType:=LowerCase(ExtractFileExt(ArchivePath));
  if (FileType<>'') and (FileType[1]='.') then
    Delete(FileType,1,1);
  if FileType='' then
    FileType:='zip';
  Result:=BuildArchiveTempRoot()+BaseName+'_'+FileType+'_'+BuildArchiveId(ArchivePath)+'\';
end;

function TForm1.BuildArchiveModuleName(const ArchivePath: String): String;
begin
  Result:=Utils.getModuleName(ExtractFileNameOnly(ArchivePath));
  if Trim(Result).IsEmpty then
    Result:=ExtractFileNameOnly(ArchivePath);
end;

function TForm1.NormalizeArchiveEntryPath(const Value: String): String;
begin
  Result:=Trim(Value);
  Result:=StringReplace(Result,'\','/',[rfReplaceAll]);
  while Pos('//',Result)>0 do
    Result:=StringReplace(Result,'//','/',[rfReplaceAll]);
  while (Result<>'') and (Result[1]='/') do
    Delete(Result,1,1);
  if Copy(Result,1,2)='./' then
    Delete(Result,1,2);
  if (Result<>'') and (Result[Length(Result)]='/') then
    Delete(Result,Length(Result),1);
end;

function TForm1.ArchiveHasAnyEntry(const ArchiveEntries: TStrings; const Pattern: String): Boolean;
var
  I: Integer;
  EntryName, PatternNorm: String;
begin
  Result:=False;
  PatternNorm:=NormalizeArchiveEntryPath(Pattern);
  for I:=0 to ArchiveEntries.Count-1 do
  begin
    EntryName:=NormalizeArchiveEntryPath(ArchiveEntries[I]);
    if MatchesMask(EntryName,PatternNorm) then
    begin
      Result:=True;
      Exit;
    end;
  end;
end;

function TForm1.FindArchiveEntry(const ArchiveEntries: TStrings; const EntryPath: String; out ExactEntry: String): Boolean;
var
  I: Integer;
  EntryName, TargetName: String;
begin
  ExactEntry:='';
  Result:=False;
  TargetName:=NormalizeArchiveEntryPath(EntryPath);
  for I:=0 to ArchiveEntries.Count-1 do
  begin
    EntryName:=NormalizeArchiveEntryPath(ArchiveEntries[I]);
    if EntryName=TargetName then
    begin
      ExactEntry:=ArchiveEntries[I];
      Result:=True;
      Exit;
    end;
  end;
end;

procedure TForm1.AddArchiveMatches(const ArchiveEntries: TStrings; const Pattern: String; Matches: TStrings);
var
  I: Integer;
  EntryName, PatternNorm: String;
begin
  PatternNorm:=NormalizeArchiveEntryPath(Pattern);
  for I:=0 to ArchiveEntries.Count-1 do
  begin
    EntryName:=NormalizeArchiveEntryPath(ArchiveEntries[I]);
    if MatchesMask(EntryName,PatternNorm) and (Matches.IndexOf(ArchiveEntries[I])=-1) then
      Matches.Add(ArchiveEntries[I]);
  end;
end;

procedure TForm1.AddFirstArchiveMatch(const ArchiveEntries: TStrings; const Pattern: String; Matches: TStrings);
var
  I: Integer;
  EntryName, PatternNorm: String;
begin
  PatternNorm:=NormalizeArchiveEntryPath(Pattern);
  for I:=0 to ArchiveEntries.Count-1 do
  begin
    EntryName:=NormalizeArchiveEntryPath(ArchiveEntries[I]);
    if MatchesMask(EntryName,PatternNorm) then
    begin
      if Matches.IndexOf(ArchiveEntries[I])=-1 then
        Matches.Add(ArchiveEntries[I]);
      Exit;
    end;
  end;
end;

procedure TForm1.AddMarkerFile(const EntryPath: String; MarkerFilesToCreate: TStrings);
begin
  if MarkerFilesToCreate.IndexOf(EntryPath)=-1 then
    MarkerFilesToCreate.Add(EntryPath);
end;

procedure TForm1.AddArchiveDirEntries(const ArchiveEntries: TStrings; const DirPath: String; Matches: TStrings; IncludeDirEntry: Boolean);
var
  I: Integer;
  EntryName, Prefix, DirNorm: String;
begin
  DirNorm:=NormalizeArchiveEntryPath(DirPath);
  if DirNorm='' then
    Exit;
  Prefix:=DirNorm+'/';
  for I:=0 to ArchiveEntries.Count-1 do
  begin
    EntryName:=NormalizeArchiveEntryPath(ArchiveEntries[I]);
    if ((IncludeDirEntry and ((EntryName=DirNorm) or (EntryName=Prefix))) or
       ((Copy(EntryName,1,Length(Prefix))=Prefix) and (Length(EntryName)>Length(Prefix)))) and
       (Matches.IndexOf(ArchiveEntries[I])=-1) then
      Matches.Add(ArchiveEntries[I]);
  end;
end;

function TForm1.ArchiveDirExists(const ArchiveEntries: TStrings; const DirPath: String): Boolean;
var
  I: Integer;
  EntryName, Prefix: String;
begin
  Result:=False;
  Prefix:=NormalizeArchiveEntryPath(DirPath);
  if Prefix='' then
    Exit;
  Prefix:=Prefix+'/';
  for I:=0 to ArchiveEntries.Count-1 do
  begin
    EntryName:=NormalizeArchiveEntryPath(ArchiveEntries[I]);
    if (EntryName=Copy(Prefix,1,Length(Prefix)-1)) or (Copy(EntryName,1,Length(Prefix))=Prefix) then
    begin
      Result:=True;
      Exit;
    end;
  end;
end;

function TForm1.ArchiveDirHasFiles(const ArchiveEntries: TStrings; const DirPath: String): Boolean;
var
  I: Integer;
  EntryName, Prefix: String;
begin
  Result:=False;
  Prefix:=NormalizeArchiveEntryPath(DirPath);
  if Prefix='' then
    Exit;
  Prefix:=Prefix+'/';
  for I:=0 to ArchiveEntries.Count-1 do
  begin
    EntryName:=NormalizeArchiveEntryPath(ArchiveEntries[I]);
    if (Copy(EntryName,1,Length(Prefix))=Prefix) and (Length(EntryName)>Length(Prefix)) then
    begin
      Result:=True;
      Exit;
    end;
  end;
end;

procedure TForm1.AddDirWithParents(const DirPath: String; Dirs: TStrings);
var
  CurrentDir: String;
  P: Integer;
begin
  CurrentDir:=NormalizeArchiveEntryPath(DirPath);
  while CurrentDir<>'' do
  begin
    if Dirs.IndexOf(CurrentDir)=-1 then
      Dirs.Add(CurrentDir);
    P:=LastDelimiter('/',CurrentDir);
    if P<=0 then
      Break;
    CurrentDir:=Copy(CurrentDir,1,P-1);
  end;
end;

procedure TForm1.AddArchiveDirMatches(const ArchiveEntries: TStrings; const DirPath: String; Dirs: TStrings);
var
  I, BaseLen, P: Integer;
  EntryName, BaseDir, ChildDir: String;
begin
  BaseDir:=NormalizeArchiveEntryPath(DirPath);
  if BaseDir='' then
    Exit;

  if (Length(BaseDir)>=2) and (Copy(BaseDir,Length(BaseDir)-1,2)='/*') then
  begin
    Delete(BaseDir,Length(BaseDir)-1,2);
    BaseDir:=NormalizeArchiveEntryPath(BaseDir);
    AddDirWithParents(BaseDir,Dirs);
    BaseLen:=Length(BaseDir)+1;
    for I:=0 to ArchiveEntries.Count-1 do
    begin
      EntryName:=NormalizeArchiveEntryPath(ArchiveEntries[I]);
      if Copy(EntryName,1,BaseLen)<>BaseDir+'/' then
        Continue;
      ChildDir:=Copy(EntryName,1,BaseLen-1);
      P:=Pos('/',Copy(EntryName,BaseLen,MaxInt));
      if P>0 then
        ChildDir:=BaseDir+'/'+Copy(Copy(EntryName,BaseLen,MaxInt),1,P-1);
      AddDirWithParents(ChildDir,Dirs);
    end;
    Exit;
  end;

  if ArchiveDirExists(ArchiveEntries,BaseDir) then
    AddDirWithParents(BaseDir,Dirs);
end;

function TForm1.FindArchiveClientCfgEntry(const ArchiveEntries: TStrings; out ClientCfgEntry, Module, GxVersion: String): Boolean;
var
  I, P: Integer;
  EntryName, Prefix, Rest: String;
begin
  Result:=False;
  ClientCfgEntry:='';
  Module:='';
  GxVersion:='';

  if FindArchiveEntry(ArchiveEntries,'WEB-INF/classes/client.cfg',ClientCfgEntry) then
  begin
    GxVersion:='10';
    Result:=True;
    Exit;
  end;

  Prefix:='WEB-INF/classes/com/';
  for I:=0 to ArchiveEntries.Count-1 do
  begin
    EntryName:=NormalizeArchiveEntryPath(ArchiveEntries[I]);
    if SameText(Copy(EntryName,1,Length(Prefix)),Prefix) and SameText(ExtractFileName(EntryName),'client.cfg') then
    begin
      Rest:=Copy(EntryName,Length(Prefix)+1,MaxInt);
      P:=Pos('/',Rest);
      if P>1 then
        Module:=Copy(Rest,1,P-1);
      ClientCfgEntry:=ArchiveEntries[I];
      GxVersion:='16';
      Result:=True;
      Exit;
    end;
  end;
end;

procedure TForm1.LoadArchiveDataSourcePreview(const ARow: Integer);
var
  ArchivePath, TempDir, WebXmlEntry, ClientCfgEntry, Module, GxVersion, ErrorMsg: String;
  WebXmlPath, ClientCfgPath: String;
  ArchiveEntries, Entries: TStringList;
begin
  EditEJJdbcDatasource.Text:='';
  EditEJResRefName.Text:='';
  if (ARow<1) or (ARow>=StringGrid1.RowCount) then
    Exit;

  ArchivePath:=Utils.clearFilePath(StringGrid1.Rows[ARow][2]);
  if not FileExists(ArchivePath) then
    Exit;

  ArchiveEntries:=TStringList.Create;
  Entries:=TStringList.Create;
  try
    ErrorMsg:=Utils.ListZipEntries(ArchivePath,ArchiveEntries);
    if not ErrorMsg.IsEmpty then
      Exit;

    Module:=BuildArchiveModuleName(ArchivePath);
    GxVersion:='10';
    if FindArchiveEntry(ArchiveEntries,'WEB-INF/web.xml',WebXmlEntry) then
      Entries.Add(WebXmlEntry);
    if FindArchiveClientCfgEntry(ArchiveEntries,ClientCfgEntry,Module,GxVersion) then
      Entries.Add(ClientCfgEntry);
    if Entries.Count=0 then
    begin
      EditEJJdbcDatasource.Text:='NO ENCONTRADO';
      EditEJResRefName.Text:='NO ENCONTRADO';
      Label18.Caption:='sin web.xml ni client.cfg';
      Label18.Cursor:=crDefault;
      Label18.Font.Color:=clRed;
      Label18.Font.Style:=[];
      Exit;
    end;

    TempDir:=BuildArchiveTempDir(ArchivePath)+'datasource_preview\';
    ErrorMsg:=Utils.ExtractJavaArchiveEntries(ArchivePath,TempDir,varGlobales.JavaHome,Entries);
    if not ErrorMsg.IsEmpty then
      Exit;

    WebXmlPath:='';
    ClientCfgPath:='';
    if not WebXmlEntry.IsEmpty then
      WebXmlPath:=Utils.clearFilePath(TempDir+StringReplace(WebXmlEntry,'/',PathDelim,[rfReplaceAll]));
    if not ClientCfgEntry.IsEmpty then
      ClientCfgPath:=Utils.clearFilePath(TempDir+StringReplace(ClientCfgEntry,'/',PathDelim,[rfReplaceAll]));
    Utils.getDataSource(
      WebXmlPath,
      ClientCfgPath,
      GxVersion,
      Module,
      EditEJJdbcDatasource,
      EditEJResRefName);
    Label18.Caption:='['+StringGrid1.Rows[ARow][3]+']';
    Label18.Cursor:=crDefault;
    Label18.Font.Color:=clBlack;
    Label18.Font.Style:=[fsBold];
  finally
    Entries.Free;
    ArchiveEntries.Free;
  end;
end;

procedure TForm1.ApplyDataSourceWarZip();
var
  ArchiveEntries, EntriesToExtract, EntriesToUpdate: TStringList;
  ArchivePath, ArchiveLabel, TempDir, WebXmlEntry, ClientCfgEntry, WebXmlPath, ClientCfgPath: String;
  ErrorMsg, WebXmlContent, Module, GxVersion, SectionINI: String;
  CS_DBNAME, USER_ID, USER_PASSWORD, JDBC_DRIVER, DB_URL, USE_JDBC_DATASOURCE, JDBC_DATASOURCE: String;
  I, DirCount, FullCount, PartialCount, NoApplyCount, ErrorCount: Integer;
  WebXml: TMyXml;
  ClientCfg: TIniFile;
  SS: TStringList;
  Ok, WebOk, ClientOk: Boolean;
  StartAt, EndAt: TDateTime;
begin
  DirCount:=0;
  FullCount:=0;
  PartialCount:=0;
  NoApplyCount:=0;
  ErrorCount:=0;
  for I:=1 to StringGrid1.RowCount-1 do
    if StringGrid1.Cells[0,I]='1' then
      Inc(DirCount);

  if DirCount<1 then
  begin
    MessageDlg('', 'Selecciona al menos un archivo War/Zip', mtError, [mbOK],0);
    Exit;
  end;

  WebXmlContent:=#13#10#9#9'<description>'+varGlobales.DSDescription+'</description>'#13#10;
  WebXmlContent:=WebXmlContent+#9#9'<res-ref-name>'+varGlobales.DSResRefName+'</res-ref-name>'#13#10;
  WebXmlContent:=WebXmlContent+#9#9'<res-type>'+varGlobales.DSResType+'</res-type>'#13#10;
  WebXmlContent:=WebXmlContent+#9#9'<res-auth>'+varGlobales.DSResAuth+'</res-auth>'#13#10;
  CS_DBNAME:='';
  USER_ID:='';
  USER_PASSWORD:='';
  JDBC_DRIVER:='';
  DB_URL:='';
  USE_JDBC_DATASOURCE:=IntToStr(varGlobales.DSUseJdbcDatasource);
  JDBC_DATASOURCE:=varGlobales.DSJdbcDataSource;

  ErrorMsg:=CleanTempDirContent();
  if not ErrorMsg.IsEmpty then
  begin
    Utils.addToRichMemo('Error al limpiar tmp: '+ErrorMsg,RichMemo1,StatusBar1,clRed);
    Exit;
  end;

  ArchiveEntries:=TStringList.Create;
  EntriesToExtract:=TStringList.Create;
  EntriesToUpdate:=TStringList.Create;
  try
    Utils.addToRichMemo('Inicio DataSource War/Zip ('+TimeToStr(Time)+')',RichMemo1,StatusBar1,clBlue);
    for I:=1 to StringGrid1.RowCount-1 do
    begin
      if StringGrid1.Cells[0,I]<>'1' then
        Continue;

      ArchiveEntries.Clear;
      EntriesToExtract.Clear;
      EntriesToUpdate.Clear;
      WebOk:=False;
      ClientOk:=False;
      ArchivePath:=Utils.clearFilePath(StringGrid1.Cells[2,I]);
      ArchiveLabel:=StringGrid1.Cells[3,I];
      if ArchiveLabel.IsEmpty then
        ArchiveLabel:=ExtractFileName(ArchivePath);
      Utils.addToRichMemo('Archivo: '+ArchiveLabel,RichMemo1,StatusBar1,clBlue);

      ErrorMsg:=Utils.ListZipEntries(ArchivePath,ArchiveEntries);
      if not ErrorMsg.IsEmpty then
      begin
        Inc(ErrorCount);
        Utils.addToRichMemo('Error leyendo ZIP: '+ErrorMsg,RichMemo1,StatusBar1,clRed);
        Continue;
      end;

      Module:=BuildArchiveModuleName(ArchivePath);
      GxVersion:='10';
      WebXmlEntry:='';
      ClientCfgEntry:='';
      if FindArchiveEntry(ArchiveEntries,'WEB-INF/web.xml',WebXmlEntry) then
        EntriesToExtract.Add(WebXmlEntry);
      if FindArchiveClientCfgEntry(ArchiveEntries,ClientCfgEntry,Module,GxVersion) then
        EntriesToExtract.Add(ClientCfgEntry);

      if EntriesToExtract.Count=0 then
      begin
        Inc(NoApplyCount);
        Utils.addToRichMemo('Sin web.xml ni client.cfg para actualizar.',RichMemo1,StatusBar1,clRed);
        Continue;
      end;

      TempDir:=BuildArchiveTempDir(ArchivePath)+'datasource\';
      SetStatusMessage('Extrayendo DataSource '+ArchiveLabel+'...');
      ErrorMsg:=Utils.ExtractJavaArchiveEntries(ArchivePath,TempDir,varGlobales.JavaHome,EntriesToExtract);
      if not ErrorMsg.IsEmpty then
      begin
        Inc(ErrorCount);
        Utils.addToRichMemo('Error al extraer DataSource: '+ErrorMsg,RichMemo1,StatusBar1,clRed);
        Continue;
      end;

      if not WebXmlEntry.IsEmpty then
      begin
        WebXmlPath:=Utils.clearFilePath(TempDir+StringReplace(WebXmlEntry,'/',PathDelim,[rfReplaceAll]));
        if FileExists(WebXmlPath) then
        begin
          WebXml:=TMyXml.Create(WebXmlPath);
          Ok:=WebXml.ReplaceValueTXT('<resource-ref>','</resource-ref>',WebXmlContent);
          if not Ok then
            Ok:=WebXml.InsertWhitPostRefTXT('</web-app>','<resource-ref>'+WebXmlContent+'</resource-ref>');
          WebXml.Free;
          if EntriesToUpdate.IndexOf(WebXmlEntry)=-1 then
            EntriesToUpdate.Add(WebXmlEntry);
          WebOk:=True;
        end;
      end;

      if not ClientCfgEntry.IsEmpty then
      begin
        ClientCfgPath:=Utils.clearFilePath(TempDir+StringReplace(ClientCfgEntry,'/',PathDelim,[rfReplaceAll]));
        if FileExists(ClientCfgPath) then
        begin
          if GxVersion='16' then
            SectionINI:=Trim(LowerCase('com.'+Trim(Module))+'|DEFAULT')
          else
            SectionINI:='default|DEFAULT';
          ClientCfg:=TIniFile.Create(ClientCfgPath);
          ClientCfg.WriteString(SectionINI,'CS_DBNAME',CS_DBNAME);
          ClientCfg.WriteString(SectionINI,'USER_ID',USER_ID);
          ClientCfg.WriteString(SectionINI,'USER_PASSWORD',USER_PASSWORD);
          ClientCfg.WriteString(SectionINI,'JDBC_DRIVER',JDBC_DRIVER);
          ClientCfg.WriteString(SectionINI,'DB_URL',DB_URL);
          ClientCfg.WriteString(SectionINI,'USE_JDBC_DATASOURCE',USE_JDBC_DATASOURCE);
          ClientCfg.WriteString(SectionINI,'JDBC_DATASOURCE',JDBC_DATASOURCE);
          ClientCfg.Free;
          SS:=TStringList.Create;
          SS.LoadFromFile(ClientCfgPath);
          SS.Text:=StringReplace(SS.Text,#13#10#13#10,#13#10,[rfReplaceAll]);
          SS.SaveToFile(ClientCfgPath);
          SS.Free;
          if EntriesToUpdate.IndexOf(ClientCfgEntry)=-1 then
            EntriesToUpdate.Add(ClientCfgEntry);
          ClientOk:=True;
        end;
      end;

      if EntriesToUpdate.Count=0 then
      begin
        Inc(NoApplyCount);
        Utils.addToRichMemo('Sin cambios DataSource para actualizar.',RichMemo1,StatusBar1,clRed);
        Continue;
      end;

      StartAt:=Now;
      SetStatusMessage('Actualizando DataSource '+ArchiveLabel+'...');
      ErrorMsg:=Utils.UpdateJavaArchiveEntries(ArchivePath,TempDir,varGlobales.JavaHome,EntriesToUpdate);
      EndAt:=Now;
      if ErrorMsg.IsEmpty then
      begin
        if WebOk and ClientOk then
          Inc(FullCount)
        else
          Inc(PartialCount);
        Utils.addToRichMemo('DataSource actualizado ('+TimeToStr(StartAt)+' - '+TimeToStr(EndAt)+'): '+FormatElapsedMs(MilliSecondsBetween(EndAt,StartAt)),RichMemo1,StatusBar1,clBlue);
      end
      else
      begin
        Inc(ErrorCount);
        Utils.addToRichMemo('Error DataSource: '+ErrorMsg,RichMemo1,StatusBar1,clRed);
      end;
    end;

    if (StringGrid1.Row>0) and (StringGrid1.Row<StringGrid1.RowCount) then
      LoadArchiveDataSourcePreview(StringGrid1.Row);
    if FullCount=DirCount then
      MessageDlg('', 'Actualización Completa', mtInformation, [mbOK],0)
    else if (FullCount+PartialCount)>0 then
      MessageDlg('', 'Aplicación parcial. Se actualizó solo web.xml o solo client.cfg en uno o más archivos War/Zip.', mtWarning, [mbOK],0)
    else if ErrorCount>0 then
      MessageDlg('', 'No se actualizó DataSource. Revisa la consola de mensajes.', mtError, [mbOK],0)
    else
      MessageDlg('', 'No se actualizó DataSource.', mtWarning, [mbOK],0);
  finally
    EntriesToUpdate.Free;
    EntriesToExtract.Free;
    ArchiveEntries.Free;
  end;
end;

procedure TForm1.ShowArchiveDisplayName();
var
  ArchiveEntries, EntriesToExtract: TStringList;
  ArchivePath, ArchiveLabel, TempDir, WebXmlEntry, WebXmlPath, ErrorMsg: String;
  MyXml: TMyXml;
  Ex: Boolean;
begin
  if (StringGrid1.RowCount<2) or (StringGrid1.Row<1) or (StringGrid1.Row>=StringGrid1.RowCount) then
    Exit;

  ArchivePath:=Utils.clearFilePath(StringGrid1.Rows[StringGrid1.Row][2]);
  ArchiveLabel:=StringGrid1.Rows[StringGrid1.Row][3];
  if ArchiveLabel.IsEmpty then
    ArchiveLabel:=ExtractFileName(ArchivePath);

  ArchiveEntries:=TStringList.Create;
  EntriesToExtract:=TStringList.Create;
  try
    ErrorMsg:=Utils.ListZipEntries(ArchivePath,ArchiveEntries);
    if not ErrorMsg.IsEmpty then
    begin
      ShowMessage('No se pudo leer el archivo War/Zip: '+ErrorMsg);
      Exit;
    end;

    if not FindArchiveEntry(ArchiveEntries,'WEB-INF/web.xml',WebXmlEntry) then
    begin
      RichMemo3.Clear;
      ShowMessage('No se encuentra WEB-INF/web.xml en '+ArchiveLabel);
      Exit;
    end;

    EntriesToExtract.Add(WebXmlEntry);
    TempDir:=BuildArchiveTempDir(ArchivePath)+'displayname_preview\';
    SetStatusMessage('Leyendo display-name '+ArchiveLabel+'...');
    ErrorMsg:=Utils.ExtractJavaArchiveEntries(ArchivePath,TempDir,varGlobales.JavaHome,EntriesToExtract);
    if not ErrorMsg.IsEmpty then
    begin
      ShowMessage('No se pudo extraer web.xml: '+ErrorMsg);
      Exit;
    end;

    WebXmlPath:=Utils.clearFilePath(TempDir+StringReplace(WebXmlEntry,'/',PathDelim,[rfReplaceAll]));
    MyXml:=TMyXml.Create(WebXmlPath);
    try
      RichMemo3.Text:=MyXml.getValueTagTXT('<display-name>','</display-name>',Ex);
      if not Ex then
        RichMemo3.Text:='';
      StringGrid1.Cells[5,StringGrid1.Row]:=RichMemo3.Text;
      Label9.Caption:='display-name: ['+ArchiveLabel+']';
    finally
      MyXml.Free;
    end;
  finally
    EntriesToExtract.Free;
    ArchiveEntries.Free;
  end;
end;

procedure TForm1.ApplyDisplayNameWarZip();
var
  ArchiveEntries, EntriesToExtract, EntriesToUpdate: TStringList;
  ArchivePath, ArchiveLabel, TempDir, WebXmlEntry, WebXmlPath, ErrorMsg, Version: String;
  I, DirCount, UpdatedCount, ErrorCount, Resp: Integer;
  MyXml: TMyXml;
  IsOk: Boolean;
  StartAt, EndAt: TDateTime;
begin
  Label16.Caption:=Utils.versionStr(EditModulo.Text,EditVersion.Text,EditFechaVersion.Text);
  Version:=Utils.versionStr(EditModulo.Text,EditVersion.Text,EditFechaVersion.Text);
  DirCount:=0;
  UpdatedCount:=0;
  ErrorCount:=0;

  for I:=1 to StringGrid1.RowCount-1 do
    if StringGrid1.Cells[0,I]='1' then
      Inc(DirCount);

  if DirCount=0 then
  begin
    ShowMessage('Debe seleccionar al menos un archivo War/Zip');
    Exit;
  end;

  if DirCount>2 then
  begin
    Resp:=Application.MessageBox(PChar('Tiene seleccionados '+DirCount.ToString+' archivos War/Zip'+#13#10+
      '¿DESEA CONTINUAR?'),'ADVERTENCIA',(MB_ICONEXCLAMATION+MB_OKCANCEL));
    if Resp=IDCANCEL then
      Exit;
  end;

  Utils.addItemListBox(ListBox1,EditModulo.Text);
  Utils.addItemListBox(ListBox2,EditVersion.Text);
  varGlobales.ListBoxModuloValues:=ListBox1.Items.CommaText;
  varGlobales.ListBoxVersionValues:=ListBox2.Items.CommaText;

  ErrorMsg:=CleanTempDirContent();
  if not ErrorMsg.IsEmpty then
  begin
    Utils.addToRichMemo('Error al limpiar tmp: '+ErrorMsg,RichMemo1,StatusBar1,clRed);
    Exit;
  end;

  ArchiveEntries:=TStringList.Create;
  EntriesToExtract:=TStringList.Create;
  EntriesToUpdate:=TStringList.Create;
  try
    Utils.addToRichMemo('Inicio display-name War/Zip ('+TimeToStr(Time)+')',RichMemo1,StatusBar1,clBlue);
    for I:=1 to StringGrid1.RowCount-1 do
    begin
      if StringGrid1.Cells[0,I]<>'1' then
        Continue;

      ArchiveEntries.Clear;
      EntriesToExtract.Clear;
      EntriesToUpdate.Clear;
      ArchivePath:=Utils.clearFilePath(StringGrid1.Cells[2,I]);
      ArchiveLabel:=StringGrid1.Cells[3,I];
      if ArchiveLabel.IsEmpty then
        ArchiveLabel:=ExtractFileName(ArchivePath);
      Utils.addToRichMemo('Archivo: '+ArchiveLabel,RichMemo1,StatusBar1,clBlue);

      ErrorMsg:=Utils.ListZipEntries(ArchivePath,ArchiveEntries);
      if not ErrorMsg.IsEmpty then
      begin
        Inc(ErrorCount);
        Utils.addToRichMemo('Error leyendo ZIP: '+ErrorMsg,RichMemo1,StatusBar1,clRed);
        Continue;
      end;

      if not FindArchiveEntry(ArchiveEntries,'WEB-INF/web.xml',WebXmlEntry) then
      begin
        Inc(ErrorCount);
        Utils.addToRichMemo('No se encuentra WEB-INF/web.xml.',RichMemo1,StatusBar1,clRed);
        Continue;
      end;

      EntriesToExtract.Add(WebXmlEntry);
      EntriesToUpdate.Add(WebXmlEntry);
      TempDir:=BuildArchiveTempDir(ArchivePath)+'displayname\';
      SetStatusMessage('Extrayendo web.xml '+ArchiveLabel+'...');
      ErrorMsg:=Utils.ExtractJavaArchiveEntries(ArchivePath,TempDir,varGlobales.JavaHome,EntriesToExtract);
      if not ErrorMsg.IsEmpty then
      begin
        Inc(ErrorCount);
        Utils.addToRichMemo('Error al extraer web.xml: '+ErrorMsg,RichMemo1,StatusBar1,clRed);
        Continue;
      end;

      WebXmlPath:=Utils.clearFilePath(TempDir+StringReplace(WebXmlEntry,'/',PathDelim,[rfReplaceAll]));
      if not FileExists(WebXmlPath) then
      begin
        Inc(ErrorCount);
        Utils.addToRichMemo('No se pudo obtener web.xml temporal.',RichMemo1,StatusBar1,clRed);
        Continue;
      end;

      MyXml:=TMyXml.Create(WebXmlPath);
      try
        IsOk:=MyXml.ReplaceValueTXT('<display-name>','</display-name>',Version);
        if not IsOk then
          MyXml.InsertWhitPrevRefTXT('metadata-complete="false">','<display-name>'+Version+'</display-name>');
      finally
        MyXml.Free;
      end;

      StartAt:=Now;
      SetStatusMessage('Actualizando display-name '+ArchiveLabel+'...');
      ErrorMsg:=Utils.UpdateJavaArchiveEntries(ArchivePath,TempDir,varGlobales.JavaHome,EntriesToUpdate);
      EndAt:=Now;
      if ErrorMsg.IsEmpty then
      begin
        Inc(UpdatedCount);
        StringGrid1.Cells[5,I]:=Version;
        Utils.addToRichMemo('Display-name actualizado ('+TimeToStr(StartAt)+' - '+TimeToStr(EndAt)+'): '+FormatElapsedMs(MilliSecondsBetween(EndAt,StartAt)),RichMemo1,StatusBar1,clBlue);
      end
      else
      begin
        Inc(ErrorCount);
        Utils.addToRichMemo('Error display-name: '+ErrorMsg,RichMemo1,StatusBar1,clRed);
      end;
    end;

    RichMemo3.Text:=StringGrid1.Rows[StringGrid1.Row][5];
    Label9.Caption:='archivo: ['+StringGrid1.Rows[StringGrid1.Row][3]+']';
    Label18.Caption:='['+StringGrid1.Rows[StringGrid1.Row][3]+']';
    if UpdatedCount=DirCount then
      MessageDlg('', 'Actualización Completa', mtInformation, [mbOK],0)
    else if UpdatedCount>0 then
      MessageDlg('', 'Aplicación parcial. Revisa la consola de mensajes.', mtWarning, [mbOK],0)
    else if ErrorCount>0 then
      MessageDlg('', 'No se actualizó display-name. Revisa la consola de mensajes.', mtError, [mbOK],0)
    else
      MessageDlg('', 'No se actualizó display-name.', mtWarning, [mbOK],0);
  finally
    EntriesToUpdate.Free;
    EntriesToExtract.Free;
    ArchiveEntries.Free;
    if not varGlobales.ConservarTmpAlFinalizar then
    begin
      SetStatusMessage('Limpiando tmp...');
      ErrorMsg:=DeleteTempDirOnFinish();
      if not ErrorMsg.IsEmpty then
        Utils.addToRichMemo('Error al limpiar tmp al finalizar: '+ErrorMsg,RichMemo1,StatusBar1,clRed);
    end;
  end;
end;

procedure TForm1.LogWarZipFdeMessage(const Texto: String; MsgColor: TColor);
var
  Mostrar: Boolean;
begin
  Mostrar:=True;
  if (MsgColor=clLtGray) and (not varGlobales.MostrarOK) then
    Mostrar:=False;
  if (MsgColor=clRed) and (not varGlobales.MostrarERR) then
    Mostrar:=False;
  if (MsgColor=clBlack) and (not varGlobales.MostrarMSJ) then
    Mostrar:=False;
  if Mostrar then
    Utils.addToRichMemo(Texto,RichMemo1,StatusBar1,MsgColor);

  TrayIcon1.Hint:=Texto;
  TrayIcon1.BalloonHint:=Texto;
  StatusBar1.SimpleText:=Texto;
end;

function TForm1.LogArchiveWebAppsRules(const AppDir: String; const ArchiveEntries: TStrings): Integer;
var
  Doc: TXMLDocument;
  WebAppsNode: TDOMNode;
  X, I, Fila, Count: Integer;
  TipoRead, DatoRead, FilaRead, ExactEntry: String;
  Matches, WorkingEntries: TStringList;
  MsgColor: TColor;
begin
  Result:=0;
  WebAppsNode:=nil;
  Doc:=TXMLDocument.Create;
  Matches:=TStringList.Create;
  WorkingEntries:=TStringList.Create;
  try
    WorkingEntries.Assign(ArchiveEntries);
    ReadXMLFile(Doc,Edit2.Text);
    if (Doc.DocumentElement=nil) or (UpperCase(Trim(Doc.DocumentElement.NodeName))<>'RULES') then
    begin
      Inc(Result);
      LogWarZipFdeMessage('Archivo FDE inválido.',clRed);
      Exit;
    end;

    for X:=0 to Doc.DocumentElement.ChildNodes.Count-1 do
      if UpperCase(Trim(Doc.DocumentElement.ChildNodes.Item[X].NodeName))='WEBAPPSRULES' then
      begin
        WebAppsNode:=Doc.DocumentElement.ChildNodes.Item[X];
        Break;
      end;

    if WebAppsNode=nil then
      Exit;

    Fila:=0;
    for X:=0 to WebAppsNode.ChildNodes.Count-1 do
    begin
      Inc(Fila);
      TipoRead:=UpperCase(Trim(WebAppsNode.ChildNodes.Item[X].NodeName));
      DatoRead:='';
      if WebAppsNode.ChildNodes.Item[X].ChildNodes.Count>0 then
        DatoRead:=WebAppsNode.ChildNodes.Item[X].FirstChild.NodeValue;
      DatoRead:=DatoRead.Replace('{MOD}',AppDir);
      FilaRead:=TipoRead+'='+DatoRead;

      if TipoRead='MSGRUN' then
      begin
        LogWarZipFdeMessage(Format('%.2d',[Fila])+': '+DatoRead,clBlack);
        Continue;
      end;

      if ((TipoRead='CHKFIL') or (TipoRead='DELFIL')) and
         (not DatoRead.IsEmpty) and
         ((DatoRead[DatoRead.Length]='\') or (DatoRead[DatoRead.Length]='/')) then
      begin
        Inc(Result);
        LogWarZipFdeMessage(Format('%.2d',[Fila])+': ['+FilaRead+'], Sintaxis incorrecta archivo .fde',clRed);
        Continue;
      end;

      DatoRead:=Utils.clearDirPath(DatoRead);
      MsgColor:=clLtGray;
      case TipoRead of
        'CHKFIL':
          begin
            if ArchiveHasAnyEntry(WorkingEntries,DatoRead) then
              LogWarZipFdeMessage(Format('%.2d',[Fila])+': ['+FilaRead+'], ok',MsgColor)
            else
            begin
              Inc(Result);
              LogWarZipFdeMessage(Format('%.2d',[Fila])+': ['+FilaRead+'], No Encontrado.',clRed);
            end;
          end;
        'CHKDIR':
          begin
            if ArchiveDirExists(WorkingEntries,DatoRead) then
              LogWarZipFdeMessage(Format('%.2d',[Fila])+': ['+FilaRead+'], ok',MsgColor)
            else
            begin
              Inc(Result);
              LogWarZipFdeMessage(Format('%.2d',[Fila])+': ['+FilaRead+'], No Encontrado.',clRed);
            end;
          end;
        'DELFIL':
          begin
            Matches.Clear;
            if (Pos('*',DatoRead)>0) or (Pos('?',DatoRead)>0) then
              AddArchiveMatches(WorkingEntries,DatoRead,Matches)
            else if FindArchiveEntry(WorkingEntries,DatoRead,ExactEntry) then
              Matches.Add(ExactEntry);
            for I:=0 to Matches.Count-1 do
              if FindArchiveEntry(WorkingEntries,Matches[I],ExactEntry) then
                WorkingEntries.Delete(WorkingEntries.IndexOf(ExactEntry));
            LogWarZipFdeMessage(Format('%.2d',[Fila])+': ['+FilaRead+'], ok, '+Matches.Count.ToString+' Eliminado(s).',MsgColor);
          end;
        'DELDIR':
          begin
            Matches.Clear;
            if ArchiveDirExists(WorkingEntries,DatoRead) then
              AddArchiveDirEntries(WorkingEntries,DatoRead,Matches,True);
            for I:=0 to Matches.Count-1 do
              if FindArchiveEntry(WorkingEntries,Matches[I],ExactEntry) then
                WorkingEntries.Delete(WorkingEntries.IndexOf(ExactEntry));
            LogWarZipFdeMessage(Format('%.2d',[Fila])+': ['+FilaRead+'], ok, '+Matches.Count.ToString+' Eliminado(s).',MsgColor);
          end;
        'CLRDIR':
          begin
            Count:=0;
            if ArchiveDirExists(WorkingEntries,DatoRead) then
            begin
              Matches.Clear;
              AddArchiveDirEntries(WorkingEntries,DatoRead,Matches,False);
              Count:=Matches.Count;
              for I:=0 to Matches.Count-1 do
                if FindArchiveEntry(WorkingEntries,Matches[I],ExactEntry) then
                  WorkingEntries.Delete(WorkingEntries.IndexOf(ExactEntry));
              LogWarZipFdeMessage(Format('%.2d',[Fila])+': ['+FilaRead+'], ok, '+Count.ToString+' Eliminados',MsgColor);
            end
            else
            begin
              Inc(Result);
              LogWarZipFdeMessage(Format('%.2d',[Fila])+': ['+FilaRead+'], Directorio no Existe',clRed);
            end;
          end;
        'CREDIR':
          begin
            if ArchiveDirExists(WorkingEntries,DatoRead) then
              LogWarZipFdeMessage(Format('%.2d',[Fila])+': ['+FilaRead+'], ok, 0 Creado(s)',MsgColor)
            else
            begin
              AddDirWithParents(DatoRead,WorkingEntries);
              LogWarZipFdeMessage(Format('%.2d',[Fila])+': ['+FilaRead+'], ok, 1 Creado(s)',MsgColor);
            end;
          end;
      else
        begin
          Inc(Result);
          LogWarZipFdeMessage(Format('%.2d',[Fila])+': ['+FilaRead+'], Sintaxis incorrecta, archivo .fde',clRed);
        end;
      end;
    end;
  except
    on E: Exception do
    begin
      Inc(Result);
      LogWarZipFdeMessage('Error leyendo FDE: '+E.Message,clRed);
    end;
  end;
  WorkingEntries.Free;
  Matches.Free;
  Doc.Free;
end;

function TForm1.BuildArchiveSelectivePlan(const AppDir: String; const ArchiveEntries,
  FilesToExtract, DirsToCreate, MarkerFilesToCreate, EntriesToDelete: TStrings; out NeedFullExtract, NeedsRepack: Boolean;
  out Reason: String): String;
var
  Doc: TXMLDocument;
  WebAppsNode, WebXmlNode: TDOMNode;
  X, I, BeforeCount: Integer;
  TipoRead, DatoRead, ExactEntry: String;
  Matches, WorkingEntries: TStringList;
begin
  Result:='';
  NeedFullExtract:=False;
  NeedsRepack:=False;
  Reason:='Sin cambios previstos';
  FilesToExtract.Clear;
  DirsToCreate.Clear;
  MarkerFilesToCreate.Clear;
  EntriesToDelete.Clear;
  WebAppsNode:=nil;
  WebXmlNode:=nil;
  Doc:=TXMLDocument.Create;
  Matches:=TStringList.Create;
  WorkingEntries:=TStringList.Create;
  try
    WorkingEntries.Assign(ArchiveEntries);
    ReadXMLFile(Doc,Edit2.Text);
    if (UpperCase(Trim(Doc.DocumentElement.NodeName))<>'RULES') or
       (Doc.DocumentElement.ChildNodes.Count=0) then
    begin
      NeedFullExtract:=True;
      Reason:='Archivo FDE inválido';
      Exit;
    end;

    for X:=0 to Doc.DocumentElement.ChildNodes.Count-1 do
      if UpperCase(Trim(Doc.DocumentElement.ChildNodes.Item[X].NodeName))='WEBAPPSRULES' then
      begin
        WebAppsNode:=Doc.DocumentElement.ChildNodes.Item[X];
        Break;
      end;

    for X:=0 to Doc.DocumentElement.ChildNodes.Count-1 do
      if UpperCase(Trim(Doc.DocumentElement.ChildNodes.Item[X].NodeName))='WEBXMLRULES' then
      begin
        WebXmlNode:=Doc.DocumentElement.ChildNodes.Item[X];
        Break;
      end;

    if WebAppsNode=nil then
    begin
      NeedFullExtract:=True;
      Reason:='Sin WEBAPPSRULES';
      Exit;
    end;

    for X:=0 to WebAppsNode.ChildNodes.Count-1 do
    begin
      TipoRead:=UpperCase(Trim(WebAppsNode.ChildNodes.Item[X].NodeName));
      DatoRead:='';
      if WebAppsNode.ChildNodes.Item[X].ChildNodes.Count>0 then
        DatoRead:=WebAppsNode.ChildNodes.Item[X].FirstChild.NodeValue;
      DatoRead:=DatoRead.Replace('{MOD}',AppDir);
      DatoRead:=Utils.clearDirPath(DatoRead);

      case TipoRead of
        'MSGRUN': ;
        'CHKFIL':
          begin
            // En War/Zip se valida contra el índice del ZIP; no necesita archivo temporal.
          end;
        'CHKDIR':
          begin
            // En War/Zip se valida contra el índice del ZIP; no necesita carpeta temporal.
          end;
        'DELFIL':
          begin
            BeforeCount:=EntriesToDelete.Count;
            if ArchiveHasAnyEntry(WorkingEntries,DatoRead) then
            begin
              Matches.Clear;
              if (Pos('*',DatoRead)>0) or (Pos('?',DatoRead)>0) then
                AddArchiveMatches(WorkingEntries,DatoRead,Matches)
              else if FindArchiveEntry(WorkingEntries,DatoRead,ExactEntry) then
                Matches.Add(ExactEntry);
              for I:=0 to Matches.Count-1 do
              begin
                if FindArchiveEntry(ArchiveEntries,Matches[I],ExactEntry) and
                   (EntriesToDelete.IndexOf(ExactEntry)=-1) then
                  EntriesToDelete.Add(ExactEntry);
                if FindArchiveEntry(WorkingEntries,Matches[I],ExactEntry) then
                  WorkingEntries.Delete(WorkingEntries.IndexOf(ExactEntry));
              end;
              if BeforeCount<>EntriesToDelete.Count then
              begin
                NeedsRepack:=True;
                if Reason='Sin cambios previstos' then
                  Reason:='DELFIL con cambios';
              end;
            end;
          end;
        'DELDIR':
          begin
            if ArchiveDirExists(WorkingEntries,DatoRead) then
            begin
              BeforeCount:=EntriesToDelete.Count+DirsToCreate.Count;
              Matches.Clear;
              AddArchiveDirEntries(WorkingEntries,DatoRead,Matches,True);
              for I:=0 to Matches.Count-1 do
              begin
                if FindArchiveEntry(ArchiveEntries,Matches[I],ExactEntry) and
                   (EntriesToDelete.IndexOf(ExactEntry)=-1) then
                  EntriesToDelete.Add(ExactEntry);
                if FindArchiveEntry(WorkingEntries,Matches[I],ExactEntry) then
                  WorkingEntries.Delete(WorkingEntries.IndexOf(ExactEntry));
                if FindArchiveEntry(DirsToCreate,Matches[I],ExactEntry) then
                  DirsToCreate.Delete(DirsToCreate.IndexOf(ExactEntry));
              end;
              if BeforeCount<>EntriesToDelete.Count+DirsToCreate.Count then
              begin
                NeedsRepack:=True;
                if Reason='Sin cambios previstos' then
                  Reason:='DELDIR con cambios';
              end;
            end;
          end;
        'CLRDIR':
          begin
            if ArchiveDirHasFiles(WorkingEntries,DatoRead) then
            begin
              BeforeCount:=EntriesToDelete.Count+DirsToCreate.Count;
              Matches.Clear;
              AddArchiveDirEntries(WorkingEntries,DatoRead,Matches,False);
              for I:=0 to Matches.Count-1 do
              begin
                if FindArchiveEntry(ArchiveEntries,Matches[I],ExactEntry) and
                   (EntriesToDelete.IndexOf(ExactEntry)=-1) then
                  EntriesToDelete.Add(ExactEntry);
                if FindArchiveEntry(WorkingEntries,Matches[I],ExactEntry) then
                  WorkingEntries.Delete(WorkingEntries.IndexOf(ExactEntry));
                if FindArchiveEntry(DirsToCreate,Matches[I],ExactEntry) then
                  DirsToCreate.Delete(DirsToCreate.IndexOf(ExactEntry));
              end;
              if BeforeCount<>EntriesToDelete.Count+DirsToCreate.Count then
              begin
                NeedsRepack:=True;
                if Reason='Sin cambios previstos' then
                  Reason:='CLRDIR con cambios';
              end;
            end;
            // El borrado se aplica reescribiendo el ZIP; no se simula con carpetas temporales.
          end;
        'CREDIR':
          begin
            if not ArchiveDirExists(WorkingEntries,DatoRead) then
            begin
              AddDirWithParents(DatoRead,DirsToCreate);
              AddDirWithParents(DatoRead,WorkingEntries);
              NeedsRepack:=True;
              if Reason='Sin cambios previstos' then
                Reason:='CREDIR con cambios';
            end;
            // Si ya existe, no hay nada físico que crear antes del reempaquetado.
          end;
      else
        begin
          NeedFullExtract:=True;
          Reason:='Comando '+TipoRead;
          Exit;
        end;
      end;
    end;

    NeedsRepack:=(EntriesToDelete.Count>0) or (DirsToCreate.Count>0);
    if NeedsRepack and (Reason='Sin cambios previstos') then
      Reason:='Cambios en ZIP';

    if (WebXmlNode<>nil) and
       FindArchiveEntry(WorkingEntries,'WEB-INF\web.xml',ExactEntry) and
       (FilesToExtract.IndexOf(ExactEntry)=-1) then
    begin
      FilesToExtract.Add(ExactEntry);
      if Reason='Sin cambios previstos' then
        Reason:='WEBXML requiere WEB-INF/web.xml';
    end;
  except
    on E: Exception do
    begin
      NeedFullExtract:=True;
      Reason:='Error leyendo FDE';
      Result:=E.Message;
    end;
  end;
  WorkingEntries.Free;
  Matches.Free;
  Doc.Free;
end;

function TForm1.ExtractArchiveToTemp(const ArchivePath, TargetDir: String): String;
begin
  Result:=Utils.ExtractJavaArchive(ArchivePath,TargetDir,varGlobales.JavaHome);
end;

function TForm1.PlanArchiveSelectiveExtraction(const ArchivePath, AppDir: String;
  FilesToExtract, DirsToCreate, MarkerFilesToCreate, EntriesToDelete: TStrings; out NeedFullExtract,
  NeedsRepack: Boolean; out Reason: String): String;
var
  ArchiveEntries: TStringList;
begin
  Result:='';
  ArchiveEntries:=TStringList.Create;
  try
    FilesToExtract.Clear;
    DirsToCreate.Clear;
    MarkerFilesToCreate.Clear;
    EntriesToDelete.Clear;
    NeedFullExtract:=False;
    NeedsRepack:=False;
    Reason:='';

    Result:=Utils.ListZipEntries(ArchivePath,ArchiveEntries);
    if not Trim(Result).IsEmpty then
      Exit;

    Result:=BuildArchiveSelectivePlan(AppDir,ArchiveEntries,FilesToExtract,DirsToCreate,MarkerFilesToCreate,EntriesToDelete,NeedFullExtract,NeedsRepack,Reason);
    if not Trim(Result).IsEmpty then
      Exit;
  finally
    ArchiveEntries.Free;
  end;
end;

function TForm1.ExtractArchiveSelectiveToTemp(const ArchivePath, TargetDir: String;
  FilesToExtract, DirsToCreate, MarkerFilesToCreate, EntriesToDelete: TStrings): String;
var
  I: Integer;
  EntriesToUpdate: TStringList;
begin
  Result:='';
  EntriesToUpdate:=TStringList.Create;
  try
  if DirectoryExists(TargetDir) then
    DeleteDirectory(TargetDir,False);
  ForceDirectories(TargetDir);

  if FilesToExtract.Count>0 then
  begin
    Result:=Utils.ExtractJavaArchiveEntries(ArchivePath,TargetDir,varGlobales.JavaHome,FilesToExtract);
    if not Trim(Result).IsEmpty then
      Exit;
  end;

  for I:=0 to DirsToCreate.Count-1 do
  begin
    ForceDirectories(Utils.clearDirPath(TargetDir+StringReplace(DirsToCreate[I],'/',PathDelim,[rfReplaceAll])));
    if EntriesToUpdate.IndexOf(DirsToCreate[I])=-1 then
      EntriesToUpdate.Add(DirsToCreate[I]);
  end;

  for I:=0 to FilesToExtract.Count-1 do
    if EntriesToUpdate.IndexOf(FilesToExtract[I])=-1 then
      EntriesToUpdate.Add(FilesToExtract[I]);

  EntriesToDelete.SaveToFile(Utils.clearFilePath(TargetDir+'.fde_delete_entries.txt'));
  EntriesToUpdate.SaveToFile(Utils.clearFilePath(TargetDir+'.fde_update_entries.txt'));
  finally
    EntriesToUpdate.Free;
  end;
end;

function TForm1.RepackTempToArchive(const SourceDir, ArchivePath: String): String;
var
  TempArchivePath, DeleteEntriesPath, UpdateEntriesPath: String;
  EntriesToDelete, EntriesToUpdate: TStringList;
begin
  TempArchivePath:=Utils.clearFilePath(IncludeTrailingPathDelimiter(SourceDir)+ExtractFileName(ArchivePath));
  DeleteEntriesPath:=Utils.clearFilePath(SourceDir+'.fde_delete_entries.txt');
  UpdateEntriesPath:=Utils.clearFilePath(SourceDir+'.fde_update_entries.txt');
  if FileExists(DeleteEntriesPath) then
  begin
    EntriesToDelete:=TStringList.Create;
    EntriesToUpdate:=TStringList.Create;
    try
      EntriesToDelete.LoadFromFile(DeleteEntriesPath);
      if FileExists(UpdateEntriesPath) then
        EntriesToUpdate.LoadFromFile(UpdateEntriesPath);
      Result:=Utils.RewriteZipWithoutEntries(ArchivePath,EntriesToDelete);
      if not Trim(Result).IsEmpty then
        Exit;
      Result:=Utils.UpdateJavaArchiveEntries(ArchivePath,SourceDir,varGlobales.JavaHome,EntriesToUpdate);
      Exit;
    finally
      EntriesToUpdate.Free;
      EntriesToDelete.Free;
    end;
  end;

  Result:=Utils.GenJavaArchive(SourceDir,varGlobales.JavaHome,ExtractFileName(ArchivePath));
  if not Trim(Result).IsEmpty then
    Exit;
  if not FileExists(TempArchivePath) then
  begin
    Result:='No se encontró el archivo generado '+ExtractFileName(ArchivePath);
    Exit;
  end;
  if FileExists(ArchivePath) then
    DeleteFile(ArchivePath);
  if not CopyFile(TempArchivePath,ArchivePath,[cffOverwriteFile]) then
    Result:='No se pudo copiar el archivo generado a '+ArchivePath;
end;

function TForm1.FormatElapsedMs(const ElapsedMs: Int64): String;
begin
  Result:=FormatFloat('0.000',ElapsedMs/1000)+' s';
end;

procedure TForm1.ProcesaPDFReportWarZip(CopyFonts:Boolean; PathFonts:String; PDFReportTXT:String);
var
  Entries: TStringList;
  Lines: TStringList;
  RCS: TMyRCS;
  I, DirCount: Integer;
  ArchivePath, ArchiveLabel, TempDir, ErrorMsg, PdfPath, FontEntryDir: String;
  StartAt, EndAt: TDateTime;
  ElapsedMs: Int64;

  function NormalizeInternalFontDir(const Value: String; out ErrorText: String): String;
  var
    Parts: TStringArray;
    Part, PartValue: String;
    Stack: TStringList;
  begin
    ErrorText:='';
    Result:=Trim(Value);
    if Result.IsEmpty then
      Exit;
    if (ExtractFileDrive(Result)<>'') or (Result[1]='/') or (Result[1]='\') then
    begin
      ErrorText:='En modo War/Zip la ruta de fuentes debe ser interna del archivo, no una ruta absoluta.';
      Result:='';
      Exit;
    end;
    Result:=StringReplace(Result,'\','/',[rfReplaceAll]);
    while Pos('//',Result)>0 do
      Result:=StringReplace(Result,'//','/',[rfReplaceAll]);
    while (Result<>'') and (Result[1]='/') do
      Delete(Result,1,1);
    while (Result<>'') and (Result[Length(Result)]='/') do
      Delete(Result,Length(Result),1);

    Stack:=TStringList.Create;
    try
      Stack.Add('WEB-INF');
      Stack.Add('classes');
      if (LowerCase(Result)='web-inf') or (Copy(LowerCase(Result),1,8)='web-inf/') then
        Stack.Clear;

      Parts:=Result.Split('/');
      for Part in Parts do
      begin
        PartValue:=Trim(Part);
        if PartValue.IsEmpty or (PartValue='.') then
          Continue;
        if PartValue='..' then
        begin
          if Stack.Count>1 then
            Stack.Delete(Stack.Count-1)
          else
          begin
            ErrorText:='En modo War/Zip la ruta de fuentes no puede salir de WEB-INF.';
            Result:='';
            Exit;
          end;
        end
        else
          Stack.Add(PartValue);
      end;
      Result:=StringReplace(Stack.Text,sLineBreak,'/',[rfReplaceAll]);
      while (Result<>'') and (Result[Length(Result)]='/') do
        Delete(Result,Length(Result),1);
    finally
      Stack.Free;
    end;
    if Result.IsEmpty then
      Result:='WEB-INF/classes';
  end;

  function WriteTempFile(const RelativeEntry, TextValue: String): String;
  var
    TargetPath: String;
  begin
    SetStatusMessage('Preparando '+RelativeEntry+'...');
    Result:='';
    TargetPath:=Utils.clearFilePath(TempDir+StringReplace(RelativeEntry,'/',PathDelim,[rfReplaceAll]));
    if not DirectoryExists(ExtractFilePath(TargetPath)) then
      ForceDirectories(ExtractFilePath(TargetPath));
    Lines.Text:=TextValue;
    Lines.SaveToFile(TargetPath);
    Entries.Add(RelativeEntry);
  end;

  function CopyFontToTemp(const FontName: String): String;
  var
    SourcePath, RelativeEntry, TargetPath: String;
  begin
    Result:='';
    SetStatusMessage('Copiando fuente '+FontName+'...');
    SourcePath:=RCS.getRCS(FontName);
    if not FileExists(SourcePath) then
    begin
      Result:='No se encontró la fuente '+FontName;
      Exit;
    end;
    RelativeEntry:=FontEntryDir+'/'+ExtractFileName(SourcePath);
    TargetPath:=Utils.clearFilePath(TempDir+StringReplace(RelativeEntry,'/',PathDelim,[rfReplaceAll]));
    if not DirectoryExists(ExtractFilePath(TargetPath)) then
      ForceDirectories(ExtractFilePath(TargetPath));
    if not CopyFile(SourcePath,TargetPath,[cffOverwriteFile]) then
      Result:='No se pudo copiar la fuente '+FontName;
    if Result.IsEmpty then
      Entries.Add(RelativeEntry);
  end;

begin
  if CopyFonts then
  begin
    FontEntryDir:=NormalizeInternalFontDir(PathFonts,ErrorMsg);
    if not ErrorMsg.IsEmpty then
    begin
      ShowMessage(ErrorMsg);
      Exit;
    end;
  end;

  ErrorMsg:=CleanTempDirContent();
  if not ErrorMsg.IsEmpty then
  begin
    Utils.addToRichMemo('Error al limpiar tmp: '+ErrorMsg,RichMemo1,StatusBar1,clRed);
    Exit;
  end;

  DirCount:=0;
  Entries:=TStringList.Create;
  Lines:=TStringList.Create;
  RCS:=TMyRCS.Create;
  try
    Utils.addToRichMemo('Inicio PDFReport War/Zip ('+TimeToStr(Time)+')',RichMemo1,StatusBar1,clBlue);
    for I:=1 to StringGrid1.RowCount-1 do
    begin
      if StringGrid1.Cells[0,I]<>'1' then
        Continue;
      Inc(DirCount);
      Entries.Clear;
      ArchivePath:=Utils.clearFilePath(StringGrid1.Cells[2,I]);
      ArchiveLabel:=StringGrid1.Cells[3,I];
      if ArchiveLabel.IsEmpty then
        ArchiveLabel:=ExtractFileName(ArchivePath);
      Utils.addToRichMemo('Archivo: '+ArchiveLabel,RichMemo1,StatusBar1,clBlue);
      if not FileExists(ArchivePath) then
      begin
        Utils.addToRichMemo('Archivo no encontrado: '+ArchivePath,RichMemo1,StatusBar1,clRed);
        Continue;
      end;

      TempDir:=BuildArchiveTempDir(ArchivePath);
      PdfPath:=Utils.clearFilePath(TempDir+'WEB-INF\PDFReport.ini');
      SetStatusMessage('Preparando PDFReport.ini para '+ArchiveLabel+'...');
      WriteTempFile('WEB-INF/PDFReport.ini',PDFReportTXT);
      if not FileExists(PdfPath) then
      begin
        Utils.addToRichMemo('No se pudo crear PDFReport.ini temporal.',RichMemo1,StatusBar1,clRed);
        Continue;
      end;

      if CopyFonts then
      begin
        ErrorMsg:=CopyFontToTemp(RCS.ARIALN_TTF);
        if ErrorMsg.IsEmpty then ErrorMsg:=CopyFontToTemp(RCS.COURI_TTF);
        if ErrorMsg.IsEmpty then ErrorMsg:=CopyFontToTemp(RCS.COUR_TTF);
        if ErrorMsg.IsEmpty then ErrorMsg:=CopyFontToTemp(RCS.MICROSS_TTF);
        if ErrorMsg.IsEmpty then ErrorMsg:=CopyFontToTemp(RCS.TIMES_TTF);
        if ErrorMsg.IsEmpty then ErrorMsg:=CopyFontToTemp(RCS.VERDANA_TTF);
        if not ErrorMsg.IsEmpty then
        begin
          Utils.addToRichMemo(ErrorMsg,RichMemo1,StatusBar1,clRed);
          Continue;
        end;
      end;

      StartAt:=Now;
      SetStatusMessage('Actualizando '+ArchiveLabel+' con jar...');
      ErrorMsg:=Utils.UpdateJavaArchiveEntries(ArchivePath,TempDir,varGlobales.JavaHome,Entries);
      EndAt:=Now;
      ElapsedMs:=MilliSecondsBetween(EndAt,StartAt);
      if ErrorMsg.IsEmpty then
        Utils.addToRichMemo('PDFReport actualizado ('+TimeToStr(StartAt)+' - '+TimeToStr(EndAt)+'): '+FormatElapsedMs(ElapsedMs),RichMemo1,StatusBar1,clBlue)
      else
        Utils.addToRichMemo('Error PDFReport: '+ErrorMsg,RichMemo1,StatusBar1,clRed);
    end;
  finally
    RCS.Free;
    Lines.Free;
    Entries.Free;
    if not varGlobales.ConservarTmpAlFinalizar then
    begin
      SetStatusMessage('Limpiando tmp...');
      ErrorMsg:=DeleteTempDirOnFinish();
      if not ErrorMsg.IsEmpty then
        Utils.addToRichMemo('Error al limpiar tmp al finalizar: '+ErrorMsg,RichMemo1,StatusBar1,clRed);
    end;
  end;
  if DirCount=0 then
    ShowMessage('Debe Seleccionar al menos un archivo war/zip')
  else
    ShowMessage('Proceso Terminado');
end;

procedure TForm1.ProcesarWarZip();
var
  FdeFile: TFdeFile;
  TempGrid: TStringGrid;
  ArchiveEntries: TStringList;
  FilesToExtract: TStringList;
  DirsToCreate: TStringList;
  MarkerFilesToCreate: TStringList;
  EntriesToDelete: TStringList;
  I, NewRow, ProcessedCount: Integer;
  ArchivePath, TempDir, ErrorMsg, ArchiveLabel, AppDir, Reason: String;
  StartAt, EndAt: TDateTime;
  ElapsedMs: Int64;
  NeedFullExtract, NeedsRepack: Boolean;
begin
  TempGrid:=TStringGrid.Create(nil);
  ArchiveEntries:=TStringList.Create;
  FilesToExtract:=TStringList.Create;
  DirsToCreate:=TStringList.Create;
  MarkerFilesToCreate:=TStringList.Create;
  EntriesToDelete:=TStringList.Create;
  try
    Utils.addToRichMemo('Inicio War/Zip ('+TimeToStr(Time)+')',RichMemo1,StatusBar1,clBlue);
    Application.ProcessMessages;
    SetStatusMessage('Limpiando tmp...');
    ErrorMsg:=CleanTempDirContent();
    if not Trim(ErrorMsg).IsEmpty then
    begin
      Utils.addToRichMemo('Error al limpiar tmp: '+ErrorMsg,RichMemo1,StatusBar1,clRed);
      Exit;
    end;
    TempGrid.ColCount:=StringGrid1.ColCount;
    TempGrid.RowCount:=1;
    TempGrid.FixedRows:=1;
    ProcessedCount:=0;
    varGlobales.WebAppsDir:=Edit1.Text;
    varGlobales.FdeFilePath:=Edit2.Text;
    FdeFile:=TFdeFile.create(Edit2.Text);
    try
      if MinScriptFDE.Checked then
        MinimizeToTray();

    for I:=1 to StringGrid1.RowCount-1 do
    begin
      if StringGrid1.Cells[0,I]<>'1' then
        Continue;
      if ProcessedCount>0 then
        Utils.addToRichMemo('==================================================',RichMemo1,StatusBar1,clBlue);
      Inc(ProcessedCount);
      ArchivePath:=Utils.clearFilePath(StringGrid1.Cells[2,I]);
      ArchiveLabel:=StringGrid1.Cells[3,I];
      Utils.addToRichMemo('Archivo: '+ArchiveLabel,RichMemo1,StatusBar1,clBlue);
      Application.ProcessMessages;
      if not FileExists(ArchivePath) then
      begin
        Utils.addToRichMemo('Archivo no encontrado: '+ArchivePath,RichMemo1,StatusBar1,clRed);
        Continue;
      end;

      TempDir:=BuildArchiveTempDir(ArchivePath);
      AppDir:=BuildArchiveModuleName(ArchivePath);
      StartAt:=Now;
      SetStatusMessage('Chequeando '+ArchiveLabel+'...');
      ArchiveEntries.Clear;
      FilesToExtract.Clear;
      DirsToCreate.Clear;
      MarkerFilesToCreate.Clear;
      EntriesToDelete.Clear;
      NeedFullExtract:=False;
      NeedsRepack:=False;
      Reason:='';
      ErrorMsg:=Utils.ListZipEntries(ArchivePath,ArchiveEntries);
      if Trim(ErrorMsg).IsEmpty then
        ErrorMsg:=BuildArchiveSelectivePlan(AppDir,ArchiveEntries,FilesToExtract,DirsToCreate,MarkerFilesToCreate,EntriesToDelete,NeedFullExtract,NeedsRepack,Reason);
      EndAt:=Now;
      ElapsedMs:=MilliSecondsBetween(EndAt,StartAt);
      Utils.addToRichMemo('Chequeo ('+TimeToStr(StartAt)+' - '+TimeToStr(EndAt)+'): '+FormatElapsedMs(ElapsedMs),RichMemo1,StatusBar1,clBlue);
      if not Trim(ErrorMsg).IsEmpty then
      begin
        Utils.addToRichMemo('Error en chequeo: '+ErrorMsg,RichMemo1,StatusBar1,clRed);
        Continue;
      end;
      LogArchiveWebAppsRules(AppDir,ArchiveEntries);

      if (not NeedFullExtract) and (not NeedsRepack) and (FilesToExtract.Count=0) then
      begin
        Utils.addToRichMemo('Sin cambios efectivos en ['+ExtractFileName(ArchivePath)+'].',RichMemo1,StatusBar1,clBlue);
        Application.ProcessMessages;
        Continue;
      end;

      if NeedFullExtract then
      begin
        if NeedsRepack then
        begin
          Utils.addToRichMemo('Extracción completa: '+Reason,RichMemo1,StatusBar1,clBlue);
        end
        else
        begin
          Utils.addToRichMemo('Extracción completa sin reempaquetado: '+Reason,RichMemo1,StatusBar1,clBlue);
        end;
        StartAt:=Now;
        SetStatusMessage('Extrayendo completo '+ArchiveLabel+'...');
        ErrorMsg:=ExtractArchiveToTemp(ArchivePath,TempDir);
        EndAt:=Now;
        ElapsedMs:=MilliSecondsBetween(EndAt,StartAt);
      end
      else
      begin
        if NeedsRepack then
        begin
          Utils.addToRichMemo('Reempaquetado requerido: '+Reason,RichMemo1,StatusBar1,clBlue);
        end
        else
        Utils.addToRichMemo('Extracción selectiva requerida: '+Reason,RichMemo1,StatusBar1,clBlue);
        StartAt:=Now;
        SetStatusMessage('Extrayendo selectivo '+ArchiveLabel+'...');
        ErrorMsg:=ExtractArchiveSelectiveToTemp(ArchivePath,TempDir,FilesToExtract,DirsToCreate,MarkerFilesToCreate,EntriesToDelete);
        EndAt:=Now;
        ElapsedMs:=MilliSecondsBetween(EndAt,StartAt);
      end;
      if not Trim(ErrorMsg).IsEmpty then
      begin
        if NeedFullExtract then
          Utils.addToRichMemo('Extracción completa ('+TimeToStr(StartAt)+' - '+TimeToStr(EndAt)+'): '+FormatElapsedMs(ElapsedMs),RichMemo1,StatusBar1,clRed)
        else
          Utils.addToRichMemo('Extracción selectiva ('+TimeToStr(StartAt)+' - '+TimeToStr(EndAt)+'): '+FormatElapsedMs(ElapsedMs),RichMemo1,StatusBar1,clRed);
        Utils.addToRichMemo('Error al extraer: '+ErrorMsg,RichMemo1,StatusBar1,clRed);
        Continue;
      end;
      if NeedFullExtract then
        Utils.addToRichMemo('Extracción completa ('+TimeToStr(StartAt)+' - '+TimeToStr(EndAt)+'): '+FormatElapsedMs(ElapsedMs),RichMemo1,StatusBar1,clBlue)
      else
        Utils.addToRichMemo('Extracción selectiva ('+TimeToStr(StartAt)+' - '+TimeToStr(EndAt)+'): '+FormatElapsedMs(ElapsedMs),RichMemo1,StatusBar1,clBlue);
      Application.ProcessMessages;
      TempGrid.RowCount:=1;
      if FileExists(Utils.clearFilePath(TempDir+'WEB-INF\web.xml')) then
      begin
        NewRow:=TempGrid.RowCount;
        TempGrid.RowCount:=TempGrid.RowCount+1;
        TempGrid.Cells[0,NewRow]:='1';
        TempGrid.Cells[1,NewRow]:=StringGrid1.Cells[1,I];
        TempGrid.Cells[2,NewRow]:=TempDir;
        TempGrid.Cells[3,NewRow]:=ArchiveLabel;
        TempGrid.Cells[4,NewRow]:=AppDir;
        TempGrid.Cells[5,NewRow]:=StringGrid1.Cells[5,I];
        TempGrid.Cells[6,NewRow]:='';
        TempGrid.Cells[7,NewRow]:=Utils.clearFilePath(TempDir+'WEB-INF\web.xml');
        TempGrid.Cells[8,NewRow]:='';
        SetStatusMessage('Aplicando reglas WEBXML...');
        FdeFile.ProcesarWebXml(TempGrid,RichMemo1,TrayIcon1,StatusBar1);
      end;

      if not NeedsRepack then
      begin
        Utils.addToRichMemo('Sin cambios efectivos en ['+ExtractFileName(ArchivePath)+']; no se reempaqueta.',RichMemo1,StatusBar1,clBlue);
        Application.ProcessMessages;
        Continue;
      end;

      StartAt:=Now;
      Utils.addToRichMemo('Inicio reempaquetado ('+TimeToStr(StartAt)+') ['+ExtractFileName(ArchivePath)+']',RichMemo1,StatusBar1,clBlue);
      SetStatusMessage('Reempaquetando '+ExtractFileName(ArchivePath)+'...');
      ErrorMsg:=RepackTempToArchive(TempDir,ArchivePath);
      EndAt:=Now;
      ElapsedMs:=MilliSecondsBetween(EndAt,StartAt);
      if Trim(ErrorMsg).IsEmpty then
      begin
        Utils.addToRichMemo('Fin reempaquetado ('+TimeToStr(EndAt)+') ['+ExtractFileName(ArchivePath)+'] duración: '+FormatElapsedMs(ElapsedMs),RichMemo1,StatusBar1,clBlue);
        Utils.addToRichMemo('Archivo actualizado: '+ExtractFileName(ArchivePath),RichMemo1,StatusBar1,clBlue);
      end
      else
      begin
        Utils.addToRichMemo('Fin reempaquetado ('+TimeToStr(EndAt)+') ['+ExtractFileName(ArchivePath)+'] duración: '+FormatElapsedMs(ElapsedMs),RichMemo1,StatusBar1,clRed);
        Utils.addToRichMemo('Error al reempaquetar ['+ExtractFileName(ArchivePath)+']: '+ErrorMsg,RichMemo1,StatusBar1,clRed);
      end;
      Application.ProcessMessages;
    end;

    finally
      FdeFile.Free;
    end;

    if ProcessedCount=0 then
      ShowMessage('No hay archivos war/zip válidos para procesar.');
  finally
    EntriesToDelete.Free;
    MarkerFilesToCreate.Free;
    DirsToCreate.Free;
    FilesToExtract.Free;
    ArchiveEntries.Free;
    TempGrid.Free;
    if not varGlobales.ConservarTmpAlFinalizar then
    begin
      SetStatusMessage('Limpiando tmp...');
      ErrorMsg:=DeleteTempDirOnFinish();
      if not ErrorMsg.IsEmpty then
        Utils.addToRichMemo('Error al limpiar tmp al finalizar: '+ErrorMsg,RichMemo1,StatusBar1,clRed);
    end;
  end;
end;

procedure TForm1.ApplyScanModeUI();
begin
  if varGlobales.EnableWarZipMode then
  begin
    CheckBox10.Caption:='Eliminar *.war antes de generar nuevo war (solo en modo carpeta)';
    MinGenWar.Caption:='Al generar WAR (solo en modo carpeta)';
  end
  else
  begin
    CheckBox10.Caption:='Eliminar *.war antes de generar nuevo war';
    MinGenWar.Caption:='Al generar WAR';
  end;

  if IsArchiveScanMode() then
  begin
    ListFilterEdit1.TextHint:='(Filtro War/Zip)';
    StringGrid1.Hint:='Archivos .war/.zip (Doble click para ver en Explorador de Windows)';
    StringGrid1.Columns[3].ReadOnly:=True;
    ItemCopyWar.Caption:='Copiar archivo';
    BitBtn9.Enabled:=False;
    LblPdfReportIni.Visible:=False;
    Label5.Visible:=True;
    Label5.Caption:='mostrar actual';
    ItemVerArchivos.Visible:=False;
    Label29.Visible:=True;
    EditModuleName.Visible:=True;
    Label34.Visible:=False;
    EditDisplayName.Visible:=False;
    Label32.Visible:=True;
    EditClientCfg.Visible:=True;
    Label33.Visible:=True;
    Editwebxml.Visible:=True;
  end
  else
  begin
    ListFilterEdit1.TextHint:='(Filtro Carpeta)';
    StringGrid1.Hint:='Subdirectorios (Doble click para ver en Explorador de Windows )';
    StringGrid1.Columns[3].ReadOnly:=False;
    ItemCopyWar.Caption:='Copiar [.war]';
    BitBtn9.Enabled:=True;
    LblPdfReportIni.Visible:=True;
    Label5.Visible:=True;
    Label5.Caption:='ver web.xml';
    ItemVerArchivos.Visible:=True;
    Label29.Visible:=True;
    EditModuleName.Visible:=True;
    Label34.Visible:=True;
    EditDisplayName.Visible:=True;
    Label32.Visible:=True;
    EditClientCfg.Visible:=True;
    Label33.Visible:=True;
    Editwebxml.Visible:=True;
  end;
end;

procedure TForm1.linkClientCfgClick(Sender: TObject);
 var Clientcfg:String;
begin
  If StringGrid1.RowCount<2 Then exit;
  Clientcfg:=Utils.clearFilePath(StringGrid1.Rows[StringGrid1.Row][6]);
  If FileExistsUTF8(Clientcfg) Then
  ShellExecute(0,nil, PChar('explorer.exe'),Pchar('/select,'+'"'+Clientcfg+'"'),PChar(ExtractFilePath(Clientcfg)),1);
end;

procedure TForm1.linkFolderAppClick(Sender: TObject);
begin
  If StringGrid1.RowCount<2 Then exit;
  if IsArchiveScanMode() then
  begin
    if FileExistsUTF8(StringGrid1.Rows[StringGrid1.Row][2]) then
      ShellExecute(0,nil, PChar('explorer.exe'),Pchar('/select,'+'"'+StringGrid1.Rows[StringGrid1.Row][2]+'"'),PChar(ExtractFilePath(StringGrid1.Rows[StringGrid1.Row][2])),1);
    Exit;
  end;
  If DirectoryExistsUTF8(StringGrid1.Rows[StringGrid1.Row][2]) Then
  ShellExecute(0,nil, PChar('explorer.exe'),Pchar('/select,'+'"'+StringGrid1.Rows[StringGrid1.Row][2]+'"'),PChar(StringGrid1.Rows[StringGrid1.Row][2]),1);
end;

procedure TForm1.linkPDFReportClick(Sender: TObject);
  var PdfReport:String;
begin
  If StringGrid1.RowCount<2 Then exit;
  if IsArchiveScanMode() then
  begin
    ShowMessage('PDFReport.ini está dentro del archivo War/Zip y no se abre directamente.');
    Exit;
  end;
  PdfReport:=Utils.clearFilePath(StringGrid1.Rows[StringGrid1.Row][2]+'WEB-INF\PDFReport.ini');
  If FileExistsUTF8(PdfReport) Then
  ShellExecute(0,nil, PChar('explorer.exe'),Pchar('/select,'+'"'+PdfReport+'"'),PChar(ExtractFilePath(PdfReport)),1);

end;

procedure TForm1.linkwarClick(Sender: TObject);
var Files:TStringList;
begin
  If StringGrid1.RowCount<2 Then exit;
  if IsArchiveScanMode() then
  begin
    if FileExistsUTF8(StringGrid1.Rows[StringGrid1.Row][2]) then
      ShellExecute(0,nil, PChar('explorer.exe'),Pchar('/select,'+'"'+StringGrid1.Rows[StringGrid1.Row][2]+'"'),PChar(ExtractFilePath(StringGrid1.Rows[StringGrid1.Row][2])),1);
    Exit;
  end;
  Files:=TStringList.Create;
  FindAllFiles(Files,StringGrid1.Rows[StringGrid1.Row][2],'*.war',True);
  If Files.Count>0 Then
  ShellExecute(0,nil, PChar('explorer.exe'),Pchar('/select,'+'"'+Files[0]+'"'),PChar(ExtractFilePath(Files[0])),1);
  Files.Free;
end;

procedure TForm1.linkwebxmlClick(Sender: TObject);
var webxml:String;
begin
 If StringGrid1.RowCount<2 Then exit;
 webxml:=Utils.clearFilePath(StringGrid1.Rows[StringGrid1.Row][7]);
 If FileExistsUTF8(webxml) Then
 ShellExecute(0,nil, PChar('explorer.exe'),Pchar('/select,'+'"'+webxml+'"'),PChar(ExtractFilePath(webxml)),1);
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  EditModulo.Text:=ListBox1.GetSelectedText;
end;

procedure TForm1.ListBox2Click(Sender: TObject);
begin
  EditVersion.Text:=ListBox2.GetSelectedText;
end;

procedure TForm1.ListFilterEdit2Change(Sender: TObject);
  var myXml:TMyXml;
begin
 If Trim(Edit6.Text).IsEmpty then Exit;
 myxml:= tmyXml.create(Edit6.Text);
 If myXml.Validaxml() then myxml.load2Grids(Memo1,StringGrid4,StringGrid5,ListFilterEdit2.Text) else
  begin
      myxml.ClearAll(Memo1,StringGrid4,StringGrid5);
      ShowMessage('Error en Archivo FDE / Formato incorrecto');
  end;
  Myxml.Free;
  haycambios.Checked:=False;
  StringGrid4.AutoSizeColumn(1);
  ListFilterEdit2.RestoreSelection;
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
  //Titulo
  haycambios.Checked:=True;
end;

procedure TForm1.MenuItem11Click(Sender: TObject);
begin
  Utils.goNotebookPage(Principal,Notebook1);
end;

procedure TForm1.MenuItem13Click(Sender: TObject);
begin
  varGlobales.delAPP(POPAPP);
  RefreshAPPS();
end;

procedure TForm1.MenuItem14Click(Sender: TObject);
begin
  Utils.goNotebookPage(RunFDE,Notebook1);
end;

procedure TForm1.MenuItem18Click(Sender: TObject);
begin
  ShellExecute(0,nil, PChar('explorer.exe'),Pchar('"https://github.com/moralek/WebUtils/releases"'),PChar('%WINDIR%'),1);
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
   Utils.goNotebookPage(EditScript,Notebook1);
end;

procedure TForm1.ItemAjustarClick(Sender: TObject);
begin
  StringGrid1.AutoSizeColumn(StringGrid1.Col);
  If StringGrid1.ColWidths[0]<=1 Then StringGrid1.AutoSizeColumn(0);
  If StringGrid1.ColWidths[1]<=1 Then StringGrid1.AutoSizeColumn(1);
  If StringGrid1.ColWidths[3]<=1 Then StringGrid1.AutoSizeColumn(3);
end;

procedure TForm1.MenuItem23Click(Sender: TObject);
var NombreAnterior,FileName,NombreNuevo:String;
begin
  FileName:=varGlobales.getApp(POPAPP);
  If Trim(Filename).IsEmpty Then Exit;
  NombreAnterior:=varGlobales.getAPPNombre(POPAPP);
  If Trim(NombreAnterior).IsEmpty then NombreAnterior:=ExtractFileNameOnly(FileName);
  NombreNuevo := InputBox (Form1.Caption,'Ingresa un Nombre para la APP',
            NombreAnterior);
  If Trim(NombreNuevo).IsEmpty then
     Begin
       NombreNuevo:=ExtractFileNameOnly(FileName);
       varGlobales.getApp(POPAPP);
       varGlobales.setAPPNombre(POPAPP,NombreNuevo)
     end
    else
        varGlobales.setAPPNombre(POPAPP,NombreNuevo);
  RefreshAPPS();
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  Utils.goNotebookPage(About,Notebook1);
end;

procedure TForm1.MenuTrayCloseClick(Sender: TObject);
begin
  TrayIcon1.Hide;
  Self.Close;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  Utils.goNotebookPage(Opciones,Notebook1);
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  Utils.MostrarCarpeta(ExtractFilePath(Application.ExeName));
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  RefreshAPPS();
end;

 //PDFReport.ini
procedure TForm1.MenuItem7Click(Sender: TObject);
  var NombreAnterior,FileName,NombreNuevo:String;
begin
  FileName:=varGlobales.getApp(POPAPP);
  If Trim(Filename).IsEmpty Then Exit;
  NombreAnterior:=varGlobales.getAPPPar(POPAPP);
  NombreNuevo := InputBox (Form1.Caption,'Ingresa PARAMETROS para la APP', NombreAnterior);
  varGlobales.setAPPPar(POPAPP,NombreNuevo);
  RefreshAPPS();
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
  If OpenDialog2.Execute Then
  Begin
    varGlobales.setImgApp(POPAPP,OpenDialog2.FileName);
    RefreshAPPS();
  end;
end;

procedure TForm1.MinAppRunChange(Sender: TObject);
begin
  varGlobales.TrayRunAPP:=MinAppRun.Checked;
end;

procedure TForm1.MinGenWarChange(Sender: TObject);
begin
    varGlobales.TrayGenWar:=MinGenWar.Checked;
end;

procedure TForm1.MinScriptFDEChange(Sender: TObject);
begin
  varGlobales.TrayScriptFDE:=MinScriptFDE.Checked;
end;

procedure TForm1.FormWindowStateChange(Sender: TObject);
begin
  if ToTray.Checked then
  begin
   If (Form1.WindowState = wsMinimized) then
     MinimizeToTray()
   end;
end;

procedure TForm1.ItemCheck_UncheckClick(Sender: TObject);
begin
  If StringGrid1.Rows[StringGrid1.Row][0] = '1' Then
     StringGrid1.Cells[0,StringGrid1.Row]:='0'
  else
      StringGrid1.Cells[0,StringGrid1.Row]:='1';
end;

procedure TForm1.ItemVerWinClick(Sender: TObject);
begin
  if IsArchiveScanMode() then
    Utils.MostrarCarpeta(ExtractFilePath(StringGrid1.Rows[StringGrid1.Row][2]))
  else
    Utils.MostrarCarpeta(StringGrid1.Rows[StringGrid1.Row][2]);
end;

procedure TForm1.StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
row, col: LongInt;
war:String;
begin
  stringgrid1.MouseToCell( X,Y, col, row );
  stringgrid1.Row := row;
  StringGrid1.Col := col;
  if button = mbRight then
  Begin
   if IsArchiveScanMode() then
     war:=StringGrid1.Rows[StringGrid1.Row][2]
   else
     war:=Utils.clearDirPath(StringGrid1.Rows[StringGrid1.Row][2])+StringGrid1.Rows[StringGrid1.Row][3]+'.war';
   If FileExists(war) Then ItemCopyWar.Visible:=True else ItemCopyWar.Visible:=False;
   ItemCopyWar.Caption:='Copiar ['+StringGrid1.Rows[row][3]+']';
   ItemVerArchivos.Visible:=not IsArchiveScanMode();
   popupmenu1.Popup;
  end;
end;

procedure TForm1.StringGrid1Selection(Sender: TObject; aCol, aRow: Integer);
begin
  ChangeStringGrid1();
end;

Procedure TForm1.ChangeStringGrid1();
var aRow:Integer;
begin
  if StringGrid1.RowCount<2 then Exit;
  aRow:=StringGrid1.Row;
  if (aRow<1) or (aRow>=StringGrid1.RowCount) then Exit;
  RichMemo3.Text:=StringGrid1.Rows[aRow][5];
  if ComboBoxDsCopyFrom.Items.Count>1 then
    ComboBoxDsCopyFrom.Items[1]:='Actual:['+StringGrid1.Rows[aRow][3]+']';
  Label18.Caption:='['+StringGrid1.Rows[aRow][3]+']';
  if IsArchiveScanMode() then
  begin
    Label9.Caption:='archivo: ['+StringGrid1.Rows[aRow][3]+']';
    EditFolderApp.Text:='webapps';
    EditFolderAppChange(EditFolderApp);
    ResetArchiveDataSourcePreview();
  end
  else
  begin
    Label9.Caption:='display-name: ['+StringGrid1.Rows[aRow][3]+']';
    Utils.getDataSource(Utils.clearFilePath(StringGrid1.Rows[aRow][7]),Utils.clearFilePath(StringGrid1.Rows[aRow][6]),StringGrid1.Rows[aRow][8],StringGrid1.Rows[aRow][4],EditEJJdbcDatasource,EditEJResRefName);
    EditFolderApp.Text:=StringGrid1.Rows[aRow][1];
  end;
end;

{procedure TForm1.StringGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
   Col, Row: Integer;
begin
  StringGrid1.MouseToCell(X, Y, Col, Row);
  StringGrid1.Cursor:=crDefault;
  If (Row>0) and (col=5) then StringGrid1.Cursor:=crHandPoint;
  //StringGrid1.Hint := IntToStr(Col) + '   ' + IntToStr(Row);
end; }

procedure TForm1.StringGrid4SelectEditor(Sender: TObject; aCol, aRow: Integer;
  var Editor: TWinControl);
begin
  if (Editor is TCustomComboBox) then
    with Editor as TCustomComboBox do begin
      if  (aCol=1) then Style := csDropDownList Else Style:=csDropDown;
  end;
end;

procedure TForm1.StringGrid4SetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: string);
begin
  haycambios.Checked:=True;
end;

procedure TForm1.StringGrid5EditingDone(Sender: TObject);
begin
  If StringGrid5.Col = 5 Then
  If Trim(StringGrid5.Cells[StringGrid5.Col, StringGrid5.Row])='' Then StringGrid5.Cells[StringGrid5.Col, StringGrid5.Row]:='0';
end;

procedure TForm1.StringGrid5KeyPress(Sender: TObject; var Key: char);
begin
 if StringGrid5.Col=5 then if not( key in ['0'..'9',#8]) then key := #0;
end;

procedure TForm1.StringGrid5SelectEditor(Sender: TObject; aCol, aRow: Integer;
  var Editor: TWinControl);
begin
  if (Editor is TCustomComboBox) then
    with Editor as TCustomComboBox do begin
      if  (aCol=3) or (aCol=4) or (aCol=7) then Style := csDropDownList Else Style:=csDropDown;
  end;
end;

procedure TForm1.StringGrid5SetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: string);
var limite:Integer;
begin
  haycambios.Checked:=True;
  If (StringGrid5.Col=5) then
  begin
   limite:=4;
   If StringGrid5.Cells[StringGrid5.Col, StringGrid5.Row].Length>limite then
      StringGrid5.Cells[StringGrid5.Col, StringGrid5.Row]:=StringGrid5.Cells[StringGrid5.Col, StringGrid5.Row].Substring(0,limite);
  end;
end;

procedure TForm1.TabSheet3Show(Sender: TObject);
begin
   Label16.Caption:=Utils.versionStr(EditModulo.Text,EditVersion.Text,EditFechaVersion.Text);
   if IsArchiveScanMode() then
     Label9.Caption:='archivo: ['+StringGrid1.Rows[StringGrid1.Row][3]+']'
   else
     Label9.Caption:='display-name: ['+StringGrid1.Rows[StringGrid1.Row][3]+']';
   RichMemo3.Text:=StringGrid1.Rows[StringGrid1.Row][5];
end;

procedure TForm1.TabSheet4Show(Sender: TObject);
Var X:Integer;
begin
  if ComboBoxDsCopyFrom.Items.Count>1 then
    ComboBoxDsCopyFrom.Items[1]:='Actual:['+StringGrid1.Rows[StringGrid1.Row][3]+']';
  Label18.Caption:='['+StringGrid1.Rows[StringGrid1.Row][3]+']';
  if IsArchiveScanMode() then
  begin
    ResetArchiveDataSourcePreview();
  end
  else
    Utils.getDataSource(Utils.clearFilePath(StringGrid1.Rows[StringGrid1.Row][7]),StringGrid1.Rows[StringGrid1.Row][6],StringGrid1.Rows[StringGrid1.Row][8],StringGrid1.Rows[StringGrid1.Row][4],EditEJJdbcDatasource,EditEJResRefName);
  if (varGlobales.OcultaEjemplosDS) then x:=1 else x:=4;
  BitBtn28.Enabled:=(ComboBoxDsCopyFrom.ItemIndex>X);
end;

procedure TForm1.TabSheet6Show(Sender: TObject);
begin
  ChangeStringGrid1();
end;


Procedure TForm1.MinimizeToTray();
begin
     TrayIcon1.Show;
     Form1.WindowState:=wsMinimized;
     Form1.ShowInTaskBar := stNever;
     Form1.Hide;
end;

Procedure TForm1.ActivateMainWindow();
begin
     Form1.WindowState:=wsNormal;
     Form1.ShowInTaskBar:=stDefault;
     Form1.Show;
     Application.Restore;
     LCLIntf.ShowWindow(Form1.Handle, SW_RESTORE);
     Form1.BringToFront;
     LCLIntf.SetWindowPos(Form1.Handle, HWND_TOPMOST, 0, 0, 0, 0,
       SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE);
     LCLIntf.SetWindowPos(Form1.Handle, HWND_NOTOPMOST, 0, 0, 0, 0,
       SWP_NOMOVE or SWP_NOSIZE or SWP_SHOWWINDOW);
     LCLIntf.SetForegroundWindow(Form1.Handle);
end;

Procedure TForm1.RestoreFromTray();
begin
     ActivateMainWindow();
end;
procedure TForm1.ToTrayChange(Sender: TObject);
begin
  varGlobales.TrayMinimize:=ToTray.Checked;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
   Utils.DelAllRowsGrid(StringGrid1);
   If DirectoryExists(Utils.clearDirPath(Edit1.Text)) then
   begin
       varGlobales.WebAppsDir:=Edit1.Text;
       Refrescar();
   end;
   {Check}

end;

procedure TForm1.Label11Click(Sender: TObject);
begin
  Utils.goNotebookPage(RunFDE,Notebook1);
end;

procedure TForm1.Label1Click(Sender: TObject);
begin
  Utils.MostrarCarpeta(Edit1.Text);
end;

procedure TForm1.Label6Click(Sender: TObject);
var Resp:Integer;
begin
  If (haycambios.Checked) and (Edit6.Text<>Edit2.Text) then
  begin
     Resp:=Application.MessageBox('Esta acción DESCARTARÁ los cambios que existen en el editor'+#13#10+' ¿Desea continuar?','ADVERTENCIA',(MB_ICONEXCLAMATION+MB_OKCANCEL));
     If (Resp=IDCANCEL) Then Exit;
  end;
  Utils.goNotebookPage(EditScript,Notebook1);
  Edit6.Text:=Edit2.Text;
end;

procedure TForm1.ListFilterEdit1Change(Sender: TObject);
begin
  Utils.FilDirGrid(Utils.clearDirPath(varGlobales.WebAppsDir),
                       ListFilterEdit1.Text,varGlobales.ScanMode,StringGrid1);
  ChangeStringGrid1();
  //StringGrid1.AutoSizeColumn(1);
end;

procedure TForm1.menuBtnClick(Sender: TObject);
begin
  PopupMenu1.PopUp;
end;

procedure TForm1.MenuItem16Click(Sender: TObject);
begin
  MinimizeToTray();
end;

procedure TForm1.MenuItem17Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TForm1.MenuItem9Click(Sender: TObject);
begin
  varGlobales.delAPP(POPAPP+'IMG');
  RefreshAPPS();
end;

procedure TForm1.RunFDEBeforeShow(ASender: TObject; ANewPage: TPage;
  ANewIndex: Integer);
begin
  StatusBar1.SimpleText:='';
  Form1.Caption:=LblProductName.Caption+' '+LblProductVersion.Caption+' [RUN SCRIPT]';
  varGlobales.PageIndex:=(Notebook1.PageIndex);
end;

procedure TForm1.RefreshAPPS();
begin

  MYApp.LoadApps(@MenuItem11Click,MenuItem5,@MenuItem17Click,TrayPopMenu,BtnApp1,ImgApp1,BtnApp2,ImgApp2,BtnApp3,ImgApp3,BtnApp4,ImgApp4,BtnApp5,ImgApp5,BtnApp6,ImgApp6,BtnApp7,ImgApp7,BtnApp8,ImgApp8,BtnApp9,ImgApp9,BtnApp10,ImgApp10,
                 BtnApp11,ImgApp11,BtnApp12,ImgApp12,BtnApp13,ImgApp13,BtnApp14,ImgApp14,BtnApp15,ImgApp15,BtnApp16,ImgApp16,BtnApp17,ImgApp17,BtnApp18,ImgApp18,BtnApp19,ImgApp19,BtnApp20,ImgApp20);
end;

procedure TForm1.AboutBeforeShow(ASender: TObject; ANewPage: TPage;
  ANewIndex: Integer);
begin
  StatusBar1.SimpleText:='';
  Form1.Caption:=LblProductName.Caption+' '+LblProductVersion.Caption+' [ACERCA DE...]';
end;

procedure TForm1.OpcionesBeforeShow(ASender: TObject; ANewPage: TPage;
  ANewIndex: Integer);
begin
  StatusBar1.SimpleText:='';
  Form1.Caption:=LblProductName.Caption+' '+LblProductVersion.Caption+' [OPCIONES]';
  varGlobales.PageIndex:=(Notebook1.PageIndex);
end;

procedure TForm1.PrincipalBeforeShow(ASender: TObject; ANewPage: TPage;
  ANewIndex: Integer);
begin
  StatusBar1.SimpleText:='';
  Form1.Caption:=LblProductName.Caption+' '+LblProductVersion.Caption+' [RUN]';
  varGlobales.PageIndex:=(Notebook1.PageIndex);
end;

procedure TForm1.RichMemo3Change(Sender: TObject);
begin
  RichMemo3.TextHint:=RichMemo3.Text;
  Label9.Hint:=RichMemo3.Text;
end;

procedure TForm1.Splitter2CanOffset(Sender: TObject; var NewOffset: Integer;
  var Accept: Boolean);
begin
  If (Splitter2.Top) > (Form1.Height-200) then Splitter2.Top:=(Form1.Height-200);
end;

procedure TForm1.StatusBar1Click(Sender: TObject);
begin
  Splitter2.Top:=(Form1.Height-200);
end;

procedure TForm1.StringGrid1DrawCell(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
var
  pdfreport:String;
  Alto,Ancho,Posicion, posalto, col_PDF,col_Ruta: Integer;
begin
  col_PDF:=9;
  col_Ruta:=2;
  //REF_PDFREPORT==========================
  Ancho := StringGrid1.ColWidths[col_PDF] div 2;
  Alto :=StringGrid1.RowHeights[1] div 2;
  Posicion := Ancho - (Image1.Picture.Width div 2);
  posalto := Alto - (Image1.Picture.Height div 2);
  if (ACol = col_PDF) and (aRow > 0) and IsArchiveScanMode() then
  begin
    with StringGrid1.Canvas do
    begin
      FillRect(aRect);
      if StringGrid1.Rows[aRow][col_PDF]='1' then
        Draw(aRect.Left+Posicion, aRect.Top+posalto, Image1.Picture.Graphic);
    end;
    Exit;
  end;

  pdfreport:=Utils.clearFilePath(StringGrid1.Rows[aRow][col_Ruta]+'WEB-INF\PDFReport.ini');
  If FileExists(pdfreport) Then
  Begin
       if (ACol = col_PDF) and (aRow > 0) then
       with StringGrid1.Canvas do
       Draw(aRect.Left+Posicion, aRect.Top+posalto, Image1.Picture.Graphic);
  end;
  //===================================
end;

procedure TForm1.AboutExit(Sender: TObject);
begin
   Timer1.Enabled:=False;
   Label7.Caption :='';
end;

procedure TForm1.StringGrid1DblClick(Sender: TObject);
var pdfreport:String;
  col_PDF:Integer;
begin
  col_PDF:=6;
  //REF_PDFREPORT
  If StringGrid1.Col = col_PDF Then
  Begin
   if IsArchiveScanMode() then
   begin
     if StringGrid1.Rows[StringGrid1.Row][col_PDF]='1' then
       showMessage('PDFReport.ini está dentro del archivo War/Zip y no se abre directamente.')
     else
       showMessage('PdfReport.ini no existe');
     Exit;
   end;
   PdfReport:=Utils.clearFilePath(StringGrid1.Rows[StringGrid1.Row][2]+'WEB-INF\PDFReport.ini');
   If FileExists(PdfReport) then ShellExecute(0,nil, PChar(PdfReport),PChar(PdfReport),nil,1) else showMessage('PdfReport.ini no existe');
  end
  else
 Utils.MostrarCarpeta(StringGrid1.Rows[StringGrid1.Row][2]);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  txt:String;
begin
  txt:=Label7.Caption;
  Label7.Caption:= Copy(txt, 2, length(txt)-1) + Copy(txt,1,1)
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  if not LblAdminRequired.Visible then
  begin
    Timer2.Enabled:=False;
    Exit;
  end;

  if LblAdminRequired.Color=RGBToColor(176,32,32) then
  begin
    LblAdminRequired.Color:=RGBToColor(255,242,242);
    LblAdminRequired.Font.Color:=RGBToColor(140,24,24);
  end
  else
  begin
    LblAdminRequired.Color:=RGBToColor(176,32,32);
    LblAdminRequired.Font.Color:=clWhite;
  end;
end;

procedure TForm1.TrayIcon1Click(Sender: TObject);
begin
 RestoreFromTray();
end;

procedure TForm1.UniqueInstance1OtherInstance(Sender: TObject;
  ParamCount: Integer; const Parameters: array of String);
begin
      If TrayIcon1.Hide then TrayIcon1.Show;
      ActivateMainWindow();
 //  ShowMessage('Ya existe una instancia de FDE web Utils ejecutándose.');
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Utils.MostrarCarpeta(Edit2.Text);
end;

procedure TForm1.Iniciar();
var MensajeError:String;
begin
    If (not FileExists(Edit2.Text)) then
        MensajeError:='No se encuentra archivo .fde';
    If (Not DirectoryExists(Utils.clearDirPath(Edit1.Text))) then
       MensajeError:=Label1.Caption+' No Valido.';
    If (Not FileExists(Utils.clearFilePath(Edit2.Text))) then
       MensajeError:=Label2.Caption+' No Valido';
    If ((Trim(Edit1.Text).IsEmpty) or (Trim(Edit2.Text).IsEmpty)) then
        MensajeError:='Existen Campos sin Completar.';
    If (Trim(MensajeError).IsEmpty) Then
       Procesar()
    else
       ShowMessage(MensajeError);
end;

procedure TForm1.Procesar();
var fdefile:Tfdefile;
begin
  if IsArchiveScanMode() then
  begin
    ProcesarWarZip();
    Exit;
  end;
  //INICIO
  varGlobales.WebAppsDir:=Edit1.Text;
  varGlobales.FdeFilePath:=Edit2.Text;
  fdefile:=TFdeFile.create(Edit2.Text);
  If MinScriptFDE.Checked Then MinimizeToTray();
  FdeFile.Procesar(StringGrid1,RichMemo1,TrayIcon1,StatusBar1);
end;
end.

