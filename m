From: Bruce <bestb@sympatico.ca>
Subject: Re: Can resize_reiserfs do non-destructive resizing??
Date: Tue, 19 Nov 2002 10:48:21 -0500
Message-ID: <200211191045.35173.bestb@sympatico.ca>
References: <200211180851.54274.bestb@sympatico.ca> <20021118165344.A14537@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12024-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021118165344.A14537@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I ran "badblocks /dev/hda2" and it produced a list of 39 numbers.

Running the above produced warnings in /var/log/kernel/warnings; the firs=
t was=20
as follows:

Nov 19 09:52:07 desktop kernel: hda: dma_intr: status=3D0x51 { DriveReady=
=20
SeekComplete Error }
Nov 19 09:52:07 desktop kernel: hda: dma_intr: error=3D0x40 { Uncorrectab=
leError=20
}, LBAsect=3D140892, sector=3D140720

And the following in /var/log/kernel/info:

Nov 19 09:52:07 desktop kernel: end_request: I/O error, dev 03:02 (hda),=20
sector 140720

The above errors were repeated a number of times with different sectors.

Bruce

On Monday 18 Nov 2002 8:53 am, Oleg Drokin wrote:
> Hello!
>
> On Mon, Nov 18, 2002 at 08:51:54AM -0500, Bruce wrote:
> > Thanks; I ran
> > =09reiserfsck --rebuild-sb /de/hda2
> > then tried to run
> > =09reiserfsck --rebuild-tree
> > However, running the second came up with:
> > Pass 0:
> > ####### Pass 0 #######
> > Loading on-disk bitmap .. ok, 1837081 blocks marked used
> > Skipping 8373 blocks (super block, journal, bitmaps) 1828708 blocks w=
ill
> > be read
> > 0%                                                      left 1823494,
> > 2607 /sec
> > bread: Cannot read a block # 17599.
>
> Hm, this is a bad sign.
> Try to run badblocks on yor drive.
>
> Is there anything in kernel logs at this time?
>
> Bye,
>     Oleg

