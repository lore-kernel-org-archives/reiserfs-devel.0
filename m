From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Tree issues, fsck output
Date: Wed, 30 Jun 2004 09:45:47 +0300
Message-ID: <20040630064547.GL4990@nysv.org>
References: <20040629201956.GK4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19452-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040629201956.GK4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: sikkh@wp.pl

On Tue, Jun 29, 2004 at 11:19:56PM +0300, Markus T=F6rnqvist wrote:
>
>I'll just send this post now, I'll send a follow-up when I'm re-doing
>fsck with some switches. This was just a basic fsck /dev/hda1, so maybe
>no need to panic yet...

So I proceeded to --build-fs

FSCK: Node (481195), item (5), [2fa6e:6c69626d70342e:1e88ae] (stat40): wrong
bytes (939), Fixed to (0).
FSCK: Directory [2fa68:496e7075742e64:2fa6e]: can't find the object
[2fa6e:6c69626d70342e:1e88ad] pointed by the entry [libmp4.so]. Entry is
removed.

Anyway, that finished with a consistent fs..

Now that I'm back in my real environment:
mjt@shrike:~$ xmms &
[1] 3752
mjt@shrike:~$ /usr/lib/xmms/Input/libtonegen.so: invalid ELF header
/usr/lib/xmms/Input/libwav.so: invalid ELF header
/usr/lib/xmms/Effect/libecho.so: invalid ELF header
/usr/lib/xmms/Effect/libstereo.so: invalid ELF header
/usr/lib/xmms/Effect/libvoice.so: invalid ELF header

So I try to reinstall xmms:
mjt@shrike:~$ sudo apt-get install xmms
Reading Package Lists... 93%

And it sticks there AGAIN!

So now I'll just compile the new auto-snapshot and see what happens...

--=20
mjt

