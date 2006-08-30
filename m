From: Andrew James Wade <andrew.j.wade@gmail.com>
Subject: Re: assertion failed: JF_ISSET(jprivate(page), JNODE_DIRTY)
Date: Wed, 30 Aug 2006 17:29:17 -0400
Message-ID: <200608301729.18303.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
References: <200608211759.04151.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608291738.21648.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608301426.12602.zam@namesys.com>
Reply-To: andrew.j.wade@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29760-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608301426.12602.zam@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Alexander Zarochentsev <zam@namesys.com>, andrew.j.wade@gmail.com

On Wednesday 30 August 2006 06:26, Alexander Zarochentsev wrote:
> On 30 August 2006 01:38, Andrew James Wade wrote:
> > I now have a stack trace for this assertion:
> 
> there  is a race between znode_make_dirty and flushing dirty node to 
> disk.  I guess (but not sure by 100%) it has no bad effect so the 
> assertion is wrong.
> 
Okay, I'll change that to a WARN_ON in my tree and see what falls out.

Thanks,
Andrew Wade
