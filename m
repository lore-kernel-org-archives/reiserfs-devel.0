From: "Danny Milosavljevic" <danny_milo@yahoo.com>
Subject: Re: Which version will be merged into mainline kernel?
Date: Sat, 11 Nov 2006 15:14:18 +0000 (UTC)
Message-ID: <ej4pca$tft$1@sea.gmane.org>
References: <194f62550610160250u265ef120lee3cf9a17266939f@mail.gmail.com>
	<454A596F.8070909@namesys.com>
	<194f62550611072321j1cd34205u55f3c121dcac7aac@mail.gmail.com>
	<200611081015.14320.biscani@pd.astro.it>
	<20061108102136.GS6012@schatzie.adilger.int>
Reply-To: danny.milo@scratchpost.org
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30139-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

On Wed, 08 Nov 2006 03:21:36 -0700, Andreas Dilger wrote:

> On Nov 08, 2006  10:15 +0100, Francesco Biscani wrote:
>> I think the slow performance you're experiencing are caused by the fsync() 
>> call not being well-optimized in reiser4. I've commented out the function in 
>> fs/buffer.c, and I'm having much better performance on my / partition.
> 
> I don't think this can be advocated as a real solution to performance
> problems.  This can mean data loss for some applications like email that
> expect "fsync return" to mean "this data is safely on disk".  

I've never understood this kind of attitude some MTAs have. Usually the
hardware would make sure that stuff doesn't disappear (UPS, powered RAM,
harddisk condenser) and not some weird software workaround that complicates
and slows down everything.

The only possibility one could still lose mail when having proper
hardware failsafes would be if the kernel had a bug and crashed (and that's
so bad, it doesn't really warrant any working around it).

But maybe that's just me.

cheers,
  Danny

