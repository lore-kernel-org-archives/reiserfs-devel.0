From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: On a free repacker
Date: Mon, 24 May 2004 23:47:51 +0300
Message-ID: <20040524204751.GC4990@nysv.org>
References: <20040519192831.GL24604@nysv.org> <200405201028.13184.reiser@namesys.com> <20040520184054.GR24604@nysv.org> <40AEBBA0.6060606@namesys.com> <20040521184451.GS24604@nysv.org> <200405211902.i4LJ25RI016978@turing-police.cc.vt.edu> <20040524203016.GA4990@nysv.org> <40B25DF0.2090400@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18833-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40B25DF0.2090400@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2004@gmx.net>
Cc: Valdis.Kletnieks@vt.edu, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

On Mon, May 24, 2004 at 10:41:20PM +0200, Carl-Daniel Hailfinger wrote:
>
># bk clone bk://some.url/of/the/project
>and you have a directory "project"
># cd project
># ./configure; make; make install
>for updates:
># cd project
># bk pull
>some projects may have a default of source not checked out, do it now
># bk -r get

I think this script is pretty much fubar :)
Oh, and mjt.nysv.org is down, don't even try to download this or anything
else, it will fail.[1]

>Can it get simpler than this? I'm truly interested in anything that makes
>my life simpler.

Lots of switches which affect what is transferred. That may be versatility
but I think it's useless. SVN is just svn update and there you have it.

That is achieved with clone, pull and -r get in BK.
How does BK do diffs? SVN is svn diff -r145:146 and it's there.

SVN's bigger problem seems to be that files are actually copied when
they're tagged. I love that, but I could see it flooding the hard drive.
Apparently they're just tagged in the server-side database, but it's
transparent copying.

That's a fair trade-off for anything CVS can throw at me ;)

I have to admit, though, that I lack experience in BK, and may find the
options, switches and knobs simpler if I got into it. But I don't see
the need...

[1]
Damn how much I hate computers sometimes. Like I wouldn't have more pressing
matters than some broken python cgi...

-- 
mjt

