From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 2 Sep 2004 08:54:18 -0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040902125417.GA12118@thunk.org>
References: <200408261819.59328.vda@port.imtp.ilyichevsk.odessa.ua> <1093789802.27932.41.camel@localhost.localdomain> <1093804864.8723.15.camel@lade.trondhjem.org> <20040829193851.GB21873@jeremy1> <20040901201945.GE31934@mail.shareable.org> <20040901202641.GJ4455@legion.cup.hp.com> <20040901203101.GG31934@mail.shareable.org> <20040901203543.GK4455@legion.cup.hp.com> <20040901204746.GI31934@mail.shareable.org> <20040901205140.GL4455@legion.cup.hp.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040901205140.GL4455@legion.cup.hp.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Allison <jra@samba.org>
Cc: Jamie Lokier <jamie@shareable.org>, Trond Myklebust <trond.myklebust@fys.uio.no>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, Linus Torvalds <torvalds@osdl.org>, reiser@namesys.com, hch@lst.de, Linux Filesystem Development <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com

On Wed, Sep 01, 2004 at 01:51:40PM -0700, Jeremy Allison wrote:
> > So you're saying SCP, CVS, Subversion, Bitkeeper, Apache and rsyncd
> > will _all_ lose part of a Word document when they handle it on a
> > Window box?
> > 
> > Ouch!
> 
> Yep. It's the meta data that Word stores in streams that will get lost.

And this is why I believe that using streams in application is well,
ill-advised.  Indeed, one of my concerns with providing streams
support is that application authors may make the mistake of using it,
and we will be back to the bad old days (when MacOS made this mistake)
where you will need to binhex files before you ftp them (and unbinhex
them on the otherside) --- and if you forget, the resulting file will
be useless.

I understand why the Samba folks want this feature very badly;
however, hopefully other projects will know enough *not* to use
streams once they become available in Linux....

						- Ted
