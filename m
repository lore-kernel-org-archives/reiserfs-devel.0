From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: REISER4 - A simple test with a filesystem and Oracle
Date: Fri, 16 Jan 2004 18:22:10 +0300
Message-ID: <20040116152209.GJ1693@backtop.namesys.com>
References: <20040116145551.GH1693@backtop.namesys.com> <20040116151144.86109.qmail@web21501.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16547-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040116151144.86109.qmail@web21501.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Correnti <paolunix@yahoo.com>
Cc: reiserfs-list@namesys.com

On Fri, Jan 16, 2004 at 07:11:44AM -0800, Paolo Correnti wrote:
> "Alex Zarochentsev" wrote
> 
> > can you try sync(1) and see does it help to recover
> > free space ?
> 
> Of course, but how do you use sync (I mean with what
> option) ?


just /bin/sync, it should force commit of reiser4 transactions  and, thereby, 
free space.

> 
> Just to know, another "strange" data
> 
> When I use df:
> 
> /dev/hda6              3701704   3042088    659616 
> 83% /u01
> 
> Then 
> 
> cd /u01/oradata/pamodb
> du
> 
> 1261200 ./archivelogs
> 4386399 .
> 
> First data (1,2 Gb) is effective, but 4,3 Gb occupated
> on a 3,7 Gb partition is not real, of course.

du(1) counts blocks (default behaviour), not bytes. 

so if two small files share one block in reiser4 du(1) counts 2 blocks 
instead of 1.


> 
> Best regards
>   
> Paolo Correnti
> 
> > >  
> > >  
> > > 
> > > 
> > > __________________________________
> > > Do you Yahoo!?
> > > Yahoo! Hotjobs: Enter the "Signing Bonus"
> > Sweepstakes
> > > http://hotjobs.sweepstakes.yahoo.com/signingbonus
> > 
> > -- 
> > Alex.
> 
> 
> __________________________________
> Do you Yahoo!?
> Yahoo! Hotjobs: Enter the "Signing Bonus" Sweepstakes
> http://hotjobs.sweepstakes.yahoo.com/signingbonus

-- 
Alex.
