From: Pallavi Dalya <pallavidalya@yahoo.com>
Subject: reading data blocks in reiser4
Date: Thu, 23 Dec 2004 05:51:34 -0800 (PST)
Message-ID: <20041223135134.64223.qmail@web60109.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1992078898-1103809894=:61580"
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-22891-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--0-1992078898-1103809894=:61580
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

hello,
 what are the internal operations to read a file in reiser4 ..
i understand that the semantic layer converts the name into key of an object(this key is received from the directory entry) and the storage layer searches for the node in the tree. also all the data of the file is stored in the unformatted leaf and only the tails of the files is stored in the items (the tail policy plugins).  
Also the key leads us to the stat data of a file for accessing the permission of the file and it gives us the offset of the actual data...is this offset a address of the node where the files direct and indirect data is stored ?

what role does a inode play in the complete process?
 
Pallavi

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
--0-1992078898-1103809894=:61580
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<DIV>hello,<BR>&nbsp;what are the internal operations to read a file in reiser4 ..</DIV>
<DIV>i understand that the semantic layer converts the name into key of an object(this key is received from the directory entry)&nbsp;and the storage layer searches for the node in the tree. also&nbsp;all the data of the&nbsp;file is stored in the&nbsp;unformatted leaf and only the tails of the files is stored in the items (the tail policy plugins).&nbsp;&nbsp;</DIV>
<DIV>Also the key leads us&nbsp;to the stat data of a file for accessing the permission of the file and it gives us the offset of the actual data...is this offset a address of the node where the files direct and indirect data is stored ?<BR><BR>what role does a inode play in the complete process?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Pallavi</DIV><p>__________________________________________________<br>Do You Yahoo!?<br>Tired of spam?  Yahoo! Mail has the best spam protection around <br>http://mail.yahoo.com 
--0-1992078898-1103809894=:61580--
