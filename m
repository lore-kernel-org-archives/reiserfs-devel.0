From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Possible bug (assertion failed)
Date: Sat, 29 Mar 2003 21:46:19 +0100
Message-ID: <3E86061B.8070203@mb.tu-ilmenau.de>
References: <200303292031.h2TKVEQ9000888@smtp3.server.rpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13442-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jim Wisniewski <wisnij@rpi.edu>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 03/29/2003 09:31 PM, Jim Wisniewski wrote:
> On a system with SuSE 8.0 and some definite filesystem errors, booting from
> the install CD and running "reiserfsck --check /dev/hda6" results in the
> following:
> 
> 
> reiserfsck 3.x.1b (2002)
> Will read-only check consistency of the filesystem on /dev/hda6
> Will put log info to 'stdout'
> 
> Do you want to run this program?[N/Yes] (note need to type Yes):Yes
> ###########
> reiserfsck --check started at Sat Mar 29 14:17:51 2003
> ###########
> Replaying journal..
> 0 transactions replayed
> Checking S+tree.. /  1 (of   3)/  2 (of 128)/ 83 (of 170)bit 2015394848,
> bitsize 2430532
> reiserfsck: bitmap.c:160: reiserfs_bitmap_test_bit: Assertion `bit_number <
> bm->bm_bit_size' failed.
> Aborting

Hi,

can you retry this with the most recent reiserfsck, please?

ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.5.tar.gz

Maybe you'll need to build it statically ( make LDFLAGS='-static' ) and 
put it to a floppy.

Thanks,

Manuel

