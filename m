From: Hans Reiser <reiser@namesys.com>
Subject: Re: max files
Date: Tue, 04 May 2004 09:39:58 -0700
Message-ID: <4097C75E.1070600@namesys.com>
References: <3DF9165145FACB4C96977FF650C1E9040C469F16@its-mail1.its.corp.gwl.com>	 <4096851F.9040508@namesys.com>  <409685C3.30502@mweb.co.za> <1083625008.6688.54.camel@faith>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18434-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1083625008.6688.54.camel@faith>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Stewart Smith <stewart@flamingspork.com>
Cc: camis <camis@mweb.co.za>, reiserfs-list@namesys.com

Stewart Smith wrote:

>On Tue, 2004-05-04 at 03:47, camis wrote:
>  
>
>>Anyone tested to see how fast/sluggish reiser3 (or 4?)
>>performs when accessing a directory that has between
>>5 and 25 million flat/text files?
>>    
>>
>
>AFAIK no current file system performs "well" under this scenario. There
>is work going on to get better performance for >1million directories on
>xfs - but it is a tricky problem.
>
>just as an indicator - for a dir with ~101000 files on reiser3, reading
>from disk ('cause this box doesn't have that much memory):
>
>stewart@saturn:~$ time ls Maildir/.Lists.linux-kernel/cur/ > /dev/null
> 
>real    0m9.403s
>user    0m2.190s
>sys     0m0.230s
>
>and for repeated runs (i.e. when things are cached):
>stewart@saturn:~$ time ls Maildir/.Lists.linux-kernel/cur/ > /dev/null
> 
>real    0m2.284s
>user    0m2.160s
>sys     0m0.130s
>
>so it is quite possible that you'll get acceptable performance... at
>least for some applications :)
>
>The algorithms will scale, there just may be implementation details
>around the place that could make things faster.
>
>I'd say, test it :)
>  
>
I would guess that reiser4 would do better at this, as our readdir 
returns files in very close to sorted order.

Of course, that depends on the sorting algorithm ls uses.... some 
sorting algorithms do worse at close to sorted order....
