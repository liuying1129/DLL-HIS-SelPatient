library SelPatient;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  Forms,
  Uni,
  Dialogs{MessageDlg},
  UfrmSelPatient in 'UfrmSelPatient.pas' {frmSelPatient};

{$R *.res}

function ShowPatientForm(AHandle:THandle;AHisConn:Pchar;AOperator:Pchar;AOperatorDep:Pchar):PChar;stdcall;
var
  ffrmSelPatient: TfrmSelPatient;
  OldApplication : TApplication;
  sResult:String;
begin
  OldApplication := TApplication.Create(Application);
  OldApplication.Handle := Application.Handle; 
  Application.Handle:=AHandle;
  ffrmSelPatient:=TfrmSelPatient.Create(nil);
  ffrmSelPatient.FHisConn:=StrPas(AHisConn);
  ffrmSelPatient.FOperator:=StrPas(AOperator);
  ffrmSelPatient.FOperatorDep:=StrPas(AOperatorDep);
  try
    ffrmSelPatient.ShowModal;
  finally
    sResult:=ffrmSelPatient.FResult;
    
    //=======将string转换为pchar
    try
      GetMem(Result,length(sResult)+1) ;
    except
      Result := nil ;
    end ;
    if assigned(Result) then
    begin
      StrPLCopy(Result,sResult,length(sResult)) ;
      Result[length(sResult)] := #0;
    end;
    //==============================
    
    ffrmSelPatient.Free;
    Application.Handle := OldApplication.Handle; 
  end;
end;

function InsertTreatMaster(AHisConn:Pchar;APatient_Unid:integer;AOperator:PChar;ADepartment:PChar;ARegister_Src:PChar;ARegister_Treat_Date:TDateTime;ARegister_Morning_Afternoon:PChar;ARegister_No_Type:PChar;ARegister_Operator:PChar):integer;stdcall;
var
  Conn:TUniConnection;
  adotemp11,adotemp22:TUniQuery;
  sqlstr:string;
begin
  Result:=-1;
  
  Conn:=TUniConnection.Create(nil);
  Conn.LoginPrompt:=false;
  Conn.ConnectString:=AHisConn;

  adotemp22:=TUniQuery.Create(nil);
  adotemp22.Connection:=Conn;
  adotemp22.Close;
  adotemp22.SQL.Clear;
  adotemp22.SQL.Text:='select TIMESTAMPDIFF(YEAR,patient_birthday,CURDATE()) as patient_age,pi.* from patient_info pi where unid='+inttostr(APatient_Unid);
  adotemp22.Open;
  if adotemp22.RecordCount<>1 then begin adotemp22.Free;Conn.Free;exit;end;

  adotemp11:=TUniQuery.Create(nil);
  adotemp11.Connection:=Conn;

  sqlstr:='Insert into treat_master ('+
                      ' patient_unid, patient_name, patient_sex, patient_age, certificate_type, certificate_num, clinic_card_num, health_care_num, address, work_company, work_address, if_marry, native_place, telephone, operator, department,'+
                      ' register_src, register_treat_date, register_morning_afternoon, register_no_type, register_operator) values ('+
                      ':patient_unid,:patient_name,:patient_sex,:patient_age,:certificate_type,:certificate_num,:clinic_card_num,:health_care_num,:address,:work_company,:work_address,:if_marry,:native_place,:telephone,:operator,:department,'+
                      ':register_src,:register_treat_date,:register_morning_afternoon,:register_no_type,:register_operator) ';
  adotemp11.Close;
  adotemp11.SQL.Clear;
  adotemp11.SQL.Add(sqlstr);
  //执行多条MySQL语句，要用分号分隔
  adotemp11.SQL.Add('; SELECT LAST_INSERT_ID() AS Insert_Identity ');
  adotemp11.ParamByName('patient_unid').Value:=APatient_Unid;
  adotemp11.ParamByName('patient_name').Value:=adotemp22.fieldbyname('patient_name').AsString;
  adotemp11.ParamByName('patient_sex').Value:=adotemp22.fieldbyname('patient_sex').AsString;
  adotemp11.ParamByName('patient_age').Value:=adotemp22.fieldbyname('patient_age').AsString;
  adotemp11.ParamByName('certificate_type').Value:=adotemp22.fieldbyname('certificate_type').AsString;
  adotemp11.ParamByName('certificate_num').Value:=adotemp22.fieldbyname('certificate_num').AsString;
  adotemp11.ParamByName('clinic_card_num').Value:=adotemp22.fieldbyname('clinic_card_num').AsString;
  adotemp11.ParamByName('health_care_num').Value:=adotemp22.fieldbyname('health_care_num').AsString;
  adotemp11.ParamByName('address').Value:=adotemp22.fieldbyname('address').AsString;
  adotemp11.ParamByName('work_company').Value:=adotemp22.fieldbyname('work_company').AsString;
  adotemp11.ParamByName('work_address').Value:=adotemp22.fieldbyname('work_address').AsString;
  adotemp11.ParamByName('if_marry').Value:=adotemp22.fieldbyname('if_marry').AsString;
  adotemp11.ParamByName('native_place').Value:=adotemp22.fieldbyname('native_place').AsString;
  adotemp11.ParamByName('telephone').Value:=adotemp22.fieldbyname('telephone').AsString;
  adotemp11.ParamByName('operator').Value:=StrPas(AOperator);//看诊医生
  adotemp11.ParamByName('department').Value:=StrPas(ADepartment);//看诊科室
  adotemp11.ParamByName('register_src').Value:=StrPas(ARegister_Src);//号源
  adotemp11.ParamByName('register_treat_date').Value:=ARegister_Treat_Date;//必须DateTime,Date则传入值为0000-00-00//看诊日期
  adotemp11.ParamByName('register_morning_afternoon').Value:=StrPas(ARegister_Morning_Afternoon);//午别
  adotemp11.ParamByName('register_no_type').Value:=StrPas(ARegister_No_Type);//号别
  adotemp11.ParamByName('register_operator').Value:=StrPas(ARegister_Operator);//挂号员
  try
    adotemp11.ExecSQL;
  except
    on E:Exception do
    begin
      adotemp11.Free;
      adotemp22.Free;
      Conn.Free;
      MessageDlg('方法InsertTreatMaster报错!'+E.Message,mtError,[mbOK],0);
      exit;
    end;
  end;

  Result:=adotemp11.fieldbyname('Insert_Identity').AsInteger;
  adotemp11.Free;

  adotemp22.Free;
  Conn.Free;
end;

exports
ShowPatientForm,
InsertTreatMaster;

begin
end.
