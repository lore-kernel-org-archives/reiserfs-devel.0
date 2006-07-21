From: Mark F <mfaine@knology.net>
Subject: Re: create very large file system
Date: Fri, 21 Jul 2006 10:58:44 -0500
Message-ID: <e9qtel$hcf$1@sea.gmane.org>
References: <e9l7bh$134$1@sea.gmane.org>
	<20060721153722.GA20270@devserv.devel.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <ext3-users-bounces@redhat.com>
In-Reply-To: <20060721153722.GA20270@devserv.devel.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/ext3-users>,
	<mailto:ext3-users-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/ext3-users>
List-Post: <mailto:ext3-users@redhat.com>
List-Help: <mailto:ext3-users-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/ext3-users>,
	<mailto:ext3-users-request@redhat.com?subject=subscribe>
Sender: ext3-users-bounces@redhat.com
Errors-To: ext3-users-bounces@redhat.com
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ext3-users@redhat.com
Cc: reiserfs-list@namesys.com

Stephen Tweedie wrote:
> Hi,
> 
> On Wed, Jul 19, 2006 at 07:10:56AM -0500, Mark F wrote:
>> Suse Linux Enterprise Server 9 SP3
>>
>> I've tried to create a large 5TB file system using both reiserfs and ext3 
>> and both have failed.
>>
>> I end up with only a 1.5TB file system.  Does anyone know why this doesn't 
>> work, what to do to fix it?
> 
> I fixed a bug in mke2fs that had this result over a year ago, so a
> recent e2fsprogs should fix it.
> 
> Failing that, there's a workaround: use "mke2fs -b 4096" to prevent
> mke2fs from trying to work out the device size in units of 1k blocks.
> Counting in 4k blocks prevents a 32-bit overflow.
> 
> --Stephen

Thanks,

I finally got it formated using the GPT label with parted.  I formatted it 
reiserfs, it takes a few seconds to mount but seems to work fine and shows up at 
full size.

-Mark
