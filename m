From: Nick Matteo <kundor@member.fsf.org>
Subject: Re: reiser limits
Date: Fri, 16 Apr 2004 09:19:59 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <c5om4s$rvd$1@sea.gmane.org>
References: <001d01c422e2$9f7e14d0$3f32a8c0@ds.ig.com.br> <1082034018.27614.145.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-list-return-18000-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Chris Mason wrote:

> On Thu, 2004-04-15 at 08:10, Fabiano Reis wrote:
>> Hi list,
>>  
>> Someone knows how many directory can I create inside a single
>> directory?
> 
> Both 2.4.x and 2.6.x v3 have no additional limits on subdirs, it's the
> same as the number of files you can put on the FS (~2^32).
> 
> v4 might be higher, not sure.
> 
> -chris

Can 64-bit platforms have 2^64 files?

