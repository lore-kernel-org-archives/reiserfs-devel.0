From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Can't mount / at boot as of kernel 2.4.21
Date: Mon, 8 Dec 2003 15:40:44 +0300
Message-ID: <200312081540.44274.vitaly@namesys.com>
References: <20031207062944.GB1925@beavis>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16287-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031207062944.GB1925@beavis>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: smiths@alumni.cse.ucsc.edu, reiserfs-list@namesys.com

On Sunday 07 December 2003 09:29, Wes Gray wrote:
> My root is reiserfs, and works fine for kernel 2.4.20, but as of 2.4.21
> during boot it mounts readonly OK, but when it goes to remount read-write,
> the command:
>
> mount / -n -o remount,rw
>
> fails with "mount: / not mounted already, or bad option".

Is there smth related in 'dmesg'?
what does 'cat /proc/mounts' say?

> This problem is very similar to FAQ question #11, but the error message
> is different and I've tried "reiserfsck --rebuild-sb" and it said my
> superblock was fine.  I'm wondering what other "sanity checks" were added
> to the kernel though.
>
> It is possible there is an error in the boot scripts and it is trying
> to remount an fs that is not mounted at all, but this is not a
> problem with previous kernel versions.  Did it become pickier about this?
>
> I am running Gentoo with reiserfs-v0.3.0.3 and reiserfsprogs-v3.6.8.

this is pretty old reiserfsprogs version, you should upgrade it to the 3.6.11.

-- 
Thanks,
Vitaly Fertman
