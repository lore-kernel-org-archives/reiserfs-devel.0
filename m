From: Ookhoi <ookhoi@xs4all.nl>
Subject: Re: reiser4progs 1.0.4
Date: Mon, 21 Feb 2005 18:01:39 +0100
Message-ID: <20050221170139.GA59816@xs4all.nl>
References: <200502201344.41656.vitaly@namesys.com> <20050221131024.GA43266@xs4all.nl> <200502211659.53972.vitaly@namesys.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200502211659.53972.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

On Mon, Feb 21, 2005 at 04:59:53PM +0300, Vitaly Fertman wrote:
> On Monday 21 February 2005 16:10, Ookhoi wrote:
> > On Sun, Feb 20, 2005 at 01:44:41PM +0300, Vitaly Fertman wrote:
> > > The new reiser4progs package is available on our ftp
> > > site (ftp://ftp.namesys.com/pub/reiser4progs/).
> >
> > Thank you for this release. It doesn't crash anymore :-)
> >
> > But it does tell me:
> > "NO REISER4 METADATA WERE FOUND. FS RECOVERY IS NOT POSSIBLE."

> no master super block, no format-specific super block, no backup blocks, 
> no status block, all bitmap blocks are not valid, no one reiser4 formatted 
> node has been found ... what you are fscking does not look like a reiser4 
> filesystem at all.

Ugh .. It should be hda2, nog hda1 ..

Well, it is checked now. I can't mount it with the current kernel (no support)
so I'll reboot and let you all know.

Sorry for the noise of that particular message ..
