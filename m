From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: mount throws a nikita-3228 on me
Date: Thu, 27 May 2004 12:21:04 +0300
Message-ID: <20040527092104.GL4990@nysv.org>
References: <20040525080001.GF4990@nysv.org> <1085473856.1915.99.camel@tribesman.namesys.com> <20040525211133.GG4990@nysv.org> <20040526052052.GO1583@backtop.namesys.com> <20040526204050.GI4990@nysv.org> <1085641367.1915.197.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18870-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1085641367.1915.197.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: Alex Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com

On Thu, May 27, 2004 at 11:02:47AM +0400, Vladimir Saveliev wrote:

>> OK. I tried it with what was suggested on the list.
>> It did not, however work. I added the lines to reiser4.h; 
>did you remove lines from debug.h?

Yes.

>> But I understood from IRC that this problem should really be fixed?
>> So am I doing something wrong here?
>certainly

It's seldom comforting to hear you're wrong; this is an exception :)

>Please try the following: add something incompilable in reiser4.h right
>after 
>#define REISER4_LARGE_KEY (1)
>
>on compiling you should get some files not compilable - as expected
>and some files which compile fine. The last ones have wrong #include
>section. The mentioned change in reiser4.h and debug.h should fix that
>though

I actually got the bugger to mount now. I just can't remember what
I did, because it was past midnight...
I switched to large keys, that must be one thing. So small keys are
probably broken? Should it even mount in that situation?

I got an oops and the bird and some stack trace, though. So it mounts
but goes belly-up.

I disabled the Reiser4 syscalls and it still didn't work. Then I went
to sleep.

There seems to be some funkyness with compiling as well.
Sometimes it dies with a get: command not found.

Is there any chance of having some daily snapshot diff available?
This was talked about before. It would save a shitload of trouble
if one wouldn't have to mess with bk and track pulled snapshots and
so on and so forth...

I'll post more details on the errors and some screenshots of the
stack trace when I get the opportunity and my corner of the web
back working. Hopefully today. And of course my .config and everything
else relevant.

Thanks for the help!
The first step in fixing a bug is knowing of its existence ;)

-- 
mjt

