object Form3: TForm3
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' UNO'
  ClientHeight = 105
  ClientWidth = 291
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 297
    Height = 225
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 0
    object Button1: TButton
      Left = 142
      Top = 8
      Width = 131
      Height = 41
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1058#1077#1083#1077#1075#1088#1072#1084#1084
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 5
      Top = 8
      Width = 131
      Height = 41
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100' WsClnt'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button10: TButton
      Left = 142
      Top = 55
      Width = 131
      Height = 41
      Caption = #1044#1086#1087' '#1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1090#1077#1083#1077#1075#1088#1072#1084#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button10Click
    end
    object Panel2: TPanel
      Left = 27
      Top = 114
      Width = 230
      Height = 103
      TabOrder = 3
      Visible = False
      object Label4: TLabel
        Left = 12
        Top = 0
        Width = 158
        Height = 16
        Caption = #1054#1090#1087#1088#1072#1074#1082#1072' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Button3: TButton
        Left = 143
        Top = 22
        Width = 75
        Height = 25
        Caption = #1042#1082#1083#1102#1095#1080#1090#1100
        TabOrder = 0
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 143
        Top = 68
        Width = 75
        Height = 25
        Caption = #1042#1099#1082#1083#1102#1095#1080#1090#1100
        TabOrder = 1
        OnClick = Button4Click
      end
      object CheckBox1: TCheckBox
        Left = 24
        Top = 22
        Width = 97
        Height = 17
        Caption = #1048#1090#1086#1075#1086#1074#1099#1081' '#1054#1090#1095#1077#1090
        TabOrder = 2
      end
      object CheckBox2: TCheckBox
        Left = 24
        Top = 45
        Width = 97
        Height = 17
        Caption = #1042#1089#1077' '#1057#1095#1077#1090#1072
        TabOrder = 3
      end
      object CheckBox3: TCheckBox
        Left = 24
        Top = 68
        Width = 97
        Height = 17
        Caption = #1054#1090#1082#1072#1079#1099' '#1074' '#1089#1095#1077#1090#1077
        TabOrder = 4
      end
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\UNO\Database\RDB.AKS'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=127.0.0.1'
      'Port=3050'
      'CharacterSet=UTF8'
      'DriverID=FB')
    LoginPrompt = False
    Left = 8
    Top = 160
  end
  object tbsmenyinactive: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE OR ALTER trigger tbsmeny_au16000 for tbsmeny'
      'inactive after update position 16000'
      'as'
      'begin'
      '  if ((old.DTEND is null) and'
      '      (not new.DTEND is null)) then'
      '  begin'
      '   if (exists(select*from telegram_users where allow=true)) then'
      '    begin'
      '    post_event '#39'SENDPHOTO'#39';'
      '    insert into TELEGRAM (IDOPER, STATUS, TXT)'
      
        '    values (1, 1, (select cast('#39'*'#1057#1084#1077#1085#1072' '#8470#39' || old.ID ||'#39' '#39'||(sele' +
        'ct STR from NUM_STR ((select sum(TOTAL_SUM)'
      
        'from DOCUMENTS where iif(idSmeny = iddriver, idSmeny, iddriver) ' +
        '= old.ID and OPERACII_TYPE = 2 and BDEL = 0)))|| ascii_char(13) ' +
        '|| ascii_char(10) ||(select RESULT'
      
        '                                                                ' +
        '                       from BDATE_TIME(current_timestamp)) || '#39'*' +
        #39' as varchar(150)) || ascii_char(13) || ascii_char(10) || G.STAT' +
        'ION || ascii_char(13) || ascii_char(10) || list(G.TXT, ascii_cha' +
        'r(13) || ascii_char(10)) || ascii_char(13) || ascii_char(10) || ' +
        #39'*'#1048#1090#1086#1075#1086': '#39' ||(select STR'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                   from NUM_STR((select sum(TOTAL_SUM)'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                 from DOCUMENTS'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                 where iif(idSmeny = iddriver, i' +
        'dSmeny, iddriver) = old.ID and'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                       OPERACII_TYPE = 2 and'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                       BDEL = 0))) || '#39'*'#39' as DCR'
      
        '                   from (select cast('#39'*'#1057#1090#1072#1085#1094#1080#1103' '#39' || upper(X.STAT' +
        'ION) || '#39'*'#39' as varchar(150)) as STATION, X.PODRAZD || ascii_char' +
        '(13) || ascii_char(10) || '#39'`'#39' || list(X.USLUGA || '#39': '#39' || cast(X' +
        '.KOLVO as integer) || '#39' - '#39' ||(select STR'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                       from NUM_STR(X.SUMMA)), ascii_char(13) ||' +
        ' ascii_char(10)) || '#39'`'#39' as TXT'
      
        '                         from (select S.NAME as STATION, cast('#39'*' +
        #39' || O.GROUP_NAME || '#39'*'#39' as varchar(150)) as PODRAZD,'
      
        '                                      O.NAME as USLUGA, sum(O.SU' +
        'M_NAKL) as SUMMA, sum(O.KOLVO) as KOLVO'
      '                               from DOCUMENTS P'
      
        '                               inner join D_LINES O on (O.IDDOCU' +
        'MENT = P.UID)'
      
        '                               inner join D_PRODUCT M on (M.ID =' +
        ' O.PRODUCT)'
      
        '                               inner join TBKOORD KR on (P.IDKOO' +
        'RD = KR.ID)'
      
        '                               inner join TBHALL H on (KR.IDHALL' +
        ' = H.ID)'
      
        '                               inner join TBSTATION S on (H.IDST' +
        'ATION = S.ID)'
      '                               where P.BDEL = 0 and'
      
        '                                     iif(P.IDSMENY = P.IDDRIVER,' +
        ' P.IDSMENY, P.IDDRIVER) = old.ID and'
      '                                     P.OPERACII_TYPE = 2 and'
      '                                     P.IDFORMAOPLATY > 0 and'
      '                                     not P.CLOSED_TIME is null'
      
        '                               group by S.NAME, O.GROUP_NAME, O.' +
        'NAME, O.CENA_SALES, P.SUPPLIER'
      '                               union all'
      
        '                               select S.NAME as STATION, '#39'*'#1053#1077' '#1079#1072 +
        #1082#1088#1099#1090#1099#1077' '#1089#1095#1077#1090#1072'*'#39', O.NAME as USLUGA,'
      
        '                                      sum(O.SUM_NAKL) as SUMMA, ' +
        'sum(O.KOLVO) as KOLVO'
      '                               from DOCUMENTS P'
      
        '                               inner join D_LINES O on (O.IDDOCU' +
        'MENT = P.UID)'
      
        '                               inner join D_PRODUCT M on (M.ID =' +
        ' O.PRODUCT)'
      
        '                               inner join TBKOORD KR on (P.IDKOO' +
        'RD = KR.ID)'
      
        '                               inner join TBHALL H on (KR.IDHALL' +
        ' = H.ID)'
      
        '                               inner join TBSTATION S on (H.IDST' +
        'ATION = S.ID)'
      '                               where P.BDEL = 0 and'
      
        '                                     iif(P.IDSMENY = P.IDDRIVER,' +
        ' P.IDSMENY, P.IDDRIVER) = old.ID and'
      '                                     P.OPERACII_TYPE = 2 and'
      '                                     P.CLOSED_TIME is null'
      
        '                               group by S.NAME, O.GROUP_NAME, O.' +
        'NAME, O.CENA_SALES, P.SUPPLIER) X'
      '                         group by X.STATION, X.PODRAZD) G'
      
        '                   group by G.STATION)||'#39'&&parse_mode=Markdown'#39')' +
        ';'
      ''
      '    post_event '#39'GET_DATA'#39';'
      '    end'
      '  end'
      'end')
    Left = 88
    Top = 64
  end
  object tbsmenyactive: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE OR ALTER trigger tbsmeny_au16000 for tbsmeny'
      'active after update position 16000'
      'as'
      'begin'
      '  if ((old.DTEND is null) and'
      '      (not new.DTEND is null)) then'
      '  begin'
      '   if (exists(select*from telegram_users where allow=true)) then'
      '    begin'
      '    post_event '#39'SENDPHOTO'#39';'
      '    insert into TELEGRAM (IDOPER, STATUS, TXT)'
      
        '    values (1, 1, (select cast('#39'*'#1057#1084#1077#1085#1072' '#8470#39' || old.ID ||'#39' '#39'||(sele' +
        'ct STR from NUM_STR ((select sum(TOTAL_SUM)'
      
        'from DOCUMENTS where iif(idSmeny = iddriver, idSmeny, iddriver) ' +
        '= old.ID and OPERACII_TYPE = 2 and BDEL = 0)))|| ascii_char(13) ' +
        '|| ascii_char(10) ||(select RESULT'
      
        '                                                                ' +
        '                       from BDATE_TIME(current_timestamp)) || '#39'*' +
        #39' as varchar(150)) || ascii_char(13) || ascii_char(10) || G.STAT' +
        'ION || ascii_char(13) || ascii_char(10) || list(G.TXT, ascii_cha' +
        'r(13) || ascii_char(10)) || ascii_char(13) || ascii_char(10) || ' +
        #39'*'#1048#1090#1086#1075#1086': '#39' ||(select STR'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                   from NUM_STR((select sum(TOTAL_SUM)'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                 from DOCUMENTS'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                 where iif(idSmeny = iddriver, i' +
        'dSmeny, iddriver) = old.ID and'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                       OPERACII_TYPE = 2 and'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                       BDEL = 0))) || '#39'*'#39' as DCR'
      
        '                   from (select cast('#39'*'#1057#1090#1072#1085#1094#1080#1103' '#39' || upper(X.STAT' +
        'ION) || '#39'*'#39' as varchar(150)) as STATION, X.PODRAZD || ascii_char' +
        '(13) || ascii_char(10) || '#39'`'#39' || list(X.USLUGA || '#39': '#39' || cast(X' +
        '.KOLVO as integer) || '#39' - '#39' ||(select STR'
      
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                       from NUM_STR(X.SUMMA)), ascii_char(13) ||' +
        ' ascii_char(10)) || '#39'`'#39' as TXT'
      
        '                         from (select S.NAME as STATION, cast('#39'*' +
        #39' || O.GROUP_NAME || '#39'*'#39' as varchar(150)) as PODRAZD,'
      
        '                                      O.NAME as USLUGA, sum(O.SU' +
        'M_NAKL) as SUMMA, sum(O.KOLVO) as KOLVO'
      '                               from DOCUMENTS P'
      
        '                               inner join D_LINES O on (O.IDDOCU' +
        'MENT = P.UID)'
      
        '                               inner join D_PRODUCT M on (M.ID =' +
        ' O.PRODUCT)'
      
        '                               inner join TBKOORD KR on (P.IDKOO' +
        'RD = KR.ID)'
      
        '                               inner join TBHALL H on (KR.IDHALL' +
        ' = H.ID)'
      
        '                               inner join TBSTATION S on (H.IDST' +
        'ATION = S.ID)'
      '                               where P.BDEL = 0 and'
      
        '                                     iif(P.IDSMENY = P.IDDRIVER,' +
        ' P.IDSMENY, P.IDDRIVER) = old.ID and'
      '                                     P.OPERACII_TYPE = 2 and'
      '                                     P.IDFORMAOPLATY > 0 and'
      '                                     not P.CLOSED_TIME is null'
      
        '                               group by S.NAME, O.GROUP_NAME, O.' +
        'NAME, O.CENA_SALES, P.SUPPLIER'
      '                               union all'
      
        '                               select S.NAME as STATION, '#39'*'#1053#1077' '#1079#1072 +
        #1082#1088#1099#1090#1099#1077' '#1089#1095#1077#1090#1072'*'#39', O.NAME as USLUGA,'
      
        '                                      sum(O.SUM_NAKL) as SUMMA, ' +
        'sum(O.KOLVO) as KOLVO'
      '                               from DOCUMENTS P'
      
        '                               inner join D_LINES O on (O.IDDOCU' +
        'MENT = P.UID)'
      
        '                               inner join D_PRODUCT M on (M.ID =' +
        ' O.PRODUCT)'
      
        '                               inner join TBKOORD KR on (P.IDKOO' +
        'RD = KR.ID)'
      
        '                               inner join TBHALL H on (KR.IDHALL' +
        ' = H.ID)'
      
        '                               inner join TBSTATION S on (H.IDST' +
        'ATION = S.ID)'
      '                               where P.BDEL = 0 and'
      
        '                                     iif(P.IDSMENY = P.IDDRIVER,' +
        ' P.IDSMENY, P.IDDRIVER) = old.ID and'
      '                                     P.OPERACII_TYPE = 2 and'
      '                                     P.CLOSED_TIME is null'
      
        '                               group by S.NAME, O.GROUP_NAME, O.' +
        'NAME, O.CENA_SALES, P.SUPPLIER) X'
      '                         group by X.STATION, X.PODRAZD) G'
      
        '                   group by G.STATION)||'#39'&&parse_mode=Markdown'#39')' +
        ';'
      ''
      '    post_event '#39'GET_DATA'#39';'
      '    end'
      '  end'
      'end')
    Left = 88
    Top = 104
  end
  object documentsinactive: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE OR ALTER trigger documents_au16000 for documents'
      'inactive after update position 16000'
      'AS'
      'begin'
      '  if (old.operacii_type = 2) then'
      '   begin'
      '   if (exists(select*from telegram_users where allow=true)) then'
      '    begin'
      
        '    if ((old.bdel = 0) and (new.bdel = 1) and (new.total_sum > 0' +
        ')) then'
      '     begin'
      '     insert into telegram(idoper, status, txt)'
      
        '     values(1, 1, '#39'*'#1059#1076#1072#1083#1077#1085#1080#1077' '#1089#1095#1077#1090#1072' '#8470#39'||old.kod||'#39'* '#39'||ascii_char' +
        '(13)||ascii_char(10)||'
      
        '     '#39#1042#1088#1077#1084#1103': '#39'||(select result from bdate_time(current_timestamp' +
        '))||ascii_char(13)||ascii_char(10)||'
      
        '     '#39#1057#1090#1086#1083': '#39'||(select replace(name,'#39'_'#39','#39#39') from tbKoord where i' +
        'd = old.idkoord)||ascii_char(13)||ascii_char(10)||'
      
        '     '#39#1053#1072' '#1089#1091#1084#1084#1091': '#39'||(select str from num_str(new.total_sum))||asc' +
        'ii_char(13)||ascii_char(10)||'
      
        '     '#39#1059#1076#1072#1083#1080#1083': *'#39'||coalesce((select replace(name,'#39'_'#39','#39#39') from peo' +
        'ples where id = new.idotver), current_user)||'#39'*&parse_mode=Markd' +
        'own'#39');'
      '     post_event '#39'GET_DATA'#39';'
      '     end'
      
        '    else if ((old.provod = 0) and (new.provod = 1) and (new.bdel' +
        ' = 0)) then'
      '     begin'
      '      insert into telegram(idoper, status, txt)'
      
        '     values(1, 1, '#39'*'#1047#1072#1082#1088#1099#1090#1080#1077' '#1089#1095#1077#1090#1072' '#8470#39'||old.kod||'#39'*'#39'||ascii_char(' +
        '13)||ascii_char(10)||'
      
        '     '#39#1054#1090#1082#1088#1099#1090': '#39'||(select result from bdate_time(old.dt))||ascii_' +
        'char(13)||ascii_char(10)||'
      
        '     '#39#1047#1072#1082#1088#1099#1090': '#39'||(select result from bdate_time(current_timestam' +
        'p))||ascii_char(13)||ascii_char(10)||'
      
        '     '#39#1057#1090#1086#1083': '#39'||(select replace(name,'#39'_'#39','#39#39') from tbKoord where i' +
        'd = old.idkoord)||ascii_char(13)||ascii_char(10)||'
      
        '     '#39#1050#1083#1080#1077#1085#1090': '#39'||coalesce((select replace(name,'#39'_'#39','#39#39') from cont' +
        'ragents where id = new.supplier), current_user)||ascii_char(13)|' +
        '|ascii_char(10)||'
      
        '     '#39'`'#39'||coalesce(cast((select list(replace(p.name,'#39'_'#39','#39#39')||'#39': ' +
        #39'||cast(l.kolvo as integer)||'#39' - '#39'||(select str from num_str(l.s' +
        'um_nakl)), ascii_char(13)||ascii_char(10))'
      '      from d_lines l inner join d_product p on(l.product = p.id)'
      
        '      where l.iddocument = old.uid) as varchar(2500)), '#39#39')||'#39'`'#39'|' +
        '|ascii_char(13)||ascii_char(10)||'
      
        '     '#39#1053#1072' '#1089#1091#1084#1084#1091': *'#39'||(select str from num_str(new.total_sum))||'#39'*' +
        '&parse_mode=Markdown'#39');'
      '     post_event '#39'GET_DATA'#39';'
      '     end'
      '    end'
      '   end'
      'end')
    Left = 56
    Top = 64
    MacroData = <
      item
        Value = Null
        Name = 'PARSE_MODE'
        DataType = mdIdentifier
      end>
  end
  object documentsactive: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE OR ALTER trigger documents_au16000 for documents'
      'active after update position 16000'
      'AS'
      'begin'
      '  if (old.operacii_type = 2) then'
      '   begin'
      '   if (exists(select*from telegram_users where allow=true)) then'
      '    begin'
      
        '    if ((old.bdel = 0) and (new.bdel = 1) and (new.total_sum > 0' +
        ')) then'
      '     begin'
      '     insert into telegram(idoper, status, txt)'
      
        '     values(1, 1, '#39'*'#1059#1076#1072#1083#1077#1085#1080#1077' '#1089#1095#1077#1090#1072' '#8470#39'||old.kod||'#39'* '#39'||ascii_char' +
        '(13)||ascii_char(10)||'
      
        '     '#39#1042#1088#1077#1084#1103': '#39'||(select result from bdate_time(current_timestamp' +
        '))||ascii_char(13)||ascii_char(10)||'
      
        '     '#39#1057#1090#1086#1083': '#39'||(select replace(name,'#39'_'#39','#39#39') from tbKoord where i' +
        'd = old.idkoord)||ascii_char(13)||ascii_char(10)||'
      
        '     '#39#1053#1072' '#1089#1091#1084#1084#1091': '#39'||(select str from num_str(new.total_sum))||asc' +
        'ii_char(13)||ascii_char(10)||'
      
        '     '#39#1059#1076#1072#1083#1080#1083': *'#39'||coalesce((select replace(name,'#39'_'#39','#39#39') from peo' +
        'ples where id = new.idotver), current_user)||'#39'*&parse_mode=Markd' +
        'own'#39');'
      '     post_event '#39'GET_DATA'#39';'
      '     end'
      
        '    else if ((old.provod = 0) and (new.provod = 1) and (new.bdel' +
        ' = 0)) then'
      '     begin'
      '      insert into telegram(idoper, status, txt)'
      
        '     values(1, 1, '#39'*'#1047#1072#1082#1088#1099#1090#1080#1077' '#1089#1095#1077#1090#1072' '#8470#39'||old.kod||'#39'*'#39'||ascii_char(' +
        '13)||ascii_char(10)||'
      
        '     '#39#1054#1090#1082#1088#1099#1090': '#39'||(select result from bdate_time(old.dt))||ascii_' +
        'char(13)||ascii_char(10)||'
      
        '     '#39#1047#1072#1082#1088#1099#1090': '#39'||(select result from bdate_time(current_timestam' +
        'p))||ascii_char(13)||ascii_char(10)||'
      
        '     '#39#1057#1090#1086#1083': '#39'||(select replace(name,'#39'_'#39','#39#39') from tbKoord where i' +
        'd = old.idkoord)||ascii_char(13)||ascii_char(10)||'
      
        '     '#39#1050#1083#1080#1077#1085#1090': '#39'||coalesce((select replace(name,'#39'_'#39','#39#39') from cont' +
        'ragents where id = new.supplier), current_user)||ascii_char(13)|' +
        '|ascii_char(10)||'
      
        '     '#39'`'#39'||coalesce(cast((select list(replace(p.name,'#39'_'#39','#39#39')||'#39': ' +
        #39'||cast(l.kolvo as integer)||'#39' - '#39'||(select str from num_str(l.s' +
        'um_nakl)), ascii_char(13)||ascii_char(10))'
      '      from d_lines l inner join d_product p on(l.product = p.id)'
      
        '      where l.iddocument = old.uid) as varchar(2500)), '#39#39')||'#39'`'#39'|' +
        '|ascii_char(13)||ascii_char(10)||'
      
        '     '#39#1053#1072' '#1089#1091#1084#1084#1091': *'#39'||(select str from num_str(new.total_sum))||'#39'*' +
        '&parse_mode=Markdown'#39');'
      '     post_event '#39'GET_DATA'#39';'
      '     end'
      '    end'
      '   end'
      'end')
    Left = 56
    Top = 104
    MacroData = <
      item
        Value = Null
        Name = 'PARSE_MODE'
        DataType = mdIdentifier
      end>
  end
  object dlinesinactive: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE OR ALTER trigger d_lines_au16000 for d_lines'
      'inactive after update position 16000'
      'AS'
      'begin'
      
        '    if((select operacii_type from documents where uid=old.iddocu' +
        'ment)=2) then'
      '    begin'
      
        '        if (exists(select*from telegram_users where allow=true))' +
        ' then'
      '        begin'
      
        '            if(old.kolvo>0 and new.prichina is not null and old.' +
        'kolvo>new.kolvo) then'
      '                --and new.prichina is not null) then'
      '            begin'
      '            insert into telegram(idoper, status, txt)'
      
        '            values(1,1,'#39'*'#1054#1090#1082#1072#1079' '#1074' '#1089#1095#1077#1090#1077' '#8470#39'||(select kod from DOCU' +
        'MENTS where UID = old.iddocument)||'#39'*'#39'||ascii_char(13)||ascii_ch' +
        'ar(10)'
      
        '                    ||'#39'  '#1042#1088#1077#1084#1103': '#39'||'#39'_'#39'||(select result from bdat' +
        'e_time(current_timestamp))||'#39'_'#39'||ascii_char(13)||ascii_char(10)'
      
        '                    ||'#39'  '#1041#1083#1102#1076#1086': '#39'||'#39'_'#39'||old.NAME||'#39'_'#39'||ascii_cha' +
        'r(13)||ascii_char(10)'
      
        '                    ||'#39'  '#1050#1086#1083'-'#1074#1086': '#39'||'#39'_'#39'||cast((old.kolvo-new.kol' +
        'vo)as integer)||'#39'_'#39'||ascii_char(13)||ascii_char(10)'
      
        '                    ||'#39'  '#1053#1072' '#1089#1091#1084#1084#1091': '#39'||'#39'_'#39'||cast(((old.CENA_SALES' +
        ')*(old.kolvo-new.kolvo))as integer)||'#39#1090#1075'.'#39'||'#39'_'#39'||ascii_char(13)|' +
        '|ascii_char(10)'
      
        '                    ||'#39'  '#1055#1088#1080#1095#1080#1085#1072': '#39'||'#39'_'#39'||(select NAME from TBOP' +
        'ERACII_TYPE where ID = new.PRICHINA)||'#39'_'#39'||ascii_char(13)||ascii' +
        '_char(10)'
      
        '                    ||'#39'  '#1054#1090#1082#1072#1079#1072#1083': *'#39'||(select NAME from PEOPLES ' +
        'where ID = old.ADDED_PEOPLE)||'#39'*&parse_mode=Markdown'#39');'
      '            post_event '#39'GET_DATA'#39';'
      '            end'
      '        end'
      '    end'
      'end'
      ''
      
        '/*|| '#39' '#1086#1090' '#39' ||(select iif(char_length(extract(day from DT)) = 1,' +
        ' '#39'0'#39' || extract(day from DT), extract(day from DT)) ||'
      
        '              '#39'/'#39' || iif(char_length(extract(month from DT)) = 1' +
        ', '#39'0'#39' || extract(month from DT), extract(month from DT)) || '#39'/'#39' ' +
        '|| extract(year from DT) || '#39#1075'. '#39' ||'
      
        '              iif(char_length(extract(hour from old.DT)) = 1, '#39'0' +
        #39' || extract(hour from DT), extract(hour from DT)) || '#39':'#39' || iif' +
        '(char_length(extract(minute from DT)) = 1, '#39'0'#39' ||'
      
        '              extract(minute from DT), extract(minute from DT)) ' +
        'from tbmenu_added_log where idlines = uid) */')
    Left = 24
    Top = 104
    MacroData = <
      item
        Value = Null
        Name = 'PARSE_MODE'
        DataType = mdIdentifier
      end>
  end
  object dlinesactive: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE OR ALTER trigger d_lines_au16000 for d_lines'
      'active after update position 16000'
      'AS'
      'begin'
      
        '    if((select operacii_type from documents where uid=old.iddocu' +
        'ment)=2) then'
      '    begin'
      
        '        if (exists(select*from telegram_users where allow=true))' +
        ' then'
      '        begin'
      
        '            if(old.kolvo>0 and new.prichina is not null and old.' +
        'kolvo>new.kolvo) then'
      '                --and new.prichina is not null) then'
      '            begin'
      '            insert into telegram(idoper, status, txt)'
      
        '            values(1,1,'#39'*'#1054#1090#1082#1072#1079' '#1074' '#1089#1095#1077#1090#1077' '#8470#39'||(select kod from DOCU' +
        'MENTS where UID = old.iddocument)||'#39'*'#39'||ascii_char(13)||ascii_ch' +
        'ar(10)'
      
        '                    ||'#39'  '#1042#1088#1077#1084#1103': '#39'||'#39'_'#39'||(select result from bdat' +
        'e_time(current_timestamp))||'#39'_'#39'||ascii_char(13)||ascii_char(10)'
      
        '                    ||'#39'  '#1041#1083#1102#1076#1086': '#39'||'#39'_'#39'||old.NAME||'#39'_'#39'||ascii_cha' +
        'r(13)||ascii_char(10)'
      
        '                    ||'#39'  '#1050#1086#1083'-'#1074#1086': '#39'||'#39'_'#39'||cast((old.kolvo-new.kol' +
        'vo)as integer)||'#39'_'#39'||ascii_char(13)||ascii_char(10)'
      
        '                    ||'#39'  '#1053#1072' '#1089#1091#1084#1084#1091': '#39'||'#39'_'#39'||cast(((old.CENA_SALES' +
        ')*(old.kolvo-new.kolvo))as integer)||'#39#1090#1075'.'#39'||'#39'_'#39'||ascii_char(13)|' +
        '|ascii_char(10)'
      
        '                    ||'#39'  '#1055#1088#1080#1095#1080#1085#1072': '#39'||'#39'_'#39'||(select NAME from TBOP' +
        'ERACII_TYPE where ID = new.PRICHINA)||'#39'_'#39'||ascii_char(13)||ascii' +
        '_char(10)'
      
        '                    ||'#39'  '#1054#1090#1082#1072#1079#1072#1083': *'#39'||(select NAME from PEOPLES ' +
        'where ID = old.ADDED_PEOPLE)||'#39'*&parse_mode=Markdown'#39');'
      '            post_event '#39'GET_DATA'#39';'
      '            end'
      '        end'
      '    end'
      'end'
      ''
      
        '/*|| '#39' '#1086#1090' '#39' ||(select iif(char_length(extract(day from DT)) = 1,' +
        ' '#39'0'#39' || extract(day from DT), extract(day from DT)) ||'
      
        '              '#39'/'#39' || iif(char_length(extract(month from DT)) = 1' +
        ', '#39'0'#39' || extract(month from DT), extract(month from DT)) || '#39'/'#39' ' +
        '|| extract(year from DT) || '#39#1075'. '#39' ||'
      
        '              iif(char_length(extract(hour from old.DT)) = 1, '#39'0' +
        #39' || extract(hour from DT), extract(hour from DT)) || '#39':'#39' || iif' +
        '(char_length(extract(minute from DT)) = 1, '#39'0'#39' ||'
      
        '              extract(minute from DT), extract(minute from DT)) ' +
        'from tbmenu_added_log where idlines = uid) */')
    Left = 24
    Top = 64
    MacroData = <
      item
        Value = Null
        Name = 'PARSE_MODE'
        DataType = mdIdentifier
      end>
  end
end
