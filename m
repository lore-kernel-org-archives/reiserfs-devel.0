From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: "wrong bytes" with files >=4GiB
Date: Thu, 16 Sep 2004 20:08:57 +0400
Message-ID: <200409162008.57769.vitaly@namesys.com>
References: <413C5521.6080700@dermichi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21819-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <413C5521.6080700@dermichi.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Weissenbacher <webmaster@dermichi.com>, ReiserFS List <reiserfs-list@namesys.com>

On Monday 06 September 2004 16:16, Michael Weissenbacher wrote:
> I'm using kernel 2.6.9-rc1-mm1 (patched for the page-size bug) and
> reiser4progs1.0.0. I am able to reproduce a "wrong bytes" problem by
> doing the following:
> # dd if=/dev/urandom bs=4096 count=1048576 of=/mnt/tmp/testfile
> # umount /mnt/tmp
> # fsck.reiser4 /dev/sda1
> ...
> FSCK: Node (45223670), item (3), [2a:7465737466696c:1000f] (stat40):
> wrong bytes(4294967296), Should be (0).
> ...
> 1 fixable corruptions were detected in the FileSystem. Run with --fix
> option to fix them.
>
> When doing a fsck.reiser4 with --fix parameter it says
> FSCK: Node (45223670), item (3), [2a:7465737466696c:1000f] (stat40):
> wrong bytes
> (4294967296), Fixed to (0).
>
> and after that it says that the fs is consistent. I cannot find any
> difference in the file on the filesystem though.
> Is this actually harmful or is it just "statistic" data?

the only problem here is that bytes field becomes wrong. 
this does not corrupt data.

> If i'm doing the same test with count=1048575 no corruption is reported
> and if i'm doing it for files >4GiB i always get the problem (with
> different numbers of course).
> I can sent the full fsck output if needed.
> BTW this problem also occurs with kernel 2.6.8.1-mm2.

I have found it, thank you for hitting the bug, fixed.

-- 
Thanks,
Vitaly Fertman

