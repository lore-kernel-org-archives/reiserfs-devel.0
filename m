From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: + reiser4-big-update-div64-fix.patch added to -mm tree
Date: Fri, 16 Sep 2005 17:17:16 +0400
Message-ID: <432AC5DC.4070601@namesys.com>
References: <200509160642.j8G6gI4Q014008@shell0.pdx.osdl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25986-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509160642.j8G6gI4Q014008@shell0.pdx.osdl.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: akpm@osdl.org
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>

Hello

akpm@osdl.org wrote:
> The patch titled
> 
>      reiser4-big-update-div64-fix
> 
> has been added to the -mm tree.  Its filename is
> 
>      reiser4-big-update-div64-fix.patch
> 
> 
> From: Andrew Morton <akpm@osdl.org>
> 
> There's no implementation of __div64_32().   Nor should there be.
> 

hmm, there is one in linux/lib/div64.c.

> This needs checking...
