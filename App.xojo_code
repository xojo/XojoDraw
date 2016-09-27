#tag Class
Protected Class App
Inherits IOSApplication
	#tag CompatibilityFlags = TargetIOS
	#tag Event
		Sub Open()
		  // Set up default colors to cycle through
		  Colors.Append(Color.Blue)
		  Colors.Append(Color.Red)
		  Colors.Append(Color.Green)
		  Colors.Append(Color.Cyan)
		  Colors.Append(Color.Magenta)
		  Colors.Append(Color.Yellow)
		  Colors.Append(&cffffff) ' White
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		Colors() As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentColorIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		LineSize As Double = 2
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="CurrentColorIndex"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineSize"
			Group="Behavior"
			InitialValue="2"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
