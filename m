From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: how manage this? (was: Bug#304342: /sbin/mkreiserfs: created a filesystem with mkreiserfs -b 1024 ...)
Date: Thu, 28 Apr 2005 15:33:37 +0400
Message-ID: <200504281533.37722.vitaly@namesys.com>
References: <20050427144845.GA1727@raptus.dandreoli.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23935-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050427144845.GA1727@raptus.dandreoli.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Domenico Andreoli <cavok@tiscali.it>, Miernik <miernik@ffii.org>, 304342@bugs.debian.org

On Wednesday 27 April 2005 18:48, Domenico Andreoli wrote:
> hi,
> 
>   which advice i can give to those users finding these absurd and
> obviously buggy behaviours? thanks.
> 
> cheers
> domenico
> 
> ----- Forwarded message from Miernik <miernik@ffii.org> -----
> 
> Date: Tue, 12 Apr 2005 16:26:33 +0200
> From: Miernik <miernik@ffii.org>
> Subject: Bug#304342: /sbin/mkreiserfs: created a filesystem with
>     mkreiserfs -b 1024 and it hangs anything trying to write to it
> 
> Package: reiserfsprogs
> Version: 1:3.6.19-1
> Severity: normal
> File: /sbin/mkreiserfs
> 
> I created a partition made of 2618595 sectors (~1.3 GB) /dev/hda6 and
> created a filesystem on it with
> 
> mkreiserfs -b 1024 -l /var/cache/wwwoffle /dev/hda6
> 
> Anything trying to write on the filesystem (tried mc and touch) hangs
> completely, shows about 60% to 65% CPU usage in top and is unkillable,
> even with -9. After 20 minutes of such state I rebooted it with
> <Alt>+<SysRq> b 
> as nothing else would stop it. 
> Then I tried "touch t1" on the filesystem, with the same result. 
> <Alt>+<SysRq> b again. 
> reboot won't work, as the partition would not unmount. 

only 4k blocksize seems to work now. fix is being prepared.

-- 
Thanks,
Vitaly Fertman
