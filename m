From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 19:05:35 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408271902410.14196@ppc970.osdl.org>
References: <Pine.LNX.4.44.0408272158560.10272-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20954-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0408272158560.10272-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@redhat.com>
Cc: Spam <spam@tnonline.net>, Jamie Lokier <jamie@shareable.org>, Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com, Al Viro <viro@parcelfarce.linux.theplanet.co.uk>



On Fri, 27 Aug 2004, Rik van Riel wrote:
> 
> Thing is, there is no way to distinguish between what are
> virtual files and what are actual streams hidden inside a
> file.  You don't know what should and shouldn't be backed
> up...

I think that lack of distinguishing poiwer is more serious for 
directories. The more I think I think about it, the more I wonder whether 
Solaris did things right - having a special operation to "cross the 
boundary".

I suspect Solaris did it that way because it's a hell of a lot easier to 
do it like that, but regardless, it would solve the issue of real 
directories having both real children _and_ the "extra streams".

		Linus
