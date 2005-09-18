From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sun, 18 Sep 2005 22:38:44 +0100
Message-ID: <1127079524.8932.21.camel@localhost.localdomain>
References: <432AFB44.9060707@namesys.com>
	 <200509171415.50454.vda@ilport.com.ua>
	 <200509180934.50789.chriswhite@gentoo.org>
	 <200509181321.23211.vda@ilport.com.ua>
	 <20050918102658.GB22210@infradead.org>
	 <b14e81f0050918102254146224@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26044-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f0050918102254146224@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: thenewme91@gmail.com
Cc: Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, Hans Reiser <reiser@namesys.com>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Sul, 2005-09-18 at 13:22 -0400, michael chang wrote:
> This is exciting to... whom?  The only thing that appears remotely
> interesting about it is that it's made by Oracle and apparently is
> supposed to be geared toward parallel server whatsits.

Which no current included fs supports. And parallel file systems btw get
exciting for everyone once you have virtualisation.

> Is that Hans' fault, or the fault of your lot?  Why can't we all just get along?

Insufficient drugs ;) ?

> work with.  Discriminate him because he's not a developer you can talk
> with, and I believe that's like discriminating a guy in a wheelchair
> because he can't run with you when you jog in the morning.

Hans can learn to work with people, most folks in wheelchairs cannot
take lessons and walk. Many of them have tried months of physiotherapy.
to learn to walk again. I think your comparison is insulting to a lot of
the disabled.

> Also, let's say that Reiser4 doesn't get into the kernel, as maybe XFS
> or ext2 or ext3 had never gotten into the kernel.  How would their

Linus refused ext3 initially. It went in because it had a userbase,
vendors shipping it and reliable clean code. Saying "no" a lot is really
rather important to keeping the kernel maintainable. I regularly meet
cases we should have said "no" a lot louder 8)

> I'm willing to go compare Reiser4 to ext2/3 as like H.264 to Mpeg-2. 
> Indeed, H.264 crashes some computers, similar to Reiser4 might crash
> some machines, but this is merely because Reiser4 explores new

It doesn't matter if reiser4 causes crashes. It matters that people can
fix them, that they are actively fixed and the code is maintainable. It
will have bugs, all complex code has bugs. Hans team have demonstrated
the ability to fix some of those bugs fast, but we also all remember
what happened with reiser3 later on despite early fast fixing.

One big reason we jump up and down so much about the coding style is
that its the one thing that ensures someone else can maintain and fix
code that the author has abandoned, doesn't have time to fix or that
needs access to specific hardware the authors may not have.

Alan

