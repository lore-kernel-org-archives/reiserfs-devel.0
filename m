From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 can't fix 1 fixable corruption
Date: Thu, 22 Apr 2004 01:13:28 +0400
Message-ID: <200404220113.28246.vitaly@namesys.com>
References: <200404201733.51809.rmeijer@internet.gr> <4086D603.3010309@xs4all.nl> <20040421205347.GA14939@raptus.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18137-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040421205347.GA14939@raptus.homelinux.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Domenico Andreoli <cavok@tiscali.it>, reiserfs-list@namesys.com

On Thursday 22 April 2004 00:53, Domenico Andreoli wrote:
> On Wed, Apr 21, 2004 at 10:13:55PM +0200, Sander Sweers wrote:
> > Building reiser4 support is easy, the patch applies cleanly on grub 0.94.
> > You have to add option --enable-stand-alone for reiser4progs and libaal
> > before grub + patch will build it.*
>
> what is this --enable-stand-alone argument? help messages says "enable
> stand alone library" but i don't know which library it is talking about.

this is probably not very clear phasing, it configures the current library 
(libreiser4 for the reiser4progs package and libaal for the libaal package) 
in the stand alone mode.

-- 
Thanks,
Vitaly Fertman

