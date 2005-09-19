From: Hans Reiser <reiser@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sun, 18 Sep 2005 22:07:18 -0700
Message-ID: <432E4786.7010001@namesys.com>
References: <432AFB44.9060707@namesys.com>	 <200509171415.50454.vda@ilport.com.ua>	 <200509180934.50789.chriswhite@gentoo.org>	 <200509181321.23211.vda@ilport.com.ua>	 <20050918102658.GB22210@infradead.org>	 <b14e81f0050918102254146224@mail.gmail.com> <1127079524.8932.21.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26056-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1127079524.8932.21.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Alan Cox wrote:

>
>It doesn't matter if reiser4 causes crashes. It matters that people can
>fix them, that they are actively fixed and the code is maintainable. It
>will have bugs, all complex code has bugs. Hans team have demonstrated
>the ability to fix some of those bugs fast, but we also all remember
>what happened with reiser3 later on despite early fast fixing.
>  
>
What was that?

>One big reason we jump up and down so much about the coding style is
>that its the one thing that ensures someone else can maintain and fix
>code that the author has abandoned, doesn't have time to fix or that
>needs access to specific hardware the authors may not have.
>
So why is the code in the kernel so hard to read then?

Linux kernel code is getting better, and Andrew Morton's code is
especially good, but for the most part it's unnecessarily hard to read. 
Look at the elevator code for instance.  Ugh.

I differ in one major aspect from some.  That is, the only coding style
requirement I have of those who work for me is that it must be easy to
read.  That is because at every company I can remember where someone was
gungho about advocating that code be written in a specific defined
style, that someone was always the one with the least readable code.

I have a simple punishment for those who violate my requirement: I go
through the code line by line with them, which they always hate for some
reason, and help them comment and clarify it.  1-2 sessions of this, and
they usually change how they code so that they don't have to go through
it again with me.

Asking for readable code is not that different from asking for readable
novels: if you try to define what is required rather than teaching
instance by instance, you can only get in the way of the artist rather
than instructing.

That is why I just say "make it easy to read and I don't care how you do
that so long as it works."

