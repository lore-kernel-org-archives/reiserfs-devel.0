From: Bruce <bestb@sympatico.ca>
Subject: Re: Can resize_reiserfs do non-destructive resizing??I
Date: Tue, 19 Nov 2002 11:14:19 -0500
Message-ID: <200211191114.19429.bestb@sympatico.ca>
References: <200211180851.54274.bestb@sympatico.ca> <200211191045.35173.bestb@sympatico.ca> <20021119185600.A29078@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12028-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021119185600.A29078@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I am guessing that, given the bad sectors on this hard drive, I should ne=
ver=20
have attempted to resize the partition. To prevent this in the future, wo=
uld=20
it make sense for whatever program is doing the resizing to do some kind =
of=20
disk test first, and give a suitable warning if bad sectors are found?

I don't know enough about the actual process, but I am guessing it may be=
=20
worth filing a bug/issue/feature request for this. Would this be best fil=
ed=20
for reiserfs_resize?? Diskdrake?? Something else??

Bruce

On Tuesday 19 Nov 2002 10:56 am, Oleg Drokin wrote:
> Hello!
>
> On Tue, Nov 19, 2002 at 10:48:21AM -0500, Bruce wrote:
> > I ran "badblocks /dev/hda2" and it produced a list of 39 numbers.
> > Nov 19 09:52:07 desktop kernel: hda: dma_intr: status=3D0x51 { DriveR=
eady
> > SeekComplete Error }
>
> Well, that means that your hard drive is failing and reiserfs cannot re=
ad
> some of the data because of bad sectors.
>
> Bye,
>     Oleg

