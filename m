From: Hans Reiser <reiser@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Mon, 19 Sep 2005 11:50:56 -0700
Message-ID: <432F0890.7060802@namesys.com>
References: <432AFB44.9060707@namesys.com>	 <200509171415.50454.vda@ilport.com.ua>	 <200509180934.50789.chriswhite@gentoo.org>	 <200509181321.23211.vda@ilport.com.ua>	 <20050918102658.GB22210@infradead.org>	 <b14e81f0050918102254146224@mail.gmail.com>	 <1127079524.8932.21.camel@localhost.localdomain>	 <432E4786.7010001@namesys.com> <1127126616.22124.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26088-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1127126616.22124.7.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Alan Cox wrote:

>On Sul, 2005-09-18 at 22:07 -0700, Hans Reiser wrote:
>  
>
>>>the ability to fix some of those bugs fast, but we also all remember
>>>what happened with reiser3 later on despite early fast fixing.
>>> 
>>>
>>>      
>>>
>>What was that?
>>    
>>
>
>Jeff Mahoney added file attributes to reiserfs3, you whined and pointed
>people at the yet to be released reiserfs4.
>
If you benchmarked that code, you might understand why I "whined."  You
can't just create a file per directory and stuff the attributes in it
and expect good performance.  Let's not forget that there was no
documentation, no design document, no design review, no QA process.

It is always a judgment call to decide what should be deferred to the
next major release and what should go into a stable branch.  File
attributes are a significant portion of the bugs that V3 has had.  File
attributes got added so that a marketer would have a bullet point added,
which can be very important and I am genuinely eager to work hard to
make marketers happy, but to the extent I get to decide, it will never
happen at the cost of coding it the wrong way.

Jeff is a great guy, and his bitmap related code is great stuff with
good design and solid empirical work behind it.  You have to really
understand the difference between V3 and V4 to appreciate that it was
not feasible for him to code xattrs for V3 the right way, because it
would be a disk format change and a nightmare to do it.  The code was
doomed by V3's lack of plugins before it was even written.  There is a
reason why V4 came into being....

If added to V4, xattrs would be higher performance and cleaner to
implement.  It would be far better to have spent the programming effort
on adding them to V4 and getting V4 out a little sooner.

I won't convince you of this one but it is also my reason: They are
inelegant semantics.

I don't remember the details of the 4k stack and journaling issues you
describe, so I will say nothing.

