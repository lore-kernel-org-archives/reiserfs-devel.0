From: Hans Reiser <reiser@namesys.com>
Subject: Re: Data being corrupted on reiserfs 3.6
Date: Mon, 16 Jan 2006 01:45:35 -0800
Message-ID: <43CB6B3F.6000706@namesys.com>
References: <43C97E17.7030604@xterminate.me.uk> <20060115204143.GC24752@atrey.karlin.mff.cuni.cz> <43CAC054.5020104@xterminate.me.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27742-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43CAC054.5020104@xterminate.me.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Barnwell <xterminate@xterminate.me.uk>
Cc: Jan Kara <jack@ucw.cz>, reiserfs-list@namesys.com

Normally we tell people that data corruption bugs must be bad hardware
for V3, and this was good advice empirically in the past, however, my
vague memory is that there have been more than usual reports of problems
with V3 recently.  Can you try to reproduce on different hardware, or
look through our mailing list traffic for similar problems recently? If
you can reproduce it on different memory and CPU or find someone else
posting with a similar experience, then I'll ask the guys to try to
reproduce it also.  Bad hardware can fail for reiserfs and not fail for
ext3 because we make the CPU 1-2C hotter and things like fans blocked
from turning by cables really can matter  for us and not ext3 (a real
user experience was just described).  In any event, even if it was bad
hardware, please let me know.

Hans

Michael Barnwell wrote:

> Hi,
>
> Jan Kara wrote:
>
> <snip>
>
>>   Hmm, that is really strange. Do the files have the same size? Do you
>> get an error also if you just create file full of zeros? If so, how do
>> the differences look like (e.g. any signs of flipped bits or so?).
>>
>
> michael@biggs:/tmp$ dd bs=1024 count=1000k if=/dev/zero of=./1GB.tst
> 1024000+0 records in
> 1024000+0 records out
> 1048576000 bytes transferred in 61.578769 seconds (17028207 bytes/sec)
> michael@biggs:/tmp$ ls -l 1GB.tst
> -rw-r--r--  1 michael michael 1048576000 2006-01-15 20:51 1GB.tst
> michael@biggs:/tmp$ md5sum 1GB.tst
> e5c834fbdaa6bfd8eac5eb9404eefdd4  1GB.tst
> michael@biggs:/tmp$ ls -l /home/michael/1GB.tst
> -rw-r--r--  1 michael michael 1048576000 2006-01-15 20:54
> /home/michael/1GB.tst
> michael@biggs:/tmp$ md5sum /home/michael/1GB.tst
> 92c51557041ebd6424b4467a878c9f44  /home/michael/1GB.tst
>
> I looked at the file in /home/michael/1GB.tst with xdd for about 5
> minutes but couldn't see anything but zeros - I'm not sure how to
> search through a binary file for non-zero bytes.
>
> So yes, error if the file is all zeros and they have the same size.
>
> Thanks,
>
> Michael Barnwell.
>
>

