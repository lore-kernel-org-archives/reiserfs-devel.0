From: "Fred -- Speed Up --" <speedup@free.fr>
Subject: Getting Reiser4 without bk
Date: Thu, 12 Jun 2003 06:36:06 +0200
Message-ID: <000f01c3309c$24860460$0200a8c0@xpstation>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000C_01C330AC.E752D760"
Return-path: <reiserfs-list-return-14510-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS ML <reiserfs-list@namesys.com>

------=_NextPart_000_000C_01C330AC.E752D760
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello !
I'd like to patch my 2.5 kernel in order to get Reiser4 working. I tried =
the bk way, but I got compilation errors, it needs a very long time to =
get all the kernel tree, and I don't got enough disk space to keep a =
Reiser4 bk kernel tree in /usr/src. I'd want to know how important the =
kernel patches are, and if Reiser4 should compile and run well without =
these (I allways use -mm patches), or if you'd have a global patch =
against official 2.5.70 source that could orevent me from using =
Bitkeeper (I suppose the kernel code you're using is not changing =
everyday, only the Reiser4 code should ...). Now can I just put the =
reiser4 folder in my fs/ folder of the 2.5 kernel tree and config & =
compile or do I need these patches ? Where do I find them without using =
bk ?
Another question : I also downloaded the reiserprogs sources, and made =
an autoconf but I got error messages ... how do you build the =
./configure script ?

Fred
------=_NextPart_000_000C_01C330AC.E752D760--

