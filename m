From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: Sun, 27 Jul 2003 17:24:11 +0400
Message-ID: <3F23D27B.3070209@namesys.com>
References: <3F1EF7DB.2010805@namesys.com> <20030726013301.6164e6e4.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15067-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030726013301.6164e6e4.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Morton <akpm@osdl.org>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, torvalds@transmeta.com, marcelo@conectiva.com.br, mason <mason@namesys.com>

Andrew Morton wrote:

>Hans Reiser <reiser@namesys.com> wrote:
>  
>
>>Please look at http://www.namesys.com/benchmarks/v4marks.html
>>    
>>
>
>It says "but since most users use ext3 with only meta-data journaling"
>which isn't really correct.  ext3's metadata-only journalling mode is
>writeback mode.
>
>Most people in fact use ext3's ordered mode, which provides the same data
>consistency guarantees on recovery as data journalling.
>
>Please compare against the ext3 in -mm.  It has tweaks which aren't yet
>merged, but which will be submitted soon.
>
>
>
>  
>
We are going to run a bunch more benchmarks when I get back, probably 
doing things like turning on htrees and tail combining and stuff, in 
lots of different combinations.  Ordered mode will be added, as well as 
making green have a uniform meaning for all the benchmarks;-).  This 
benchmark was just what could be done before I got on a plane.

-- 
Hans


