From: Paul Jakma <paul@clubi.ie>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 01:46:53 +0100 (IST)
Message-ID: <Pine.LNX.4.61.0408290141560.2441@fogarty.jakma.org>
References: <Pine.LNX.4.44.0408272158560.10272-100000@chimarrao.boston.redhat.com>
 <Pine.LNX.4.58.0408271902410.14196@ppc970.osdl.org> <20040828170515.GB24868@hh.idb.hist.no>
 <Pine.LNX.4.58.0408281038510.2295@ppc970.osdl.org>
 <20040828182954.GJ21964@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0408281132480.2295@ppc970.osdl.org>
 <20040828185613.GK21964@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21033-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040828185613.GK21964@parcelfarce.linux.theplanet.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: viro@parcelfarce.linux.theplanet.co.uk
Cc: Linus Torvalds <torvalds@osdl.org>, Helge Hafting <helgehaf@aitel.hist.no>, Rik van Riel <riel@redhat.com>, Spam <spam@tnonline.net>, Jamie Lokier <jamie@shareable.org>, Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com

On Sat, 28 Aug 2004 viro@parcelfarce.linux.theplanet.co.uk wrote:

> OK, let me restate the question - what do we get from pwd if we do
> fchdir() to such beast?

On solaris: ENOTDIR from getcwd(), with 'pwd' executed inside a shell 
started with runat.

.. entry exists, but doesnt lead anywhere, cd .. returning ENOTDIR 
too.

regards,
-- 
Paul Jakma	paul@clubi.ie	paul@jakma.org	Key ID: 64A2FF6A
Fortune:
If you didn't get caught, did you really do it?
