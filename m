From: Manuel Krause <manuelkrause@netscape.net>
Subject: data-logging for 2.4.21+ (was Re: How to build a big file server)
Date: Sat, 14 Jun 2003 13:11:31 +0200
Message-ID: <3EEB02E3.6030608@netscape.net>
References: <1054800852.1997.15.camel@wusel.schnulli.de>	 <200306051959.45126.russell@coker.com.au>	 <1054807982.1995.56.camel@wusel.schnulli.de>	 <200306052025.05910.russell@coker.com.au> <1054820922.23132.133.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14538-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>, Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 06/05/2003 03:48 PM, Chris Mason wrote:
> On Thu, 2003-06-05 at 06:25, Russell Coker wrote:
> 
> 
>>>I use SuSE 8.2. It's much faster than the SuSE kernel in 8.1, even on my
>>>ZIP drive at the parallel port ;)
>>
>>Hopefully someone can advise on whether the SuSE 8.2 kernel has all the 
>>patches you desire for best ReiserFS performance.
> 
> 
> The suse kernels include the data logging code, along with the other
> minor optimizations in my data logging dir.
> 
> The good news is that I've also tracked down a long standing
> data=ordered performance bug, and I've got more data=ordered
> optimizations to make fsync workloads better.  Hopefully this morning I
> can get it all to stop oopsing and I'll send out for broader testing.
> 
> -chris

Hi, Chris, Oleg and all others!

Are these patches ready for "broader testing" now? I would appreciate it 
as you mentioned the key words "performance" and "data=ordered" in one 
sentence ...  ;-))

Does the iget5_locked patch (Oleg?!) get updated or is it obsolete? It 
didn't apply fine to 2.4.21-pre6. So I skipped it for that kernel.

I didn't try kernels > 2.4.21-pre6 so far -- my simple question is: Are 
  the new patches in the queue or have they been forgotten over time? Or 
are there some compounds or merges in progress?!!


Many thanks for clarification,
best regards,

  Manuel

