From: "Frank Clatterbaugh" <frank@esellerate.net>
Subject: Compiling libaal
Date: Fri, 16 Jan 2004 14:20:15 -0600
Message-ID: <AC582FE38EBCDC44BCAC55FE8C1C3C1131ACEF@pos.int.mindvision.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3DC6E.29185082"
Return-path: <reiserfs-list-return-16557-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------_=_NextPart_001_01C3DC6E.29185082
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

Hi all,

=20

I hope it's ok to write to the group. I'm planning on installing reiser
4.0 and am getting the following error compiling libaal on a

Redhat  Version 7.2 system.

=20

Any ideas ?

=20

=20

=20

=20

#./make

cd . \

  && CONFIG_FILES=3D CONFIG_HEADERS=3Dconfig.h \

     /bin/sh ./config.status

config.status: creating config.h

make  all-recursive

make[1]: Entering directory `/root/libaal-0.4.15'

Making all in src

make[2]: Entering directory `/root/libaal-0.4.15/src'

source=3D'device.c' object=3D'libaal_la-device.lo' libtool=3Dyes \

depfile=3D'.deps/libaal_la-device.Plo'
tmpdepfile=3D'.deps/libaal_la-device.TPlo' \

depmode=3Dnone /bin/sh ../depcomp \

/bin/sh ../libtool --mode=3Dcompile gcc -DHAVE_CONFIG_H -I. -I. -I..
-I../include   -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -O0 -g -W -Wall
-Wno-unused-parameter -Wredundant-decls -c -o libaal_la-device.lo `test
-f device.c || echo './'`device.c

../depcomp: ../depcomp: No such file or directory

make[2]: *** [libaal_la-device.lo] Error 127

make[2]: Leaving directory `/root/libaal-0.4.15/src'

make[1]: *** [all-recursive] Error 1

make[1]: Leaving directory `/root/libaal-0.4.15'

make: *** [all] Error 2


------_=_NextPart_001_01C3DC6E.29185082--
