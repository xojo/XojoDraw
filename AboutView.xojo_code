#tag IOSView
Begin iosView AboutView
   BackButtonTitle =   ""
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "About Xojo Draw"
   Top             =   0
   Begin iOSLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 1, 1, 170, 
      AutoLayout      =   Label1, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   Label1, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, 
      AutoLayout      =   Label1, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, 
      Enabled         =   True
      Height          =   170.0
      Left            =   20
      LineBreakMode   =   "0"
      LockedInPosition=   False
      Scope           =   2
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   73
      Visible         =   True
      Width           =   280.0
   End
   Begin iOSToolButton GitHubButton
      Caption         =   "GitHub"
      Enabled         =   True
      Height          =   22
      Image           =   "0"
      Image           =   "0"
      Left            =   8
      LockedInPosition=   False
      Scope           =   2
      Top             =   446
      Type            =   "1001"
      Width           =   53.0
   End
   Begin iOSToolButton VideoButton
      Caption         =   "Video"
      Enabled         =   True
      Height          =   22
      Image           =   "0"
      Image           =   "0"
      Left            =   268
      LockedInPosition=   False
      Scope           =   2
      Top             =   446
      Type            =   "1001"
      Width           =   44.0
   End
   Begin iOSToolButton FlexibleSpace
      Caption         =   "Untitled"
      Enabled         =   True
      Height          =   22
      Image           =   "0"
      Image           =   "0"
      Left            =   70
      LockedInPosition=   False
      Scope           =   2
      Top             =   446
      Type            =   "5"
      Width           =   189.0
   End
   Begin iOSImageView LogoImage
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   LogoImage, 8, , 0, False, +1.00, 1, 1, 160, 
      AutoLayout      =   LogoImage, 3, Label1, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   LogoImage, 2, Label1, 2, False, +1.00, 1, 1, 0, 
      AutoLayout      =   LogoImage, 1, Label1, 1, False, +1.00, 1, 1, 0, 
      ContentMode     =   "1"
      Height          =   160.0
      Image           =   "489998335"
      Image           =   "489998335"
      Left            =   20
      LockedInPosition=   False
      Scope           =   2
      Top             =   251
      Visible         =   True
      Width           =   280.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Constant, Name = kAboutText, Type = Text, Dynamic = False, Default = \"Xojo Draw is made with Xojo\x2C a multi-platform development tool that makes it super-easy to create your own iOS apps.\n\nWant to see how Xojo Draw was made\?\n\nUse the buttons below to get the full source code for Xojo Draw on GitHub or watch the short video on the making of Xojo Draw on YouTube.", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events Label1
	#tag Event
		Sub Open()
		  Me.Text = kAboutText
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LogoImage
	#tag Event
		Sub Open()
		  
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
