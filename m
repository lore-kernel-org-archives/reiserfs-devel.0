From: Jamie Lokier <jamie@shareable.org>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 1 Sep 2004 21:25:49 +0100
Message-ID: <20040901202549.GF31934@mail.shareable.org>
References: <Pine.LNX.4.44.0408261011410.27909-100000@chimarrao.boston.redhat.com> <200408261819.59328.vda@port.imtp.ilyichevsk.odessa.ua> <1093789802.27932.41.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21221-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1093789802.27932.41.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com

Alan Cox wrote:
> On Iau, 2004-08-26 at 16:19, Denis Vlasenko wrote:
> > > Office suites can store a document with embedded images
> > > and spread sheets "easily" by putting the text, the
> > > images and spread sheets all in different file streams.
> > 
> > Kinda far reaching. It's hard to assess whether that is good or bad idea.
> > Can we start small, like putting metadata (e.g. ACLs) into these streams?
> 
> Openoffice does this in user space and the user space vfs code desktops
> use can handle zips so this "just works" already including over NFS,
> unlike a kernel proposed method.

OpenOffice is very sensible, and I agree that a method of handling
document parts that _requires_ kernel support would be foolish.

However, please see my message "The argument for fs assistance in
handling archives" for how kernel support can improve performance of
programs like OpenOffice on large compound documents, while preserving
the sensible behaviour and remaining portable.

-- Jamie
