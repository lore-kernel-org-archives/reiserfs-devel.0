From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: 2.4.20 and data logging
Date: Sat, 21 Dec 2002 13:52:44 +0100
Message-ID: <200212211352.44188.Dieter.Nuetzel@hamburg.de>
References: <200212031238.32403.russell@coker.com.au> <1039707458.2058.2.camel@tiny> <3E0434C8.2050800@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12190-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E0434C8.2050800@mb.tu-ilmenau.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Am Samstag, 21. Dezember 2002 10:30 schrieb Manuel Krause:
> On 12/12/2002 04:47 PM, Chris Mason wrote:
> > On Tue, 2002-12-03 at 17:14, Anders Widman wrote:
> >>>On Tue, 2002-12-03 at 06:38, Russell Coker wrote:
> >>>>How is data logging work going?  Is there a patch for 2.4.20?
> >>>
> >>>I'm trying to sort out a complete fix for the transaction overflow bug
> >>>Philippe hit, but other than that the patches are considered stable.
> >>
> >>Are these complete and working yet?
> >
> > The current status is they are almost ready.  The mmania guys hit a
> > slightly different overflow bug which we've also fixed, and we are
> > waiting on some final testing to say for sure.
>
> Can you, then, please, post it to the list as soon as, err, beta!?
>
> Maybe the recent wishes can be included as well according "data=..."
> ( /proc/fs/reiserfs/ide*(*,*) display, reiserfs-option data=ordered
> mounting / by default again without rootflags=data=ordered neede AND
> finally showing the complete namesys stuff in mount, but that's their
> stuff, of course).

And maybe on top of 2.4.20aa1 (the real SuSE kernel;-), please.

Regards,
	Dieter
