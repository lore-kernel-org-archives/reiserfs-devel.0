From: rvalles <rvalles@es.gnu.org>
Subject: Re: IO randomly blocked for >1 minute while disk writes still in 2.6.16.1 + 2.6.16-reiser4-1
Date: Tue, 2 May 2006 19:58:26 +0200
Message-ID: <23237.9981935539$1146592759@news.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28553-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
Sender: <tux@eww.ath.cx.>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Mon, May 01, 2006 at 10:54:34AM -0700, Hans Reiser wrote:
> >Using 2.6.16.11 with reiser4 for 2.6.16-2, things are still very bad.
> We are trying to get a large patch out the door.    If it does not fix
> it, please remind me of this, and we will write some (nontrivial) code
> that I suspect is needed.  Does this freezing happen about every 600
> seconds?
>=20
Not that I'm aware of; the conditions at which "it" (1) happens do feel
random, but more likely when doing many things in paral=C2=B7lel, and is ea=
sily
triggered by just changing something then scrolling up and down or writing
a file with the VIM editor, as I originally reported; I strongly believe
it's fsync related. VIM makes a "work copy" of the file being edited,
and then accesses it with mmap and probably fsyncs changes often, so
that the least minimum is lost in the event of a power failure or, say, a
system crash.=20

I don't use that computer (athlon@600MHz, 768mb) as my desktop anymore (my
brother does) so it's back with 2.6.12.6 so that it doesn't give him proble=
ms.
My current desktop (athlon-xp 1600+ @1400MHz, 512mb) was donated by a friend
and has a small HD I had on a drawer. It uses XFS; will move it to reiser4 =
the
moment I confirm this problem fixed on the other one and buy a bigger disk.

The interesting part is that I rely on NFS to access my old home, gentoo's
portage tree and some other stuff in there, mounted in sync mode, and "it" =
(1)
seems to trigger like _each_ time I, for example, download a file with wget
into there, slowing the download down to no more than 20KB/s (I can get
400KB/s or so from internet). Supposedly the "sync" mount option is a KEY
there, because it supposedly causes each write not to report done until it's
actually done, which means continous fsyncings in the nfs server side.

(1) "it": HD led stays on, gkrellm reports continous writing to disk at
about half megabyte/sec, I/O is slowed down dramatically (opening a
Maildir with Mutt takes ages), the condition lasts anywhere from a few
seconds to a whole minute.

--=20
- Do you study theories? - Oh yes! Theories are fun. - How do you use them?=
 - When I must act, theories are too slow. To act, I must know.
