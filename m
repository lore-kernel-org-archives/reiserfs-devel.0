From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Processes dying?
Date: Sat, 5 Jun 2004 00:23:12 +0300
Message-ID: <20040604212312.GI4990@nysv.org>
References: <20040604203925.GF4990@nysv.org> <200406042050.i54KoDYD029229@turing-police.cc.vt.edu> <20040604210130.GH4990@nysv.org> <40C0E503.6010904@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19023-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40C0E503.6010904@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2004@gmx.net>
Cc: Valdis.Kletnieks@vt.edu, reiserfs-list@namesys.com

On Fri, Jun 04, 2004 at 11:09:23PM +0200, Carl-Daniel Hailfinger wrote:
>echo t >/proc/sysrq-trigger
>
>Or did you mean something different?

Thanks!

However, it never commited to the disk. I must come up with some way.

The syslog is corrupted as is always the case with reset-button boots,
but I took a copy of the syslog file which vanished into thin air.

So I must really come up with a way to save it. Sure as hell ain't
gonna write it by hand :)

Any way of forcing a journal commit?

-- 
mjt

