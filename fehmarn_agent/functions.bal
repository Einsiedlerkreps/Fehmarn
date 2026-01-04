function sendMail(string [] to, string subject, string body) returns gmail:Message|error {
    gmail:MessageRequest requestMessage = {to, subject, bodyInText: body};
    gmail:Message message = check gmailClient->/users/me/messages/send.post(requestMessage);
    return gmailClient->/users
}
