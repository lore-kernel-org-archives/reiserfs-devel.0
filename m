From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: [2.4.18]: Reiserfs: vs-2120: add_save_link: insert_item
	returned -28
Date: Fri, 16 Jan 2004 15:50:13 +0300
Message-ID: <1074257413.2250.53.camel@tribesman.namesys.com>
References: <200401091622.41352.lkml@kcore.org>
	 <4007A54A.3030005@namesys.com>
	 <1074244260.2250.45.camel@tribesman.namesys.com>
	 <200401161229.30831.lkml@kcore.org>  <4007DBC6.4040606@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16539-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4007DBC6.4040606@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Jan De Luyck <lkml@kcore.org>, reiserfs-list@namesys.com

On Fri, 2004-01-16 at 15:40, Hans Reiser wrote:
> Jan De Luyck wrote:
> 
> >On Friday 16 January 2004 10:11, Vladimir Saveliev wrote:
> >  
> >
> >>On Fri, 2004-01-16 at 11:48, Hans Reiser wrote:
> >>    
> >>
> >>>Vladimir Saveliev wrote:
> >>>      
> >>>
> >>>>Hello
> >>>>
> >>>>On Fri, 2004-01-09 at 18:22, Jan De Luyck wrote:
> >>>>        
> >>>>
> >>>>>Hello list,
> >>>>>
> >>>>>Today I discovered I could no longer create files on one of my boxes,
> >>>>>which still runs 2.4.18 (box is too far away to upgrade right now). It
> >>>>>gives me 'disk full' messages.
> >>>>>
> >>>>>The following message is all over my logs since January 3:
> >>>>>
> >>>>>vs-2120: add_save_link: insert_item returned -28
> >>>>>          
> >>>>>
> >>>>This is just a warning. You should be able to free some disk space by
> >>>>removing some files.
> >>>>
> >>>>        
> >>>>
> >>>>>I can't seem to find much on this issue, is this a bug in reiserfs
> >>>>>(which is fixed in a later version)? Is something wrong with the fs
> >>>>>itself?
> >>>>>
> >>>>>Thanks for answers.
> >>>>>
> >>>>>[I'm not subscribed @ reiserfs-list, so please cc me with answers from
> >>>>>that list]
> >>>>>
> >>>>>Jan
> >>>>>          
> >>>>>
> >>>why do we generate this warning?  It should be fixed, yes?
> >>>      
> >>>
> >>Yes
> >>    
> >>
> >
> >Just returning a message that makes sense to people would be nice.
> >
> >Jan
> >
> >  
> >
> there is no need for a warning at all, it is a normal condition, and 
> returning ENOSPACE says all that we should say.

At this case we do not return ENOSPC. Operation which failed due to
ENOSPC was "save link" insertion. The major operation (unlink or
truncate) just continues without "save links". (save link are used to be
able to complete removal of unlinked/truncated files on reboot if they
did not manage to get properly removed/truncated due to unclean
shutdown).



