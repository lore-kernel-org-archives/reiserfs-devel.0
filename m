From: Jamie Lokier <jamie@shareable.org>
Subject: Re: FS Corruption with VIA MVP3 + UDMA/DMA
Date: Sat, 9 Aug 2003 18:38:50 +0100
Message-ID: <20030809173850.GA30143@mail.jlokier.co.uk>
References: <16128.19218.139117.293393@charged.uio.no> <3F34E6D1.7030900@sbcglobal.net> <20030809162710.GC29647@mail.jlokier.co.uk> <200308091943.25231.insecure@mail.od.ua>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15268-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200308091943.25231.insecure@mail.od.ua>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: insecure <insecure@mail.od.ua>
Cc: Wes Janzen <superchkn@sbcglobal.net>, Linux Kernel <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com

insecure wrote:
> > The VP2/97 also had severe problems with DMA.  I could never run
> > standard kernels on mind in the 2.0 days, and distro installs would
> > always lock up during installation, although Mandrake 8 seemed
> > reliable so something improved.
> 
> I had a VIA VPX sometime ago. AFAIR it worked fine...
> 
> I suspect PCI conf tweaks etc could work around
> this trouble. I'm afraid there won't be much interest
> in fixing these oldies. For example, I got rid of that
> board (exchanged for Socket A one) -> no way to test fixes :(

I found a hdparm command which fixed it, though it wasn't much use
during distro installs.  It was very pleasant to see Mandrake 8 just
work.  Fwiw, Windows 95, 98 and NT4 have no problems on the box.  It's
now my "Internet Explorer 4" test rig :)

-- Jamie
