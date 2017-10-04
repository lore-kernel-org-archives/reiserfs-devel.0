From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Subject: RE: Real status of ReiserFS4?
Date: Wed, 4 Oct 2017 15:46:00 +0000
Message-ID: <F9C551623D2CBB4C9488801D14F864C60154C6C4FE@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C60154C6BE9F@ex-mb1.corp.adtran.com>
 <2027a1de-0aac-97f2-40f0-401e585e38ae@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <2027a1de-0aac-97f2-40f0-401e585e38ae@gmail.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Edward Shishkin' <edward.shishkin@gmail.com>, "'reiserfs-devel@vger.kernel.org'" <reiserfs-devel@vger.kernel.org>

> Basically, it is stable (as of the latest stuff release). However,
> I would recommend reiser4 only for personal needs, not for production
> (corporate use). The latter requires some work to be done in active

Yeah, that was what I was told in the late 90's when I put an early
rev of ReiserFS on a production server with a whopping 75GB of storage.

Eventually, after about the 5 power loss on the system, it corrupted
that partition.  Reiserfs-progs was able to recover it, though.  So,
is this one of those cases where if I put it on a production system it
will work great as long as I don't improperly drop power on it?

I really like the stability of ReiserFS over everything else I've used.

> collaboration with administrators of production systems. Reiser4 has a

I own all of these systems.  Most are built from scratch.

> number of open tickets/bugreports, but all of those problems are hard
> reproducible. Every sophisticated file system has a list of such
> issues, though.

Yeah, hence the question above.

> 
> It is really hard to corrupt a reiser4 partition in a way that fsck
> will refuse to fix it. Nevertheless, I wouldn't recommend to use too
> large partitions. The smaller partition, the larger chances, that I'll
> take a look at it, if any problems with fsck.

I have a back-up copy (actually several back-up copies).  And, this is
data that doesn't change that much, so I can recover fairly easily.

> Also, keep in mind that
> intelligent compression (default mode) is not optimal for large media-
> files (see https://reiser4.wiki.kernel.org/index.php/Reiser4_Howto for
> details).

With a 15TB drive, I'm not worried about compression.  That, IMO, would
be a performance hit anyway.

> 
> Reiser4 is better in all items (performance, features, implementation,
> maintainability, etc) than its predecessor ReiserFS(v3).
> 
> Thanks,
> Edward.

Thanks Edward!  I'll give ReiserFS4 a shot!

Andy

> 
> On 10/04/2017 12:29 AM, ANDY KENNEDY wrote:
> > All,
> >
> > I've searched around on the web a bit and found various folks spouting
> > off about Reiser4 here and there.  I am about to reinstall a system and
> > want to choose the right filesystem.  I read some report about ReiserFS
> > v3 not being multi-thread safe and that ext4 ran circles around it.  I
> > was disappointed at the hanging I was getting on ext4, so switched back
> > to ReiserFS and got more consistent high performance.  I have a power-
> > house system built with a large HW Raid 5 drive and want to reformat
> > and repartition that sucker up.  In your opinion, what is the best
> > filesystem to use right now?  Keeping in mind that I do low-level
> > driver work for my company and am used to hacking around in the kernel,
> > so patching a kernel doesn't frighten me at all.
> >
> > It looks like Reiser4 still isn't in the mainline kernel... which is
> > disappointing to me that we developers also allow political
> > bureaucracy to shadow over potentially better solutions.  So, what is
> > the sate of Reiser4 and should I go with that for my 16-core system,
> > stick with Reiser3, or grab hold to ext4?
> >
> > Thanks for your opinion in advance!
> >
> > Andy
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

