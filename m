From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Mon, 14 Oct 2002 23:24:14 +0200
Message-ID: <200210142324.14617.Dieter.Nuetzel@hamburg.de>
References: <200210121052.22603.bofh@coker.com.au> <20021014175909.GA10292@tapu.f00f.org> <200210142252.09438.bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11685-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200210142252.09438.bofh@coker.com.au>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Russell Coker <bofh@coker.com.au>, Chris Wedgwood <cw@f00f.org>
Cc: reiserfs-list@namesys.com

Am Montag, 14. Oktober 2002 22:52 schrieb Russell Coker:
> On Mon, 14 Oct 2002 19:59, Chris Wedgwood wrote:
> > On Sat, Oct 12, 2002 at 04:02:03PM -0700, The Amazing Dragon wrote:

[-]

> > At present, you can't get 100MB/s sustained read off any IDE drive I'm
> > aware off, not even for linear-read-out.  You *may* get 50MB/s on a
> > high-end SCSI disk, most IDE drives seem to top out around 30MB/s.
>
> In my tests IDE drives topped out at 30MB/s for sustained reads from the
> start of the drive two years ago, one year ago they were approaching
> 40MB/s.  I haven't tested the latest drives, but I expect them to be
> faster...  Maybe the recently released IDE drives will sustain 50MB/s for
> the first few dozen gigs at least...

Very true, today.
Maxtor, WD, IBM all aroung 45 MB/sec.
W'll see what the next round bring (Maxtor 200-320 GB).

But SCSI is there ~80 MB/sec (Maxtor, IBM) and Fujitsu is at 104/111 MB/sec=
=20
;-)

> > > What astonishes me is that 66MHz 64-bit PCI is *still* confined
> > > exclusively to high end motherboards, when even the low-end
> > > motherboards are struggling against the bandwidth monster.
> >
> > Nope.  Some cheap MB's are 64/66, the Dual Athlon boards for example.
>
> Cheap =3D=3D single CPU.
>
> In a quick web search of some companies I buy from, one sells a single
> dual-CPU motherboard which costs three times as much as the single-CPU
> motherboards (which have become amazingly cheap).  However it'll end up
> costing more because with the lack of choice I'll probably be forced to
> spend more on other things.

Dual Athlon MBs (760MPX, all with 64/66) are aroung 300 =A4 (EUR) here in=20
Germany.

Regards,
	Dieter
