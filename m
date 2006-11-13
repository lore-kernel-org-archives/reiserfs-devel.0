From: Christopher Chan <chrisfz@netvigator.com>
Subject: Re: Which version will be merged into mainline kernel?
Date: Mon, 13 Nov 2006 11:11:16 +0800
Message-ID: <4557E254.5060404@netvigator.com>
References: <194f62550610160250u265ef120lee3cf9a17266939f@mail.gmail.com>	<454A596F.8070909@namesys.com>	<194f62550611072321j1cd34205u55f3c121dcac7aac@mail.gmail.com>	<200611081015.14320.biscani@pd.astro.it>	<20061108102136.GS6012@schatzie.adilger.int> <ej4pca$tft$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30143-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ej4pca$tft$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: danny.milo@scratchpost.org
Cc: reiserfs-list@namesys.com

Danny Milosavljevic wrote:
> Hi,
> 
> On Wed, 08 Nov 2006 03:21:36 -0700, Andreas Dilger wrote:
> 
>> On Nov 08, 2006  10:15 +0100, Francesco Biscani wrote:
>>> I think the slow performance you're experiencing are caused by the fsync() 
>>> call not being well-optimized in reiser4. I've commented out the function in 
>>> fs/buffer.c, and I'm having much better performance on my / partition.
>> I don't think this can be advocated as a real solution to performance
>> problems.  This can mean data loss for some applications like email that
>> expect "fsync return" to mean "this data is safely on disk".  
> 
> I've never understood this kind of attitude some MTAs have. Usually the
> hardware would make sure that stuff doesn't disappear (UPS, powered RAM,
> harddisk condenser) and not some weird software workaround that complicates
> and slows down everything.
> 
> The only possibility one could still lose mail when having proper
> hardware failsafes would be if the kernel had a bug and crashed (and that's
> so bad, it doesn't really warrant any working around it).

Ever used DOS with smartdrv? smartdrv gave a performance boost by 
storing recently touched files in memory and writing to disk later. This 
is called a disk cache. You would be explicitly told to NOT just turn 
off the computer each time smartdrv was loaded. You had to first clear 
the cache and then you could power off the box otherwise you would lose 
any data sitting in the cache that had not been flushed.

All current Unices have disk cache capabilities built-in and the only 
way to bypass the disk cache for those applications that needed to have 
their data definitely written to disk and not sitting the cache was the 
fsync and fsyncdata calls.
