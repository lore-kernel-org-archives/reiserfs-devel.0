From: Rikard Johnels <rikjoh@norweb.se>
Subject: Re: Failed ReiserFS
Date: Thu, 10 Feb 2005 19:27:24 +0100
Message-ID: <200502101927.25189.rikjoh@norweb.se>
References: <200502100535.01814.rikjoh@norweb.se> <200502100756.48506.rikjoh@norweb.se> <1108044080.3900.38.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1108044080.3900.38.camel@tribesman.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thursday 10 February 2005 15.01, Vladimir Saveliev wrote:
> Hello
>
> On Thu, 2005-02-10 at 09:56, Rikard Johnels wrote:
> > On Thursday 10 February 2005 07.26, Vladimir Saveliev wrote:
> > > Hello
> > >
> > > On Thu, 2005-02-10 at 07:35, Rikard Johnels wrote:
> > > > Hello all.
> > > > I am new to the list so please have patience with me for maybe asking
> > > > obvious questions.
> > > >
> > > > I tried a recovery as described in the manpages;
> > > >
> > > > talen:~ # reiserfsck --rebuild-tree -S /dev/hdc1
> > > > --logfile /root/reisercheck.logfile
> > >
> > > Why did you use -S?
> > >
> > > > It ran as excpected (i hope) right up until the end where it barfed
> > > > with;
> > > >
> > > > Pass 3a (looking for lost dir/files):
> > > > Looking for lost directories:
> > > > Looking for lost files:
> > > > lost+found.c 348 pass_3a_look_for_lost
> > > > look_for_lost: The entry 'lost+found' could not be found in the root
> > > > directory.
> > > > Aborted
> > > >
> > > > What is wrong?
> > >
> > > You have hit reiserfsck bug.
> > >
> > > > What can i do?
> > >
> > > Which reiserfsck do you have?
> >
> > reiserfsck 3.6.13
> > I used -S to scan the whole partition, as per man page
> > A bug heh.. :(
> > So is there any fix for it?
>
> Please try latest reiserfsck.
> ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.19.tar.gz

Same problem: 

 lost+found.c 348 pass_3a_look_for_lost
look_for_lost: The entry 'lost+found' could not be found in the root directory
Aborted

This is getting more than frustrating...
-- 

         /Rikard

---------------------------------------------------------------
Rikard Johnels          email   : rikjoh@norweb.se
                        Web     : http://www.rikjoh.com/users/rikjoh
                        Mob     : +46 735 05 51 01
                        PGP     : 0x461CEE56
---------------------------------------------------------------
