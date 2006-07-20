From: David Masover <ninja@slaphack.com>
Subject: Re: create very large file system
Date: Thu, 20 Jul 2006 11:46:31 -0500
Message-ID: <44BFB367.6080503@slaphack.com>
References: <e9l7bh$134$1@sea.gmane.org> <200607191657.38644.zam@namesys.com>	<20060720062646.GA6174@schatzie.adilger.int> <20060720071118.GA6553@HAL_5000D.tc.ph.cox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29089-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060720071118.GA6553@HAL_5000D.tc.ph.cox.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Clay Barnes <clay.barnes@gmail.com>
Cc: Alexander Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com, Mark F <mfaine@knology.net>

Clay Barnes wrote:
> On 02:26 Thu 20 Jul     , Andreas Dilger wrote:
>> On Jul 19, 2006  16:57 +0400, Alexander Zarochentsev wrote:
>>> On Wednesday 19 July 2006 16:10, Mark F wrote:
>>>> I've tried to create a large 5TB file system using both reiserfs and
>>>> ext3 and both have failed.
>>> you might need to convert the partition table to GPT format for 
>>> supporting 2TB+ partitions.  it can be done by the gnu parted tool.
>> Or, for that matter, don't use a partition table at all, since this
>> adds an unhelpful offset to all the filesystem structures and can
>> hurt performance on RAID where the filesystem is trying to align IO
>> to RAID stripe boundaries.
> Well, damn.  Too late for that to help me.  I've a 700GB that's...
> rather too full to put on DVDs or my other drives to fix that.  There
> isn't some "safe" way to remove a partition table from a SW RAID array,
> is there?

Define "safe".  You could probably do it non-destructively with dd, if 
you set the block size properly.  That doesn't make it safe, though, 
you're basically screwed if you lose power.

And even once you do that, I don't think the Reiser4 tools would let you 
resize.

Anyway, I haven't tried this myself, as my SW RAID does actually have 
multiple partitions, for good reason.
