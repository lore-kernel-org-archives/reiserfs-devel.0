From: Michael Barnwell <xterminate@xterminate.me.uk>
Subject: Re: Data being corrupted on reiserfs 3.6
Date: Sun, 15 Jan 2006 21:36:20 +0000
Message-ID: <43CAC054.5020104@xterminate.me.uk>
References: <43C97E17.7030604@xterminate.me.uk> <20060115204143.GC24752@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27731-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060115204143.GC24752@atrey.karlin.mff.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Kara <jack@ucw.cz>
Cc: reiserfs-list@namesys.com

Hi,

Jan Kara wrote:

<snip>
>   Hmm, that is really strange. Do the files have the same size? Do you
> get an error also if you just create file full of zeros? If so, how do
> the differences look like (e.g. any signs of flipped bits or so?).
> 

michael@biggs:/tmp$ dd bs=1024 count=1000k if=/dev/zero of=./1GB.tst
1024000+0 records in
1024000+0 records out
1048576000 bytes transferred in 61.578769 seconds (17028207 bytes/sec)
michael@biggs:/tmp$ ls -l 1GB.tst
-rw-r--r--  1 michael michael 1048576000 2006-01-15 20:51 1GB.tst
michael@biggs:/tmp$ md5sum 1GB.tst
e5c834fbdaa6bfd8eac5eb9404eefdd4  1GB.tst
michael@biggs:/tmp$ ls -l /home/michael/1GB.tst
-rw-r--r--  1 michael michael 1048576000 2006-01-15 20:54 
/home/michael/1GB.tst
michael@biggs:/tmp$ md5sum /home/michael/1GB.tst
92c51557041ebd6424b4467a878c9f44  /home/michael/1GB.tst

I looked at the file in /home/michael/1GB.tst with xdd for about 5 
minutes but couldn't see anything but zeros - I'm not sure how to search 
through a binary file for non-zero bytes.

So yes, error if the file is all zeros and they have the same size.

Thanks,

Michael Barnwell.
