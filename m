From: Oleg Drokin <green@namesys.com>
Subject: Re: Horrible ftruncate performance
Date: Sun, 13 Jul 2003 16:58:04 +0400
Message-ID: <20030713125804.GB6061@namesys.com>
References: <200307112151.05829.Dieter.Nuetzel@hamburg.de> <Pine.LNX.4.30.0307120213080.30730-100000@divine.city.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14919-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0307120213080.30730-100000@divine.city.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Szakacsits Szabolcs <szaka@sienet.hu>
Cc: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>, Chris Mason <mason@suse.com>, Marc-Christian Petersen <m.c.p@gmx.net>, reiserfs-list@namesys.com, Philippe Gramoull? <philippe.gramoulle@mmania.com>

Hello!

On Sat, Jul 12, 2003 at 03:37:48AM +0200, Szakacsits Szabolcs wrote:
> Footnotes:
> (*) So disk shouldn't matter because the other filesystems use only 4kB to
>     store this 200GB sparse file. ReiserFS wastes 201MB! One could

Yes. The thing is reiserfs prepopulates the tree with empty pointers
up to needed file length. Others just increase filesize.
We found out that just increasing filesize leads to races later on
when two parallel writers try to actually write somewhere
past the real file end. Then we endup in a situation where
same stuff in the tree is about to be inserted twice which
is bad idea of course.

Bye,
    Oleg
