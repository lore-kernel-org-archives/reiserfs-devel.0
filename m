From: Frank van Maarseveen <frankvm@xs4all.nl>
Subject: Re: The argument for fs assistance in handling archives (was: silent semantic changes with reiser4)
Date: Fri, 3 Sep 2004 01:52:53 +0200
Message-ID: <20040902235253.GA6131@janus>
References: <20040826150202.GE5733@mail.shareable.org> <200408282314.i7SNErYv003270@localhost.localdomain> <20040901200806.GC31934@mail.shareable.org> <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org> <1094118362.4847.23.camel@localhost.localdomain> <20040902203854.GA4801@janus> <200409022319.i82NJlTN025039@turing-police.cc.vt.edu> <1076230617.20040903014302@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21362-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1076230617.20040903014302@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spam <spam@tnonline.net>
Cc: Valdis.Kletnieks@vt.edu, Frank van Maarseveen <frankvm@xs4all.nl>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Fri, Sep 03, 2004 at 01:43:02AM +0200, Spam wrote:
> 
>   Yes why not? If there was any filesystem drivers for the AudioCD
>   format then it could.
> 
>   I had such a driver for Windows 9x which would display several
>   folders and files for inserted AudioCD's:
> 
>   D: (cdrom)
>     Stereo
>       22050
>         Track01.wav
>         Track02.wav
>         ...
>       44100
>         Track01.wav
>         ...
...
> 
>   If you just want to do a cd file.iso then it may be a totally
>   different thing. Either you would have a automount feature or a
>   filesystem/vfs plugin that could load secondary modules to support
>   this kind of thing.

Why is this so different, compared to your example? They are both
filesystem drivers.

-- 
Frank
