From: Bruce <bestb@sympatico.ca>
Subject: Re: Can resize_reiserfs do non-destructive resizing??
Date: Tue, 19 Nov 2002 11:00:58 -0500
Message-ID: <200211191100.58359.bestb@sympatico.ca>
References: <200211180851.54274.bestb@sympatico.ca> <200211191045.35173.bestb@sympatico.ca> <20021119185600.A29078@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12026-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021119185600.A29078@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Excellent!

Seriously, I thought as much; I think it is still under warranty, and I d=
o=20
have a backup, so no great loss.

Thanks for the feedback.

B.

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

