From: Pallavi Dalya <pallavidalya@yahoo.com>
Subject: minor and major locality of key in reiser4
Date: Tue, 28 Dec 2004 11:59:57 +0000 (GMT)
Message-ID: <20041228115957.56981.qmail@web60109.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-636334459-1104235197=:56662"
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-22921-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiser-list mailing <reiserfs-list@namesys.com>

--0-636334459-1104235197=:56662
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

hello,
 
While reading a file we give the name of the file. The semantic layer converts the name into key. The directory plugin item contains the key for the file (which we call a common part). This key is then manipulated by the storage layer to reach the actual offset we want to read and we get the data.
 
But how does the sematic layer converts the name in the key. I found out that the semantic layer makes use of graph and not a tree. But in order to use the graph  atleast the "/" address has to be stored somewhere. In which structure (e.g inode,superblock,..etc) is the address stored. Also the semantic layer is the graph that means it does not make use of the actual tree to find the key from the file name .Again the key for a file is stored in directory pluign or directory item which is stored in the tree. That means the semantic layer has to traverse the tree to get the key. but how can it traverse the tree without a key .This is rather confusing.
 
Basically i want to know what actually the semantic layer does to convert a filename into a key.
 
Regards,
Pallavi


---------------------------------
  Yahoo! Messenger - Communicate instantly..."Ping" your friends today! Download Messenger Now
--0-636334459-1104235197=:56662
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<DIV>hello,</DIV>
<DIV>&nbsp;</DIV>
<DIV>While reading a file we give the name of the file. The semantic layer converts the name into key. The directory plugin item contains the key for the file (which we call a common part). This key is then manipulated by the storage layer to reach the&nbsp;actual offset we want to read and we get the data.</DIV>
<DIV>&nbsp;</DIV>
<DIV>But how does the sematic layer converts the name in the key. I found out that the semantic layer makes use of graph and not a tree.&nbsp;But in order to use the graph&nbsp; atleast the "/" address has to be stored somewhere. In which structure (e.g inode,superblock,..etc) is the address stored. Also the semantic layer is the graph that means it does not make use of the actual tree to find&nbsp;the key from the file name .Again the key for a file is stored in directory pluign or directory item which is stored in the tree. That means the semantic layer has to traverse the tree to get the key. but how can it traverse the tree without a key&nbsp;.This is rather confusing.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Basically i want to know what actually the semantic layer does to convert a filename into a key.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Regards,</DIV>
<DIV>Pallavi</DIV><p><hr size=1><font face="Arial" size="2"> <a href="http://uk.rd.yahoo.com/mail/tagline_messenger/*http://uk.messenger.yahoo.com"><b> 
Yahoo! Messenger</b></a> - Communicate instantly..."Ping" your friends 
today! <a href="http://uk.rd.yahoo.com/mail/tagline_messenger/*http://uk.messenger.yahoo.com/download/index.html"><strong>Download Messenger Now</strong></a></font>
--0-636334459-1104235197=:56662--
