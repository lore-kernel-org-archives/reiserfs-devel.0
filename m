From: Pierre =?UTF-8?B?RXRjaGVtYcOvdMOp?= <petchema@concept-micro.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Sat, 3 Sep 2005 13:34:49 +0200
Message-ID: <20050903133449.76703fb0.petchema@concept-micro.com>
References: <20050901134604.31ddd297@SiRiUS.home>
	<20050901144842.34629bcf@SiRiUS.home>
	<4316F9CC.2090904@namesys.com>
	<20050901150507.3d6f53c7@SiRiUS.home>
	<4316FD28.5020304@redhat.com>
	<43171D57.3030007@namesys.com>
	<20050903100846.GC3405@favonius>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25843-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050903100846.GC3405@favonius>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le Sat, 3 Sep 2005 12:08:46 +0200, Sander <sander@humilis.net> a =C3=A9crit=
 :

> Does this mean that if my reiser4 filesystem is 90% full, it can be
> considered 85% full wrt performance because of the 5% reservation?

0.9 * 0.95 =3D 0.855

so it should be 85.5% full if you consider its real physical capacity.

(slight difference, only pointing out a common mistake people do when
percentages are involved...)
