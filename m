From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck --rebuild-tree is very slow
Date: Mon, 5 Aug 2002 09:04:47 +0400
Message-ID: <20020805090447.A5678@namesys.com>
References: <20020804212148.GC6570@vic20.blipp.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11119-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020804212148.GC6570@vic20.blipp.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrik Wallstrom <pawal@blipp.com>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Aug 04, 2002 at 11:21:48PM +0200, Patrik Wallstrom wrote:

> The result of reiserfsck --check and the result with --fix-fixable:
> bread: Cannot read a block # 10052279.

Hm, what's in kernel logs, is it filled with I/O errors?

> ####### Pass 0 #######
> Loading on-disk bitmap .. ok, 6110187 blocks marked used
> Skipping 8399 blocks (super block, journal, bitmaps) 6101788 blocks
> will be read
> 0%                                                         left 5911812, 2 /sec
> From what I can see, this session can last for many years...
> Any advise?

Look into the kernel logs, if it is filled by many I/O error messages, 
then it will indeed may atek a lot of time. Also it is possible that the
drive itself is reading data very slowly (ie it encounters multiple errors
that it tries to correct and this takes huge amount of time, I saw such
behaviour with IBM DTLA drives).
If you can access data on the drive just fine without fsck
(I mean if dd if=/dev/device of=/dev/zero bs=4096k works as fast as expected),
then this may need more investigations.

Bye,
    Oleg
