From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: silent semantic changes with reiser4
Date: Sat, 28 Aug 2004 22:12:39 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408282205170.2295@ppc970.osdl.org>
References: <Pine.LNX.4.44.0408272158560.10272-100000@chimarrao.boston.redhat.com>
 <Pine.LNX.4.58.0408271902410.14196@ppc970.osdl.org> <20040828170515.GB24868@hh.idb.hist.no>
 <Pine.LNX.4.58.0408281038510.2295@ppc970.osdl.org>
 <20040828182954.GJ21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408281132480.2295@ppc970.osdl.org>
 <20040828185613.GK21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408281201290.2295@ppc970.osdl.org>
 <20040828194526.GL21964@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21035-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040828194526.GL21964@parcelfarce.linux.theplanet.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: viro@parcelfarce.linux.theplanet.co.uk
Cc: Helge Hafting <helgehaf@aitel.hist.no>, Rik van Riel <riel@redhat.com>, Spam <spam@tnonline.net>, Jamie Lokier <jamie@shareable.org>, Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com



On Sat, 28 Aug 2004 viro@parcelfarce.linux.theplanet.co.uk wrote:
> 
> OK, forget getcwd().  What does lookup of .. do from that point?  *Especially*
> for stuff you've got from regular files.  That's the decision that needs to
> be made.

I think that will decide on whether we expose attributes through the 
normal namespace or not.

If we do expose them in the normal namespace, then ".." should work the
way the namespace looks: if you do ".." on the "attribute directory" of a
file, you get the directory that the file was in. Ie an old-style 
user-space "getcwd()" would give the right path (well, an old-style 
user-space getcwd() would probably refuse the file on the base that it is 
S_IFREG, but ignoring that..)

If we _don't_ expose it in the normal namespace, we should should either
just error out (logically you'd get the file itself, but I really don't
wan tto have ".." return a non-directory, because _that_ really might
confuse things), or you'd just return the same directory (ie it would be a
"local root" in the namespace you got moved to).

So let's try to be self-consistent with how we expose it in the normal 
namespace.

		Linus
