From: maciejej@msoe.edu
Subject: Re: status of reiser4
Date: Sat, 18 Dec 2004 15:22:42 -0600 (CST)
Message-ID: <55214.68.255.59.159.1103404962.squirrel@www.msoe.edu>
References: <41C322ED.4000807@namesys.com>
    <1103309648.8570.28.camel@localhost>
    <1103365613.3641.12.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-22838-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1103365613.3641.12.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

I tried 2.6.10-rc2-mm4 with Zam's bitmap.c patch and 2.6.9 with the
version -3 patch. I also tried compiling with GCC 3.3 rather than 3.4,
using reiser4progs 1.0.3, and running in loopback mode, but nothing has
worked yet.

> Hello
>
> On Fri, 2004-12-17 at 21:54, Jake Maciejewski wrote:
>> Have there been any reports other than Isaac's of reiser4 working on
>> AMD64? It still doesn't work for me, and I'd like to know if I'm the
>> only one having problems.
>>
>
> What kernel are you using?
>
>> On Fri, 2004-12-17 at 10:18 -0800, Hans Reiser wrote:
>> > Vladimir is working on one last bug that occurs if copy from user page
>> > faults on the user space process's buffer, and then we are going to
>> > bundle a set of patches together, send them to andrew morton, and then
>> > start a discussion on the changes to core kernel code that Hellweg and
>> > company object to that currently prevent our inclusion.
>> >
>> > hans
>
>

