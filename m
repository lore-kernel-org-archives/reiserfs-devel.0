From: Francois-Rene Rideau <fare@tunes.org>
Subject: Crash again!
Date: Tue, 21 Jan 2003 22:33:36 +0100
Sender: Francois-Rene Rideau <fare@Samaris.tunes.org>
Message-ID: <20030121213336.GA6756@hell.mine.nu>
References: <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115142.B21932@namesys.com> <20030118100157.C5575@humilis> <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115142.B21932@namesys.com> <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115724.GA946@Kadath>
Reply-To: Francois-Rene Rideau <fare@tunes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12450-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030118115724.GA946@Kadath>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

After the hardware crash, the software crash!

I added RAM to my workstation and rebooted.
Big mistake: I had stopped the machine with swsusp instead of a plain halt.
By the time I realized it, it was too late.
swsusp recover failed because the RAM size didn't match.
Now the reiserfs partition is half-unmounted,
and trying to mount results in an endless loop
as reiserfs tries to replay the journal.

Is the partition recoverable? Can the data be retrieved?
Should I try reiserfsck or not?
Should I try to get swsusp to recover the same state and do its thing,
or is it too late?

Should I run to the shop where I sent my previous hardware-crashed disk
so that they don't actually send the disk back to manufacturer for exchange?

What a loser!

Thanks for your precious advice.

[ Fran=E7ois-Ren=E9 =D0VB Rideau | Reflection&Cybernethics | http://fare.tu=
nes.org ]
[  TUNES project for a Free Reflective Computing System  | http://tunes.org=
  ]
Do not handicap your children by making their lives easy. -- Robert Heinlein
