From: Pallavi Dalya <pallavidalya@yahoo.com>
Subject: finding the key in reiser4
Date: Tue, 4 Jan 2005 04:59:07 +0000 (GMT)
Message-ID: <20050104045907.79772.qmail@web60110.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-2118481262-1104814747=:79590"
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-23031-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--0-2118481262-1104814747=:79590
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

hello,
  
    i want to know that given a filename in reiser4 say "/root/abc.txt"
how do u find the key for this file. I am confused in the following two ways:
 
1)Does the complete string that is the "/root/abc.txt" is converted into the key and then we traverse the tree using the key to read the data.
Where the information about converting the name into key is stored? Is there some particular data structure or a way to convert such name directly into key?
 
2)Is the "/" key is first found and then we go to the directory item of the "/" to get the key of "root" and get the key for "abc.txt" and then traverse the tree for abc.txt. For that the "/" directory address should be stored somewhere or it should have a fixed address like in ext2?
 
Pallavi
 
 


---------------------------------
  Yahoo! Messenger - Communicate instantly..."Ping" your friends today! Download Messenger Now
--0-2118481262-1104814747=:79590
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<DIV>hello,</DIV>
<DIV>&nbsp; </DIV>
<DIV>&nbsp;&nbsp;&nbsp; i want to know that given a filename in reiser4 say "/root/abc.txt"</DIV>
<DIV>how do u find the key for this file. I am confused in the following two ways:</DIV>
<DIV>&nbsp;</DIV>
<DIV>1)Does the complete string that is the "/root/abc.txt" is converted into the key and then we traverse the tree using the key to read the data.</DIV>
<DIV>Where the information about converting the name into key is stored? Is there some particular data structure or a way to convert such name directly into key?</DIV>
<DIV>&nbsp;</DIV>
<DIV>2)Is the "/" key is first found and then we go to the directory item of the "/" to get the key of "root" and get the key for "abc.txt" and then traverse the&nbsp;tree for abc.txt. For that the "/" directory address should be stored somewhere or it should have a fixed address like in ext2?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Pallavi</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV><p><hr size=1><font face="Arial" size="2"> <a href="http://uk.rd.yahoo.com/mail/tagline_messenger/*http://uk.messenger.yahoo.com"><b> 
Yahoo! Messenger</b></a> - Communicate instantly..."Ping" your friends 
today! <a href="http://uk.rd.yahoo.com/mail/tagline_messenger/*http://uk.messenger.yahoo.com/download/index.html"><strong>Download Messenger Now</strong></a></font>
--0-2118481262-1104814747=:79590--
