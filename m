From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: reiser4 crash
Date: Sun, 25 Jul 2004 10:41:08 +0300
Message-ID: <20040725074108.GR4990@nysv.org>
References: <200407241827.54674.frbiscani@jumpy.it>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19794-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200407241827.54674.frbiscani@jumpy.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francesco Biscani <frbiscani@jumpy.it>
Cc: reiserfs-list@namesys.com

On Sat, Jul 24, 2004 at 06:27:54PM +0200, Francesco Biscani wrote:
>
>Hope this is useful. I'll be glad to give more details is asked to. 
>Regards,

Try patching in
http://mjt.nysv.org/reiser/log-write-readpage-releasepage-2.diff.gz

Then recompile the kernel with debugging and assertions (printing was iirc
not required) turned on and try to reproduce it.

Note, that this may cause your system to oops and go haywire big time, so
if you have a netconsole or something to log, it's great.
One other method is cat /proc/kmsg > foo and scping foo elsewhere before
the computer goes down.

The patch above is from Namesys, but I don't think it's in any of the
auto-snapshots (should it be?) and it may or may not give more info
on what's going on, but if it does, the output is some 512 extra lines
of log.

-- 
mjt

