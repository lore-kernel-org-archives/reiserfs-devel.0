From: Tuomas Jormola <tjormola@cc.hut.fi>
Subject: LVM array, one disk failed
Date: 28 Dec 2002 05:07:31 +0200
Message-ID: <1041044851.5964.32.camel@ganga>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12249-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

I'd be happy to use ReiserFS support services if they can help me here,
but I'd like post this question to the mailing list before paying since
PayPal doesn't support my bank so it's a bit troublesome to transfer the
money forth and back in case there's nothing to do in this case...

I have a 110GiB LVM array constructed using EVMS. It consists of three
IDE hard disks from which the last one died the other day. The
filesystem is ReiserFS, of course. Array is a linear one and there was
about 15GiB free space when disk died so I'm hoping there was a somewhat
resonable way to recover the data on two disks that are full and in
front of the array. The failed disk is totally dead, not just a couple
of bad sectors. It spins but it's not detected on boot. When I try to
mount the volume with only two disks connected, it get this:

sh-2029: reiserfs read_bitmaps: bitmap block (#19234816) reading failed
reiserfs_read_super: unable to read bitmap

Someone already asked a question regarding this error:
http://marc.theaimsgroup.com/?l=reiserfs&m=101232163203836&w=2
and Andreas Dilger provided with a clear answer but in this case it
probably doesn't work since so large part of the filesystem is missing.
Is someone able to say for sure if there's a chance to recover parts of
the filesystem or whether it can't be done?

Thanks and best regards,

-- 
Tuomas Jormola <tjormola@cc.hut.fi>

