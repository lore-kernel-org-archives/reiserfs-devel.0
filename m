From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 14:41:04 -0400
Sender: Trond Myklebust <trondmy@trondhjem.org>
Message-ID: <1093804864.8723.15.camel@lade.trondhjem.org>
References: <Pine.LNX.4.44.0408261011410.27909-100000@chimarrao.boston.redhat.com>
	 <200408261819.59328.vda@port.imtp.ilyichevsk.odessa.ua>
	 <1093789802.27932.41.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21077-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093789802.27932.41.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, Linus Torvalds <torvalds@osdl.org>, reiser@namesys.com, hch@lst.de, Linux Filesystem Development <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com

P=E5 su , 29/08/2004 klokka 10:30, skreiv Alan Cox:

> Openoffice does this in user space and the user space vfs code desktops
> use can handle zips so this "just works" already including over NFS,
> unlike a kernel proposed method.

NFS is not the roadblock here. Sure v2 and v3 support would be
impossible to do, but since this is all 2.6 work anyway, people have the
option of using NFSv4, which has full support for streams...

NFSv4 has an OPENATTR call which acts on files to return a filehandle
that works fine with both READDIR and LOOKUP, so if a VFS interface for
streams existed, we could code up full support tomorrow.
As it is, we're having to shoehorn this into the xattr interface. 8-(

Cheers,
  Trond
