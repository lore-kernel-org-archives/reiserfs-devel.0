From: Guido Schimmels <__guido__@web.de>
Subject: Re: The argument for fs assistance in handling archives (was:
 silent semantic changes with reiser4)
Date: Fri, 03 Sep 2004 02:01:28 +0000
Sender: __guido__@web.de
Message-ID: <1094176888l.2667l.0l@RoxOS>
References: <20040826150202.GE5733@mail.shareable.org>
	<200408282314.i7SNErYv003270@localhost.localdomain>
	<20040901200806.GC31934@mail.shareable.org>
	<Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org>
	<1094118362.4847.23.camel@localhost.localdomain>
	<20040902203854.GA4801@janus>
	<200409022319.i82NJlTN025039@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-21389-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200409022319.i82NJlTN025039@turing-police.cc.vt.edu> (from
	Valdis.Kletnieks@vt.edu on Fr, Sep 03, 2004 at 01:19:47 +0200)
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: reiserfs-list@namesys.com

Am 03.09.2004 01:19:47 schrieb(en) Valdis.Kletnieks@vt.edu:
> On Thu, 02 Sep 2004 22:38:54 +0200, Frank van Maarseveen said:
> 
> > Can it do this:
> >
> > 	cd FC2-i386-disc1.iso
> > 	ls
> 
> That one's at least theoretically doable, assuming that it really  
> *IS*
> the
> Fedora Core disk and an ISO9660 format...
> 
> > 	cd /dev/cdrom
> > 	ls
> 
> And the CD in the drive at the moment is AC/DC "Back in Black".  What
> should this produce as output?
>

With cdfs (http://www.elis.ugent.be/~ronsse/cdfs/)
you get something like:

track-01.wav  track-03.wav  track-05.wav
track-02.wav  track-04.wav  track-06.wav

This could easily be coupled with cddb for the real titles.
