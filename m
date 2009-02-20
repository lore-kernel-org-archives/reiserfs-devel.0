From: Zan Lynx <zlynx@acm.org>
Subject: Re: mmotm 2009-02-10-16-35 uploaded (reiser4-quota)
Date: Fri, 20 Feb 2009 11:12:31 -0700
Message-ID: <499EF28F.4080508@acm.org>
References: <499305AD.4020900@oracle.com>	<20090211171324.GC13817@duck.suse.cz>	<20090212114737.C8EA.KOSAKI.MOTOHIRO@jp.fujitsu.com> <20090211185321.138bb93a.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090211185321.138bb93a.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, Jan Kara <jack@suse.cz>, Randy Dunlap <randy.dunlap@oracle.com>, linux-kernel@vger.kernel.org, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Andrew Morton wrote:
> On Thu, 12 Feb 2009 11:49:20 +0900 (JST) KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com> wrote:
> 
>> Andrew, recently I've never seen any reiser4 activity in LKML.
>> I would suggest to remove it from -mm.
> 
> A handful of people use it, and the cost of carrying it is pretty low.
> 
> Hey, at least it handles ENOSPC without going BUG().

I use it and love it and I think its code belongs in the kernel far more 
than ext4 ever did when ext4 was first added.

By the way, I have been waiting for a new -mm release. :-)

Are there going to be any more -mm releases or are we supposed to use 
mmotm only now?

-- 
Zan Lynx
zlynx@acm.org

"Knowledge is Power.  Power Corrupts.  Study Hard.  Be Evil."
