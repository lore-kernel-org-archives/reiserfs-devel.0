From: Corey Hickey <bugfood-ml@fatooh.org>
Subject: Re: Problem with reiserfs volume
Date: Wed, 06 May 2009 22:59:28 -0700
Message-ID: <4A0278C0.5050709@fatooh.org>
References: <20090506020455984.ECK17490@cdptpa-omta04.mail.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:from:mime-version:to:cc:subject:references:in-reply-to
	:content-type:content-transfer-encoding; s=dkim; bh=82307DyktkM1
	HWnR52V5fp98ZOU=; b=WXr9++vd0rLvTuXurc5D/Ykzo2VW4iSZ76BMoABLSTTP
	DGpXgsVjDL/EwtcLPmKGlCRU2UCp3UDZgs/f3vFvqw1GvemnzP4K4qtlZ7kfuMty
	ZVwbGWh4h3/himMTom2usINwS3MBo2kfEqF1A4qMixjBz3UdnkiNyVyEVa1u5gA=
In-Reply-To: <20090506020455984.ECK17490@cdptpa-omta04.mail.rr.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: lrhorer@satx.rr.com
Cc: reiserfs-devel@vger.kernel.org

Leslie Rhorer wrote:
>> I might not have been clear on this before: reading the bitmap data is
>> slow because it is distributed every 128 MB across the filesystem; this
>> means that in order to read lots of bitmaps, the disk spends most of its
>> time seeking rather than reading. For me, that's what was causing the
>> disk to "buzz", and that's why dstat showed read rates of only 400-600
>> KB/sec.
> 
> Yeah, but reads and writes worked just fine: up to 450 Mbps. 

I mean, above, that read rates would fall to 400-600 KB/sec when the
filesystem was busy reading bitmap data. That at least roughly
corresponds to what you wrote on 2009-04-28: "The reads at the array
level would fall to zero on 5 of the 10 drives, while the other 5 would
report a very low level of read activity, but not zero."

> Appending to
> an existing file (or writing several GB to a file once the create was done)
> ran like a racehorse on one or several files without ever a burp.  Reading
> could be accomplished flat-out no matter what, but with total disk activity
> well in excess of 500Mbps, everything would suddenly halt if a file was
> created on an intermittent basis. 

That's just like what was happening to me. The filesystem would drop
everything else it was doing and read bitmaps for a while.

>> Having the bitmaps spread out among several disks of a RAID probably
>> wouldn't help. Reiserfs doesn't try to read the bitmaps in parallel;
>> that would be bad unless it knew the RAID layout. So, each disk would
>> just be idle when it wasn't its turn to seek and read another bitmap.
> 
> With 400+ Mbps of data being read and written, the discs weren't idle very
> much.

Except that when the filesystem is busy reading bitmaps, it isn't doing
anything else.... :)

>> Remember how in the old days (before 2.6.19, I think) large reiserfs
>> filesystems took forever to mount?
> 
> I have only been using reiserfs for a short time.

Well, mounting did take forever. :)
http://lkml.org/lkml/2006/1/14/223
http://linuxgazette.net/122/TWDT.html#piszcz
(scroll down a bit to the graphs)

>>> Except this happened without any file writes or reads other than the
>> file
>>> creation itself and with no disk activity other than the array re-sync.
>> I remember even 0-byte files taking a long time to write. My guess would
>> be that reiserfs doesn't know the file will end up being empty when the
>> file is created, or perhaps it tries to find some contiguous space
>> anyway so the file can be appended to without excessive fragmentation.
> 
> So why didn't it happen when appending data to an existing file?  Once a
> file was created, large or small, I could write freely to it over and over,
> either appending data or writing over data.

I don't know how appends or overwrites are handled. The scheme for
finding free space may differ.

-Corey
