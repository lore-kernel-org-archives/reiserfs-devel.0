From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiserfs on redhat advanced server?
Date: Fri, 31 Jan 2003 17:15:49 +0300
Message-ID: <3E3A8515.5010701@namesys.com>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org>	 <3E397A19.60409@namesys.com> <20030130234142.E8448@vestdata.no>	 <3E3A6071.6060102@namesys.com> <20030131115333.GC15359@marowsky-bree.de>	 <3E3A67AE.4050601@namesys.com> <20030131122147.GE15359@marowsky-bree.de>	 <3E3A6D76.7080300@namesys.com> <20030131123943.GH15359@marowsky-bree.de>	 <20030131160624.A12036@namesys.com> <1044021310.15684.154.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12583-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1044021310.15684.154.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Oleg Drokin <green@namesys.com>, Lars Marowsky-Bree <lmb@suse.de>, reiserfs-list@namesys.com

Chris Mason wrote:

>On Fri, 2003-01-31 at 08:06, Oleg Drokin wrote:
>  
>
>>Hello!
>>
>>On Fri, Jan 31, 2003 at 01:39:43PM +0100, Lars Marowsky-Bree wrote:
>>
>>    
>>
>>>Woot? Mainline tends to crash under Oracle or SAP, for example, lacks drivers
>>>etc. Yeah, this is a problem, but don't bitch at the distros about it, but at
>>>the driver developers etc.
>>>      
>>>
>>Distro kernels tend to crash in unusual places, too.
>>E.g. SuSE 8.1 default kernel breaking under memory pressure.
>>RedHat 8.0 default kernel with slow block devices and ext3 bugs.
>>And so on.
>>    
>>
>
>The simple truth is that all kernels have bugs. 
>
Yes, true.

> In general, I believe
>the distro kernels are more suitable for production use than a vanilla
>kernel.  These companies are betting their support time and future
>revenue on their kernels working properly, and the distros take that
>very seriously.
>
and Marcelo does not have his reputation bet on it?

>
>The fact that nobody actually ships a vanilla kernel should make it
>pretty clear the stock releases are not ready for the tasks our
>customers need them for.  
>
This is not clear to me at all.

>The fact that our customers pay us to add
>patches instead of using the stock kernel for free is also important.
>
There is a difference between using a distro kernel because it has some 
missing feature (desiring untested by the masses features is 
reasonable), and using it because it is more stable (thinking features 
untested by the masses for 6 weeks are stable is unreasonable).

I think our developer community is slowly breaking down into squabbling 
sub-herds....

it is sad to watch....

I think the difficulty of getting good patches into the kernel 
accentuates the trend.

I think most users would be happier if the patches went straight to 
Marcelo rather than through a distro.

I think that most users are better off with a recent stable kernel with 
a good word of mouth than blindly using what the distro ships.  I think 
that most users don't have the time to be bothered with downloading and 
compiling a kernel, but those that do should feel confident about doing 
so.  We probably need a better system of rating and labeling kernels 6 
weeks after they have shipped.

-- 
Hans


