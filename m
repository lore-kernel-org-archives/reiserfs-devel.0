From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Failed ReiserFS
Date: Mon, 14 Feb 2005 15:06:43 +0300
Message-ID: <200502141506.43506.vitaly@namesys.com>
References: <200502100535.01814.rikjoh@norweb.se> <200502110857.32077.rikjoh@norweb.se> <200502141224.33293.rikjoh@norweb.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502141224.33293.rikjoh@norweb.se>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rikard Johnels <rikjoh@norweb.se>, reiserfs-list@namesys.com

On Monday 14 February 2005 14:24, Rikard Johnels wrote:
> On Friday 11 February 2005 08.57, Rikard Johnels wrote:
> > On Thursday 10 February 2005 22.03, Vitaly Fertman wrote:
> > > > > > reiserfsck 3.6.13
> > > > > > I used -S to scan the whole partition, as per man page
> > > > > > A bug heh.. :(
> > > > > > So is there any fix for it?
> > > > >
> > > > > Please try latest reiserfsck.
> > > > > ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.19.tar.gz
> > > >
> > > > Same problem:
> > > >
> > > >  lost+found.c 348 pass_3a_look_for_lost
> > > > look_for_lost: The entry 'lost+found' could not be found in the root
> > > > directory Aborted
> > > >
> > > > This is getting more than frustrating...
> > >
> > > would you pack the metadata with
> > > 	debugreiserfs -p <device> | bzip2 -c > <device>-meta.bz2
> > > and provide them for downloading?
> >
> > the metadata and reiserfsck log are both available for download.
> >
> > ftp://ftp.rikjoh.com/reisercheck.logfile.bz2
> > ftp://ftp.rikjoh.com/hdc1-meta.bz2
>
> Moved the disks to another computer with a clean install of Linux.
> Reran the --rebuild-tree on that one. And i still get the same error
> "look_for_lost: The entry 'lost+found' could not be found in the root"
> And its the "reiserfs-3.6.13" package.
> Still no luck :(
>
> Why cant it find the /lost+found ?

no problem with your metadata. 
Are you sure you run reiserfsck 3.6.19?
Did you obtain reiserfsprogs-3.6.19 from our ftp site?
Would you check the memory on the computer you run reiserfsck 
on and would you check the harddrive for bad blocks?

-- 
Thanks,
Vitaly Fertman

