From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: can't compile with reiser4
Date: Sat, 1 May 2004 21:45:45 +0300
Message-ID: <20040501184545.GP29226@nysv.org>
References: <4092DCD1.6000107@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18352-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4092DCD1.6000107@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

On Fri, Apr 30, 2004 at 06:10:09PM -0500, David Masover wrote:
>glibc) on my system now either fail to install, continue trying to
>install forever (make caught in an infinite loop), or install but don't

This has been fixed.

I have a copy of the patch here:
http://mjt.nysv.org/reiser/tail.c.diff

-- 
mjt

