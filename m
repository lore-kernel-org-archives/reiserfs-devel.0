From: Oleg Drokin <green@namesys.com>
Subject: Re: What is reiserfsck telling me?
Date: Mon, 24 Feb 2003 00:36:08 +0300
Message-ID: <20030224003608.A10491@namesys.com>
References: <20030223181451.28117.qmail@web9807.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12881-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030223181451.28117.qmail@web9807.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guillermo Torreiro <gtorreiro@yahoo.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Sun, Feb 23, 2003 at 10:14:51AM -0800, Guillermo Torreiro wrote:

> <-------------reiserfsck, 2002------------->
> reiserfsprogs 3.x.1b

First it indirectly tells you is too old ;)

> Checking S+tree../ 27 (of  40)/ 37 (of 170)
> pass_through_tree: unable to read 11434 block on
> device 0x3

Now it tells it cannot read block 11434.
Likely a hardware problem, e.g. bad sector.

> So... ok, I got a problem there with block 11434, I
> can't read it, but why? what is that mean? block 11434
> turned to be a bad block? Can I find a work around to
> this so I could get to read that block? Anyone can
> explain that to me? How do I proceed with this kind of
> problems?

Well, if block is bad, it is bad. So you just cannot
read from it.
If it would be possible to read, you won't get the error after all.
You might hope that not all of 8 sectors making up this block are
broken, though.
Try to read this block with something like dd in 512b chunks.

Bye,
    Oleg
