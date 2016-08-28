program iNanoGeradordeCPF;

uses
  Forms,
  UnitCPF in 'UnitCPF.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'iNano: Gerador de CPF';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
