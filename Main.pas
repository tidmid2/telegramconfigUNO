unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IniFiles,ShellApi,WinSvc,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    FDConnection1: TFDConnection;
    tbsmenyinactive: TFDQuery;
    tbsmenyactive: TFDQuery;
    documentsinactive: TFDQuery;
    documentsactive: TFDQuery;
    dlinesinactive: TFDQuery;
    dlinesactive: TFDQuery;
    Button2: TButton;
    Button10: TButton;
    Panel2: TPanel;
    Label4: TLabel;
    Button3: TButton;
    Button4: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExecuteStartService(ServiceName: String);
    procedure ExecuteControlService(ServiceName: String; ServiceControlCode : DWORD);
    procedure StatusService(ServiceName: String;TypeStart: DWORD);
    procedure Button2Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    function ServiceRunning(sMachine, sService: PChar): Boolean;
    function ServiceGetStatus(sMachine, sService: PChar): DWORD;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}
var ini: Tinifile; REGNUM,srvkeyoncreate : String;
  //aa:cardinal;ess:TEnumServiceStatus;
procedure TForm3.FormCreate(Sender: TObject);
begin
//�������� �� ������� �� ������ ��� ��������� � ������ ��������
  ini:= TIniFile.Create('C:\UNO\bin\config.ini');
  srvkeyoncreate:= ini.ReadString('DATABASE','SRVKEY','');
  if srvkeyoncreate='' then
      begin
        if (ini.ReadString('REGISTRY','REGNUM','')='') then
        begin
            ShowMessage('��������������� ��� ����������, ������� ����������� ���������!') ;
            Application.Destroy;
        end
        else
        begin
           button1.Caption:='�������� ��������';
        end;

        if ini.ReadString('DATABASE','SRVKEY','')='' then
        begin
          button2.Caption:='�������� WsClnt';
        end
        else button2.Caption:='��������� WsClnt';
      end
      else
      begin
         button1.Caption:='��������� ��������';
      end;


end;

procedure TForm3.Button10Click(Sender: TObject);
begin
  if ServiceRunning(nil, '��� ������') then
  begin
  ShowMessage('��������')
  end else
  begin
  ShowMessage('�� ��������')
  end;
  if panel2.Visible=False then
  begin
    panel2.Visible:=True;
    Form3.ClientHeight:=221;
  end
  else
  begin
    panel2.Visible:=False;
    Form3.ClientHeight:=107;
  end;
end;

procedure TForm3.Button1Click(Sender: TObject);   //��������� ��� ���������� ������
begin
    if button1.caption='�������� ��������' then
    begin
      button1.Caption:='��������� ��������';
      if ini.ReadString('DATABASE','SRVKEY','')='' then
      begin
        REGNUM:=ini.ReadString('REGISTRY','REGNUM','');
        Ini.WriteString('DATABASE','SRVKEY',REGNUM);
      end;
      if ini.ReadString('WS','IDSRV','')='' then
      begin
         Ini.WriteString('WS','IDSRV',REGNUM);
      end;
        documentsactive.Execute(1);
        dlinesactive.Execute(1);
        tbsmenyactive.Execute(1);
        StatusService('Telegram_grd',SERVICE_AUTO_START);
        ExecuteStartService('Telegram_grd');

        StatusService('telegram_srv',SERVICE_AUTO_START);
        ExecuteStartService('telegram_srv');
        showmessage('�������� �������');

    end
    else
    begin
      button1.Caption:='�������� ��������';
      documentsinactive.Execute(1);
      dlinesinactive.Execute(1);
      tbsmenyinactive.Execute(1);
      StatusService('Telegram_grd',SERVICE_DISABLED);
      ExecuteControlService('Telegram_grd',SERVICE_CONTROL_STOP);

      StatusService('telegram_srv',SERVICE_DISABLED);
      ExecuteControlService('telegram_srv',SERVICE_CONTROL_STOP);
      showmessage('�������� ��������');
     end;

end;

procedure TForm3.Button2Click(Sender: TObject);
var // ini: Tinifile;
reg: String;
begin
     if button2.Caption='�������� WsClnt'  then
     begin

         button2.Caption:='��������� WsClnt';
        if (ini.ReadString('REGISTRY','REGNUM','')='') then
            begin
                ShowMessage('��������������� ��� ����������, ������� ����������� ���������!') ;
                Application.Destroy;
            end
        else
        begin
           reg:=ini.ReadString('REGISTRY','REGNUM','');
           if (ini.ReadString('DATABASE','SRVKEY','')='') then
            begin
              Ini.WriteString('DATABASE','SRVKEY',reg);
            end;
            //else ShowMessage('ID ��������� ������');

            if ini.ReadString('WS','IDSRV','')='' then
            begin
               Ini.WriteString('WS','IDSRV',reg);
            end;
            //else  ShowMessage('ID ��������� � ������ ������');
            StatusService('WebWSClnt',SERVICE_AUTO_START);
            ExecuteControlService('WebWSClnt',SERVICE_CONTROL_STOP);
            ExecuteStartService('WebWSClnt');

        end;
     end
     else
     begin
       button2.Caption:='�������� WsClnt';
       StatusService('WebWSClnt',SERVICE_DISABLED);
       ExecuteControlService('WebWSClnt',SERVICE_CONTROL_STOP);
     end;
  {   }
