From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Failed ReiserFS
Date: Fri, 11 Feb 2005 00:03:57 +0300
Message-ID: <200502110003.57166.vitaly@namesys.com>
References: <200502100535.01814.rikjoh@norweb.se> <1108044080.3900.38.camel@tribesman.namesys.com> <200502101927.25189.rikjoh@norweb.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502101927.25189.rikjoh@norweb.se>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rikard Johnels <rikjoh@norweb.se>, reiserfs-list@namesys.com

> > > reiserfsck 3.6.13
> > > I used -S to scan the whole partition, as per man page
> > > A bug heh.. :(
> > > So is there any fix for it?
> >
> > Please try latest reiserfsck.
> > ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.19.tar.gz
>
> Same problem:
>
>  lost+found.c 348 pass_3a_look_for_lost
> look_for_lost: The entry 'lost+found' could not be found in the root
> directory Aborted
>
> This is getting more than frustrating...

would you pack the metadata with 
	debugreiserfs -p <device> | bzip2 -c > <device>-meta.bz2
and provide them for downloading?

-- 
Thanks,
Vitaly Fertman

