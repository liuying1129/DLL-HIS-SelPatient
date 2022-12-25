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
  UfrmSelPatient in 'UfrmSelPatient.pas' {frmSelPatient};

{$R *.res}

function ShowPatientForm(AHandle:THandle;AServer:Pchar;APort:Integer;ADatabase:Pchar;AUsername:Pchar;APassword:Pchar;AOperator:Pchar;AOperatorDep:Pchar):PChar;stdcall;
var
  ffrmSelPatient: TfrmSelPatient;
  OldApplication : TApplication;
  sResult:String;
begin
  OldApplication := TApplication.Create(Application);
  OldApplication.Handle := Application.Handle; 
  Application.Handle:=AHandle;
  ffrmSelPatient:=TfrmSelPatient.Create(nil);
  ffrmSelPatient.FServer:=StrPas(AServer);
  ffrmSelPatient.FPort:=APort;
  ffrmSelPatient.FDatabase:=StrPas(ADatabase);
  ffrmSelPatient.FUsername:=StrPas(AUsername);
  ffrmSelPatient.FPassword:=StrPas(APassword);
  ffrmSelPatient.FOperator:=StrPas(AOperator);
  ffrmSelPatient.FOperatorDep:=StrPas(AOperatorDep);
  try
    ffrmSelPatient.ShowModal;
  finally
    sResult:=ffrmSelPatient.FResult;
    
    //=======½«string×ª»»Îªpchar
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

exports
ShowPatientForm;

begin
end.
