object frmSelPatient: TfrmSelPatient
  Left = 191
  Top = 131
  Width = 870
  Height = 464
  Caption = #24739#32773#20449#24687
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 425
    Align = alLeft
    TabOrder = 0
    object Label1: TLabel
      Left = 30
      Top = 82
      Width = 52
      Height = 13
      Caption = #20986#29983#26085#26399
    end
    object Label2: TLabel
      Left = 30
      Top = 106
      Width = 52
      Height = 13
      Caption = #35777#20214#31867#22411
    end
    object Label3: TLabel
      Left = 56
      Top = 274
      Width = 26
      Height = 13
      Caption = #23130#21542
    end
    object Label4: TLabel
      Left = 56
      Top = 34
      Width = 26
      Height = 13
      Caption = #24615#21035
    end
    object Label5: TLabel
      Left = 24
      Top = 407
      Width = 143
      Height = 13
      Caption = #9678#34920#31034#35813#39033#25903#25345#22238#36710#25628#32034
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object LabeledEdit1: TLabeledEdit
      Left = 85
      Top = 6
      Width = 100
      Height = 21
      EditLabel.Width = 53
      EditLabel.Height = 13
      EditLabel.Caption = #22995#21517'('#9678')'
      LabelPosition = lpLeft
      TabOrder = 0
      OnKeyDown = LabeledEdit1KeyDown
    end
    object LabeledEdit3: TLabeledEdit
      Left = 85
      Top = 54
      Width = 100
      Height = 21
      EditLabel.Width = 26
      EditLabel.Height = 13
      EditLabel.Caption = #24180#40836
      LabelPosition = lpLeft
      TabOrder = 2
      OnExit = LabeledEdit3Exit
    end
    object LabeledEdit6: TLabeledEdit
      Left = 85
      Top = 126
      Width = 100
      Height = 21
      EditLabel.Width = 79
      EditLabel.Height = 13
      EditLabel.Caption = #35777#20214#21495#30721'('#9678')'
      LabelPosition = lpLeft
      TabOrder = 5
      OnKeyDown = LabeledEdit1KeyDown
    end
    object LabeledEdit7: TLabeledEdit
      Left = 85
      Top = 150
      Width = 100
      Height = 21
      EditLabel.Width = 79
      EditLabel.Height = 13
      EditLabel.Caption = #35786#30103#21345#21495'('#9678')'
      LabelPosition = lpLeft
      TabOrder = 6
      OnKeyDown = LabeledEdit1KeyDown
    end
    object LabeledEdit8: TLabeledEdit
      Left = 85
      Top = 198
      Width = 100
      Height = 21
      EditLabel.Width = 26
      EditLabel.Height = 13
      EditLabel.Caption = #20303#22336
      LabelPosition = lpLeft
      TabOrder = 7
    end
    object LabeledEdit9: TLabeledEdit
      Left = 85
      Top = 222
      Width = 100
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #24037#20316#21333#20301
      LabelPosition = lpLeft
      TabOrder = 8
    end
    object LabeledEdit10: TLabeledEdit
      Left = 85
      Top = 246
      Width = 100
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #24037#20316#22320#22336
      LabelPosition = lpLeft
      TabOrder = 9
    end
    object LabeledEdit12: TLabeledEdit
      Left = 85
      Top = 294
      Width = 100
      Height = 21
      EditLabel.Width = 26
      EditLabel.Height = 13
      EditLabel.Caption = #31821#36143
      LabelPosition = lpLeft
      TabOrder = 11
    end
    object LabeledEdit13: TLabeledEdit
      Left = 85
      Top = 318
      Width = 100
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #32852#31995#30005#35805
      LabelPosition = lpLeft
      TabOrder = 12
    end
    object LabeledEdit14: TLabeledEdit
      Left = 85
      Top = 342
      Width = 100
      Height = 21
      EditLabel.Width = 26
      EditLabel.Height = 13
      EditLabel.Caption = #22791#27880
      LabelPosition = lpLeft
      TabOrder = 13
    end
    object BitBtn1: TBitBtn
      Left = 85
      Top = 368
      Width = 100
      Height = 25
      Caption = #20445#23384#24739#32773#20449#24687
      TabOrder = 14
      OnClick = BitBtn1Click
    end
    object DateTimePicker1: TDateTimePicker
      Left = 85
      Top = 78
      Width = 100
      Height = 21
      Date = 44314.668484467590000000
      Time = 44314.668484467590000000
      TabOrder = 3
    end
    object ComboBox1: TComboBox
      Left = 85
      Top = 102
      Width = 100
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      OnKeyDown = ComboBox1KeyDown
    end
    object ComboBox2: TComboBox
      Left = 85
      Top = 270
      Width = 100
      Height = 21
      ItemHeight = 13
      TabOrder = 10
      OnKeyDown = ComboBox2KeyDown
    end
    object ComboBox3: TComboBox
      Left = 85
      Top = 30
      Width = 100
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnKeyDown = ComboBox3KeyDown
    end
    object LabeledEdit2: TLabeledEdit
      Left = 85
      Top = 174
      Width = 100
      Height = 21
      EditLabel.Width = 79
      EditLabel.Height = 13
      EditLabel.Caption = #21307#20445#21345#21495'('#9678')'
      LabelPosition = lpLeft
      TabOrder = 15
      OnKeyDown = LabeledEdit1KeyDown
    end
  end
  object Panel2: TPanel
    Left = 201
    Top = 0
    Width = 653
    Height = 425
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 49
      Width = 651
      Height = 375
      Align = alClient
      DataSource = DataSource1
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 651
      Height = 48
      Align = alTop
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -24
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label6: TLabel
        Left = 374
        Top = 32
        Width = 124
        Height = 13
        Caption = #27880':'#21452#20987#24739#32773#36827#34892#36873#25321
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 80
        Height = 46
        Hint = #21452#20987','#12304#20462#25913#12305#29366#24577#21464#20026#12304#26032#22686#12305#29366#24577
        Align = alLeft
        Caption = #26032#22686
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -24
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = Panel4DblClick
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = MyQuery1
    Left = 313
    Top = 136
  end
  object MyQuery1: TUniQuery
    AfterOpen = MyQuery1AfterOpen
    Left = 281
    Top = 136
  end
  object DosMove1: TDosMove
    Active = True
    Left = 353
    Top = 136
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 385
    Top = 136
    object N1: TMenuItem
      Caption = #20462#25913#24739#32773#20449#24687
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #21024#38500#24739#32773#20449#24687
      OnClick = N3Click
    end
  end
  object MyConnection1: TUniConnection
    Left = 249
    Top = 136
  end
end
