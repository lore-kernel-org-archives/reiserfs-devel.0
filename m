From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck --rebuild-tree is very slow
Date: Mon, 5 Aug 2002 11:42:44 +0400
Message-ID: <20020805114244.A25293@namesys.com>
References: <20020804212148.GC6570@vic20.blipp.com> <20020805090447.A5678@namesys.com> <20020805073752.GA21118@vic20.blipp.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11121-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020805073752.GA21118@vic20.blipp.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrik Wallstrom <pawal@blipp.com>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Aug 05, 2002 at 09:37:52AM +0200, Patrik Wallstrom wrote:
> > > The result of reiserfsck --check and the result with --fix-fixable:
> > > bread: Cannot read a block # 10052279.
> > Hm, what's in kernel logs, is it filled with I/O errors?
> Aug  5 06:34:13 motor kernel: hdd: lost interrupt
> Aug  5 06:34:53 motor last message repeated 4 times
> Aug  5 06:35:53 motor last message repeated 6 times

Hm, this is a problem of IDE layer then

> > > From what I can see, this session can last for many years...
> > > Any advise?
> > Look into the kernel logs, if it is filled by many I/O error messages, 
> > then it will indeed may atek a lot of time. Also it is possible that the
> > drive itself is reading data very slowly (ie it encounters multiple errors
> > that it tries to correct and this takes huge amount of time, I saw such
> > behaviour with IBM DTLA drives).
> > If you can access data on the drive just fine without fsck
> > (I mean if dd if=/dev/device of=/dev/zero bs=4096k works as fast as expected),
> > then this may need more investigations.
> The read operation from dd was very fast.

You mean right now if you interrupt reiserfsck and issue a dd command, it
will be fast (ie. you tried it right now), or it was fast some time ago?

How aboult changing blocksize from 4M down to 4k?

> Should I just try --rebuild-tree, and wait for some weeks? :)

No, you should fix a problem in your IDE subsystem instead.

> The error from --check was now
> Bad root block 4294967295. (--rebuild-tree did not complete)

Yes, this is correct message for unfinished rebuild tree.

> So I guess I have to...

As an alternative thing: you can copy your partition to file, run fsck
on that file and then dd the file back, but this way the problem you
are having won't be fixed. And we have nothing to do with the problem so
we cannot help here (err, we can help probably but since that's not reiserfs
bug, such a help won't be free).

Bye,
    Oleg
