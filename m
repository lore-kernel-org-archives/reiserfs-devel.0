From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: reiser4 without problems?!
Date: Sun, 21 Nov 2004 22:41:04 +0200
Message-ID: <20041121204104.GY26192@nysv.org>
References: <20041121201203.8A3C23956@sitemail.everyone.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22477-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041121201203.8A3C23956@sitemail.everyone.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: BLuEGoD <bluegod@linuxwaves.com>
Cc: reiserfs-list@namesys.com

On Sun, Nov 21, 2004 at 12:12:02PM -0800, BLuEGoD wrote:
>
> Hi, I want to run a debian with reiser4, but since reiser4 went out, there
> is no one that run it without problems, anyone knows if any kernel with -mm
> patches runs well?.. I think nowadays all people are losing time with

Apart from my recent issues, which I just realized others have reported
as well, the -cko series has been the best for me, and unfortunately
the -rc2-mm2 crashes even worse for me (if I turn debug on), so it'll
take a while before I can say anything more.

Reiser4progs is still in Debian, so that's nothing.

> reiser4, because I read that reiser4 comes without anything positive than
> others (that is because comes with "core" only).. If someone can set up for
> three or more days a system stable with reiser4 and 2.6.X kernel please tell
> me who!

I just used debootstrap to install from a small partition which I still
have as reiserfs.

It's not a big issue to install it yourself.

-- 
mjt

