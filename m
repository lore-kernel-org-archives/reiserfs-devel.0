From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: --rebuild-tree with bad blocks (Was: Need a boot disk...)
Date: Sat, 1 Nov 2003 01:03:36 +0300
Message-ID: <200311010103.36476.vitaly@namesys.com>
References: <20031030181457.GA31387@the-love-shack.net> <Pine.LNX.4.58.0310301336010.8142@renaissance.laroia.net> <1067626286.727.10.camel@Gollum>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15953-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1067626286.727.10.camel@Gollum>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Malinovich <demonbane@the-love-shack.net>
Cc: reiserfs-list@namesys.com


Hello, 

> So now I'm left with quite a dilemma. I have a relatively small number
> of blocks killing the rebuild-tree scan and the computer along with it.
> (I start getting various scsi0: Command failed and IO errors and the
> disk becomes unresponsive). Is there any way that I can just avoid those
> blocks? Only about 15% of the data on that drive is REALLY important. I
> don't mind losing all the rest if I can just get that 15% moved
> somewhere safe somehow. Any way to do that?

I am sending you in the next email reiserfsprogs-3.6.12-pre1 that is 
just waiting for the proper documentation to be released. They have 
bad block support included. Prepare the list of bad block with the 
following:
    /sbin/badblocks -b 4096 -o bad_block_list /dev/xxx
and then run
    reiserfsck --rebuild-tree --badblocks bad_block_list /dev/xxx

-- 
Thanks,
Vitaly Fertman


