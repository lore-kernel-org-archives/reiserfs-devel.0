From: Brad Boyer <flar@allandria.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 3 Sep 2004 18:10:13 -0700
Message-ID: <20040904011012.GA27405@pants.nu>
References: <Pine.LNX.4.44.0408261011410.27909-100000@chimarrao.boston.redhat.com> <200408261819.59328.vda@port.imtp.ilyichevsk.odessa.ua> <1093789802.27932.41.camel@localhost.localdomain> <1093804864.8723.15.camel@lade.trondhjem.org> <20040829193851.GB21873@jeremy1> <20040901201945.GE31934@mail.shareable.org> <20040901202641.GJ4455@legion.cup.hp.com> <1094118524.4842.27.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21454-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1094118524.4842.27.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Jeremy Allison <jra@samba.org>, Jamie Lokier <jamie@shareable.org>, Trond Myklebust <trond.myklebust@fys.uio.no>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, Linus Torvalds <torvalds@osdl.org>, reiser@namesys.com, hch@lst.de, Linux Filesystem Development <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com

On Thu, Sep 02, 2004 at 10:48:46AM +0100, Alan Cox wrote:
> What I don't understand is the tie between Linux having such streams and
> Windows doing it for Samba to work. Netatalk has always handle this for
> Macintosh and portably. Presumably any Samba support would need to
> handle OS's without wacky files for portability too ?

I'm not 100% sure on the samba side, but I think there is a pretty
significant difference. On the Mac, the problem of copying forks and
metadata onto non-Mac systems was recognized early on. There are several
standard formats for serialized versions of this data. If you take the
files that netatalk writes and copy them directly to a Mac separately,
there are tools that can convert them back to the original format with
all the data intact. I've never seen such a thing for NTFS named streams.

	Brad Boyer
	flar@allandria.com

