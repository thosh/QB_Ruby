Sub ExportEmailAndFiles(MyMail As MailItem)

On Error GoTo GotAnError

Dim myMailEntryID As String
Dim outlookNameSpace As Outlook.NameSpace
Dim outlookMail As Outlook.MailItem
Dim attachedFile As Attachment
Dim attachedFileName As String
Dim fileNameArray() As String
Dim fileType As String
Dim filePath As String
Dim extFilePath As String

filePath = "\\C:\Users\tom.shannon\Downloads\"

If UCase$(outlookMail.SenderEmailType) = "EX" Then
		Set recip = outlookNameSpace.CreateRecipient(outlookMail.SenderEmailAddress)
		Set exUser = recip.AddressEntry.GetExchangeUser()
		sAddress = exUser.PrimarySmtpAddress
Else
		sAddress = outlookMail.SenderEmailAddress
End If

extFilePath = filePath & Replace(sAddress,"@", "_") & "\"

If Len(Dir(extFilePath)) = 0 Then
   MkDir extFilePath
End If

Set fileSystemObject = CreateObject("Scripting.FileSystemObject")
Set textFile = fileSystemObject.CreateTextFile(extFilePath & myMailEntryID & "EmailBody.txt", True)

emailBody = outlookMail.Body    
    For i = 0 To 12
    emailBody = Replace(outlookMail.Body, Chr(i), "")
    Next i
    
    For i = 14 To 31
    emailBody = Replace(emailBody, Chr(i), "")
    Next i
    
    For i = 128 To 255
    emailBody = Replace(emailBody, Chr(i), "")
    Next i
    
    For x = 1 To 5
    emailBody = Replace(emailBody, Chr(13) & Chr(10) & Chr(13) & Chr(10), Chr(13) & Chr(10))
    Next x

    If Right(emailBody, 2) = Chr(13) & Chr(10) Then
        emailBody = Left(emailBody, Len(emailBody) - 2)
    End If
		
    If Left(emailBody, 2) = Chr(13) & Chr(10) Then
        emailBody = Right(emailBody, Len(emailBody) - 2)
    End If
		
textFile.WriteLine (sAddress)
textFile.WriteLine (outlookMail.SenderName)
textFile.WriteLine (emailBody)
textFile.Close

If MyMail.Attachments.Count >0 Then
	Set fileSystemObject = CreateObject("Scripting.FileSystemObject")
	Set textFile = fileSystemObject.CreateTextFile(extFilePath & myMailEntryID & "Paperwork.txt", True)
			For Each attachedFile In MyMail.Attachments
					x = x + 1
					fileType = Right(attachedFile.FileName, Len(attachedFile.FileName) - InStr(attachedFile.FileName, "."))
					attachedFileName = Trim(attachedFile.FileName)
					attachedFileName = Replace(attachedFileName, "#", " ")
					attachedFileName = Replace(attachedFileName, ",", " ")
					attachedFileName = Replace(attachedFileName, " ", "_")
					attachedFileName = Format(MyMail.CreationTime, "yyyymmdd_hhnnss_") & " " & x & " " & attachedFileName & "." & fileType
					attachedFile.SaveAsFile ( extFilePath & attachedFileName)
					textFile.WriteLine ("file:" & extFilePath & attachedFileName)
			Next attachedFile
	textFile.Close
End If




GotAnError:
    Set outlookNameSpace = Nothing
    Set outlookMail = Nothing
    Set attachedFile = Nothing
    Exit Sub

End Sub