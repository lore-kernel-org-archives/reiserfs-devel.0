From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: NFSv2 problem? initctl problem?
Date: Thu, 19 Aug 2004 14:30:43 +0300
Sender: owner-linux-fai@rrz.uni-koeln.de
Message-ID: <20040819113043.GI1284@nysv.org>
References: <20040818145103.GE1284@nysv.org> <200408191256.40317.bernd-schubert@web.de>
Mime-Version: 1.0
Return-path: <owner-linux-fai@rrz.uni-koeln.de>
Content-Disposition: inline
In-Reply-To: <200408191256.40317.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com, linux-fai@rrz.uni-koeln.de

On Thu, Aug 19, 2004 at 12:56:34PM +0200, Bernd Schubert wrote:
>
>Don't use te unfsd except for special reasons. If you want to test a userspace 
>daemon just use unfs3 (unfs3.sf.net).

I may have given the wrong impression here, I am still trying to use
knfsd here, I just tried the userspace one and noticed that it did not work.

>"man 5 nfs", mountoption is "nfsvers=3"

Heh, sorry about that one :)
OK, just have to google around on how to have it affect root=/dev/nfs

>> With the user-space NFS implementation I got the file id of 1476542499
>I wouldn't use the old userspace daemon with reiserfs at all, if you want to 
>do this, just use unfs3.

So I assume there's something really broken here, but still, it is irrelevant
because knfsd, which should work, doesn't work. And unless you or anyone
else who knows better than me about the situation on Linux NFS implementations
tells me unfs3 is better than knfsd, I'll stick to it :)

>2.) To test if exporting works, I would take a second non-rootnfs system and 
>try to mount the exported directories on this system. This will help you a 
>lot since you can experiment with mount options on this system and you can 
>check the syslogs.

I can mount the root-fs-to-be, /usr/lib/fai/nfsroot, on netbsd and read
from it. Unfortunately I don't yet have any other Linux at hand, and
depending on if FAI works or not, I won't have one today. At least I don't
think I can accomplish one, unless I conjure up an installation CD.

>3.) I mounting from you second server works, you can go on and see what 
>happens in your fai environment.

Is there any way of seeing more of the FAI environment?
Possibly I should edit in an interactive shell somehow.

But is it usual for knfsd with v2 to get stuck on /dev/initctl?
For the record, I also tried sync instead of async and with taking away
devfs=nomount...

From what I've gathered, getattr is just a side-effect of doing something
else, but NFS doesn't say what it's doing to a file. Does FAI or something
have a verbosity switch for this? More verbose than FAI_FLAGS: verbose=1 :P

>Your questions are completety off topic from the view of reiserfs, since there 
>are many people (including our group) who use nfs and reiserfs. However you 

I'm almost desperate here, please forgive me :)

I will remove the reiserfs-list in my next reply.

>PS: If you should decide to unfs3 for some tests, make sure it is able to 

I might if I have more time, now I'd rather have just something, ANYTHING,
that works..

>include the ext2_fs.h, unfortunality the one from the debian kernel-headers 
>package is broken :(, replace it with the file from Mariusz Mazur headers 
>(http://ep09.pld-linux.org/~mmazur/linux-libc-headers/)

Thanks for the tip and the reply!

-- 
mjt

