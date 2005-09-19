From: Hans Reiser <reiser@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Mon, 19 Sep 2005 14:55:20 -0700
Message-ID: <432F33C8.90908@namesys.com>
References: <432AFB44.9060707@namesys.com> <200509171415.50454.vda@ilport.com.ua> <200509180934.50789.chriswhite@gentoo.org> <200509181321.23211.vda@ilport.com.ua> <432F18DF.6020903@tmr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26098-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <432F18DF.6020903@tmr.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Davidsen <davidsen@tmr.com>
Cc: Denis Vlasenko <vda@ilport.com.ua>, Christoph Hellwig <hch@infradead.org>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Bill Davidsen wrote:

> Denis Vlasenko wrote:
>
>>
>> Maybe xfs shouldn't be accepted too, this may be an answer.
>
>
> That argument is specious, and raises the chance that someone will
> suggest that we learn from our mistakes.

It wasn't a mistake to accept xfs, xfs is a great piece of technology. 
I haven't monitored their progress, but I am sure that they are
diligently fixing bugs as they are reported.  Guys, making a filesystem
stable is hard, and once every known test passes without crashing, there
is no substitute for masses of users finding bugs not hit by the tests,
and getting them fixed.  My point is merely that Hellwig could go and
find flaws in the filesystem he worked on, XFS, if he chose to.  I think
he should.

