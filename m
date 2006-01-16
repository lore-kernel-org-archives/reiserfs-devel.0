From: Jan Kara <jack@ucw.cz>
Subject: Re: Data being corrupted on reiserfs 3.6
Date: Mon, 16 Jan 2006 11:41:37 +0100
Message-ID: <20060116104137.GA18267@atrey.karlin.mff.cuni.cz>
References: <43C97E17.7030604@xterminate.me.uk> <20060115204143.GC24752@atrey.karlin.mff.cuni.cz> <43CAC054.5020104@xterminate.me.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27744-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <43CAC054.5020104@xterminate.me.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Barnwell <xterminate@xterminate.me.uk>
Cc: reiserfs-list@namesys.com

  Hello,

> Jan Kara wrote:
> 
> <snip>
> >  Hmm, that is really strange. Do the files have the same size? Do you
> >get an error also if you just create file full of zeros? If so, how do
> >the differences look like (e.g. any signs of flipped bits or so?).
> >
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
> minutes but couldn't see anything but zeros - I'm not sure how to search 
> through a binary file for non-zero bytes.
  You can use 'od -t x1 <file>' - it should squeeze repeating characters
so you should see the non-zero ones easily...
  As Hans said usually such problems are hardware problems (memory,
overheating processor, flaky disk controler etc.).
  BTW: I generated the same file as you and md5sum of the one on
reiserfs is same as mine. So the file is stored correctly and something
wrong really happens during the copy from /tmp to /home/michael. I
looked at the differences and they don't seem to be random. It's always
a chunk of 3-16 bytes that gets corrupted. Then numbers written there
also do not seem to be random (lots of characters with code 16, 54,
128,...). I'll investigate more later...
  So this could be some memory corruption - for checking out this it
would be useful if you could try to reproduce the problem with 2.6.15
kernel. The problem might well be fixed there.

								Honza
