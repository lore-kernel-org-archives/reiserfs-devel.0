From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: REISER4 - A simple test with a filesystem and Oracle
Date: Fri, 16 Jan 2004 18:56:00 +0300
Message-ID: <20040116155600.GK1693@backtop.namesys.com>
References: <20040116152209.GJ1693@backtop.namesys.com> <20040116153914.46777.qmail@web21502.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16549-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040116153914.46777.qmail@web21502.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Correnti <paolunix@yahoo.com>
Cc: reiserfs-list@namesys.com

On Fri, Jan 16, 2004 at 07:39:14AM -0800, Paolo Correnti wrote:
> No results with sync (I mean no changes on free
> space).

that means all trancations are committed already.  

anyway we will re-ckeck reiser4 for existance of space leaks, it is so easy to
add a bug of this kind to reiser4 again ...
  
> 
> But these results are very strange ...
> 
> df
> 
> Filesystem           1K-blocks      Used Available
> Use% Mounted on
> 
> /dev/hda6              3701704   3042028    659676 
> 83% /u01
> 
> du /u01/oradata

what does du -b report ? I hope there are no files with holes...

> 
> 617649  /u01/oradata/archived
> 56774   /u01/oradata/pamodb/archivelogs
> 3192028 /u01/oradata/pamodb              <- !!
> 3809677 /u01/oradata                     <- !!
> 
> Regards
> 
> PC
> 
> 
> 
> __________________________________
> Do you Yahoo!?
> Yahoo! Hotjobs: Enter the "Signing Bonus" Sweepstakes
> http://hotjobs.sweepstakes.yahoo.com/signingbonus

-- 
Alex.
