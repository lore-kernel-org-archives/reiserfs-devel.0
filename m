From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfsck --rebuild-tree all-in-one problem.
Date: Tue, 28 Mar 2006 16:19:57 +0400
Message-ID: <1143548397.23834.124.camel@tribesman.namesys.com>
References: <1143546486-3dd48ed32be0d4559e2fd9e4f239038e@vitou.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28375-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1143546486-3dd48ed32be0d4559e2fd9e4f239038e@vitou.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitold Kapshitzer <vitold@vitou.com>
Cc: reiserfs-list@namesys.com

Hello

On Tue, 2006-03-28 at 13:48 +0200, Vitold Kapshitzer wrote:
> Hello,
> 
> I'm trying to do a rebuild-tree for days now, it seams that I've got the same probleme above. The server didn't hang when the error accured. I've turned on the monitor on the morning and have seen that the disk got full (was about 120Go free, 650Go total), the root disk is also reiserfs but is ok, reiserfsck(3.6.19) told me that I need to run reiserfsck with the rebuild-tree option but it never ended. Only my LVM logical disk is now unmountable.
> 
> I am using gentoo, and I've already tried to recompile reiserfsprogs,  but unfortunatly, same result.
> 

I am told that this problem might be fixed already. Would you try
ftp://ftp.namesys.com/pub/tmp/reiserfsprogs-3.6.20.tar.gz, please?

> Thanks
> 
> Vitold
> 
> on Sunday 02 February 2003 21:33, Brian Chu wrote:
> > Hello.
> >
> >     Last friday when I went to upgrade my server, I noticed that there had
> > been a lot of kernel messages on my server that were saying that one
> > partition was spewing this:
> >
> > Jan  5 13:48:14 simmy kernel: hde: dma_intr: status=0x51 { DriveReady
> > SeekComplete Error }
> > Jan  5 13:48:14 simmy kernel: hde: dma_intr: error=0x40 {
> > UncorrectableError }, LBAsect=91887, high=0, low=91887, sector=91824
> > Jan  5 13:48:14 simmy kernel: end_request: I/O error, dev 21:01 (hde),
> > sector 91824
> > Jan  5 13:48:14 simmy kernel: vs-13070: reiserfs_read_inode2: i/o failure
> > occurred trying to find stat data of [7495 7710 0x0 SD]
> >
> >     I gave up that night, because running dd once took 7 hours and
> > reiserfsck twice took 2 hours each, so the whole day was wasted.  I had
> > read on the first time I ran --rebuild-tree that a "dd_rescue" was
> > suggested, so I downloaded it, installed it, and ran it again (since I had
> > used just plain dd the first time). I'm not sure if that made a difference
> > or not.
> 
> Right, dd seems to produce an output with just skipped bad blocks not writing 
> anything into the output.
> 
> >     Today I started again, assuming that with dd_rescue, I would have a
> > greater chance of getting the filesystem recovered, but --check told me I
> > had to run --rebuild-tree, and this time I just did --logfile /dev/null,
> > because screen dumps during the run would make it impossible to see what's
> > going on. But again, it stopped again at the same place- Pass 2. Since the
> > logfiles spit so much STUFF out, I have none at the moment (I can remake
> > them if needed).
> >
> > Screen dump:
> >
> > Pass 2:
> > 0%....20%....40%..                                              left 36, 0
> > /sec
> >
> >     And it stops there. top indicates reiserfsck is using all of the cpu
> > cycles, even after it seemingly freezes.
> 
> Looks like you built the reiserfsck on another mashine. Could you rebuild it 
> on the same mashine you run it. It is possible to suppress the logfile with 
> -n option, but I think the logfile was so big due to this endless loop.
> 

