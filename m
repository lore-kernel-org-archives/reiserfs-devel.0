From: Xuan Baldauf <xuan--reiserfs@baldauf.org>
Subject: Re: Heuristic readahead for filesystems
Date: Wed, 11 Sep 2002 20:43:22 +0200
Message-ID: <3D7F8ECA.21086A5@baldauf.org>
References: <Pine.LNX.4.44L.0209111340060.1857-100000@imladris.surriel.com> <3D7F83BC.5DF306A@baldauf.org> <200209112030.27269.oliver@neukum.name>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11424-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Oliver Neukum <oliver@neukum.name>
Cc: Rik van Riel <riel@conectiva.com.br>, Xuan Baldauf <xuan--lkml@baldauf.org>, linux-kernel@vger.kernel.org, Reiserfs List <reiserfs-list@namesys.com>



Oliver Neukum wrote:

> > In theory, this also could be implemented explicitly if the applicati=
on
> > could tell the kernel "I'm going to read these 100 files in the very
> > near future, please make them ready for me". But wait, maybe the
> > application can do this (for regular files, not for directory entries=

> > and stat() data): Could it be efficient if the application used
> > open(file,O_NONBLOCK) for the next 100 files and subsequent read()s o=
n
> > each of the returned filedescriptors?
>
> What do you want to trigger the reading ahead, open() or read() ?

As open() immediately returns, it does not matter by which call the reada=
head is
triggered. But I'm unsure about wether it is triggered at all for the amo=
unt of
data the read() requested.

>
> Please correct me, if I am wrong, but wouldn't read() block ?

AFAIK, "man open" tells

[...]
      int open(const char *pathname, int flags);
[...]
       O_NONBLOCK or O_NDELAY
               The file is opened in non-blocking mode. Neither the open =
nor any
__subsequent__ operations  on  the  file  descriptor
               which is returned will cause the calling process to wait.
[...]

So read won't block if the file has been opened with O_NONBLOCK.


>
>
> Aio should be able to do it. But even that want help you with the stat =
data.

Aio would help me announcing stat() usage for the future?

>
>
>         Regards
>                 Oliver

Xu=E2n.


