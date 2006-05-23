From: "Alexey Polyakov" <alexey.polyakov@gmail.com>
Subject: Re: reiser4: first impression (vs xfs and jfs)
Date: Wed, 24 May 2006 01:00:07 +0400
Message-ID: <b5d90b2a0605231400y6cc17c93g59d4d6a577337684@mail.gmail.com>
References: <20060523155102.GB25889@zero>
	 <b5d90b2a0605231213q3857eb6apb0c8525ad3728070@mail.gmail.com>
	 <20060523201712.GD25889@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28670-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060523201712.GD25889@zero>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com

Mine is 2xOpteron280, on a hardware RAID (Adaptec 2010S on 3xSCSI
146Gx15K). It's a heavily loaded web server. It suffers from
write-outs too. I've tested XFS and JFS, and found out that R4 behaves
better after system crash (due to power), and it gives much better
performance.

What I do for my server is:
1) Get vanilla
2) Do patch-o-matic-ng patches (I wonder why those patches are not
included in vanilla)
3) Apply latest available reiser4

Right now it looks like that:

root@titanic [~]# df -Tm
Filesystem    Type   1M-blocks      Used Available Use% Mounted on
/dev/i2o/hda2            reiser4        9504      4488      5016  48% /
/dev/i2o/hda1	         ext3             99        50        44  54% /boot
/dev/i2o/hda3            reiser4       22659     13884      8776  62% /var
/dev/i2o/hda5            reiser4         917        29       889   4% /tmp
/dev/i2o/hda7            reiser4       18135     14140      3995  78% /usr
/dev/i2o/hda6            reiser4       54382     53278      1104  98% /home
/dev/i2o/hda8            reiser4       54382     48583      5799  90% /home2
/dev/i2o/hda9            reiser4      106370     62854     43517  60% /home3

What's the most interesting, I had (and continuing to have) a lot of
hardware crashes. Reiser4 does the best job - XFS would make some
files (created right before the crash) length 0, reiserfs would render
the fs unusable, and ext3 would lose up to 30% of files on a FS.


On 5/24/06, Tom Vier <tmv@comcast.net> wrote:
> It's linux software raid1. 250gigs:
>
> md1 : active raid1 sdd1[1] sdc1[0]
>      262156544 blocks [2/2] [UU]
>
> I should've mentioned:
>
> Linux zero 2.6.16.16r4-2 #2 SMP PREEMPT Thu May 18 23:49:20 EDT 2006 i686
> GNU/Linux
>
> CONFIG_PREEMPT=y
> CONFIG_PREEMPT_BKL=y
>
> It's a dual 2.6ghz opteron box, running an x86 kernel.
>
> On Tue, May 23, 2006 at 11:13:05PM +0400, Alexey Polyakov wrote:
> > what kind of raid do you use? Is it software md, or a hw raid solution?
> > Also, what's the size of your r4 partition?
> >
> > On 5/23/06, Tom Vier <tmv@comcast.net> wrote:
> > >I finally decided to try a few different fs'es on my 250gig raid1. (I use
> > >reiserfs3 most of the time.) Here's some things i noticed, between r4, xfs,
> > >and jfs.
> > >
> > >Both r4 and xfs suffer from io pauses. This is on a dual 2.6ghz opteron,
> > >btw. I don't see high cpu usage, but clock throttling could be screwing up
> > >top's % calcs (tho i think all usage is measured by time, so it shouldn't).
> > >
> > >What i'm doing is rsyncing from a slower drive (on 1394) to the raid1 dev.
> > >When using r4 (xfs behaves similarly), after several seconds, reading from
> > >the source and writing to the destination stops for 3 or 4 seconds, then
> > >brief burst of writes to the r4 fs (the dest), a 1 second pause, and then
> > >reading and periodic writes resume, until it happens again.
> > >
> > >It seems that both r4 and xfs allow a large number of pages to be dirtied,
> > >before queuing them for writeback, and this has a negative effect on
> > >throughput. In my test (rsync'ing ~50gigs of flacs), r4 and xfs are almost
> > >10 minutes slower than jfs.
> > >
> > >One thing that surprised me was, once r4 does write out, it is very fast.
> > >Fast enough that i wasn't sure it was actually writing whole files!
> > >However,
> > >i did a umount; mount and ran cksum, and sure enough, the files were good.
> > >8)
> > >
> > >--
> > >Tom Vier <tmv@comcast.net>
> > >DSA Key ID 0x15741ECE
> > >
> >
> >
> > --
> > Alexey Polyakov
>
> --
> Tom Vier <tmv@comcast.net>
> DSA Key ID 0x15741ECE
>


-- 
Alexey Polyakov
