From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: accidentally formatted vfat over reiserfs, recoverable?
Date: Sat, 20 Sep 2003 00:24:22 +0400
Message-ID: <200309200024.22525.vitaly@namesys.com>
References: <Pine.OSF.4.58.0309191844050.245847@kosh.hut.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15713-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.OSF.4.58.0309191844050.245847@kosh.hut.fi>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tommi Sakari Uimonen <tuimonen@cc.hut.fi>, reiserfs-list@namesys.com

On Friday 19 September 2003 20:17, Tommi Sakari Uimonen wrote:
> Hi. I had a reiserfs (3.6.11 from debian unstable) partition and I made a
> 'mkfs.vfat -F 32' on it. Is there any chance of getting the data from the
> old reiserfs partition?
>
> I have not written onto it since, and mkfs.vfat performed it's duties very
> promptly, so I guess it just wrote something  "small" to the beginning of
> the partition. (The partition is  about 100GB so I would have noticed if
> it had done some serious formatting on it)
>
> Maybe some dd if=/dev/hdb5 of=... magic or what?
>
> Tommi Uimonen

Hi Tommi,

this was the user mistake and we provide the support for such in terms of 
our www.namesys.com/support.html page.

-- 
Thanks,
Vitaly Fertman
