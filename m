From: Christian Iversen <chrivers@iversen-net.dk>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Thu, 1 Apr 2004 18:37:57 +0200
Message-ID: <200404011837.57924.chrivers@iversen-net.dk>
References: <20040401163120.98834.qmail@web25006.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17647-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040401163120.98834.qmail@web25006.mail.ukl.yahoo.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thursday 01 April 2004 18:31, Narcoleptic Electron wrote:
> If there are other approaches not addressed here, or
> clarification required, please feel free to revise
> this list.

I think someone suggested putting meta file information in /proc.

So. Is this a bad idea? I think not. 

In this scheme, /some/file would have /proc/metas/some/file/* as meta 
information. 

This reduces the risk of conflict to 0. 

One other idea I have, is "...". That way, 

dir/. is the directory itself
dir/.. is the parent
and
dir/... is the meta info.

Any comments?

-- 
Regards,
Christian Iversen
