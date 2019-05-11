unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  RichMemo, ListFilterEdit, RTTICtrls, UGlobales, UMyUtils, UfdeFile, LCLIntf,
  Buttons, ExtCtrls, Menus, Grids, LCLType, ComCtrls, IniPropStorage, EditBtn,
  ActnList, UMyApps, LazFileUtils, SynEdit, SynHighlighterXML, UMyGridString,
  UniqueInstance, atshapeline, CalendarLite, ShellApi, UMyXml, lazutf8, UMyWin,
  UMyRCS,
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
    ComboBox1: TComboBox;
    ComboBoxDsCopyFrom: TComboBox;
    EditDisplayName: TEdit;
    Editwebxml: TEdit;
    EditFolderApp: TEdit;
    EditModuleName: TEdit;
    EditClientCfg: TEdit;
    EditWar: TEdit;
    EditPrueba2: TEdit;
    EditPRUEBA: TEdit;
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
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    linkwebxml: TLabel;
    linkFolderApp: TLabel;
    linkClientCfg: TLabel;
    linkwar: TLabel;
    LblPdfReportIni: TLabel;
    LblFullInfo: TLabel;
    LblLinkUpdate: TLabel;
    linkPDFReport: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListFilterEdit2: TListFilterEdit;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
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
    GroupBox6: TGroupBox;
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
    MenuItem15: TMenuItem;
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
    ItemSelNada: TMenuItem;
    ItemInvertirSel: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem2: TMenuItem;
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
    TabSheet5: TTabSheet;
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
    procedure Button2Click(Sender: TObject);
    procedure CalendarLite1DateChange(Sender: TObject);
    procedure CheckBox10Change(Sender: TObject);
    procedure CheckBox11Change(Sender: TObject);
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
    procedure ItemCopyRutaClick(Sender: TObject);
    procedure ItemCopyWarClick(Sender: TObject);
    procedure ItemInvertirSelClick(Sender: TObject);
    procedure ItemPDFReportIniClick(Sender: TObject);
    procedure ItemSelNadaClick(Sender: TObject);
    procedure ItemSelTodoClick(Sender: TObject);
    procedure ItemWebXmlClick(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure Label22Click(Sender: TObject);
    procedure Label23Click(Sender: TObject);
    procedure Label24Click(Sender: TObject);
    procedure Label25Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure LblPdfReportIniClick(Sender: TObject);
    procedure LblLinkUpdateClick(Sender: TObject);
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
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure ItemAjustarClick(Sender: TObject);
    procedure MenuItem23Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
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
    procedure TrayIcon1Click(Sender: TObject);
    procedure UniqueInstance1OtherInstance(Sender: TObject;
      ParamCount: Integer; const Parameters: array of String);
  private
    Procedure HandleApplicationActivate(Sender: TObject);
    procedure Iniciar();
    procedure Procesar();
    procedure Refrescar();
    Procedure MinimizeToTray();
    Procedure RestoreFromTray();
    procedure RefreshAPPS();
    Procedure ChangeStringGrid1();
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
begin
  Label16.Caption:=Utils.versionStr(EditModulo.Text,EditVersion.Text,EditFechaVersion.Text);
  Application.AddOnActivateHandler(@HandleApplicationActivate);
  If FileExists(ExtractFilePath(ParamStr(0))+'DelFind_UPD.exe') then DeleteFile(ExtractFilePath(ParamStr(0))+'DelFind_UPD.exe');
  If FileExists(ExtractFilePath(ParamStr(0))+'libeay32.dll') then DeleteFile(ExtractFilePath(ParamStr(0))+'libeay32.dll');
  If FileExists(ExtractFilePath(ParamStr(0))+'ssleay32.dll') then DeleteFile(ExtractFilePath(ParamStr(0))+'ssleay32.dll');
  //TrayIcon1.Hide;
  FileVerInfo:=TFileVersionInfo.Create(nil);
  If  TrayIcon1.Hide then TrayIcon1.Show;
  try
    FileVerInfo.ReadFileInfo;
    LblProductName.Caption:=FileVerInfo.VersionStrings.Values['ProductName'];
    LblProductVersion.Caption:='Ver.'+FileVerInfo.VersionStrings.Values['ProductVersion'];
    LblOriginalFilename.Caption:=FileVerInfo.VersionStrings.Values['OriginalFilename'];
    LblLinkUpdate.Caption:='Ver si existe una nueva versión';
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
  MenuItem2.Visible:=(Not(Utils.isElevated()));
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
  ComboBoxDsCopyFrom.ItemIndex:=1;
  EditJdbcDatasource.Text:=varGlobales.DSJdbcDataSource;
  EditResRefName.Text:=varGlobales.DSResRefName;
  //INFO
  ChangeStringGrid1();
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
  Utils.updDataSource(StringGrid1);
  Utils.getDataSource(Utils.clearFilePath(StringGrid1.Rows[StringGrid1.Row][7]),StringGrid1.Rows[StringGrid1.Row][6],StringGrid1.Rows[StringGrid1.Row][8],StringGrid1.Rows[StringGrid1.Row][4],EditEJJdbcDatasource,EditEJResRefName);
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
  Utils.applyDataSource(EditJdbcDatasource,EditResRefName,ComboBoxDsCopyFrom.ItemIndex,EditEJJdbcDatasource.Text,EditEJResRefName.Text);
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
  Utils.ProcesaPDFReport(StringGrid1, CheckBox1.Checked,EDRutaFonts.Text,Memo2.Text);
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
var Version:String;
  DirCount,i, Resp:Integer;
  myxml:TMyXml;
  isok:Boolean;
begin
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
var Gridds:TMyGridString;
   //JDBC_DATASOURCE,RES_REF_NAME:String;
begin
Gridds:=TMyGridString.Create;
//ShowMessage(Gridds.getSelectedValueStringGrid1(StringGrid1,StringGrid1.get));
Gridds.Free;

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

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
  varGlobales.OcultarDirROOT:=CheckBox1.Checked;
    Utils.FilDirGrid(Utils.clearDirPath(varGlobales.WebAppsDir),
                       ListFilterEdit1.Text,StringGrid1);
//  StringGrid1.AutoSizeColumn(3);
end;

procedure Tform1.Refrescar();
begin
  Utils.FilDirGrid(Utils.clearDirPath(varGlobales.WebAppsDir),
  ListFilterEdit1.Text,StringGrid1);
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

procedure TForm1.ComboBoxDsCopyFromChange(Sender: TObject);
begin

end;

procedure TForm1.Edit2Change(Sender: TObject);
var myxml:TMyXml;
begin
  try
  MyXml:=TMyXml.create(Edit2.Text);
  Label6.Visible:=MyXml.Validaxml();
  finally
  Myxml.Free;
  end;
end;

procedure TForm1.EditFolderAppChange(Sender: TObject);
var aRow:Integer;
  Pdfreportini,clientcfg,webxml:String;
  Files:TStringList;
begin

  aRow:=StringGrid1.Row;
  EditDisplayName.Text:=StringGrid1.Rows[aRow][5];
  EditModuleName.Text:=StringGrid1.Rows[aRow][4];
  //WAR;
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
end;

procedure TForm1.EditDSResAuthChange(Sender: TObject);
begin
  varGlobales.DSResAuth:=EditDSResAuth.Text;
end;

procedure TForm1.EditDSRestypeChange(Sender: TObject);
begin
  varGlobales.DSResType:=EditDSRestype.Text;
end;

procedure TForm1.EditDSUseJdbcDataSourceChange(Sender: TObject);
begin
  varGlobales.DSUseJdbcDatasource:=StrToInt(EditDSUseJdbcDataSource.Text);
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
begin
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

procedure TForm1.ItemCopyRutaClick(Sender: TObject);
var path, filename:String;
begin
  Utils.ClipboardCopy(Utils.clearDirPath(StringGrid1.Rows[StringGrid1.Row][2]));
end;

procedure TForm1.ItemCopyWarClick(Sender: TObject);
var path:String;
begin
  path:= Utils.clearDirPath(StringGrid1.Rows[StringGrid1.Row][2])+StringGrid1.Rows[StringGrid1.Row][3]+'.war';
  if FileExists(path) then
  begin
   Utils.FileToClipboard(path)
  end else
  ShowMessage('NO EXISTE ARCHIVO ['+StringGrid1.Rows[StringGrid1.Row][3]+'.war]');
end;

procedure TForm1.ItemInvertirSelClick(Sender: TObject);
begin
   Utils.InvertStringGrid(StringGrid1);
end;

procedure TForm1.ItemPDFReportIniClick(Sender: TObject);
var filePDF:String;
begin
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
  dir:=Utils.clearDirPath(StringGrid1.Rows[StringGrid1.Row][2])+'WEB-INF\web.xml';
  If FileExists(dir) then ShellExecute(0,nil, PChar(dir),PChar(dir),nil,1) else showMessage('No se Encuentra web.xml');
end;

procedure TForm1.LblPdfReportIniClick(Sender: TObject);
var PdfReport:String;
begin
  If StringGrid1.RowCount<2 Then exit;
  PdfReport:=Utils.clearFilePath(StringGrid1.Rows[StringGrid1.Row][2]+'WEB-INF\PDFReport.ini');
  If FileExists(PdfReport) then ShellExecute(0,nil, PChar(PdfReport),PChar(PdfReport),nil,1) else showMessage('No se Encuentra PdfReport.ini');
end;

procedure TForm1.LblLinkUpdateClick(Sender: TObject);
begin
  ShellExecute(0,nil, PChar('explorer.exe'),Pchar('"https://www.evernote.com/shard/s201/sh/4e60e820-8eac-4134-a146-841c94d76d10/89c888a93ea73a36"'),PChar('%WINDIR%'),1);
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
  If DirectoryExistsUTF8(StringGrid1.Rows[StringGrid1.Row][2]) Then
  ShellExecute(0,nil, PChar('explorer.exe'),Pchar('/select,'+'"'+StringGrid1.Rows[StringGrid1.Row][2]+'"'),PChar(StringGrid1.Rows[StringGrid1.Row][2]),1);
end;

procedure TForm1.linkPDFReportClick(Sender: TObject);
  var PdfReport:String;
begin
  If StringGrid1.RowCount<2 Then exit;
  PdfReport:=Utils.clearFilePath(StringGrid1.Rows[StringGrid1.Row][2]+'WEB-INF\PDFReport.ini');
  If FileExistsUTF8(PdfReport) Then
  ShellExecute(0,nil, PChar('explorer.exe'),Pchar('/select,'+'"'+PdfReport+'"'),PChar(ExtractFilePath(PdfReport)),1);

end;

procedure TForm1.linkwarClick(Sender: TObject);
var Files:TStringList;
begin
  If StringGrid1.RowCount<2 Then exit;
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

procedure TForm1.MenuItem15Click(Sender: TObject);
var RCS:TMyRCS;
params,filepath,Dll1,Dll2:String;
begin
  RCS:=TMyRCS.Create;
  filePath:=RCS.getRCS(RCS.DelFind_UPD_exe);
  Dll1:=RCS.getRCS(RCS.SSLEAY32_DLL);
  Dll2:=RCS.getRCS(RCS.LIBEAY32_DLL);
  RCS.Free;
  params:= '"'+ParamStr(0)+'" ' + varGlobales.ProductVersion +' ' + varGlobales.IniUpdate;
  Application.Terminate;
  if ShellExecute(0,nil, PChar(filePath),PChar(params),PChar(ExtractFilePath(ParamStr(0))),1) =0 then;

  //Utils.RunAsAdmin(filePath,params);

end;

procedure TForm1.MenuItem18Click(Sender: TObject);
begin
  ShellExecute(0,nil, PChar('explorer.exe'),Pchar('"https://www.evernote.com/shard/s201/sh/4e60e820-8eac-4134-a146-841c94d76d10/89c888a93ea73a36"'),PChar('%WINDIR%'),1);
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

procedure TForm1.MenuItem2Click(Sender: TObject);
var  tipo: TMsgDlgType;
     botones: TMsgDlgButtons;
begin
 tipo := mtWarning;
 botones:= [mbOK];
 MessageDlg ('Advertencia', 'Recuerda: Ejecutar como ADMINISTRADOR', tipo, botones,0);
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
   war:= Utils.clearDirPath(StringGrid1.Rows[StringGrid1.Row][2])+StringGrid1.Rows[StringGrid1.Row][3]+'.war';
   If FileExists(war) Then ItemCopyWar.Visible:=True else ItemCopyWar.Visible:=False;
   ItemCopyWar.Caption:='Copiar ['+StringGrid1.Rows[row][3]+'.war]';
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
  aRow:=StringGrid1.Row;
  RichMemo3.Text:=StringGrid1.Rows[aRow][5];
  Label9.Caption:='display-name: ['+StringGrid1.Rows[aRow][3]+']';
  ComboBoxDsCopyFrom.Items[1]:='Actual:['+StringGrid1.Rows[aRow][3]+']';
  Label18.Caption:='['+StringGrid1.Rows[aRow][3]+']';
  Utils.getDataSource(Utils.clearFilePath(StringGrid1.Rows[aRow][7]),Utils.clearFilePath(StringGrid1.Rows[aRow][6]),StringGrid1.Rows[aRow][8],StringGrid1.Rows[aRow][4],EditEJJdbcDatasource,EditEJResRefName);
  EditFolderApp.Text:=StringGrid1.Rows[aRow][1];
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
   Label9.Caption:='display-name: ['+StringGrid1.Rows[StringGrid1.Row][3]+']';
   RichMemo3.Text:=StringGrid1.Rows[StringGrid1.Row][5];
end;

procedure TForm1.TabSheet4Show(Sender: TObject);
begin
  ComboBoxDsCopyFrom.Items[1]:='Actual:['+StringGrid1.Rows[StringGrid1.Row][3]+']';
  Label18.Caption:='['+StringGrid1.Rows[StringGrid1.Row][3]+']';
  Utils.getDataSource(Utils.clearFilePath(StringGrid1.Rows[StringGrid1.Row][7]),StringGrid1.Rows[StringGrid1.Row][6],StringGrid1.Rows[StringGrid1.Row][8],StringGrid1.Rows[StringGrid1.Row][4],EditEJJdbcDatasource,EditEJResRefName);
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

Procedure TForm1.RestoreFromTray();
begin
 //    TrayIcon1.Hide;
     Form1.WindowState:=wsNormal;
     Form1.ShowInTaskBar := stDefault;
     Form1.Show;
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
                       ListFilterEdit1.Text,StringGrid1);
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
var pdfreport:String;
  Alto,Ancho,Posicion, posalto, col_PDF,col_Ruta: Integer;
begin
  col_PDF:=9;
  col_Ruta:=2;
  //REF_PDFREPORT==========================
  Ancho := StringGrid1.ColWidths[col_PDF] div 2;
  Alto :=StringGrid1.RowHeights[1] div 2;
  Posicion := Ancho - (Image1.Picture.Width div 2);
  posalto := Alto - (Image1.Picture.Height div 2);
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

procedure TForm1.TrayIcon1Click(Sender: TObject);
begin
 RestoreFromTray();
end;

procedure TForm1.UniqueInstance1OtherInstance(Sender: TObject;
  ParamCount: Integer; const Parameters: array of String);
begin
      //TrayIcon1.Hide;
      If TrayIcon1.Hide then TrayIcon1.Show;
      Form1.WindowState:=wsNormal;
      Form1.ShowInTaskBar := stDefault;
      Form1.Show;
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
  //INICIO
  varGlobales.WebAppsDir:=Edit1.Text;
  varGlobales.FdeFilePath:=Edit2.Text;
  fdefile:=TFdeFile.create(Edit2.Text);
  If MinScriptFDE.Checked Then MinimizeToTray();
  FdeFile.Procesar(StringGrid1,RichMemo1,TrayIcon1,StatusBar1);
end;
end.

