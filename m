From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 data journalling?
Date: Fri, 29 Aug 2003 00:48:36 +0400
Message-ID: <3F4E6AA4.3030900@namesys.com>
References: <3F4E3AF9.2060100@tupshin.com> <16206.16138.72832.920045@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15479-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16206.16138.72832.920045@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Tupshin Harper <tupshin@tupshin.com>, Reiserfs List <reiserfs-list@namesys.com>

Nikita Danilov wrote:

>Tupshin Harper writes:
> > Will reiser4 have options equivalent to ext3's data=journal and 
> > data=ordered options? My understanding is that reiser4(and reiser3) do 
> > the equivalent of ext3's writeback mode(correct?). Any plans for the 
>
>reiserfs has meta-data only journalling by default (equivalent to
>writeback mode), and optionally supports full data journalling (Chris
>patches).
>
>reiser4 supports full data journalling only
>
full data journaling means that if you perform writes that are 4k or 
less, and page align them, they will be performed atomically. 

Reiser4 is a fully atomic filesystem, and that means that you can 
perform a set of filesystem operations of any size, and they will be 
performed atomically.  By default, every fs system call is performed 
atomically.

Please describe reiser4 as an atomic filesystem, not as (just) a data 
journaling filesystem, ok?

>, but it is still faster than
>ext3-writeback.
>
>Look at http://www.namesys.com/benchmarks.html for last benchmarking
>results.
>
> > other modes in order to maximize data integrity?
> > 
> > -Tupshin
> > 
>
>Nikita.
>
>
>  
>


-- 
Hans


