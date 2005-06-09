From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: My reiserfs module crash...
Date: Thu, 9 Jun 2005 12:16:51 +0400
Message-ID: <200506091216.52275.vitaly@namesys.com>
References: <1117205926.7083.189.camel@tribesman.namesys.com> <200505271917.31290.vitaly@namesys.com> <42A7F740.1000104@euphorik.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24354-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42A7F740.1000104@euphorik.ch>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Greg Burri <greg@euphorik.ch>

On Thursday 09 June 2005 12:01, Greg Burri wrote:
> Vitaly wrote:
> 
> >>Hi !
> >>I have done "debugreiserfs -p" to collect metadata .. .I take me about 
> >>15 hours but its ok.
> >>I have put the file here :
> >>http://www.euphorik.ch/boardel/debugreiserfs_metadata.bz2 (23Mo)
> >>    
> >>
> >
> >unfortunately I have failed to unpack metadata, they got corrupted 
> >somehow, but I see at least that fs is not consistent and you need 
> >to run
> >	reiserfsck --rebuild-tree -l logfile <device>
> >to fix it.
> >
> >there is also a problem with reiserfs module crash on mounting 
> >such a partition, we are working on the fix.
> > 
> >  
> >
> >>I wish that someone can help me, I don't want to loose all my data :'(
> >>
> >>bye !
> >>Thanks by advance
> >>
> >>Greg Burri
> >>    
> >>
> >
> >
> >
> >  
> >
> Re Hi !
> I have try this command for three times but It doesn't work.
> #>reiserfsck --rebuild-tree -l logfile /dev/sda1
> 
> When I try to mount my partition after the reiserfsck the same problem 
> occure.
> I have put the logs here with a screen dump for the third try :

is the screen dump the same for all 3 times?

> http://www.euphorik.ch/boardel/reiserfsck_rebuild_log_1.txt
> http://www.euphorik.ch/boardel/reiserfsck_rebuild_log_2.txt
> http://www.euphorik.ch/boardel/reiserfsck_rebuild_log_3.txt
> http://www.euphorik.ch/boardel/reiserfsck_screendump_3.txt

looks like a hardware problem, problably memory.

> I think, maybe I'll format my partition, I'm a bit desperate :/
>
> bye !
> 
> Greg Burri
> 
> 
> 
> 

-- 
Thanks,
Vitaly Fertman
