From: Francesco Biscani <frbiscani@jumpy.it>
Subject: Re: reiser4 disk formats (was http://www.namesys.com/snapshots/2004.08.09-internal.testing/)
Date: Mon, 16 Aug 2004 01:38:30 +0200
Message-ID: <200408160138.30792.frbiscani@jumpy.it>
References: <20040813171827.GA15303@raptus.homelinux.net> <200408160113.38791.frbiscani@jumpy.it> <20040815232751.GA3627@raptus.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20312-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040815232751.GA3627@raptus.homelinux.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Domenico Andreoli <cavok@tiscali.it>

Hi,

On Monday 16 August 2004 01:27, Domenico Andreoli wrote:
> what is confusing me is Vitaly saying:
>
> "The converter (debugfs.reiser4 -C) is supposed to be run on consistent
>  fs of course, so probably it is worth to check/fix it with the current
>  reiser4progs before any update."
>
> probably with "... any update." he meant also the update of the
> reiser4progs package to 1.0.0, doesn't him?
>

Yes, I think he meant that. Maybe you could just put a message to be printed 
when reiser4progs 1.x is being installed: "Make sure you checked your reiser4 
partition(s) if upgrading to this version of reiser4progs from 0.5.x: 
avoiding to do this may lead to data loss!". This could be made interactive 
(i.e., "Type 'Yes' to continue"). 

Just a thought :)

Regards,

  Francesco
