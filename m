From: Pallavi Dalya <pallavidalya@yahoo.com>
Subject: minor and major locality of key in reiser4
Date: Mon, 27 Dec 2004 10:12:24 +0000 (GMT)
Message-ID: <20041227101224.12746.qmail@web60107.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-437399205-1104142344=:9891"
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-22907-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiser-list mailing <reiserfs-list@namesys.com>

--0-437399205-1104142344=:9891
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

hello,
      The tree in reiser4 is fully ordered by a key. What information do we  aggregate in the key so that later the information can be segregated from it. What is minor and major locality packing of the key.
 
The key is defined as
 
union reiser4_key{
 
d64 el[KEY_LAST_INDEX];
int pad;
};
 
Its specified that KEY_LAST_INDEX has the value of three. Where is this defined.
 
 
Pallavi


---------------------------------
  Yahoo! Messenger - Communicate instantly..."Ping" your friends today! Download Messenger Now
--0-437399205-1104142344=:9891
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<DIV>hello,</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The tree in reiser4 is fully ordered by a key. What information do we&nbsp; aggregate in the key so that later the information can be segregated from it. What is minor and major locality packing of the key.</DIV>
<DIV>&nbsp;</DIV>
<DIV>The key is defined as</DIV>
<DIV>&nbsp;</DIV>
<DIV>union reiser4_key{</DIV>
<DIV>&nbsp;</DIV>
<DIV>d64 el[KEY_LAST_INDEX];</DIV>
<DIV>int pad;</DIV>
<DIV>};</DIV>
<DIV>&nbsp;</DIV>
<DIV>Its specified that KEY_LAST_INDEX has the value of three. Where is this defined.</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>Pallavi</DIV><p><hr size=1><font face="Arial" size="2"> <a href="http://uk.rd.yahoo.com/mail/tagline_messenger/*http://uk.messenger.yahoo.com"><b> 
Yahoo! Messenger</b></a> - Communicate instantly..."Ping" your friends 
today! <a href="http://uk.rd.yahoo.com/mail/tagline_messenger/*http://uk.messenger.yahoo.com/download/index.html"><strong>Download Messenger Now</strong></a></font>
--0-437399205-1104142344=:9891--
