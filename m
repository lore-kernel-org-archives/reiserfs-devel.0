From: Nicholas Miell <nmiell@comcast.net>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 13:14:50 -0700
Message-ID: <1093810490.2766.8.camel@entropy>
References: <Pine.LNX.4.44.0408272158560.10272-100000@chimarrao.boston.redhat.com>
	 <Pine.LNX.4.58.0408271902410.14196@ppc970.osdl.org>
	 <20040828170515.GB24868@hh.idb.hist.no>
	 <Pine.LNX.4.58.0408281038510.2295@ppc970.osdl.org>
	 <4131074D.7050209@namesys.com>
	 <Pine.LNX.4.58.0408282159510.2295@ppc970.osdl.org>
	 <4131A3B2.30203@namesys.com>
	 <Pine.LNX.4.58.0408291055140.2295@ppc970.osdl.org>
	 <41323436.80007@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21084-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41323436.80007@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Linus Torvalds <torvalds@osdl.org>, Helge Hafting <helgehaf@aitel.hist.no>, Rik van Riel <riel@redhat.com>, Spam <spam@tnonline.net>, Jamie Lokier <jamie@shareable.org>, David Masover <ninja@slaphack.com>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com, Al Viro <viro@parcelfarce.linux.theplanet.co.uk>

On Sun, 2004-08-29 at 12:53, Hans Reiser wrote:
> With your model, can I do:
> 
> cat filenameA/metas/permissions > filenameB/metas/permissions
> 

runat filenameA "cat permissions" | runat filenameB "cat > permissions"

> find / -exec cat {}/permissions \; | grep 4777 | wc -l

find / -exec runat {} "cat permissions" \; | grep 4777 | wc -l

Although, whether or not the kernel exposes file permissions as an
attribute named permissions is up to the filesystem. (And the wrong
thing to do, in my opinion, but that's irrelevant.)

> If yes, then we are talking past each other somehow rather than 
> disagreeing. If metafiles can be opened with both open and openat() in 
> your model, then we are discussing some small detail.

It can be opened by both, but in order to do it via open(2), you need to
fchdir(2) to the attribute directory as returned by openat(2) and then
use a relative pathname.

> I think the answer is no though, in which case you are missing the point 
> of the new design. Is the answer no?
-- 
Nicholas Miell <nmiell@comcast.net>

