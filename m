From: Russell Coker <russell@coker.com.au>
Subject: Re: ReiserFS is not suitable for a root FS.
Date: Sat, 17 May 2003 22:40:45 +1000
Message-ID: <200305172240.45091.russell@coker.com.au>
References: <200305172030.58775.russell@coker.com.au> <200305172125.59713.russell@coker.com.au> <3EC6247C.4030605@gmx.net>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14144-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EC6247C.4030605@gmx.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Cc: ReiserFS <reiserfs-list@namesys.com>

On Sat, 17 May 2003 22:01, Carl-Daniel Hailfinger wrote:
> Oleg? Given a statically linked reiserfsck binary completely loaded into
> memory and an initrd below the reiserfs root filesystem, it should be
> possible to completely unmount the root fs because the initrd is still
> there and can serve as root fs.

If you have the fsck program is already on the initrd then this problem is 
already solved.

If you don't have the fsck program on the initrd (as is the case for a typical 
Debian install - and probably most other distributions too) then by the time 
the root filesystem is mounted the initrd is moved away by pivot_root and 
moving it back would be complex and not a supported feature of the boot 
scripts.

With kernel 2.6 I believe that the initrd will become a regular tmpfs, in 
which case the proceedure could be:
1) Kernel loads initrd.
2) Initrd mounts root read-only and checks for errors or other indications 
that fsck is needed.
3)  If fsck is needed then the fsck program is copied from /root/sbin to 
/sbin, /root is umounted fsck'd and remounted.
4)  Continue as usual.

With the 2.4 kernels we would need to mount a tmpfs before step 3, but the 
Debian initrd scripts already do that for other reasons, so it wouldn't be 
such a big change.

This could be done.  To do it you want to first get SUSE to do it and then 
some other RPM based distro.  Once it's considered a "standard" thing to do 
for ReiserFS it will be easier to get into Debian.

Getting changes to Debian to make up for features that aren't in ReiserFS but 
are in Ext2/3 will probably be rather difficult at the moment...

However this does not deal with the situation where an initrd is not being 
used.  Some people just don't like using an initrd.  For that case you would 
have to copy all relevant files to a tmpfs and use pivot_root to make it the 
root file system.  After that the best thing to do would be to reboot as 
testing all the possible options to ensure that the system will consistantly 
boot in a regular fashion after such a fsck will be difficult (and a reboot 
is not so arduous anyway).

> A compressed metadata dump uses about 0.1% of your disk space, i.e. ~2MB
> for a 2GB partition. I'm sure you have at least 1% spare disk space.
> Otherwise you are suffering from horrible performance anyway. There is
> no filesystem I'm aware of which performs well with <5% free.

Is this with the -p option of debugreiserfs?

I'll do it next time.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

