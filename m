From: Oleg Drokin <green@namesys.com>
Subject: Re: LVM(1|2) vs EVMS
Date: Fri, 15 Aug 2003 16:17:21 +0400
Message-ID: <20030815121721.GB20698@namesys.com>
References: <3F3C0FDE.4000900@iteso.mx>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15317-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F3C0FDE.4000900@iteso.mx>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jose Alberto Guzman <jose@iteso.mx>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Aug 14, 2003 at 05:40:30PM -0500, Jose Alberto Guzman wrote:
>  What would be the recommended volume management system for an smp 
> production server running oracle 8i (later 9i) on 2.4.20 or 2.4.21 
> debian gnu/linux with reiserfs: lvm1, lvm2 or evms ??
>  Solid stability under heavy load and snapshots are the main needed 
> features.
>  What would you suggest?

LVM1 is part of the kernel for a lot of time and is greatly tested,
so I guess it will be the best choice in your case.

Bye,
    Oleg
