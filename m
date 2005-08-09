From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 performance
Date: Mon, 08 Aug 2005 20:33:11 -0500
Message-ID: <42F807D7.9090900@slaphack.com>
References: <dd7cbn$kbg$1@sea.gmane.org> <42F7A01A.7090209@namesys.com>	 <e692861c05080816136f9d70bc@mail.gmail.com>	 <42F7F6DC.2080706@slaphack.com> <e692861c050808175818078a30@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25369-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c050808175818078a30@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gregory Maxwell <gmaxwell@gmail.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Gregory Maxwell wrote:
> On 8/8/05, David Masover <ninja@slaphack.com> wrote:
> 
>>Gregory Maxwell wrote:
>>
>>>On 8/8/05, Hans Reiser <reiser@namesys.com> wrote:
>>
>>>If ever you are looking for a killer app for Reiser4 that people who
>>>don't care about the visionary stuff will care about:
>>
>>Define "visionary"?
>>
>>I can name a few things that work best in Reiser4, and very well in v3,
>>simply because of efficient storage of small files and lazy allocation:
>>
[...]
>>mailserver -- especially IMAP+maildir, lots of small files, read/write
>>and so on...
> 
> 
> An interesting application space, no doubt. Although you can cure a
> lot of sins tossing solid state disk at it. :) (or just battery backed
> cache on a hardware raid controller).

Ok, we were talking about budget class before, and now we're talking 
about solid state disks?  Some people run much smaller IMAP servers, 
where it actually matters if an FS is twice as fast.  Especially for 
full-text searches on a server that doesn't do indexing -- and none of 
the existing ones do real-time indexing.

>>Gentoo box:
>>        /usr/portage is over a hundred thousand very small files, updated via
>>rsync.  Since they are updated all at once, you get a boost out of lazy
> 
> [snip]
> 
> Rsync algo or the network is going to be your bottleneck there, for
> the sync...

Want to bet?  Try it.  I can say with a reasonable amount of certainty 
that it's my FS/disk that's the bottleneck with my local rsync server -- 
the server is heavily disk-bound --  and even with my older boxes if I 
have them syncing directly to the Internet.

> Are you really getting disk bound for compile? if so
> increase your -j N.

Not all Gentoo packages need much of a compile.  Some need none at all.

For example:  Netcat is a single binary, and I believe it's even a 
single GCC command.  Most of Portage's helper scripts are Bash or 
Python, and while Python compiles a little, the "compile" stage for Bash 
is a nullop.

Besides, the parts of this that don't relate directly to compiling still 
apply -- that is, the unpack/install/merge -- even for something that 
compiles.

>>These are all things that Reiser4 already does better than anything
>>else.  So now we're going to get Postgres to run faster.  I can't wait
>>until we have more people hacking on the plugin interface -- then we'll
>>have some *real* killer apps.
> 
> 
> I agree. Still it would be nice to have some really good bread and
> butter improvements.. and a sufficient level of 'transaction' support
> exposed to PostgreSQL could result in a huge performance improvement
> while improving reliability. "Your database is more reliable on
> reiser4" would be a compelling argument... even to those not convinced
> by plugins and small files.

Absolutely.  I'm not knocking your idea, just wanted to clarify that 
"Reiser4 would be great if..." is getting old.  It is great, and it's 
getting even better pretty fast.

And, by the way, if the transaction interface gets done, it's not just 
databases that will benefit, but also small files.  After all, what kind 
of transactions are used for your OpenOffice document?  Or your source 
code -- should that really be the job of a text editor?  For someone 
making their living as a writer or a programmer, that's much more 
important than some inane database that keeps their icons looking 
pretty, or a SQL behemoth that'll never be on their machine.

