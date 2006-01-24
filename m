From: Jan Kara <jack@ucw.cz>
Subject: Re: Data being corrupted on reiserfs 3.6
Date: Tue, 24 Jan 2006 15:09:23 +0100
Message-ID: <20060124140923.GD10638@atrey.karlin.mff.cuni.cz>
References: <43C97E17.7030604@xterminate.me.uk> <20060115204143.GC24752@atrey.karlin.mff.cuni.cz> <43CAC054.5020104@xterminate.me.uk> <20060116104137.GA18267@atrey.karlin.mff.cuni.cz> <43D376BE.7010800@xterminate.me.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27846-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <43D376BE.7010800@xterminate.me.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Barnwell <xterminate@xterminate.me.uk>
Cc: reiserfs-list@namesys.com

  Hello,

> Jan Kara wrote:
> <snip>
> >>
> >  You can use 'od -t x1 <file>' - it should squeeze repeating characters
> >so you should see the non-zero ones easily...
> >  As Hans said usually such problems are hardware problems (memory,
> >overheating processor, flaky disk controler etc.).
> >  BTW: I generated the same file as you and md5sum of the one on
> >reiserfs is same as mine. So the file is stored correctly and something
> >wrong really happens during the copy from /tmp to /home/michael. I
> >looked at the differences and they don't seem to be random. It's always
> >a chunk of 3-16 bytes that gets corrupted. Then numbers written there
> >also do not seem to be random (lots of characters with code 16, 54,
> >128,...). I'll investigate more later...
> >  So this could be some memory corruption - for checking out this it
> >would be useful if you could try to reproduce the problem with 2.6.15
> >kernel. The problem might well be fixed there.
> 
> I finally upgraded to 2.6.15-1 and I'm still seeing the same problem 
> there - It's possibly its a memory issue or flaky disk controller, it's 
> a Silicon Image 3114 PCI card that I've not used before these hard 
> disks, it's more likely then memory which has been going fine for a 
> couple of years without any problems but I will run memtest86 when I get 
> the chance.
  Ok. Have you tried to reproduce the problem on some other hardware
(with some other controler)?

> Oh and I don't know if I mentioned this before but the corruption only 
> ever occurs on writing not reading.
> 
> Can anyone suggest a test to tell if it is the disk controller?
  I have no other idea than try a different hardware...

									Honza
