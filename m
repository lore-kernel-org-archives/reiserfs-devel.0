From: Jeremy Allison <jra@samba.org>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 12:38:51 -0700
Message-ID: <20040829193851.GB21873@jeremy1>
References: <Pine.LNX.4.44.0408261011410.27909-100000@chimarrao.boston.redhat.com> <200408261819.59328.vda@port.imtp.ilyichevsk.odessa.ua> <1093789802.27932.41.camel@localhost.localdomain> <1093804864.8723.15.camel@lade.trondhjem.org>
Reply-To: Jeremy Allison <jra@samba.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21081-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1093804864.8723.15.camel@lade.trondhjem.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, Linus Torvalds <torvalds@osdl.org>, reiser@namesys.com, hch@lst.de, Linux Filesystem Development <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com

On Sun, Aug 29, 2004 at 02:41:04PM -0400, Trond Myklebust wrote:
> 
> NFSv4 has an OPENATTR call which acts on files to return a filehandle
> that works fine with both READDIR and LOOKUP, so if a VFS interface for
> streams existed, we could code up full support tomorrow.
> As it is, we're having to shoehorn this into the xattr interface. 8-(

Yeah, that's what I'm really trying to avoid for Samba.
We're currently using the xattr interface for DOS attributes,
and soon for NT ACL support, but it doesn't really fit as
a streams interface (no lseek() support) although someone in
HP coded up a test interface to NT streams that map into xattrs
(most of the streams in a Word file for instance are quite
small) - but I really don't want to have to do this :-).

Jeremy.
