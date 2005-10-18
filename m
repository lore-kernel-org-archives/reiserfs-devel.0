From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: reiser4 and laptop_mode
Date: Mon, 17 Oct 2005 22:34:13 -0400
Message-ID: <e692861c0510171934m56e2a41dw8a780eb6ddb02f6e@mail.gmail.com>
References: <19812996093.20051017162429@usu.ru> <43542DE1.7050700@slaphack.com>
	 <43545DCF.1070301@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26556-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43545DCF.1070301@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, Sinitsyn Valentine <Valentine.Sinitsyn@usu.ru>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

On 10/17/05, Hans Reiser <reiser@namesys.com> wrote:
> > In fact, if you have enough RAM, you won't ever touch the
> >disk -- deleting a file before it's committed means it never touches dis=
k.
> >
> >It is not as spindown-friendly as laptop_mode, which notices when the
> >drive has to spin up anyway (maybe through a read) and flushes all
> >writes.  Don't know if they are compatible.
> >
> >
> We should work to integrate well with it.  Zam, can you look at that?
> Thanks.

Actually, laptop mode flushes when there is a write and sync all
pending transactions just before spindown. (delaying the write as long
as possible to hopefully get as much in one pass as possible).

In the future when enough API is exposed to make a nice interface for
multi-syscall transactions with partial sync (i.e. only forced syncs
of blocks related to transactions which demand physical fixation), it
would be nice if the commit logic were smart enough to grab other
nearby small transactions and batch them into the same commit.
