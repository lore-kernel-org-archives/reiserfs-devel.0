From: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>
Subject: Re: ReiserFS problems
Date: Wed, 6 Aug 2003 19:52:15 +0200
Message-ID: <20030806195215.B32577@bitwizard.nl>
References: <20030806182055.A28562@bitwizard.nl> <20030806164852.GA14719@namesys.com> <20030806191806.A31496@bitwizard.nl> <20030806114331.H7752@schatzie.adilger.int>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15186-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030806114331.H7752@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>, Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

On Wed, Aug 06, 2003 at 11:43:31AM -0600, Andreas Dilger wrote:
> On Aug 06, 2003  19:18 +0200, Rogier Wolff wrote:
> > > > later. So we hit control-C on the fsck.
> > > 
> > > That was big mistake.
> > 
> > It was only a couple of percent done. All we have to do now is run it
> > again, and let it continue.
 
>  From a user-safety point-of-view, you should use "tty()" to see if
>  the program > is running interactively, and then trap CTRL-C and
>  have it print a warning in > the signal handler that pressing
>  CTRL-C again in the next second will kill it.  > All you need then
>  is to call "time()" and save it in a static, and if the > signal
>  handler is called more than once in the same second only then exit.

No. The warning should not be that pressing control-C again will kill
the program, but that interrupting a rebuild-tree will make your
filesystem unmountable, and that pressing control-C again will
interrupt the running rebuild-tree. 

			Roger. 

-- 
+-- Rogier Wolff -- www.harddisk-recovery.nl -- 0800 220 20 20 --
| Files foetsie, bestanden kwijt, alle data weg?!
| Blijf kalm en neem contact op met Harddisk-recovery.nl!
