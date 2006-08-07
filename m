From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Mon, 7 Aug 2006 19:55:58 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0608071954560.3365@yvahk01.tjqt.qr>
References: <200608071737.k77Hbjph002429@wind.enjellic.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29528-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608071737.k77Hbjph002429@wind.enjellic.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@enjellic.com
Cc: Theodore Tso <tytso@mit.edu>, Adrian Ulrich <reiser4@blinkenlights.ch>, vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

>> With the latest e2fsprogs and 2.6 kernels, the online resizing
>> support has been merged in, and as long as the filesystem was
>> created with space reserved for growing the filesystem (which is now
>> the default, or if the filesystem has the off-line prepration step
>> ext2prepare run on it), you can run resize2fs on a mounted
>> filesystem and grow an ext2/3 filesystem on-line.  And yes, you get
>> more inodes as you add more disk blocks, using the original inode
>> ratio that was established when the filesystem was created.
>
>Are all the necessary tools in and documented in e2fsprogs?
>
>It seems that finding all the bits and pieces to do ext3 on-line
>expansion has been a study in obfuscation.  Somewhat surprising since
>this feature is a must for enterprise class storage management.

Enterprise will hardly use ext3 on the big ones, but one of the "more
commercial" things.



Jan Engelhardt
-- 
