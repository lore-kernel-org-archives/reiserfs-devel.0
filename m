From: viro@parcelfarce.linux.theplanet.co.uk
Subject: Re: silent semantic changes with reiser4
Date: Sat, 28 Aug 2004 20:45:26 +0100
Sender: <viro@www.linux.org.uk>
Message-ID: <20040828194526.GL21964@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.44.0408272158560.10272-100000@chimarrao.boston.redhat.com> <Pine.LNX.4.58.0408271902410.14196@ppc970.osdl.org> <20040828170515.GB24868@hh.idb.hist.no> <Pine.LNX.4.58.0408281038510.2295@ppc970.osdl.org> <20040828182954.GJ21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408281132480.2295@ppc970.osdl.org> <20040828185613.GK21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408281201290.2295@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21019-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0408281201290.2295@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>
Cc: Helge Hafting <helgehaf@aitel.hist.no>, Rik van Riel <riel@redhat.com>, Spam <spam@tnonline.net>, Jamie Lokier <jamie@shareable.org>, Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com

On Sat, Aug 28, 2004 at 12:16:47PM -0700, Linus Torvalds wrote:
> So if we do support it, I think we should just make the attribute point
> look exactly like a normal directory, since that path would work as-is. If
> we don't support it (and at directory points), we might want to just
> consider it a special root.
> 
> NOTE! Anybody who tries to use the "getcwd()" string as a real path is 
> already broken - you have pathname permissions that may not make it 
> possible to look up the path you see.

OK, forget getcwd().  What does lookup of .. do from that point?  *Especially*
for stuff you've got from regular files.  That's the decision that needs to
be made.
