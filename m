From: Paolo Correnti <paolunix@yahoo.com>
Subject: Re: REISER4 - A simple test with a filesystem and Oracle
Date: Fri, 16 Jan 2004 07:39:14 -0800 (PST)
Message-ID: <20040116153914.46777.qmail@web21502.mail.yahoo.com>
References: <20040116152209.GJ1693@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16548-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040116152209.GJ1693@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

No results with sync (I mean no changes on free
space).

But these results are very strange ...

df

Filesystem           1K-blocks      Used Available
Use% Mounted on

/dev/hda6              3701704   3042028    659676 
83% /u01

du /u01/oradata

617649  /u01/oradata/archived
56774   /u01/oradata/pamodb/archivelogs
3192028 /u01/oradata/pamodb              <- !!
3809677 /u01/oradata                     <- !!

Regards

PC



__________________________________
Do you Yahoo!?
Yahoo! Hotjobs: Enter the "Signing Bonus" Sweepstakes
http://hotjobs.sweepstakes.yahoo.com/signingbonus
