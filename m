From: Hans Reiser <reiser@namesys.com>
Subject: Re: Re: [PATCH CFT] tons of logging patches
Date: Fri, 02 Aug 2002 16:59:39 +0400
Message-ID: <3D4A823B.7040803@namesys.com>
References: <200206222202.56577.Dieter.Nuetzel@hamburg.de>	<1024945533.9008.10.camel@tin	 y> 	<200207091552.52815.Dieter.Nuetzel@hamburg.de>	<1026223243.5603.124.camel@tiny> <1026502991.4952.136.camel@tiny> 	<3D30CB31.8040703@mb.tu-ilmenau.de>  <1028291287.12934.207.camel@tiny> <1028291685.19330.215.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11112-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Chris Mason wrote:

>On Fri, 2002-08-02 at 08:28, Chris Mason wrote:
>  
>
>>Hello everyone,
>>
>>I've uploaded 03-data-logging-24.diff, which fixes a tail packing oops
>>in data=journal mode, and fixes the data=ordered slow down (5-10%)
>>introduced in -23.  
>>    
>>
>
>Whoops, I neglected to mention that data=ordered is now the default in
>the patch.  You can mount with -o data=writeback if you don't want
>ordered data writes.
>
>-chris
>
>
>
>
>  
>
we just saw a benchmark in which data=ordered caused a major slowdown. 
 Does this patch fix this?

Edward and Elena, I want thorough benchmarking of this.

-- 
Hans



