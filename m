From: Miguel <turtle.power@wanadoo.es>
Subject: "df -i" support
Date: Thu, 13 May 2004 09:34:32 +0200
Message-ID: <20040513093432.52d3d7a3.turtle.power@wanadoo.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18648-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi
We have several machines running as MTA's using reiser for the mail
queue, we usually check the number of files (well an approximation)
using the output of "df -i" command on our monitorization plugins this
may be not very acurate but is very fast and didn't affect the MTA's
work.

With reiser the output of df -i is no longer usable, we changed this to
"find | wc -l" variations but it hurts the performance.

There's a command to count the number of leafs (that's the name?) of a
tree from a reiser partition? or other orientative value?.(we mount
with notail)

Tnx

--=20
La resistencia es f=FAtil todos ser=E9is asimilados
