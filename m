From: Phil Frost <indigo@bitglue.com>
Subject: Re: A strategy to recover from a bad block infected disk in middle of an LVM array situation
Date: Mon, 7 Jun 2004 19:00:21 -0400
Sender: Phil Frost <indigo@unununium.org>
Message-ID: <20040607230021.GA22624@unununium.org>
References: <1EC1DF61-B8D5-11D8-9336-000A9566C776@cc.hut.fi>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19074-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1EC1DF61-B8D5-11D8-9336-000A9566C776@cc.hut.fi>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I don't know much about reiser, but if you need to image your disk but
need the block device for LVM, loopback can do that. The trick is to
manually bind the file to a loop device, with a command like

losetup /dev/loop0 imagefile

Then /dev/loop0 is a real block device using the image file, and you
should be able to give it to LVM.

On Tue, Jun 08, 2004 at 01:50:49AM +0300, Tuomas Jormola wrote:
> Hello list,
> 
> I've beginning to get bad blocks on a disk that is part of an LVM 
> array. Here's my plan how to get away with the situation. I'm hoping to 
> hear some comments if there's something that should be done in a 
> smarter way.
> 
> Ok, currently I'm running badblocks(8) against the LVM volume block 
> device to find out exactly which blocks are bad but I don't think there 
> are awfully lot of those yet. However, if you try to mount the fs, you 
> get the following kernel warnings
> 
> ReiserFS: dm-12: warning: sh-2029: reiserfs read_bitmaps: bitmap block 
> (#6275072) reading failed
> ReiserFS: dm-12: warning: jmacd-8: reiserfs_full_super: unable to read 
> bitmap
> 
> and after that mount fails. Since the filesystem is about 300GB I don't 
> have the space to read the whole LVM block device with dd_rescue to an 
> image file and use it for recovering. Also I can't just make an image 
> of the fault disk with dd_rescue because you can't replace the real 
> disk with an image file when using LVM - it must be a block device. 
> Therefore I'm hoping to get 100% identical working disk (same brand, 
> model and hopefully size ;) with the failed one tomorrow and then I'm 
> going to clone the failed disk to the new one with dd_rescue.
> 
> [snip]
> 
> -- 
> Tuomas Jormola <tjormola@cc.hut.fi>
