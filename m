From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: About direntries pointing to nowhere on reiserfs problem in 2.4
Date: Tue, 25 Feb 2003 22:35:59 +0300
Message-ID: <200302252235.59400.vitaly@namesys.com>
References: <20030220175309.A23616@namesys.com> <200302251539.10847.vitaly@namesys.com> <b3gbjr$emu$1@satsuki.furryterror.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12925-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b3gbjr$emu$1@satsuki.furryterror.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

On Tuesday 25 February 2003 21:11, Zygo Blaxell wrote:
> In article <200302251539.10847.vitaly@namesys.com>,
>
> Vitaly Fertman  <vitaly@namesys.com> wrote:
> >Ok, I could try to remove them faster, if you give me the list of these
> >directories - all those messages in logs, and an account on your computer.
>
> Handing out access to this (proprietary) data is probably not worth
> saving 53 hours.  I have pairs of fileservers set up as mirrors of

well, it would be a fast hack, not tested properly, so I would prefere to 
control how it goes with debugger.

> each other.  They're meant to survive one of the machines falling off the
> shelf and breaking all of its disks.  In the best case nobody will notice
> the reiserfsck, and in the worst case I'll have to abort the reiserfsck
> and live with the dangling direntries for a few more days.  Also, I need
> to schedule a test of the automatic failover this month anyway. ;-)
>
> I was hoping for something along the lines of "if you turn off these
> parts of the kernel code, it will let unlink() work even if it can't
> find an inode."  I'd then boot a kernel modified that way, delete all
> the offending files, then switch back to a regular kernel, which could
> all be done in a single day.
>
> >Hm, fix-fixable works faster usually.
>
> It does!  You should see how long --rebuild-tree takes!  ;-)

there is one known bottleneck with objectid map on semantic rebuild pass 
and I will improve it as when I will have time on it. Other things should 
be profiled.

> >It would be not bad to get the metadata
> >of this partition, and to profile it locally. Although, metadata dump will
> > take some time also. If you have this time on one of your mashins, could
> > you run debugreiserfs -p /dev/xxx | bzip2 -c > xxx.bz2
>
> I did that once many months ago.  It ran out of space after 40 gigabytes
> of .bz2 output, and I never tried it again (and this was with the
> filesystem about 60% full...now it's 90% full).  It looked like it
> had dumped about 30% of the tree data before it died.

oh, looks like you have only a few kilobytes files on it. 

-- 

Thanks,
Vitaly Fertman
