object Form1: TForm1
  Left = 0
  Top = 0
  ClientHeight = 715
  ClientWidth = 1066
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1066
    Height = 715
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Class Information'
      object MemoClasse: TMemo
        Left = 0
        Top = 0
        Width = 1058
        Height = 687
        Align = alClient
        Lines.Strings = (
          'public int Id {get; set;}'
          'public string Descricao {get; set;}'
          'public decimal Preco {get; set;}'
          'public string Uni {get; set;}'
          '')
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Select Fields'
      ImageIndex = 1
      object Label1: TLabel
        Left = 16
        Top = 69
        Width = 22
        Height = 13
        Caption = 'Field'
      end
      object Label2: TLabel
        Left = 288
        Top = 69
        Width = 24
        Height = 13
        Caption = 'Type'
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1058
        Height = 49
        Align = alTop
        TabOrder = 0
        object Label4: TLabel
          Left = 192
          Top = 16
          Width = 59
          Height = 13
          Caption = 'Class Name:'
        end
        object BitBtn1: TBitBtn
          Left = 16
          Top = 8
          Width = 121
          Height = 25
          Caption = 'Load Fields Class'
          TabOrder = 0
          OnClick = BitBtn1Click
        end
        object txtClassName: TEdit
          Left = 257
          Top = 11
          Width = 225
          Height = 21
          TabOrder = 1
        end
      end
      object CboField: TComboBox
        Left = 16
        Top = 88
        Width = 233
        Height = 21
        TabOrder = 1
        OnSelect = CboFieldSelect
      end
      object CboTipo: TComboBox
        Left = 288
        Top = 88
        Width = 233
        Height = 21
        TabOrder = 2
        Text = 'TEXT'
        OnSelect = CboTipoSelect
        Items.Strings = (
          'TEXT'
          'NUMBER'
          'DATE'
          'SELECT'
          'RADIO'
          'CHECK')
      end
      object BitBtn2: TBitBtn
        Left = 16
        Top = 121
        Width = 129
        Height = 25
        Caption = 'Add Field HTML'
        TabOrder = 3
        OnClick = BitBtn2Click
      end
      object pnlChildField: TPanel
        Left = 726
        Top = 55
        Width = 329
        Height = 401
        TabOrder = 4
        Visible = False
        object Label3: TLabel
          Left = 16
          Top = 8
          Width = 53
          Height = 13
          Caption = 'Child Fields'
        end
        object txtChildField: TEdit
          Left = 1
          Top = 35
          Width = 327
          Height = 21
          Align = alBottom
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object memoItensChild: TMemo
          Left = 1
          Top = 81
          Width = 327
          Height = 319
          Align = alBottom
          TabOrder = 1
        end
        object BitBtn3: TBitBtn
          Left = 1
          Top = 56
          Width = 327
          Height = 25
          Align = alBottom
          Caption = 'Add Child Field'
          TabOrder = 2
          OnClick = BitBtn3Click
        end
      end
      object MemoForm: TMemo
        Left = 3
        Top = 168
        Width = 702
        Height = 473
        TabOrder = 5
      end
      object BitBtn4: TBitBtn
        Left = 3
        Top = 647
        Width = 126
        Height = 25
        Caption = 'Copy Form'
        TabOrder = 6
        OnClick = BitBtn4Click
      end
    end
  end
end
