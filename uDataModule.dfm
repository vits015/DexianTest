object DM: TDM
  Height = 480
  Width = 640
  object FDConnection: TFDConnection
    ConnectionName = 'Connection'
    Params.Strings = (
      'SERVER=VITOR-PC\SQLEXPRESS'
      'OSAuthent=Yes'
      'ApplicationName=Enterprise/Architect/Ultimate'
      'Workstation=VITOR-PC'
      'MARS=yes'
      'Database=DexianDB'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 144
    Top = 184
  end
  object DriverLink: TFDPhysMSSQLDriverLink
    ODBCDriver = 'SQL Server'
    Left = 144
    Top = 144
  end
end
