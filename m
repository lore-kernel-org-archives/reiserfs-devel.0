From: Patrik Wallstrom <pawal@blipp.com>
Subject: Re: reiserfsck --rebuild-tree is very slow
Date: Mon, 5 Aug 2002 09:37:52 +0200
Message-ID: <20020805073752.GA21118@vic20.blipp.com>
References: <20020804212148.GC6570@vic20.blipp.com> <20020805090447.A5678@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11120-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020805090447.A5678@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Mon, 05 Aug 2002, Oleg Drokin wrote:

> Hello!
> 
> On Sun, Aug 04, 2002 at 11:21:48PM +0200, Patrik Wallstrom wrote:
> 
> > The result of reiserfsck --check and the result with --fix-fixable:
> > bread: Cannot read a block # 10052279.
> 
> Hm, what's in kernel logs, is it filled with I/O errors?

Aug  5 06:34:13 motor kernel: hdd: lost interrupt
Aug  5 06:34:53 motor last message repeated 4 times
Aug  5 06:35:53 motor last message repeated 6 times

> > From what I can see, this session can last for many years...
> > Any advise?
> 
> Look into the kernel logs, if it is filled by many I/O error messages, 
> then it will indeed may atek a lot of time. Also it is possible that the
> drive itself is reading data very slowly (ie it encounters multiple errors
> that it tries to correct and this takes huge amount of time, I saw such
> behaviour with IBM DTLA drives).
> If you can access data on the drive just fine without fsck
> (I mean if dd if=/dev/device of=/dev/zero bs=4096k works as fast as expected),
> then this may need more investigations.

The read operation from dd was very fast.

Should I just try --rebuild-tree, and wait for some weeks? :)
The error from --check was now
Bad root block 4294967295. (--rebuild-tree did not complete)

So I guess I have to...

-- 
patrik_wallstrom->foodfight->pawal@blipp.com->+46-709580442
