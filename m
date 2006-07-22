From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 status (correction)
Date: Fri, 21 Jul 2006 23:53:41 -0600
Message-ID: <44C1BD65.8070204@namesys.com>
References: <44BFFCB1.4020009@namesys.com> <44C043B5.3070501@slaphack.com>	 <44C093D2.1040703@namesys.com>	 <1153514509.6659.41.camel@ipso.snappymail.ca>	 <44C141C4.1030802@slaphack.com>	 <1153517853.6659.56.camel@ipso.snappymail.ca>	 <44C157D2.5060202@slaphack.com> <1153525982.6659.108.camel@ipso.snappymail.ca> <44C191FD.4010302@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29128-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44C191FD.4010302@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Mike Benoit <ipso@snappymail.ca>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>

David Masover wrote:

>
>
> And it's not just databases.  Consider BitTorrent.  The usual
> BitTorrent way of doing things is to create a sparse file, then fill
> it in randomly as you receive data.  Only if you decide to allocate
> the whole file right away, instead of making it sparse, you gain
> nothing on Reiser4, since writes will be just as fragmented as if it
> was sparse.

If you don't flush it before you fill it, then in reiser4 it does not
matter if it starts out sparse.

>
> Personally, I'd rather leave it as sparse, but repack everything later.

We have 3 levels of optimization: 1) at each modification, 2) at each
flush, and 3) at each repack.  Each of these operates on a different
time scale, and all 3 are worthy of doing as right as we can.

Now, the issue of where should airholes be?  Why, that is the grand
experiment that will start to happen in a few months.  Nobody knows yet
what defaults we should have, and whatever we choose, there will be some
users who gain from explicit control of it.

>   it must not be as trivial as I think it is.

The problem is that there was a list of must dos, and this was just one
of them.  If reiser4 goes in, then fsync is the only thing in front of
the repacker.  The list has reduced in size a bunch.

>
>> A much better approach in my opinion would be to have Reiser4 perform
>> well in the majority of cases without the repacker, and sell the
>> repacker to people who need that extra bit of performance. If I'm not
>> mistaken this is actually Hans intent.
>
>
> Hans?

Yes, that's the idea.  Only sysadmins of large corps are likely to buy. 
We throw in service and support as well for those who purchase it.

If I was making money, I would not do this, but I am not.  I am not
really willing to work a day job for the rest of my life supporting guys
in Russia, it is only ok to do as a temporary measure.  I am getting
tired....

>
>> If Reiser4 does turn out to
>> perform much worse over time, I would expect Hans would consider it a
>> bug or design flaw and try to correct the problem however possible. 
>
>
I would want Reiser4 without a repacker to outperform all other
filesystems.  The problem with this fragmentation over time issue is
that it is hard to tweak allocation, measure the effect, tweak again,
etc.  Not sure how to address it without a lot of work.  Maybe we need
to create some sort of condensed portage benchmark....

Hans

Hans
