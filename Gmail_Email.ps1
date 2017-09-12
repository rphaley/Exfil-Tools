function Send-ToEmail([string]$email, [string]$attachmentpath, [string]$Username, [string]$Password){$message = new-object Net.Mail.MailMessage;
    $message.From = $email;
    $message.To.Add($email);
    $message.Subject = "Logs from " + $env:USERNAME;
    $message.Body = "Some logs...";
    $attachment = New-Object Net.Mail.Attachment($attachmentpath);
    $message.Attachments.Add($attachment);

    $smtp = new-object Net.Mail.SmtpClient("smtp.gmail.com", "587");
    $smtp.EnableSSL = $true;
    $smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);
    $smtp.send($message);
    write-host "Mail Sent" ; 
    $attachment.Dispose();
 }
