From: Pallavi Dalya <pallavidalya@yahoo.com>
Subject: reading data blocks in reiser4
Date: Thu, 23 Dec 2004 05:52:21 -0800 (PST)
Message-ID: <20041223135221.98517.qmail@web60110.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-646277194-1103809941=:98444"
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-22892-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--0-646277194-1103809941=:98444
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

hello,
 what are the internal operations to read a file in reiser4 ..
i understand that the semantic layer converts the name into key of an object(this key is received from the directory entry) and the storage layer searches for the node in the tree. also all the data of the file is stored in the unformatted leaf and only the tails of the files is stored in the items (the tail policy plugins).  
Also the key leads us to the stat data of a file for accessing the permission of the file and it gives us the offset of the actual data...is this offset a address of the node where the files direct and indirect data is stored ?

what role does a inode play in the complete process?
 
Pallavi


		
---------------------------------
Do you Yahoo!?
 Read only the mail you want - Yahoo! Mail SpamGuard.
--0-646277194-1103809941=:98444
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<DIV>
<DIV>hello,<BR>&nbsp;what are the internal operations to read a file in reiser4 ..</DIV>
<DIV>i understand that the semantic layer converts the name into key of an object(this key is received from the directory entry)&nbsp;and the storage layer searches for the node in the tree. also&nbsp;all the data of the&nbsp;file is stored in the&nbsp;unformatted leaf and only the tails of the files is stored in the items (the tail policy plugins).&nbsp;&nbsp;</DIV>
<DIV>Also the key leads us&nbsp;to the stat data of a file for accessing the permission of the file and it gives us the offset of the actual data...is this offset a address of the node where the files direct and indirect data is stored ?<BR><BR>what role does a inode play in the complete process?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Pallavi</DIV></DIV><p>
		<hr size=1>Do you Yahoo!?<br> 
Read only the mail you want - <a href="http://us.rd.yahoo.com/mail_us/taglines/spamguard/*http://promotions.yahoo.com/new_mail/static/protection.html">Yahoo! Mail SpamGuard</a>.
--0-646277194-1103809941=:98444--
