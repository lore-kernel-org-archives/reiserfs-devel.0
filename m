From: Julian Picht <JPicht85@web.de>
Subject: Re: data loss with reiserfs
Date: Fri, 21 Jun 2002 19:59:17 +0200
Sender: JPicht85@web.de
Message-ID: <200206211959.17837.JPicht85@web.de>
References: <200206211920.38534.JPicht85@web.de> <20020621212543.A1160@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10785-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020621212543.A1160@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

> you mean
> umount /dev/hdb3 ; reiserfsck --check /dev/hdb3
> produces error about device being already mounted?
Yes

> Anything interesting in logs?
Not in that logs I looked in.

> I hope /dev/hdb3 is not your root device?
Well... it is.

greetings Julian Picht
