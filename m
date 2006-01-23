From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: stale dk warning
Date: Mon, 23 Jan 2006 11:29:40 +0300
Message-ID: <1138004980.6165.11.camel@tribesman.namesys.com>
References: <1137788919.22212.7.camel@gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27834-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1137788919.22212.7.camel@gentoo>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: reiserfs-list@namesys.com

Hello

On Fri, 2006-01-20 at 14:28 -0600, Jake Maciejewski wrote:
> In addition to the disable write barrier warning reported by Louis-David
> Mitterrand on January 10th, with 2.6.15-1 I'm getting:
>         
>         <4>reiser4[dd(25448)]: update_stale_dk (fs/reiser4/search.c:1363)[nikita-38210]:
>         WARNING: stale dk
>         
> The process varies. I've also seen the stale dk warning triggered by rsync and rm.
> 

This is harmless. I think we should remove this warning as well as the
one about write barrier.

