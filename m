From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: silent semantic changes with reiser4
Date: Sat, 28 Aug 2004 12:46:10 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408281244340.2295@ppc970.osdl.org>
References: <Pine.LNX.4.44.0408272158560.10272-100000@chimarrao.boston.redhat.com>
 <Pine.LNX.4.58.0408271902410.14196@ppc970.osdl.org> <20040828170515.GB24868@hh.idb.hist.no>
 <Pine.LNX.4.58.0408281038510.2295@ppc970.osdl.org>
 <20040828182954.GJ21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408281132480.2295@ppc970.osdl.org>
 <20040828185613.GK21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408281201290.2295@ppc970.osdl.org> <20040828194129.GA7713@pclin040.win.tue.nl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21020-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040828194129.GA7713@pclin040.win.tue.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andries Brouwer <aebr@win.tue.nl>
Cc: viro@parcelfarce.linux.theplanet.co.uk, Helge Hafting <helgehaf@aitel.hist.no>, Rik van Riel <riel@redhat.com>, Spam <spam@tnonline.net>, Jamie Lokier <jamie@shareable.org>, Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com



On Sat, 28 Aug 2004, Andries Brouwer wrote:
> 
> If I see it correctly, you want to group a file and some
> ancillary files together.
> 
> The Unix way would be to make a directory and put them all there:
> 	xterm/xterm
> 	xterm/xterm.icon
> 
> But you are unsatisfied and want
> 	xterm
> 	xterm/xterm.icon
> 
> As long as we agree that the latter really means the former,
> there are no problems in finding out what should happen.
> 
> The conclusion is, that a directory carries an additional bit
> that says "if I am opened as a regular file then use the file
> of the same name inside".
> 
> Now there is no attribute space, just a shorthand.

It's more than a shorthand, though. _Much_ more.

There's the small issue of atomicity and locking.

There's the small issue of hardlinks.

Both of those are why it would need special support.

		Linus
