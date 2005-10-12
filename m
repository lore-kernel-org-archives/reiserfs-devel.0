From: =?iso-8859-2?q?V=E1clav_H=F9la?= <ax@natur.cuni.cz>
Subject: Re: Reiser4 problems on gentoo & 2.6.14-rc1-mm1
Date: Wed, 12 Oct 2005 17:35:45 +0200
Message-ID: <200510121735.45874.ax@natur.cuni.cz>
References: <200510121243.55956.ax@natur.cuni.cz> <434CF0B9.7030406@namesys.com>
Reply-To: ax@natur.cuni.cz
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26511-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <434CF0B9.7030406@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi.

Dne st=F8eda 12 =F8=EDjna 2005 13:17 Vladimir V. Saveliev napsal(a):
> Hello
>
> I believe it is fixed in 2.6.14-rc2-mm2. Please use it.
>
> PS: if it still does not work - try to set REISER4_USE_EFLUSH macro (it is
> in file fs/reiser4/reiser4.h) to 1.
> If that does not help - please report.

After patching (thanks Sander) I managed to compile 2.6.14-rc2-mm2, looks=20
working. (after one-and-half hour of compiling no errors in syslog)

Ax
=2D-=20
V=E1clav H=F9la,
spr=E1vce po=B9tovn=EDho serveru
P=F8=EDrodov=ECdeck=E1 fakulta
Univerzita Karlova v Praze
