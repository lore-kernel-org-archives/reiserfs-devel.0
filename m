From: Tupshin Harper <tupshin@tupshin.com>
Subject: Re: New reiser4 snapshot (as of August 22, 2003)
Date: Fri, 22 Aug 2003 18:16:35 -0700
Message-ID: <3F46C073.4080008@tupshin.com>
References: <20030822150853.GA960@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15396-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030822150853.GA960@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

Oleg Drokin wrote:

>Hello!
>
>   I have just released new snapshot of reiser4.
>   Release notes follows.
>   Give it a try.
>
>Reiser4 snapshot for 2003.08.22
>
>WARNING!!! This code is experimental! WE ARE NOT KIDDING! DO NOT PUT
>ANY VALUABLE DATA ON REISER4 YET!
>
>Fixed builds for 64bit arches (there are still some warnings, but it
>should work now, I hope). Fixed some bugs.
>There are still some stability problems on SMP machines that we are working on.
>
>If you used reiser4progs from last snapshot (August 11th), you need to upgrade those
>to fix critical largekeys bug in mkfs.reiser4
>
>Snapshot is released as a patch against linux-2.6.0-test3-bk9.
>REISER4_NOOPT config option (Disable compiler optimizations for reiser4 code.)
>is known to not compile on x86.
>Enable CONFIG_REISER4_LARGE_KEY, as reiser4progs are creating filesystems with
>large keys by default.
>The reiser4-kernelonly.diff file represents only required kernel modifications if you plan to use our reiser4 bk repository.
>    It does not contains any reiser4 code
>The reiser4.diff is full patch with everything included
>
Are these patches available outside of bitkeeper, and if so, where are 
they located?

-Tupshin

