From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser3 and O_DIRECT read
Date: Fri, 07 Oct 2005 17:29:46 +0400
Message-ID: <4346784A.1050208@namesys.com>
References: <Pine.LNX.4.61.0510071208030.1805@dacun.noviforum.si>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26421-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.61.0510071208030.1805@dacun.noviforum.si>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gorazd Golob <gorazdg@noviforum.si>
Cc: reiserfs-list@namesys.com

Hello

Gorazd Golob wrote:
> re!
> 
> Are we looking on wrong suspect - snip from code looks like this:
> 
> fd = open(f, O_RDONLY | O_DIRECT, 0);
> 
> and is not working for reiserfs3 filesystem?
> 

reiserfs is supposed to support O_DIRECT. Please provide more details about the
problem.

> Or in other words is reiserfs3 supporting reading with O_DIRECT flag?
> Writing works well with 0_DIRECT on reiserfs3.
> 
> Gorazd
> 
> 
> 

