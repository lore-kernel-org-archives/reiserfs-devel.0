From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck --blame-it-on-the-hardware-yeah-yeah
Date: Sat, 8 Feb 2003 13:20:44 +0300
Message-ID: <20030208132044.A30757@namesys.com>
References: <20030208005057.GA1059@horo.vilain.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12675-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030208005057.GA1059@horo.vilain.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam@Vilain.net
Cc: reiserfs-list@namesys.com

Hello!


> bread: Cannot read the block (524111).
> Aborted
> (none):~# dd if=/dev/hda of=/tmp/foo skip=524100 count=100
> 100+0 records in
> 100+0 records out
> (none):~# od -x /tmp/foo
> 0000000 6974 6e6f 7720 6c69 206c 6562 6920 636e
> 0000020 756c 6564 2064 6e69 7420 6568 6e20 7865
> [... lots of very valid looking data snipped ...]

This is wrong block, try adding bs=4k to dd
Also read not from /dev/hda, but from your partition instead

Bye,
    Oleg
