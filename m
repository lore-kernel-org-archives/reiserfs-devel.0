From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: reiserfs3 filesystem corruption?
Date: Sat, 28 Aug 2004 17:28:15 +0200
Message-ID: <200408281728.16047.christian.mayrhuber@gmx.net>
References: <270bd0c404082806271f566342@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20992-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <270bd0c404082806271f566342@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, leon breedt <bitserf@gmail.com>

On Saturday 28 August 2004 15:27, leon breedt wrote:
> hi,
> 
> not sure if i'm going mad here:
> 
> [ljb@imryrr]:/home/ljb $ ls -l /usr/bin/sdiff
> -rwxr-xr-x  1 root root 24576 Apr 25  2003 /usr/bin/sdiff*
> 
> [ljb@imryrr]:/home/ljb $ cp /usr/bin/sdiff .
> 
> [ljb@imryrr]:/home/ljb $ ls -l sdiff
> -rwxr-xr-x  1 ljb ljb 20480 Aug 29 01:12 sdiff*
> 
> [ljb@imryrr]:/home/ljb $ ./sdiff
> zsh: bus error  ./sdiff
> 
> [ljb@imryrr]:/home/ljb $ /usr/bin/sdiff
> /usr/bin/sdiff: missing operand after `/usr/bin/sdiff'
> /usr/bin/sdiff: Try `/usr/bin/sdiff --help' for more information.
> 
> why would the file shrink by 4096 bytes? 
> 
> and notice, the original is still able to run. its just when i try to
> copy it, that it gets corrupted somehow.
> 
> this occurs for a fair number of random files on this filesystem
> (affected files all shrink by 4096 bytes). reiserfsck has no
> complaints, and i've also run reiserfsck --rebuild-tree. it occurs to
> the same set of files every time.
> 
> i ran across this while trying to copy my / filesystem to a new
> reiser4 filesystem. first thought it was a reiser4 issue, but it
> occurs when copying to an ext3 filesystem as well.
> 
> i've run badblocks on the disk, with no errors. the filesystem isn't
> mounted with any special options, just "noatime".
> 
> kernel: 2.6.9-rc1-mm1
> reiserfsck: 3.6.18
> reiserfs format: "3.6"
> 
> its serial ATA device on ICH5-R, if that makes any difference.
> 
> the relevant dmesg output:
> 
> ReiserFS: sda7: found reiserfs format "3.6" with standard journal
> ReiserFS: sda7: using ordered data mode
> ReiserFS: sda7: journal params: device sda7, size 8192, journal first
> block 18, max trans len 1024, max batch 900, max commit age 30, max
> trans age 30
> ReiserFS: sda7: checking transaction log (sda7)
> ReiserFS: sda7: Using r5 hash to sort names
> 
> any ideas what to try? i'm keeping this filesystem around so i have
> the test cases available.
> 
> leon
> 

This is a bug in 2.6.9-rc1-mm1. See:
http://marc.theaimsgroup.com/?l=linux-kernel&m=109360433916523&w=2

To fix it you have to revert these patches:

=== START Andrew Morton ===
ftp://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.9-rc1/2.6.9-rc1-mm1/ 
\
broken-out/re-fix-pagecache-reading-off-by-one-cleanup.patch

and then

ftp://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.9-rc1/2.6.9-rc1-mm1/ 
\
broken-out/re-fix-pagecache-reading-off-by-one.patch
=== END Andrew Morton ===
Full email at: 
http://marc.theaimsgroup.com/?l=linux-kernel&m=109368723414915&w=2

-- 
lg, Chris
