From: Paolo Correnti <paolunix@yahoo.com>
Subject: Re: REISER4 - A simple test with a filesystem and Oracle
Date: Fri, 16 Jan 2004 11:15:26 -0800 (PST)
Message-ID: <20040116191526.47585.qmail@web21502.mail.yahoo.com>
References: <20040116162055.GL1693@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16554-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040116162055.GL1693@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

Sorry for delay in my answers (I'm at home now ...).

> "df" or "du" ?
 
 du (I made a typing mistake with df)

> what processes were accessing the fs those 5-7 min? 
> oracle was?

Oracle processes only, with no particular activities.
I made also a backup vith Oracle RMAN with data and
backup paths on the same partition and all went fine,
but after having seen good du result.

Next days I'll make the same test with another PC,
kernel 2.6.1 and  a larger reiser4 partition
 
Have a nice week-end

Paolo


__________________________________
Do you Yahoo!?
Yahoo! Hotjobs: Enter the "Signing Bonus" Sweepstakes
http://hotjobs.sweepstakes.yahoo.com/signingbonus
