From: Hans Reiser <reiser@namesys.com>
Subject: Re: Problems with journal size option on mkfs
Date: Thu, 16 May 2002 16:00:29 +0400
Message-ID: <3CE39F5D.6010604@namesys.com>
References: <OFE8E86981.F03B17DE-ON85256BBA.006A1833@pok.ibm.com>	<20020516091611.A6880@namesys.com>  <3CE38E43.1000408@namesys.com> <1021549979.14986.759.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10331-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Oleg Drokin <green@namesys.com>, Steve Pratt <slpratt@us.ibm.com>, reiserfs-list@namesys.com

Chris Mason wrote:

>On Thu, 2002-05-16 at 06:47, Hans Reiser wrote:
>
>  
>
>>journal resizing and relocating will go into the next pre1.
>>
>>    
>>
>
>That makes for a huge set of changes we have planned for pre1.  We need
>to limit ourselves to one significant change per prerelease, otherwise
>debugging is very difficult.
>
>The journal relocation stuff needs to be tossed onto an FTP site and
>widely tested before we submit for a stable kernel series.  It clearly
>has not been widely tested 2.5.x ;-)
>
>-chris
>
>
>
>
>  
>
Yes, I admit I was thinking as I pressed send about just how much stuff 
would be going into pre1 and wondering if it should be broken into pre1, 
pre2, and pre3.

Probably the journal relocation stuff, being the most tested in 2.5 (do 
any reiserfs users use it in 2.5 though?), should go into pre3.

The bitmap code and the file write code should go into pre1, along with 
the cleanups.

Feel free to suggest different orderings, though maybe we should only 
think about this when it is time for it....

Hans


