From: Bruce Israel <israel@tux.org>
Subject: Re: a hosed reiserfs
Date: Sun, 4 Jul 2004 12:20:21 -0400
Message-ID: <20040704122021.A25785@tux.org>
References: <20040625115258.A27445@tux.org> <200406252006.55426.vitaly@namesys.com> <40DC58B7.109@namesys.com> <20040625144523.A5159@tux.org> <40E0595D.8060106@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19503-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40E0595D.8060106@namesys.com>; from reiser@namesys.com on Mon, Jun 28, 2004 at 10:46:05AM -0700
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>

On Mon, Jun 28, 2004 at 10:46:05AM -0700, Hans Reiser wrote:
>
> www.namesys.com/support.html takes credit cards.  Thanks for being our 
> customer.

OK, done.

Here's the current situation:

My partition doesn't mount.  reiserfsck says there are bad blocks.  The
output of 'debugreiserfs' is as follows:

    Filesystem state: consistency is not checked after last mounting

    Reiserfs super block in block 16 on 0x2148 of format 3.6 with standard journal
    Count of blocks on the device: 4885760
    Number of bitmaps: 150
    Blocksize: 4096
    Free blocks (count of blocks - used [journal, bitmaps, data, reserved] blocks): 1095151
    Root block: 9426
    Filesystem is NOT cleanly umounted
    Tree height: 4
    Hash function used to sort names: "r5"
    Objectid map size 602, max 972
    Journal parameters:
	    Device [0x0]
	    Magic [0x4edee6b]
	    Size 8193 blocks (including 1 for journal header) (first block 18)
	    Max transaction length 1024 blocks
	    Max batch size 900 blocks
	    Max commit age 30
    Blocks reserved by journal: 0
    Fs state field: 0x0:
    sb_version: 2
    inode generation number: 2033166
    UUID: af13ddfc-8726-4732-bbf5-db17b6c6671d
    LABEL: 
    Set flags in SB:
	    ATTRIBUTES CLEAN

The partition table looks fine (and hasn't changed in the last 6 months or
so). 

I've tried running dd_rescue to copy the partition over; I've run it both
forward and reverse.  Whenever I run it, it copies for a while and then
hangs my system (Linux 2.6.5-gentoo-r1; also hangs a 2.6.3 kernel).

When I say it hangs, I mean that all other shells and virtual consoles are
non-responsive, and the only thing that works is the reset button on the
front panel.

I also tried /sbin/badblocks which hung the sytem as well.

When I run dd_rescue forward, it copies about 4.5GB (out of 20GB total),
before hanging, resulting in the following file:

4511808 -rw-r-----    1 root     4615569408 Jul  2 23:50 hdf8

I've also run it forward and then reverse on the same file.  It seems to
only copy about 20 Meg or so in the reverse direction.  The most recent
effort resulted in:

4520612 -rw-r-----    1 root     20012073984 Jul  4 12:04 hdf8-2

I've tried giving it starting byte counts of the size (or 1K less), but it
still hangs, just a lot quicker.  Turning on dd_rescue's logging doesn't
help; it appears that the system is locked up before anything is either
written or flushed.

This is a very slow process since I have to reboot after each time I run
it. 

What should I do?

Bruce
