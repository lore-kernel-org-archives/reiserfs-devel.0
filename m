From: Oleg Drokin <green@namesys.com>
Subject: Re: vs-3050: wait_buffer_until_released
Date: Wed, 19 Feb 2003 11:22:33 +0300
Message-ID: <20030219112233.A10215@namesys.com>
References: <200302181840.47996.sebastian.kanthak@muehlheim.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12834-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200302181840.47996.sebastian.kanthak@muehlheim.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Kanthak <sebastian.kanthak@muehlheim.de>
Cc: reiserfs-list@namesys.com, vs@namesys.com

Hello!

On Tue, Feb 18, 2003 at 06:40:47PM +0100, Sebastian Kanthak wrote:

> I'm using a  vanilla 2.4.20 kernel with reiserfs on lvm. I can reproducably 
> crash the system by accessing the reiserfs-partition via samba. If I do this, 
> the following message appears in the kernel log and repeats every 5 or 10 
> seconds.
> Feb 18 11:11:10 manticore kernel: vs-3050: wait_buffer_until_released: nobody 
> releases buffer (dev 3a:01, size 4096, blocknr 128036, count 2, list 0, state 
> 0x10019, page c1108284, (UPTODATE, CLEAN, UNLOCKED)). Still waiting 
> (60000000)  JDIRTY !JWAIT
> I've dumped the mentioned block via debugreiserfs and attached it to this 
> email.

Aha. More info for you.
If you mean the above message as the "crash", then there is different scenario,
that might be taking place.
There is a in-tree block that is marked as free in the bitmap (how did it get in
that state is still unclear). Now you use that block during tree traversals.
Then you want to allocate one more block. Bitmap allocator chooses the block
that is marked free and by accident it is the same block sthat is in fact used
already. We start to wait for buffer with the block to be released, but that's we
who hold the buffer in this case, so buffer is indeed never released.
You can fix this problem with reiserfsck --fix-fixable, just as it recommended.

Bye,
    Oleg
