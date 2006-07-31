From: Bernd Schubert <bernd-schubert@gmx.de>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Mon, 31 Jul 2006 23:14:37 +0200
Message-ID: <200607312314.37863.bernd-schubert@gmx.de>
References: <200607241806.k6OI6uWY006324@laptop13.inf.utfsm.cl> <20060731191712.GE17206@HAL_5000D.tc.ph.cox.net> <20060731192902.GS31121@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750906AbWGaVOq@vger.kernel.org>
In-Reply-To: <20060731192902.GS31121@lug-owl.de>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Jan-Benedict Glaw <jbglaw@lug-owl.de>, Clay Barnes <clay.barnes@gmail.com>, Rudy Zijlstra <rudy@edsons.demon.nl>, Adrian Ulrich <reiser4@blinkenlights.ch>, vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org

On Monday 31 July 2006 21:29, Jan-Benedict Glaw wrote:
>
> The point is that it's quite hard to really fuck up ext{2,3} with onl=
y
> some KB being written while it seems (due to the
> fragile^Wsophisticated on-disk data structures) that it's just easy t=
o
> kill a reiser3 filesystem.
>

Well, I was once very 'luckily' and after a system crash (*) e2fsck put=
 all=20
files into lost+found. Sure, I never experienced this again, but I also=
 never=20
experienced something like this with reiserfs. So please, stop this kin=
d of=20
=46UD against reiser3.6.
While filesystem speed is nice, it also would be great if reiser4.x wou=
ld be=20
very robust against any kind of hardware failures.

(*) The problem was a specific mainboard + video-card + driver combinat=
ion. As=20
soon as X started up, the system entirely crashed. I don't believe many=
 bytes=20
were written, but I also can't prove it.

--=20
Bernd Schubert
PCI / Theoretische Chemie
Universit=E4t Heidelberg
INF 229
69120 Heidelberg
