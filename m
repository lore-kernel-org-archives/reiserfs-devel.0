From: Simon Waters <simonw@zynet.net>
Subject: Re: Directory updates in filesystems
Date: Mon, 1 Nov 2004 10:32:17 +0000
Message-ID: <1099305140.1205.TMDA@h34.zynet2.co.uk>
References: <1098955408.29128.TMDA@h34.zynet2.co.uk>
	<4182B2F4.2080607@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22239-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4182B2F4.2080607@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

On Friday 29 Oct 2004 10:15 pm, Hans Reiser wrote:
> Simon Waters wrote:
> 
> >Are there any file systems that fully address this issue
>
> I think no.  It is quite fixable in a variety of ways.  If someone wants
> to fix it or have it fixed, let me know.

I mostly wanted to make sure I'd understood the problem correctly.

I can see it being a desirable option for a filesystem, indeed perhaps it 
ought to be a default behaviour that can be switched off for performance, as 
the "behaviour of least surprise". 

However I think immediately it isn't obvious that it is needed, as in many 
cases people are using disparate file systems or NFS, and we have lived so 
far without it. But then if it did exist people might see it as a compelling 
reason to use the filesystem supplying it for specific purposes, much as DJB 
recommends BSD and FFS without soft updates for aspects of qmail (if I 
understood it correctly).
