From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: Reiser4 file recovery
Date: Mon, 10 Oct 2005 11:27:56 -0400
Message-ID: <e692861c0510100827s72d3d119g9b8e881c120d86a5@mail.gmail.com>
References: <434A633C.6030507@darthvader.us>
	 <b14e81f00510100806p7a337ebemec0d193dee57df52@mail.gmail.com>
	 <200510101714.35937.chrivers@iversen-net.dk>
Reply-To: Gregory Maxwell <gmaxwell@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26452-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510101714.35937.chrivers@iversen-net.dk>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Iversen <chrivers@iversen-net.dk>
Cc: reiserfs-list@namesys.com

On 10/10/05, Christian Iversen <chrivers@iversen-net.dk> wrote:

> > I suggest you run Spinrite (grc.com, ~$50 IIRC) on the bad disk from a
> > floppy or CD-ROM in DOS (the program makes images for you in Windows,
> > if you have a working partition, or you can get images from the site
> > IIRC once you've bought a copy) and see how much is recovered
> > (assuming it's just bad sectors or something).  Re-add it to the LVM,
> > recover to a seperate media, and then convert the whole thing to a
> > RAID (maybe via tar?).  I know it's not a free solution, but data
> > recovery is nearly impossible w/o paying in one way, shape, or form.
> > It's easier to have backups.
>
> As usually, Gibson "Research" is skimpy on details, so I'm not entirely s=
ure
> if spinrite is anything more than a disk imager. If not, just use the fre=
e
> (gratis && libre) dd_rescue program instead. It will save you $50.

A decade ago spinright would put the disk into a low level mode where
it could read the ADC output and complete raw sectors... then it
performed something like PRML to recover the data. It was a miracle
worker. Back then, between that and a huge box of spare drives to swap
parts from I was able to recover almost all any dead drive that
crossed my desk.

No clue what spinrite does today, as I doubt that sort of low level
access is still possible, and even if it is, drives have become smart
enough to do a lot of that on their own.
