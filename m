From: _nasturtium <_nasturtium@bigpond.com>
Subject: Re: When is a defragmenting tool expected to be released?
Date: Sat, 26 Apr 2003 14:14:00 +1000
Message-ID: <200304261414.00860._nasturtium@bigpond.com>
References: <569438017.20030425213516@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-13817-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <569438017.20030425213516@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anders Widman <andewid@tnonline.net>, reiserfs-list@namesys.com

On Sat, 26 Apr 2003 05:35 am, Anders Widman wrote:
>    I  am  curious  about  if/when  a  defragmenting  tool that support
>    reiserfs  will  be  available.  Please  do  not  say  to  tar/untar
>    everything. I simply do not have enough storage for that.

No defragmenting tools that I know of, or mentioned on the list.

You might like to check out what Hans Reiser wrote at 
http://www.osnews.com/story.php?news_id=69. 
Basically, reiser4 will have delayed allocation, like XFS, rather than the 
current ext2-like system of preallocating blocks, so it'll be a lot more 
fragmentation-resistant.

However, if you just want to check fragmentation there's a program called 
mongo, it's a benchmarking package and you can see if your filesystem (or 
even individual files) are fragmented.

Regards,
	_nasturtium
