From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: reiser4 performance
Date: Mon, 8 Aug 2005 19:13:20 -0400
Message-ID: <e692861c05080816136f9d70bc@mail.gmail.com>
References: <dd7cbn$kbg$1@sea.gmane.org> <42F7A01A.7090209@namesys.com>
Reply-To: Gregory Maxwell <gmaxwell@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25362-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42F7A01A.7090209@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On 8/8/05, Hans Reiser <reiser@namesys.com> wrote:
> I should add that fsync performance has not been worked on yet, which is
> surely why postgres performance is poor.

Hans, I'm on the postgresql hackers list (although I don't really have
a voice there, so I can't really speak much for reiser4 there)..

One of the 'interesting' issues they face is that that postgresql
database works with 8K pages.  From a performance and reliability
perspective they would benefit impressively from a file system (and
VFS) which could atomically update their 8k pages. Without such a
feature their performance is slaughtered when operating in a mode that
provides the highest reliability, and their reliability is slaughtered
when operating in the highest performance configuration.

I'm sure the PostgreSQL folks would be here themselves asking for help
with this issue... if they weren't so oriented around FreeBSD. :)

If ever you are looking for a killer app for Reiser4 that people who
don't care about the visionary stuff will care about: you couldn't
find one better than postgresql. If you could get postgresql working
as reliably as a double logged full fsync configuration but performing
as fast as a configuration with async writes.... you'd have a lot more
supporters.
