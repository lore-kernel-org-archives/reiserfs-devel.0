From: Oleg Drokin <green@namesys.com>
Subject: Re: --fix-fixable being ignored
Date: Sun, 9 Mar 2003 17:35:36 +0300
Message-ID: <20030309173536.A7808@namesys.com>
References: <Pine.LNX.4.33.0303082353370.16310-100000@hpc.me.utexas.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13152-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0303082353370.16310-100000@hpc.me.utexas.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: michael stone <mike@hpc.me.utexas.edu>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Mar 09, 2003 at 12:02:17AM +0000, michael stone wrote:

> I have an ide raid server with a 610GB /home directory with errors. Running
> reiserfsck --check says it has found 6 errors which can be fixed with
> --fix-fixable.  But when I run it with --fix-fixable, the option is ignored and
> and a check is simply run again.  Any advice?  The filesystem errors are really
> screwing up quota services, so I need to get them fixed.  Thanks!

You need to completely unmount the fs.
Also using more recent version of reiserfsck is recommended.

Bye,
    Oleg
