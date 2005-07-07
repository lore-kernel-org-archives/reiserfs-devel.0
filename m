From: Pierre =?UTF-8?B?RXRjaGVtYcOvdMOp?= <petchema@concept-micro.com>
Subject: Re: [PATCH] reiserfs: on-demand bitmap loading (testing only)
Date: Fri, 8 Jul 2005 00:37:56 +0200
Message-ID: <20050708003756.21bd4c80.petchema@concept-micro.com>
References: <42CC4B7F.2070506@suse.com>
	<42CC5F1E.6060505@namesys.com>
	<42CD528B.9040502@suse.com>
	<5a59ce530507071059731b30cc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25046-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5a59ce530507071059731b30cc@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le Thu, 7 Jul 2005 13:59:35 -0400, studdugie <studdugie@gmail.com> a =C3=A9=
crit :

> I agree w/ Jeff 100%. I'm not a kernel hacker, simply a user. As a
> matter of fact, I was one of those people that Jeff aluded to when he
> said: "There have been reports of large filesystems taking an
> unacceptably long time to mount."

That also makes reiserfs uncomfortable with automount devices, specially
if they're bandwidth limited like external USB or firewire disks...
