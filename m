From: David Masover <ninja@slaphack.com>
Subject: Re: The situation at hand and in the future
Date: Wed, 09 Jun 2004 17:01:17 -0500
Message-ID: <40C788AD.4000800@slaphack.com>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu> <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org> <40B89C9C.5050307@slaphack.com> <873c5j0zm3.fsf@uhoreg.ca> <40B91A65.2060302@slaphack.com> <200405311827.i4VIRdlS001316@turing-police.cc.vt.edu> <40BBA23D.7000109@slaphack.com> <87ekp0ghbo.fsf@uhoreg.ca>            <40C1510F.5020608@slaphack.com> <200406050730.i557UouE026516@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19125-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406050730.i557UouE026516@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: Hubert Chan <hubert@uhoreg.ca>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Valdis.Kletnieks@vt.edu wrote:
[...]
| Proper programming would probably render encryption almost-zero overhead.
| Except for really high-end disk subsystems, you're not going to get an
*effective*
| (i.e. after seeks and rotational delay and all that) throughput of
much over
| 40 megabytes/second - and encrypting/decrypting at 40 megabytes/second

Yes, I know this.  Consider:  On Windows 9x (and 3.1, of course), when
you read from a floppy, it's unbelievably slow.  True, this doesn't
matter much when you consider how slow the physical medium is.  But
while it's actually reading it, you cannot do anything else.

So, multitasking matters.  Suppose I've got this game (because games are
fun) with two threads -- the player-kills-all thread, and the
load-rest-of-level thread.  So the player isn't going to move for awhile
- -- he's getting shot at too much -- but the game wants to load a little
more detail from disk to make the sky and/or landscape look prettier.
Without encryption, big deal -- the level-loading thread asks for the
data from the disk, then goes to sleep until it arrives, thus freeing
resources for the immediate gameplay.  With encryption, if we are trying
to load things from disk, we are also going to have to spend some CPU
decrypting them which we wouldn't otherwise.  Not much latency -- unless
you need CPU to make sure the player doesn't lag.  Or you put the thread
on a low priority, which works -- unless you need as close to 100% CPU
as possible for higher-priority threads, which drives said latency up
insanely.

Of course, most of the time people can just buy a new CPU.

Should we take this off-list?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQMeIrXgHNmZLgCUhAQJLkhAAj97ah2lvz97mmtVFvydmZ+nJPS1f/OBP
gifHHcE8ZGe/PN2Iy+1PQVz2P1GkDmk2dW8/HIid+aHYv0UZsISw6Y6rQ2Kyxr9y
OULkebG+qgV5zxwKFUMKqkTMaxFXJBQinxvf1mdEbOMmTfxW1HzKB7FYVH3muAWO
i4knab6t720m+rWQ0q+VBKKSH52CVHCno1ncZnaRiTmZlicJQ3GSitglq/5NHsk6
3PKPXM68TMWl7ms9k6Htseba3jYcW4l9kHNjHICjAbQ4hK/KYtkNhoBeTIoVcpbW
BkGa9ThKF23/3CTYNycXZ+BUS6C7RdH9iXku5WjlbrT6dlEZDDenleiJz5HEBo94
MB74xlGLpz2O/b/A/i0iie5QJyoyOzexqh+AMoJlN9n6VUS1o5sUquoDWPhL9ZvH
1BUJnm/tk9qcOuzmkcxux0sWVGambqJah9gU8F+a0AQTiT71z4UnEb78YmWfQFg7
hXsWgXG2l/aF8XKqQY4w+lZT2WsX7kcSZ417VzeoiMVx1yHpYQk2qPDC59n8EcNh
q1EmNaYJD0DEtAbexH5jZhlofB9mnpJDpRHPvixKDxvD5h7WLrcwyfJ7+SHZnykw
xUDXRumoWmF2La/Dh75SwQc6YJeyXVmOICB6uRuX7mC187wjfQfy/KC2Z6dRjNow
ysMN5rbtSLY=
=Ayvm
-----END PGP SIGNATURE-----
