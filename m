From: Pavel Machek <pavel@ucw.cz>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 23:37:28 +0200
Message-ID: <20050920213728.GA1945@elf.ucw.cz>
References: <200509182004.j8IK4JNx012764@inti.inf.utfsm.cl> <432E5024.20709@namesys.com> <20050920075133.GB4074@elf.ucw.cz> <200509202328.28501.rik@osrc.info>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26164-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200509202328.28501.rik@osrc.info>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roman I Khimov <rik@osrc.info>
Cc: reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>

Hi!

> > Can V4 survive few hours of test below?
> 
> Maybe I'm doing something wrong here, but ext2 have failed on second check 
> of first pass with

No, you have probably just found bug in e2fsck...

> Second check...
> e2fsck 1.34 (25-Jul-2003)

I have 1.38 here, so yours is too old.

OTOH if reiser4 survives that for 80 cycles... that's pretty good.

									Pavel
-- 
if you have sharp zaurus hardware you don't need... you know my address
