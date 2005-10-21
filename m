From: =?ISO-8859-15?Q?Konstantin_M=FCnning?= <konstantin@muenning.com>
Subject: reiserfstune: block allocator is not defined
Date: Fri, 21 Oct 2005 02:24:17 +0200
Message-ID: <43583531.3040105@muenning.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26588-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi!

Just tried to add some badblocks like this:

reiserfstune -b /tmp/badblocklist /dev/hda5

and I get the error:


block allocator is not defined

Aborted


The same when I try it with -B. As this message means nothing to me, has
somebody any idea what the problem might be? The man pages and
interestingly a web search gave me nothing about it. Or is reiserfstune
not to be used for adding bad blocks to the fs?

Kernel 2.6.12, reiserfstools 3.6.19.

Thanks!
--=20
Konstantin M=FCnning
