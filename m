From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: mount throws a nikita-3228 on me
Date: Wed, 26 May 2004 23:40:50 +0300
Message-ID: <20040526204050.GI4990@nysv.org>
References: <20040525080001.GF4990@nysv.org> <1085473856.1915.99.camel@tribesman.namesys.com> <20040525211133.GG4990@nysv.org> <20040526052052.GO1583@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18860-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040526052052.GO1583@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Zarochentsev <zam@namesys.com>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

On Wed, May 26, 2004 at 09:20:53AM +0400, Alex Zarochentsev wrote:
>
>There is a delay (up to 24h) in the public BK update. 

OK. I tried it with what was suggested on the list.
It did not, however work. I added the lines to reiser4.h; should I
have seen some better debug info? I just did a quick boot, so I
may have missed something...

I understand times have been hectic at Namesys, so just keep on
trying and I'll keep on testing and telling you what's up :)

But I understood from IRC that this problem should really be fixed?
So am I doing something wrong here?

I just noted that I don't have large keys enabled in the kernel.
Must have missed that one. Anyway, still it fails and says small
keys are supported, alone.

Thanks for the help, though, and I'll get back to you

-- 
mjt

