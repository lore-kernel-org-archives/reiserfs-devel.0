From: Francois-Rene Rideau <fare@tunes.org>
Subject: Re: recovery of crashed reiserfs disk?
Date: Mon, 20 Jan 2003 15:20:11 +0100
Sender: Francois-Rene Rideau <fare@Samaris.tunes.org>
Message-ID: <20030120142011.GA4268@Kadath>
References: <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115142.B21932@namesys.com> <20030118100157.C5575@humilis> <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115142.B21932@namesys.com> <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115724.GA946@Kadath>
Reply-To: Francois-Rene Rideau <fare@tunes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12441-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030118115724.GA946@Kadath>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ookhoi <ookhoi@humilis.net>, Oleg Drokin <green@namesys.com>, Xuan Baldauf <baldauf--fare--tunes.org--reiserfs-list--namesys.com@medium.net>, reiserfs-list@namesys.com

Kisses to you all! dd_rescue did save the day indeed!
And thanks to the -a option (sparse image), I didn't even have to
empty my other disk completely before to recover data.

/usr/src/local/dd_rescue/dd_rescue -b 32768 -B 512 -l dd_rescue.log -a -v /=
dev/hdc4 hdc4.img
mount -o loop -r hdc4.img /mnt -t reiserfs

(However I persist that such an operation would be unnecessary
if reiserfs -- and maybe linux in general -- had an option to mount
a block device readonly with error =3D=3D blank).

>> http://www.garloff.de/kurt/linux/ddrescue/

[ Fran=E7ois-Ren=E9 =D0VB Rideau | Reflection&Cybernethics | http://fare.tu=
nes.org ]
[  TUNES project for a Free Reflective Computing System  | http://tunes.org=
  ]
God exists and I'm His Prophet. And He says: "Don't you believe in Me or in
My Prophet, least you be doomed to go to Hell, for I gave you brains not to
believe in things dogmatically and superstitiously, but to think rationally=
."
		-- Far=E9
