From: Hans Reiser <reiser@namesys.com>
Subject: Re: Kernel crash upon unmount
Date: Mon, 29 Dec 2003 00:18:37 +0300
Message-ID: <3FEF48AD.2030903@namesys.com>
References: <200312251942.20053.sikkh@wp.pl> <20031228191636.6991.qmail@ninja.dynup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16415-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031228191636.6991.qmail@ninja.dynup.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <jedi@ninja.dynup.net>
Cc: reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

David Masover wrote:

> Piotr Neuman writes:
>
>> When I use reiser4 on one partition everything is fine. But when I 
>> tried to use it on two partitions - kernel crashed upon doing unmount 
>> of filesystems.
>
>
> I have the same problem.  My current workaround is to never unmount 
> them at all -- I crudely hacked halt.sh to skip trying to unmount 
> filesystems, and to jump straight to "remounting remaining filesystems 
> readonly".  I have to do "mount -o remount,ro", because "umount -r" 
> crashes.
> About this "crash" -- it's an oops at first, then things start to fall 
> apart.  I never quite get a crash, but a reiser4 crash is almost as bad.
>
>
Zam mentioned something to me about a race in the umount code he ran 
into while benchmarking, could be the same thing, probably he'll tell 
you more on monday.

-- 
Hans


