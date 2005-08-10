From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 performance
Date: Wed, 10 Aug 2005 14:33:10 -0700
Message-ID: <42FA7296.7090203@namesys.com>
References: <dd7cbn$kbg$1@sea.gmane.org> <200508081409.03814.rmeijer@internet.gr> <42F7B8F4.80101@slaphack.com> <42F7D77E.5080108@namesys.com> <42F7F28B.7010602@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25395-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42F7F28B.7010602@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: "Raymond A. Meijer" <rmeijer@internet.gr>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

David Masover wrote:

>>
>>
>> I am skeptical that it gets worse than V3, unless it is because we
>> haven't put in all the bitmap optimizations we did for V3.  I wish I
>> knew how to measure it.....
>
>
> Me too.  It's fairly subjective on my part, so maybe not.  After all,
> I've gone from lots-of-tiny-partitions to one-huge-root-partition at
> the same time as I switched from v3 to v4, and I know that most of
> this is probably /usr/portage.  With a repacker, Reiser4 would be the
> best FS for /usr/portage -- it's over a hundred thousand shell scripts
> and text files which get updated usually once a day or once a week
> with rsync -- but without a repacker, it's best kept on a separate
> partition.
>
>
>
Yes, that usage pattern likely needs a repacker.
