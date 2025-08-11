object DM: TDM
  Height = 147
  Width = 162
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
    Left = 56
    Top = 56
  end
  object DriverLink: TFDPhysMSSQLDriverLink
    ODBCDriver = 'SQL Server'
    Left = 56
    Top = 16
  end
end
