From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Latest reiser4 snapshot for vanilla/-cko kernel
Date: Thu, 8 Jul 2004 09:54:21 +0300
Message-ID: <20040708065421.GR4990@nysv.org>
References: <200407080003.27874.sikkh@wp.pl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19549-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200407080003.27874.sikkh@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Piotr Neuman <sikkh@wp.pl>
Cc: reiserfs-list@namesys.com

On Thu, Jul 08, 2004 at 12:03:27AM +0200, Piotr Neuman wrote:
>Hi another updated version of latest reiser4 snapshot is available at:
>http://kem.p.lodz.pl/~peter/cko/reiser4/

Hooray!

>ps. Before you ask Markus - yes it survived 'bonnie++ -x 3' ;-) (thanks to 
>Vitaly probably...)

:D

Did you do apt-get install something on it?

It seems also Redeeman has the latter auto-snapshots working a-ok, so
there may be something in how Debian, the package list and tails work
together to cause the bug, which was also hit with bonnie++ -x 3 and
at random by xmms, mozilla and, err, something else...

Well, waiting for a fix to that one, and maybe I'll try -cko. If I
got around to do the video capturing thing I think Con's patches and
assorted others would enhance speed quite nicely...

Thanks!

-- 
mjt

