From: Matthias Lange <ml@netuse.de>
Subject: rename system call kernel lockup
Date: Wed, 08 May 2002 15:03:11 +0200
Message-ID: <3CD9220F.8030709@netuse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10283-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

My system: Linux hobbes 2.4.4-64GB-SMP #1 SMP
(SuSE Distribution 7.2)

The following c program locks up in kernel mode and a
reboot is required to access the directory /tmp/b again:

$ mkdir -p /tmp/b/a

--------------------
#include <stdio.h>
int main (void) {
   int ret;

   ret =3D rename("/tmp/b/a","/tmp/b");   /* <--- locks up here */

   printf("Return Code: %d\n",ret);
   perror("main");
   return 0
}
--------------------

The partition is reiserfs, created with 3.5 and running with the
-o conv option to enable 32Bit uids.

I have not found any references to this problem on the mailing list,
is this a known bug? Possibly fixed in current versions?

Any help or advice is appreciated.

Greetings

Matthias Lange

Please cc: me since I am not on the list
--=20
Matthias Lange, Dipl.-Ing. (FH)                 e:   ml@netuse.de
NetUSE AG               Dr.-Hell-Stra=DFe         Fon: +49 431 38643500
http://www.netuse.de/   D-24107 Kiel, Germany   Fax: +49 431 38643599

