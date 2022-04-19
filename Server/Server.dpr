program Server;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  Horse,

  IdSSLOpenSSL;
var
  LPemPath: string;
begin
  ReportMemoryLeaksOnShutdown := True;

  {LPemPath := 'C:\Fontes Sistemas\test\HorseSSL\Server\Files\cert';

  THorse.IOHandleSSL.CertFile := LPemPath + '.crt';
  THorse.IOHandleSSL.KeyFile := LPemPath + '.key';
  THorse.IOHandleSSL.SSLVersions := [sslvSSLv2, sslvSSLv23, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
  THorse.IOHandleSSL.Active := True;}

  THorse
    .Group
    .Prefix('api/v1/HorseSSL')
    .Get('Ping',
    procedure(AReq: THorseRequest; ARes: THorseResponse; ANext: TNextProc)
    begin
      ARes.RawWebResponse.ContentType := 'application/json';
      ARes.RawWebResponse.Content := '{"result":"Pong"}';
    end)
    .Get('Ping1',
    procedure(AReq: THorseRequest; ARes: THorseResponse; ANext: TNextProc)
    begin
      ARes.Send('Pong1');
    end);

  THorse.Listen(9007,
  procedure (Horse: THorse)
  begin
    StrToInt('1');
  end);
end.
