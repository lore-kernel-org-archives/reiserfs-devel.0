From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: A real panic
Date: Sat, 13 Nov 2004 16:09:34 +0200
Message-ID: <20041113140934.GJ26192@nysv.org>
References: <20041113120455.GI26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22372-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041113120455.GI26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Sat, Nov 13, 2004 at 02:04:55PM +0200, Markus T=F6rnqvist wrote:
>
>Nov 13 13:38:21 shrike kernel: reiser4 panicked cowardly: assertion failed=
: !memcmp(inode->u.generic_ip, sd->body, (size_t) length + 1)

mjt@shrike:/usr/src/vlc$ sudo apt-get source --build vlc
...
E: Method http has died unexpectedly!                    =20
...

and now my computer crashed, just like the first time.
The log is mjt.nysv.org/reiser/2004.11.13.forensics/syslog2

But I think it's worth noting that the computer does freeze to a state
of needing a powerbutton boot.

Also that I was doing apt-get install the first time, apt-get source --build
the second time.

Is this something the debug options brought along?

I'm now running a non-debug build of -cko3 because it hasn't crashed
before; I'll let you know if it does ;)

--=20
mjt

