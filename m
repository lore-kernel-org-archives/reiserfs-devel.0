From: Oleg Drokin <green@namesys.com>
Subject: Re: securely deleting files
Date: Mon, 12 May 2003 14:44:25 +0400
Message-ID: <20030512104425.GA4165@namesys.com>
References: <Pine.LNX.4.44.0305060522270.20364-100000@potato.zayda.com> <20030512075022.GC21604@namesys.com> <3EBF79F7.8090501@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14078-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EBF79F7.8090501@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Jason Holt <jason@lunkwill.org>, reiserfs-list@namesys.com

Hello!

On Mon, May 12, 2003 at 02:39:51PM +0400, Hans Reiser wrote:

> >Yes they can.
> >No, we don't have such (supported) feature in reiserfsv3 yet.
> You meant the reserved space for root?

Yes.
Also starting from 2.4.20 (with new block allocator), we do not
reserve any space at all (we used to reserve 2M or so before 2.4.20,
and those reserved 2M could not be used by anything in kernel).

Bye,
    Oleg
