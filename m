From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck question - session results
Date: Mon, 29 Jul 2002 10:00:33 +0400
Message-ID: <20020729100033.A13890@namesys.com>
References: <0GZZ00C5ZQAFLJ@mtaout05.icomcast.net> <0GZZ00FN7UFXM0@mtaout06.icomcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11090-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <0GZZ00FN7UFXM0@mtaout06.icomcast.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David R. Bergstein" <dbergstein@comcast.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Mon, Jul 29, 2002 at 12:43:08AM -0400, David R. Bergstein wrote:

> It turned out there was no problem after I ran reiserfsck, it was an 
> initscript issue, specifically in /etc/rc.d/rc.sysinit on Mandrake 8.1.  The 
> script assumes that the root filesystem is first mounted read-only, however I 
> had previously taken steps to ensure that this reiserfs partition is mounted 
> read-write so journal replays work correctly.  This resulted in the boot time 

In fact journal replays work ok even with readonly mounts. So mounting rootfs
readonly is not required in reiserfs case.

Bye,
    Oleg
