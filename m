From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Processes dying?
Date: Sat, 5 Jun 2004 01:41:11 +0300
Message-ID: <20040604224111.GK4990@nysv.org>
References: <200406042133.i54LXIXN031219@turing-police.cc.vt.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19025-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200406042133.i54LXIXN031219@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: Valdis.Kletnieks@vt.edu

(*sigh* maybe this time the mail will come through, without a file-k
attachment ;)

On Fri, Jun 04, 2004 at 05:33:18PM -0400, Valdis.Kletnieks@vt.edu wrote:

>Of course, if your syslogd is one of the processes wedged up, you won't 
>get much....

I did not.

However, I got something.

It is at the url
http://mjt.nysv.org/reiser/2004-06-04_trace.bz2

The mystical data is at 01:10:58 and 01:15:31.

Anyway, I recognize just about tty_read, sys_read, vfs_read and
make_space_tail from there. If there is some document which I could
read to learn these things without having to learn the ancient art
of kernel-coding, I would appreciate a url :)

Hope this helps, and thanks!

-- 
mjt

