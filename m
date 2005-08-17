From: Hans Reiser <reiser@namesys.com>
Subject: Re: where is the journal kept?
Date: Tue, 16 Aug 2005 22:51:54 -0700
Message-ID: <4302D07A.40804@namesys.com>
References: <20050815115310.GA28630@tranquility.scriptkitchen.com>	 <20050815125025.GA29390@tranquility.scriptkitchen.com>	 <43009184.2080201@namesys.com> <200508150812.40382.pat@patdouble.com>	 <4300A603.2050602@namesys.com>	 <d9a6586e05081509195017d679@mail.gmail.com>	 <4300D240.7010109@namesys.com>	 <d9a6586e0508151108431fabba@mail.gmail.com>	 <4302458E.9070604@namesys.com> <d9a6586e05081613275071c00a@mail.gmail.com> <430268F4.8020100@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25536-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <430268F4.8020100@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Shawn Rutledge <shawn.t.rutledge@gmail.com>, "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

David Masover wrote:

> Shawn Rutledge wrote:
>
> >On 8/16/05, Hans Reiser <reiser@namesys.com> wrote:
>
> >>Reiser4 does a very nice job of packing the tree tightly, which is
> >>independent of seeks.  Ditto for compression plugin.
> >>He merely needs to ignore some code, he is not harmed by it.  If he
> >>wants to write a new block allocator, sure, why not, we have allocator
> >>plugins yes?   His will just be simpler.....
>
>
> >But the most important thing is to reduce the number of writes as low
> >as possible.
>
>
> Something Reiser4 does very well.  If you have enough RAM, it's possible
> to avoid any reads/writes at all -- given enough RAM, it behaves as a
> ramdisk, which is why I wish I knew how to tell Gentoo to *not* mount
> tmpfs over /dev.
>
> One other thing you might try is disabling the write-twice behavior.
> Currently, if you've got a huge, fairly well-sorted file that you're
> making lots of tiny writes to, such as a database, it makes sense to
> write twice to keep the file from getting fragmented.  But,
> fragmentation isn't nearly as much an issue on truly random-access
> media, so you'd want the default small-file behavior to be used
> everywhere -- first write the data to the new location, then atomically
> update the pointer to it as you deallocate the old location.
>
> Am I right about this?  I'm not feeling very lucid today...

Yes, but there is not a lot of write twice for most usage patterns....

Hans
