From: Corey Hickey <bugfood-ml@fatooh.org>
Subject: Re: Problem with reiserfs volume
Date: Sun, 03 May 2009 16:54:30 -0700
Message-ID: <49FE2EB6.9060002@fatooh.org>
References: <20090503015844648.PNBZ22077@cdptpa-omta02.mail.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; s=dkim; bh=D8IRCeZxvOio
	TcpA6xLPIWJTgYY=; b=l/XmY1CwlVxGT73zNX1qjeC+c11o4Mt3ieedQR8Px4Ca
	Lbkb8Kiy1dIBo/m9buakTra899T99v/yktMZvCMAk9hmdjVA871qqwqdF6q7bwU6
	LTCoCSefYEBdtc+hqJwLNnS8J7qHrw4+HQcZaw6051bLyLPip+AEfUtjlaqU/jM=
In-Reply-To: <20090503015844648.PNBZ22077@cdptpa-omta02.mail.rr.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: lrhorer@satx.rr.com, reiserfs-devel@vger.kernel.org

Leslie Rhorer wrote:
>>> The read activity at the array level also fell to zero, but at the drive
>>> level 5 of the drives would still show activity.
>> Are you sure the read activity for the array was 0?
> 
> Yep.  According to iostat, absolute zilch.

Peculiar. I cannot explain that.

>> If the array wasn't
>> doing anything but the individual drives were, that would indicate a
>> lower-level problem than the filesystem;
> 
> It could, yes.  In fact, it is not unlikely to be and interaction failure
> between the file system and the RAID device management system (/dev/md0, or
> whatever).
> 
>> unless I'm missing something,
>> the filesystem can't do anything to the individual drives without it
>> showing up as read/write from/to the array device.
> 
> I don't know if that's true or not.  Certainly if the FS is RAID aware, it
> can query the RAID system for details about the array and its member
> elements (XFS, for example does just this in order to automatically set up
> stripe width dur8ing format). 

For XFS, this appears to be done by mkfs.xfs via a GET_ARRAY_INFO ioctl
on the md block device. See the xfsprogs source, libdisk/md.c,
md_get_subvol_stripe().

> There's nothing to prevent the FS from
> issuing command directly to the drive management system (/dev/sda, /dev/sdb,
> etc.).

That seems to me like it would be opening a can of worms. It's the job
of md (or lvm, dm, etc.) to figure out which disk (or partition, or
file, etc.) to read/write; otherwise, the filesystem would have to
consider a number of factors, even besides RAID layout. Someone please
correct me if I'm mistaken....

>> Did you ever test with dstat and debugreiserfs like I mentioned earlier
>> in this thread?
> 
> Yes to the first and no to the second.  I must have missed the reference in
> all the correspondence.  'Sorry about that.

That's ok.

>>>> It would always be the same 5 drives which dropped to zero
>>>> and the same 5 which still reported some reads going on.
>> I did the math and (if a couple reasonable assumptions I made are
>> correct), then the reiserfs bitmaps would indeed be distributed among
>> five of 10 drives in a RAID-6.
>>
>> If you're interested, ask, and I'll write it up.
> 
> It's academic, but I'm curious.  Why would the default parameters have
> failed?

It's not exactly a "failure"--it's just that the bitmaps are placed
every 128 MB, and that results in a certain distribution among your disks.

bitmap_freq = 128 MB * 1024 KB/MB = 131072 KB


For a simple example, first consider a 2-disk RAID-0 with the default 64
KB chunk size.

num_data_disks = 2
chunk_size = 64 KB
stripe_size = chunk_size * num_data_disks = 128 KB
stripe_offset = bitmap_freq / stripe_size = 1024

131072 is a multiple of 128, so the bitmaps are all on the same disk,
1024 stripes apart.


Now consider a 3-disk RAID-0. 131072 is not a multiple of 192.

num_data_disks = 3
chunk_size = 64 KB
stripe_size = chunk_size * num_data_disks = 192 KB
stripe_offset = bitmap_freq / stripe_size = 682.6666....

Bitmaps are 682 and 2/3 stripes apart. 2/3 of a 3-chunk stripe is 2
chunks, so if the first bitmap is on the first disk, the next bitmap
would be on the third disk, then the second disk, then back to the
first: (A,C,B,...). In this case the bitmaps would be spread among all
three disks.


Now lets look at your 10-disk RAID-6. This is more complicated because
we have to consider that two chunks out of each stripe hold parity, and
that the chunk layout changes with each stripe. Here's where I have to
make an assumption: I can't find out whether the layout methods for
RAID-6 are the same as for RAID-5. If they are, the layout for your RAID
will be like this (the default left-symmetric) or at least substantially
similar.

         disk  ABCDEFGHIJ

stripe 0:      abcdefghPP
stripe 1:      bcdefghPPa
stripe 2:      cdefghPPab
stripe 3:      defghPPabc
stripe 4:      efghPPabcd
stripe 5:      fghPPabcde
stripe 6:      ghPPabcdef
stripe 7:      hPPabcdefg
stripe 8:      PPabcdefgh
stripe 9:      PabcdefghP

Note that the layout repetition period is the same as the number of
disks. So...

chunk_size = 64 KB
num_disks = 10
num_data_disks = num_disks - 2 = 8
stripe_size = chunk_size * num_data_disks = 512 KB
stripe_offset = bitmap_freq / stripe_size = 256

131072 is a multiple of 512, so the bitmaps are all on the first chunk
of a stripe, 256 stripes apart; however, 256 is not a multiple of the
chunk layout period, so, for each stripe that holds a bitmap, the
position of the first chunk will vary.

chunk_layout_period = num_disks = 10
stripe_layout_offset = stripe_offset % chunk_layout_period = 6

That means each subsequent bitmap will be 6 stripes later within the
stripe layout pattern: 0,6,2,8,4,...

The first chunk is chunk "a", so, for each of those stripes, find which
disk chunk "a" is on in the layout table above. That yields disks
A,E,I,C,G: five disks out of the ten, just like you reported.


(Hopefully I didn't screw up too much of that.)

>>>> During a RAID resync, almost every file create causes a halt.
>> Perhaps because the resync I/O caused the bitmap data to fall off the
>> page cache.
> 
> How would that happen?  More to the point, how would it happen without
> triggering activity in the FS?

That was sort of a speculative statement, and I can't really back it up
because I don't know the details of how the page cache fits in, but IF
the data read and written during a resync gets cached, then the page
cache might prefer to retain that data rather than the bitmap data.

If the bitmap data never stays in the page cache for long, then a file
write would pretty much always require some bitmaps to be re-read.

-Corey
