From: Jordan Breeding <jordan.breeding@attbi.com>
Subject: Re: [RFC] [PATCH] Label support in mount
Date: Thu, 29 Aug 2002 08:26:35 -0500
Message-ID: <3D6E210B.5040604@attbi.com>
References: <20020829052041.GDJC14185.rwcrmhc51.attbi.com@rwcrwbc58>	<20020829052400.GD19435@clusterfs.com>  <3D6DC28C.70007@attbi.com> <1030623269.17778.332.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11343-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Andreas Dilger <adilger@clusterfs.com>, reiserfs-list@namesys.com

Chris Mason wrote:
> On Thu, 2002-08-29 at 02:43, Jordan Breeding wrote:
> 
>>Andreas Dilger wrote:
>>
>>>On Aug 29, 2002  05:20 +0000, jordan.breeding@attbi.com wrote:
>>>
>>>
>>>> This patch was originally intended to try and add
>>>>support for reiserfs labels to mount from
>>>>util-linux-2.11u found on ftp.kernel.org.  It is not
>>>>quite working (if I try to mount something by label the
>>>>mount program seg. faults), and I won't have time to
>>>>debug and look at it until at least tomorrow night.  I am
>>>>sure there is something trivial or stupid that I have
>>>>done wrong.  At least it is a starting point, if someone
>>>>knows what is wrong and knows how to fix it quickly then
>>>>feel free to fix the patch and send it back to me or send
>>>>it to the util-linux maintainer.
>>>
> 
> Hi Jordan,
> 
> Here's my current patch, the only bug is that can detect 3.5.x
> filesystems with a relocated journal as 3.6.x (with a label/uuid).
> 
> Once I get that fixed I'll send along to the mount maintainer:
> 

Chris,

   Thanks.  Your patch works perfectly for my partitions.

Jordan




