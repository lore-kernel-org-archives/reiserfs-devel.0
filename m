From: Clifford Beshers <clifford.beshers@lindows.com>
Subject: 2 Terabyte install
Date: Thu, 06 May 2004 15:58:07 -0700
Message-ID: <409AC2FF.7080800@lindows.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;boundary="------------030804050508070806020108"
Return-path: <reiserfs-list-return-18516-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs mail-list <Reiserfs-List@namesys.com>

--------------030804050508070806020108
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

What are the current size limitations for disks/partitions/filesystems 
with the following combinations?  My googling has produced inconsistent 
answers.

    { linux 2.4.24, linux 2.6.5 } X { reiserfs3, reiser4 }

We have a new machine with a 3-ware 8 port controller (looks like a scsi 
controller to the system, but actually drives 8 ide drives).  We have 8 
x 300GB drives attached for a total > 2TB.

Our IT guy has been unable to install Linspire on it (linux 2.6.5, 
reiserfs3).  I'm about to go look in more detail, but I thought I'd find 
out what the bounds were for sure.

Thanks,

Cliff

--

This message contains information which may be confidential and privileged. Unless you are the 
addressee (or authorized to receive for the addressee), you may not use, copy or disclose to anyone 
the message or any information contained in the message. If you have received the message in error, 
please advise the sender and delete the message.  Thank you.

--------------030804050508070806020108
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
What are the current size limitations for disks/partitions/filesystems
with the following combinations?&nbsp; My googling has produced inconsistent
answers.<br>
<blockquote>{ linux 2.4.24, linux 2.6.5 } X { reiserfs3, reiser4 }<br>
</blockquote>
We have a new machine with a 3-ware 8 port controller (looks like a
scsi controller to the system, but actually drives 8 ide drives).&nbsp; We
have 8 x 300GB drives attached for a total &gt; 2TB.<br>
<br>
Our IT guy has been unable to install Linspire on it (linux 2.6.5,
reiserfs3).&nbsp; I'm about to go look in more detail, but I thought I'd
find out what the bounds were for sure.<br>
<br>
Thanks,<br>
<br>
Cliff<br>
<BR><PRE>
--

This message contains information which may be confidential and privileged. Unless you are the 
addressee (or authorized to receive for the addressee), you may not use, copy or disclose to anyone 
the message or any information contained in the message. If you have received the message in error, 
please advise the sender and delete the message.  Thank you.
</pre><BR></body>
</html>

--------------030804050508070806020108--

