From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: Possible interference between reiser4 and usb-storage?
Date: Sat, 25 Nov 2006 05:43:28 +0000 (GMT)
Message-ID: <Pine.LNX.4.64.0611250538370.16392@sheep.housecafe.de>
References: <194f62550611191252l612ac827tc2f0e581d01be46a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30216-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <194f62550611191252l612ac827tc2f0e581d01be46a@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Clemens Eisserer <linuxhippy@gmail.com>
Cc: reiserfs-list@namesys.com

On Sun, 19 Nov 2006, Clemens Eisserer wrote:
> am using cryptocompress with the 2.6.19rc4 kernel and after some time
> df reports something like:

..."after some time", so right after mkfs df(1) is telling the truth?
Does it drop to 52MB all of a sudden or does it decrease slowly? does it 
happen with other/former kernels too?

> /dev/sda1             55068032  32996604  22071428  60% /mnt (1GB flash 
> storage)
>
> however sda1 is a 1gb usb storage device!!

What does fdisk say?

> Could that be because I compiled the kernel with -O3?

Does it happen without the tweak? Why are you using -O3 anyway, does it 
really make a difference?

Christian.
-- 
BOFH excuse #400:

We are Microsoft.  What you are experiencing is not a problem; it is an undocumented feature.
