#tag IOSView
Begin iosView PenSizeView
   BackButtonTitle =   ""
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "Select Pen Size"
   Top             =   0
   Begin iOSSlider PenSizeSlider
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   PenSizeSlider, 1, <Parent>, 1, False, +1.00, 1, 1, 50, 
      AutoLayout      =   PenSizeSlider, 2, <Parent>, 2, False, +1.00, 1, 1, -50, 
      AutoLayout      =   PenSizeSlider, 8, , 0, True, +1.00, 1, 1, 23, 
      AutoLayout      =   PenSizeSlider, 3, Label1, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      Enabled         =   True
      Height          =   23.0
      Left            =   50
      LockedInPosition=   False
      MaxValue        =   50.0
      MinValue        =   2.0
      Scope           =   0
      Top             =   130
      Value           =   2.0
      Visible         =   True
      Width           =   220.0
   End
   Begin iOSCanvas PenCanvas
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   PenCanvas, 8, , 0, False, +1.00, 1, 1, 55, 
      AutoLayout      =   PenCanvas, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, 
      AutoLayout      =   PenCanvas, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, 
      AutoLayout      =   PenCanvas, 3, PenSizeSlider, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      Height          =   55.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Top             =   161
      Visible         =   True
      Width           =   280.0
   End
   Begin iOSLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 1, 1, 49, 
      AutoLayout      =   Label1, 1, <Parent>, 1, False, +1.00, 1, 1, 20, 
      AutoLayout      =   Label1, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, 
      AutoLayout      =   Label1, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      Enabled         =   True
      Height          =   49.0
      Left            =   20
      LineBreakMode   =   "0"
      LockedInPosition=   False
      Scope           =   2
      Text            =   "Use the Slider to change the size of the drawing pen."
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   73
      Visible         =   True
      Width           =   280.0
   End
   Begin iOSTable ColorTable
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ColorTable, 1, <Parent>, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   ColorTable, 2, <Parent>, 2, False, +1.00, 1, 1, 0, 
      AutoLayout      =   ColorTable, 3, Label2, 4, False, +1.00, 2, 1, *kStdControlGapV, 
      AutoLayout      =   ColorTable, 4, <Parent>, 4, False, +1.00, 1, 1, -*kStdGapCtlToViewV, 
      EditingEnabled  =   False
      EditingEnabled  =   False
      EstimatedRowHeight=   -1
      Format          =   "0"
      Height          =   198.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   2
      SectionCount    =   0
      Top             =   262
      Visible         =   True
      Width           =   320.0
   End
   Begin iOSLabel Label2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label2, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Label2, 1, Label1, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Label2, 2, Label1, 2, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Label2, 3, PenCanvas, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LineBreakMode   =   "0"
      LockedInPosition=   False
      Scope           =   2
      Text            =   "Select the pen color:"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   224
      Visible         =   True
      Width           =   280.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  // Start the slider at the current line size
		  PenSizeSlider.Value = App.LineSize
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events PenSizeSlider
	#tag Event
		Sub ValueChanged()
		  // Set the drawing line size to the slider value
		  App.LineSize = Me.Value
		  PenCanvas.Invalidate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PenCanvas
	#tag Event
		Sub Paint(g As iOSGraphics)
		  // Draw a sample of the line in the selected size
		  g.FillColor = App.Colors(App.CurrentColorIndex)
		  g.LineColor = App.Colors(App.CurrentColorIndex)
		  g.LineWidth = App.LineSize
		  g.DrawLine(10, g.Height / 2, g.Width - 10, g.Height / 2)
		  
		  // Draw a black border around the line, which is useful
		  // to see the size of the white line color.
		  g.LineColor = &c000000
		  g.LineWidth = 1
		  g.DrawRect(10, (g.Height - App.LineSize) / 2, g.Width - 20, App.LineSize) 
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ColorTable
	#tag Event
		Sub Open()
		  // Add the colors to the table for selection.
		  Me.AddSection("")
		  
		  For i As Integer = 0 To App.Colors.Ubound
		    // Create a rectangle that fills the entire row
		    Dim colorPic As New iOSBitmap(Self.ContentSize.Width + 10, 48, 1.0)
		    Dim g As iOSGraphics = colorPic.Graphics
		    g.FillColor = App.Colors(i)
		    g.FillRect(10, 10, g.Width - 20, g.Height - 20)
		    
		    // Draw a black border around the line, which is useful
		    // to see the size of the white line color.
		    g.LineColor = &c000000
		    g.LineWidth = 1
		    g.DrawRect(10, 10, g.Width - 20, g.Height - 20) 
		    
		    Dim cell As iOSTableCellData = Me.CreateCell
		    cell.Image = colorPic.Image
		    Me.AddRow(0, cell)
		  Next
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action(section As Integer, row As Integer)
		  // Set the selected color based on the row index
		  App.CurrentColorIndex = row
		  PenCanvas.Invalidate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackButtonTitle"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="NavigationBarVisible"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Group="Behavior"
		Type="iOSImage"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabTitle"
		Group="Behavior"
		Type="Text"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
