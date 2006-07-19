From: Mark F <mfaine@knology.net>
Subject: Re: create very large file system
Date: Wed, 19 Jul 2006 08:24:35 -0500
Message-ID: <e9lblk$h45$1@sea.gmane.org>
References: <e9l7bh$134$1@sea.gmane.org> <200607191657.38644.zam@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29073-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200607191657.38644.zam@namesys.com>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: Ext3-users@redhat.com

Alexander Zarochentsev wrote:
> On Wednesday 19 July 2006 16:10, Mark F wrote:
>> Suse Linux Enterprise Server 9 SP3
>>
>> I've tried to create a large 5TB file system using both reiserfs and
>> ext3 and both have failed.
> 
> how did they fail?
> 
When I create the partition using cfdisk it appeared to be created correctly, now I have discovered that it is not.

I thought the problem was with the mkfs.<filesystem> commands but it looks like it is a bit deeper than that.

>> I end up with only a 1.5TB file system.  Does anyone know why this
>> doesn't work, what to do to fix it?
> 
> you have a single 5TB device? h/w raid, I think ?

Yes, Orion 12S RAID Array.  12x500GB drives

> 
> you might need to convert the partition table to GPT format for 
> supporting 2TB+ partitions.  it can be done by the gnu parted tool.
> 

Thanks, I don't know what GPT format is but I'll try to figure it out, I'm compiling/installing gparted right now.

-Mark

>> Others have suggested that  only XFS or JFS will work.  Is this so?
>>
>> Thanks,
>> -Mark
> 
> 

