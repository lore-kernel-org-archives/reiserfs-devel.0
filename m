From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: R4 won't mount.
Date: Wed, 21 Jan 2004 12:08:15 +0300
Message-ID: <16398.16767.736267.213891@laputa.namesys.com>
References: <20040121080522.85547.qmail@web21507.mail.yahoo.com>
	<400E3700.2090802@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16597-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <400E3700.2090802@shaw.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris wakefield <c_wakefield@shaw.ca>
Cc: Paolo Correnti <paolunix@yahoo.com>, reiserfs-list@namesys.com

Chris wakefield writes:
 > Hi Paolo.
 > Thanks for your reply.  I'm mounting a new reiser4 partition.  I just 
 > recreated another partition with cfdisk  (not rewriting R4 over the 

Let's get this straight:

1. partition (/dev/hda7) was created by cfdisk.
2. mkfs.reiser4 /dev/hda7 was executed
3. now mount fails

right?

 > previous one) and still won't mount.  I'm getting the usual error 
 > report:  "mount: wrong fs type, bad option, bad superblock on 
 > /dev/hda7.....etc"

What is in your kernel logs? (Use dmesg command or look into file like
/var/log/messages.)

 > I also recompiled my 2.6.1 kernel & reiser4progs-0.4.20 as well.
 > I have noticed that the kernel compile is complaining though, now that I 
 > think about it I remember the original patching coming up with "hunk  
 > #1, etc, succeeding, etc and I had about 6 or 8 of those.  I ignored 
 > them as I assumed the word "succeeding" meant that things went ok.
 > So my next step will be to repatch a fresh kernel.

That shouldn't matter.

 > Chris W.
 >  

Nikita.

 > 
