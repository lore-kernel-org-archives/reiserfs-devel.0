From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: can't compile with reiser4
Date: Sat, 1 May 2004 22:09:47 +0300
Message-ID: <20040501190947.GQ29226@nysv.org>
References: <4092DCD1.6000107@slaphack.com> <20040501184545.GP29226@nysv.org> <4093F380.7040502@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18354-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4093F380.7040502@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

On Sat, May 01, 2004 at 01:59:12PM -0500, David Masover wrote:
>
>But the fix isn't in any snapshot.  When is the next snapshot, or where
>can I find the latest code?

Of course I'm not the correct person to speak for Namesys, but it seems
they have made progress, so the next snapshot may come some time soon.

Obviously these smaller issues do not warrant an entirely new snapshot.

The stuff I use is here:
http://mjt.nysv.org/reiser/

The bonnie patch is not needed for anything and the other lesser patches
(of which I can't remember if they are in the latest shot) are integrated
in http://mjt.nysv.org/reiser/2004.03.26.all.fixed.diff

Note that it changes metas/ into ..metas/ as well.

-- 
mjt