end;



procedure TForm3.Button3Click(Sender: TObject);
begin
    if (checkbox1.Checked=False) and (checkbox2.Checked=False) and (checkbox3.Checked=False) then
    begin
        ShowMessage('�������� ����-�� ���� �������')
    end
    else
    begin
      if checkbox1.Checked=True then
      begin
        tbsmenyactive.Execute(1);
      end;
      if checkbox2.Checked=True then
      begin
        documentsactive.Execute(1);
      end;
      if checkbox3.Checked=True then
      begin
        dlinesactive.Execute(1);
      end;
    end;

    StatusService('Telegram_grd',SERVICE_DISABLED);
    StatusService('telegram_srv',SERVICE_DISABLED);

    ExecuteStartService('Telegram_grd');
    ExecuteStartService('telegram_srv');

    checkbox1.Checked:=False;
    checkbox2.Checked:=False;
    checkbox3.Checked:=False;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
    if (checkbox1.Checked=False) and (checkbox2.Checked=False) and (checkbox3.Checked=False) then
    begin
        ShowMessage('�������� ����-�� ���� �������')
    end
    else
    begin
      if checkbox1.Checked=True then
      begin
        tbsmenyinactive.Execute(1);
      end;
      if checkbox2.Checked=True then
      begin
        documentsinactive.Execute(1);
      end;
      if checkbox3.Checked=True then
      begin
        dlinesinactive.Execute(1);
      end;
    end;

    StatusService('Telegram_grd',SERVICE_DISABLED);
    StatusService('telegram_srv',SERVICE_DISABLED);

    ExecuteStartService('Telegram_grd');
    ExecuteStartService('telegram_srv');

    checkbox1.Checked:=False;
    checkbox2.Checked:=False;
    checkbox3.Checked:=False;
end;

procedure TForm3.ExecuteControlService(ServiceName: String; ServiceControlCode : DWORD);
var
 SCManagerHandle, SCHandle  : THandle;
 ServiceStatus : TServiceStatus;
begin
 SCManagerHandle := OpenSCManager(nil, nil, GENERIC_READ);
 SCHandle := OpenService(SCManagerHandle, PChar(ServiceName), SERVICE_ALL_ACCESS);
 ControlService(SCHandle, ServiceControlCode, ServiceStatus);
 CloseServiceHandle(SCHandle);
 CloseServiceHandle(SCManagerHandle);
end;

procedure TForm3.StatusService(ServiceName: String;TypeStart: DWORD);
  var
    SCManager, Service: SC_HANDLE;
  begin
    SCManager := OpenSCManager(nil, nil, GENERIC_READ);
    Service := OpenService(SCManager, PChar(ServiceName), SERVICE_ALL_ACCESS);
    ChangeServiceConfig(Service, SERVICE_NO_CHANGE,TypeStart, SERVICE_NO_CHANGE, nil, nil, nil, nil,nil, nil, nil);
    CloseServiceHandle(Service);
    CloseServiceHandle(SCManager);
  end;

procedure TForm3.ExecuteStartService(ServiceName: String);
var
 SCManagerHandle, SCHandle  : THandle;
 p : PChar;
begin
 SCManagerHandle := OpenSCManager(nil, nil, GENERIC_READ);
 SCHandle := OpenService(SCManagerHandle, PChar(ServiceName), SERVICE_ALL_ACCESS);
 p := nil;
 StartService(SCHandle, 0, p);
 CloseServiceHandle(SCHandle);
 CloseServiceHandle(SCManagerHandle);
end;

function TForm3.ServiceGetStatus(sMachine, sService: PChar): DWORD;
{******************************************}
  {*** Parameters: ***}
  {*** sService: specifies the name of the service to open
  {*** sMachine: specifies the name of the target computer
  {*** ***}
  {*** Return Values: ***}
  {*** -1 = Error opening service ***}
  {*** 1 = SERVICE_STOPPED ***}
  {*** 2 = SERVICE_START_PENDING ***}
  {*** 3 = SERVICE_STOP_PENDING ***}
  {*** 4 = SERVICE_RUNNING ***}
  {*** 5 = SERVICE_CONTINUE_PENDING ***}
  {*** 6 = SERVICE_PAUSE_PENDING ***}
  {*** 7 = SERVICE_PAUSED ***}
  {******************************************}

var
  SCManHandle, SvcHandle: SC_Handle;
  SS: TServiceStatus;
  dwStat: DWORD;
begin
  dwStat := 0;
  // Open service manager handle.
  SCManHandle := OpenSCManager(sMachine, nil, SC_MANAGER_CONNECT);
  if (SCManHandle > 0) then
  begin
    SvcHandle := OpenService(SCManHandle, sService, SERVICE_QUERY_STATUS);
    // if Service installed
    if (SvcHandle > 0) then
    begin
      // SS structure holds the service status (TServiceStatus);
      if (QueryServiceStatus(SvcHandle, SS)) then
        dwStat := ss.dwCurrentState;
      CloseServiceHandle(SvcHandle);
    end;
    CloseServiceHandle(SCManHandle);
  end;
  Result := dwStat;
end;

function TForm3.ServiceRunning(sMachine, sService: PChar): Boolean;
begin
  Result := SERVICE_RUNNING = ServiceGetStatus(sMachine, sService);
end;


end.
