From: Chris Dukes <pakrat@www.uk.linux.org>
Subject: Re: Reiserfsck and root filesystem
Date: Fri, 18 Apr 2003 14:09:09 +0100
Sender: <pakrat@www.linux.org.uk>
Message-ID: <20030418130909.GC19803@parcelfarce.linux.theplanet.co.uk>
References: <001e01c305a9$ad5470b0$0a9a10ac@GRZEGORZ> <20030418170053.A7143@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13708-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030418170053.A7143@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Grzegorz Paszka <Grzegorz@Paszka.com>, reiserfs-list@namesys.com

On Fri, Apr 18, 2003 at 05:00:53PM +0400, Oleg Drokin wrote:
> Hello!
> 
> On Fri, Apr 18, 2003 at 02:54:41PM +0200, Grzegorz Paszka wrote:
> 
> > I just want have sure.
> > I need repair root filesystem.
> > Have I chance to repair it mounted read-only or I have to umount it and
> > check this filesystem in another computer ?
> 
> You need to have the filesystem completely unmounted, if you want to fix it.
> So you either need to use another computer or boot from rescue disk..

Or have an initrd that includes reiserfsck.

-- 
Chris Dukes
I tried being reasonable once--I didn't like it.
