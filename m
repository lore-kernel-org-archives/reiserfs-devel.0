From: Jeremy Allison <jra@samba.org>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 1 Sep 2004 13:26:41 -0700
Message-ID: <20040901202641.GJ4455@legion.cup.hp.com>
References: <Pine.LNX.4.44.0408261011410.27909-100000@chimarrao.boston.redhat.com> <200408261819.59328.vda@port.imtp.ilyichevsk.odessa.ua> <1093789802.27932.41.camel@localhost.localdomain> <1093804864.8723.15.camel@lade.trondhjem.org> <20040829193851.GB21873@jeremy1> <20040901201945.GE31934@mail.shareable.org>
Reply-To: Jeremy Allison <jra@samba.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21222-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040901201945.GE31934@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Jeremy Allison <jra@samba.org>, Trond Myklebust <trond.myklebust@fys.uio.no>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, Linus Torvalds <torvalds@osdl.org>, reiser@namesys.com, hch@lst.de, Linux Filesystem Development <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com

On Wed, Sep 01, 2004 at 09:19:45PM +0100, Jamie Lokier wrote:
> Jeremy Allison wrote:
> > (most of the streams in a Word file for instance are quite small)
> 
> Streams in a Word file?

Yep.

> Are you saying that when I copy a .doc file onto my Linux box and off,
> I lose part of a Word document?

Right now no, because when Samba refuses the stream open, Word falls
back into a "tar"-like mode where it linearises the streams into the
data (it's a legacy mode for storing data on a FAT drive, not an NTFS
drive). However, the problem is that no currently supported Microsoft
OS doesn't have streams-capable NTFS support. 

This means that in a future MS-Office revision, this backwards support
may be broken by accident or by design (less likely, Microsoft really
don't do that kind of thing without very high level requests :-) and no
testers at Microsoft will notice (because they only test against MS servers).

Jeremy.
