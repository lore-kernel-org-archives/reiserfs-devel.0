From: Oleg Drokin <green@namesys.com>
Subject: Re: Un-long listable files (strace+Oops)
Date: Tue, 9 Sep 2003 18:47:42 +0400
Message-ID: <20030909144742.GA3177@namesys.com>
References: <200308061431.13695.Michael.James@csiro.au> <200308070823.40130.Michael.James@csiro.au> <3F3188C5.7050606@suse.com> <200309091512.11914.Michael.James@csiro.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15608-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200309091512.11914.Michael.James@csiro.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael.James@csiro.au
Cc: reiserfs-list@namesys.com, jeffm@suse.com

Hello!

On Tue, Sep 09, 2003 at 03:12:11PM +1000, Michael.James@csiro.au wrote:

> I'm getting un-long listable files cropping up occasionally.
> (on a Suse8.2 system, Reiserfs 3.6)

Yes, I remember that case. (it was related to xattrs last time)

> Please get in touch directly if you are interested,
>  particularily if there is some other test I could perform.
> Generally I find having these files around an irritating form of bitrot,
>  so I get rid of them, which can hinder investigations
>  as I can't create them repeatably.

Hm, but do you get an oops each time before you see such files?

> Here's an strace of what happens when I "ls -l it.
> suse:/home/pi/jam176/tmp # cat strace.ls-l
[...]
> lstat64("KNOPPIX_V3.2-2003-07-26-EN.iso", {st_mode=S_IFREG|0644, st_size=290107392, ...}) = 0
> getxattr("KNOPPIX_V3.2-2003-07-26-EN.iso", "system.posix_acl_access"s

Ok, and in hung at xattrs stuff again.
May be Jeff will be interested in metadata snapshot of corrupted fs.

> And there it hangs, waiting for heat-death-of-universe.

> Sep  3 12:39:13 suse kernel: Unable to handle kernel paging request at virtual address 00001d08
> Sep  3 12:39:13 suse kernel: EIP:    0010:[__find_lock_page_helper+23/96]    Tainted: PF

Hm, you have binary modules loaded. What are those?
Can you reproduce without those modules ever loaded?

> Sep  3 12:39:15 suse kernel: Call Trace:    [generic_file_write_nolock+705/2000] [generic_file_write+56/80] [reiserfs:__insmod_reiserfs_S.text_L165788+51778/139792] [sys_write+120/256] [system_call+51/64]

Otherwise the oops does not even looks like reiserfs related, just some in-memory corruption.

Bye,
    Oleg 
