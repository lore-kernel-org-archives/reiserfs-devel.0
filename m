From: insecure <insecure@mail.od.ua>
Subject: Re: FS Corruption with VIA MVP3 + UDMA/DMA
Date: Sat, 9 Aug 2003 19:43:25 +0300
Message-ID: <200308091943.25231.insecure@mail.od.ua>
References: <16128.19218.139117.293393@charged.uio.no> <3F34E6D1.7030900@sbcglobal.net> <20030809162710.GC29647@mail.jlokier.co.uk>
Reply-To: insecure@mail.od.ua
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-15267-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030809162710.GC29647@mail.jlokier.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>, Wes Janzen <superchkn@sbcglobal.net>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com

On Saturday 09 August 2003 19:27, Jamie Lokier wrote:
> Wes Janzen wrote:
> > I seemed to get a skeptical reaction when I originally posted this to
> > the list, however, just google for "mvp3 corrupt dma mode" to confirm.
>
> The VP2/97 also had severe problems with DMA.  I could never run
> standard kernels on mind in the 2.0 days, and distro installs would
> always lock up during installation, although Mandrake 8 seemed
> reliable so something improved.

I had a VIA VPX sometime ago. AFAIR it worked fine...

I suspect PCI conf tweaks etc could work around
this trouble. I'm afraid there won't be much interest
in fixing these oldies. For example, I got rid of that
board (exchanged for Socket A one) -> no way to test fixes :(
--
vda
