From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: no further nfsd-fh: found a name that I didn't expect
Date: Fri, 23 May 2003 20:20:36 +0200
Sender: Bernd Schubert <Bernd.Schubert@tc.pci.uni-heidelberg.de>
Message-ID: <200305232020.36324.bernd-schubert@web.de>
References: <200305231703.47899.bernd-schubert@web.de> <20030523151835.GB9289@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14235-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030523151835.GB9289@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: 'reiserfs' <reiserfs-list@namesys.com>

> Hm. I thought that iget5_locked patch had wrong port to 2.4.20 and
> everybody had problems with it. There was another minimal 2.4.20 patch that
> only touched reiserfs stuff and that was recommended to use.

Oh sorry, actually I was referring to the minimal patch.

>
> > ever again. Well, we once rebooted and used by accident the wrong
> > kernel-image and of course had problems again until the next reboot.
> >
> > Btw, is the iget4()-fix in 2.4.21-rc3 the same patch ?
>
> No, this is not iget5_locked (we plan to push it in 2.4.22pre time),
> this is minimal fix instead.

Great, so we won't see this problem even without patching.


Have a nice weekend,
	Bernd
