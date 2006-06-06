From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4: first impression (vs xfs and jfs)
Date: Tue, 06 Jun 2006 12:26:24 -0700
Message-ID: <4485D6E0.8090406@namesys.com>
References: <20060523155102.GB25889@zero> <20060606134459.GA18513@zero> <1149604706.6389.40.camel@tribesman.namesys.com> <20060606153035.GF10672@HAL_5000D> <op.taqjp6bvcigqcu@apollo13>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28751-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.taqjp6bvcigqcu@apollo13>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: PFC <lists@peufeu.com>
Cc: Clay Barnes <clay.barnes@gmail.com>, "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

PFC wrote:

>
>> This may have been mentioned before, but perhaps there could be a
>> "trickle-out" option along the lines of "if the hard drive is idle (and
>> optionally only if it's spun up), slowly write out the changes to the
>> disk structure."  This could also be paired with keeping as much of the
>> data in memory as necessary to mantain the speed boost that r4 gets from
>> temporal locality of reference, possibly just giving it to the system
>> cache.
>
>
>     Hm actually, this looks a lot like read-ahead algorithms, but
> instead  it's "write-ahead" :
>
>     For instance :
>     - Sequential writes on large files should stream through the cache.
>     - Random writes or small file writes should be kept as long as
> possible  in dirty pages so they can be coalesced into larger writes
> with a better  disk layout on flush, or not written at all if it was
> temp files from a  make, for instance.
>
>     Do the file copying programs open their output files with
> O_SEQUENTIAL ?  If so, there is information to exploit...
>
>
You can change them to do so....
