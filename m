From: Xuan Baldauf <xuan--reiserfs@baldauf.org>
Subject: Re: Heuristic readahead for filesystems
Date: Wed, 11 Sep 2002 19:56:12 +0200
Message-ID: <3D7F83BC.5DF306A@baldauf.org>
References: <Pine.LNX.4.44L.0209111340060.1857-100000@imladris.surriel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11422-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Rik van Riel <riel@conectiva.com.br>
Cc: Xuan Baldauf <xuan--lkml@baldauf.org>, linux-kernel@vger.kernel.org, Reiserfs List <reiserfs-list@namesys.com>



Rik van Riel wrote:

> On Wed, 11 Sep 2002, Xuan Baldauf wrote:
>
> > I wonder wether Linux implements a kind of heuristic
> > readahead for filesystems:
>
> > If an application did a stat()..open()..read() sequence on a
> > file, it is likely that, after the next stat(), it will open
> > and read the mentioned file. Thus, one could readahead the
> > start of a file on stat() of that file.
>
> > Example: See this diff strace:
>
> Your observation is right, but I'm not sure how much it will
> matter if we start reading the file at stat() time or at
> read() time.
>
> This is because one disk seek takes about 10 million CPU
> cycles on modern systems and we'll have completed the stat(),
> open() and started the read() before the disk arm has started
> moving ;)
>
> regards,
>
> Rik

The point here is not to optimize latency but to optimize throughput: If =
the
filesystem is able to recognize that a whole tree is being read, it may i=
ssue
read requests for all the blocks of that tree, which are (with a high
probability) in such a close location to each other that all the read req=
uests
can result in a single, large, megabyte-big disk-read-burst, taking few
seconds instead of minutes.

In theory, this also could be implemented explicitly if the application c=
ould
tell the kernel "I'm going to read these 100 files in the very near futur=
e,
please make them ready for me". But wait, maybe the application can do th=
is
(for regular files, not for directory entries and stat() data): Could it =
be
efficient if the application used open(file,O_NONBLOCK) for the next 100 =
files
and subsequent read()s on each of the returned filedescriptors?

Xu=E2n.


