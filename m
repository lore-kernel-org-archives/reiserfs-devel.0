From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Where Reiser4 may break?
Date: Thu, 27 May 2004 12:25:42 +0300
Message-ID: <20040527092541.GN4990@nysv.org>
References: <20040526204457.GJ4990@nysv.org> <1085648404.1915.219.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18871-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1085648404.1915.219.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On Thu, May 27, 2004 at 01:00:05PM +0400, Vladimir Saveliev wrote:

>yes, now moving a hard drive with reiser4 between systems with different
>page size is impossible. 
>> Is this common with other file systems?
>no

Well, we'll see what the future brings in this.
I couldn't care less about architecture-compatibility, but then again,
I may start caring if the situation demands it :)

>Both large and small keys should be supported such that user does not
>have to care of compile option
>It was made compile option because there was a desire to try it as fast
>as possible.

This is good news.
Would the file system/kernel then decide which key size to use and
where? What is the logic?

Hope you get it working!

Thanks

-- 
mjt

