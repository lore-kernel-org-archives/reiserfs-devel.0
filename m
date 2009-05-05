From: Corey Hickey <bugfood-ml@fatooh.org>
Subject: Re: Problem with reiserfs volume
Date: Tue, 05 May 2009 16:40:37 -0700
Message-ID: <4A00CE75.4020109@fatooh.org>
References: <20090505084353762.EEUS22077@cdptpa-omta02.mail.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:from:mime-version:to:cc:subject:references:in-reply-to
	:content-type:content-transfer-encoding; s=dkim; bh=KIniXROtsKa/
	/AGjIC4V3QTSBWA=; b=T+rAJb10qAW5dCjlBmNY3wEVYP9yGlPGS+L81b71XxcH
	662bl0iqECUIFf0NMhz1HsPJrtLEmZyNEFxeTD2u6eV1V6pqJJg9dqIRSGzNCaJr
	zmufLp0wq3zSMZ3hUFvvg+CrY67mWXjsoT4prEvk87kAerGwTuUCagXl1Ya6VF4=
In-Reply-To: <20090505084353762.EEUS22077@cdptpa-omta02.mail.rr.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: lrhorer@satx.rr.com
Cc: reiserfs-devel@vger.kernel.org

Leslie Rhorer wrote:
>>>>>> It would always be the same 5 drives which dropped to zero
>>>>>> and the same 5 which still reported some reads going on.
>>>> I did the math and (if a couple reasonable assumptions I made are
>>>> correct), then the reiserfs bitmaps would indeed be distributed among
>>>> five of 10 drives in a RAID-6.
>>>>
>>>> If you're interested, ask, and I'll write it up.
>>> It's academic, but I'm curious.  Why would the default parameters have
>>> failed?
>> It's not exactly a "failure"--it's just that the bitmaps are placed
>> every 128 MB, and that results in a certain distribution among your disks.
> 
> This triggered a thought.  When I built the array, it was physically in a
> termporary configuration, so that while /dev/sda was drive 0 in the array
> and /dev/sdj was drive 9 in the array when it was built, the drives were
> moved in a piecemeal fashion to the new chassis, so that the order was
> something like /dev/sdf, /dev/sdg, /dev/sdh, /dev/sdi, /dev/sdj, /dev/sda,
> /dev/sde, /dev/sdd, /dev/sdc, /dev/sb, or something like that.  This
> shouldn't create a problem, as md handles RAID assembly based upon the drive
> superblock, not the udev assignment.  Is it possible the re-arrangement
> caused a failure of the bitmap somehow?

That should be fine.

I might not have been clear on this before: reading the bitmap data is
slow because it is distributed every 128 MB across the filesystem; this
means that in order to read lots of bitmaps, the disk spends most of its
time seeking rather than reading. For me, that's what was causing the
disk to "buzz", and that's why dstat showed read rates of only 400-600
KB/sec.

I just ran a quick test on my single-disk reiserfs and calculated the
average seek rate:

fs_size = 242341144 KB
bitmap_spacing = 128 MB = 131072 KB
num_bitmaps = fs_size / bitmap_spacing = 1849
bitmaps_read_time = 15.5 sec   (from debugreiserfs -m)
bitmap_read_rate = num_bitmaps / bitmaps_read_time = 119 bitmaps/sec
seek_rate = bitmap_read_rate = 119 seeks/sec  (seek to every bitmap)

That's a lot of seeking!

Having the bitmaps spread out among several disks of a RAID probably
wouldn't help. Reiserfs doesn't try to read the bitmaps in parallel;
that would be bad unless it knew the RAID layout. So, each disk would
just be idle when it wasn't its turn to seek and read another bitmap.


Remember how in the old days (before 2.6.19, I think) large reiserfs
filesystems took forever to mount? That's because reiserfs was reading
all the bitmap data and caching it internally. Eventually Jeff Mahoney
wrote a patch to make reiserfs read bitmap data on-demand and just let
the kernel cache them (or not).

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=5065227b46235ec0131b383cc2f537069b55c6b6

> It still doesn't quite explain to me how a high read rate strictly at the
> drive level (e.g. ckarray) causes severe problems at the FS level, while an
> idle system did not exhibit nearly the frequency of problems nor did the
> hang last even a fraction as long (40 seconds vs. 20 minutes).

20 minutes sounds excessive, even when competing with a resync. I
couldn't say, and can't test it here.

>>>>>> During a RAID resync, almost every file create causes a halt.
>>>> Perhaps because the resync I/O caused the bitmap data to fall off the
>>>> page cache.
>>> How would that happen?  More to the point, how would it happen without
>>> triggering activity in the FS?
>> That was sort of a speculative statement, and I can't really back it up
>> because I don't know the details of how the page cache fits in, but IF
>> the data read and written during a resync gets cached, then the page
>> cache might prefer to retain that data rather than the bitmap data.
>>
>> If the bitmap data never stays in the page cache for long, then a file
>> write would pretty much always require some bitmaps to be re-read.
> 
> Except this happened without any file writes or reads other than the file
> creation itself and with no disk activity other than the array re-sync.

I remember even 0-byte files taking a long time to write. My guess would
be that reiserfs doesn't know the file will end up being empty when the
file is created, or perhaps it tries to find some contiguous space
anyway so the file can be appended to without excessive fragmentation.

In order to find contiguous space, reiserfs needs to look at the
bitmaps; if enough bitmap data isn't cached, reiserfs will have to read
some, which, as we know, can take a long time.

-Corey
