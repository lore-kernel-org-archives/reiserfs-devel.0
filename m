From: =?ISO-8859-1?Q?S=E6valdur?= Gunnarsson <addi@root.is>
Subject: libaal compile fails
Date: Wed, 29 Oct 2003 04:33:57 +0000
Message-ID: <1067402036.4704.4.camel@plutonia>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-U3Fq4VIKLBPWAeVQMIeF"
Return-path: <reiserfs-list-return-15919-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-U3Fq4VIKLBPWAeVQMIeF
Content-Type: multipart/alternative; boundary="=-jA2Uc8KRIkQTEDdDWL/G"


--=-jA2Uc8KRIkQTEDdDWL/G
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

When I try building libaal it fails with the following error message:

make[2]: Entering directory
`/raid/disc0/usr/src/linux-2.6.0-test9/libaal-0.4.13/src'
source=3D'file.c' object=3D'libaal_la-file.lo' libtool=3Dyes \
depfile=3D'.deps/libaal_la-file.Plo'
tmpdepfile=3D'.deps/libaal_la-file.TPlo' \
depmode=3Dgcc3 /bin/sh ../depcomp \
/bin/sh ../libtool --mode=3Dcompile gcc -DHAVE_CONFIG_H -I. -I. -I..
-I../include   -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -O0 -g -W -Wall
-Wno-unused-parameter -Wredundant-decls -Werror -c -o libaal_la-file.lo
`test -f file.c || echo './'`file.c
rm -f .libs/libaal_la-file.lo
gcc -DHAVE_CONFIG_H -I. -I. -I.. -I../include -D_REENTRANT
-D_FILE_OFFSET_BITS=3D64 -O0 -g -W -Wall -Wno-unused-parameter
-Wredundant-decls -Werror -c file.c -MT libaal_la-file.lo -MD -MP -MF
.deps/libaal_la-file.TPlo  -fPIC -DPIC -o .libs/libaal_la-file.lo
file.c: In function `file_len':
file.c:213: parse error before '[' token
cc1: warnings being treated as errors
file.c:213: warning: signed and unsigned type in conditional expression
make[2]: *** [libaal_la-file.lo] Error 1
make[2]: Leaving directory
`/raid/disc0/usr/src/linux-2.6.0-test9/libaal-0.4.13/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/raid/disc0/usr/src/linux-2.6.0-test9/libaal-0.4.13'
make: *** [all] Error 2
titanium /usr/src/linux/libaal-0.4.13#



S=E6valdur Gunnarsson: RHCE
Let justice be done; though the
world perish

--=-jA2Uc8KRIkQTEDdDWL/G
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; CHARSET=3DUTF-8">
  <META NAME=3D"GENERATOR" CONTENT=3D"GtkHTML/3.0.8">
</HEAD>
<BODY>
When I try building libaal it fails with the following error message:<BR>
<BR>
make[2]: Entering directory `/raid/disc0/usr/src/linux-2.6.0-test9/libaal-0=
.4.13/src'<BR>
source=3D'file.c' object=3D'libaal_la-file.lo' libtool=3Dyes \<BR>
depfile=3D'.deps/libaal_la-file.Plo' tmpdepfile=3D'.deps/libaal_la-file.TPl=
o' \<BR>
depmode=3Dgcc3 /bin/sh ../depcomp \<BR>
/bin/sh ../libtool --mode=3Dcompile gcc -DHAVE_CONFIG_H -I. -I. -I.. -I../i=
nclude&nbsp;&nbsp; -D_REENTRANT -D_FILE_OFFSET_BITS=3D64 -O0 -g -W -Wall -W=
no-unused-parameter -Wredundant-decls -Werror -c -o libaal_la-file.lo `test=
 -f file.c || echo './'`file.c<BR>
rm -f .libs/libaal_la-file.lo<BR>
gcc -DHAVE_CONFIG_H -I. -I. -I.. -I../include -D_REENTRANT -D_FILE_OFFSET_B=
ITS=3D64 -O0 -g -W -Wall -Wno-unused-parameter -Wredundant-decls -Werror -c=
 file.c -MT libaal_la-file.lo -MD -MP -MF .deps/libaal_la-file.TPlo&nbsp; -=
fPIC -DPIC -o .libs/libaal_la-file.lo<BR>
file.c: In function `file_len':<BR>
file.c:213: parse error before '[' token<BR>
cc1: warnings being treated as errors<BR>
file.c:213: warning: signed and unsigned type in conditional expression<BR>
make[2]: *** [libaal_la-file.lo] Error 1<BR>
make[2]: Leaving directory `/raid/disc0/usr/src/linux-2.6.0-test9/libaal-0.=
4.13/src'<BR>
make[1]: *** [all-recursive] Error 1<BR>
make[1]: Leaving directory `/raid/disc0/usr/src/linux-2.6.0-test9/libaal-0.=
4.13'<BR>
make: *** [all] Error 2<BR>
titanium /usr/src/linux/libaal-0.4.13#<BR>
<BR>
<TABLE CELLSPACING=3D"0" CELLPADDING=3D"0" WIDTH=3D"100%">
<TR>
<TD>
<BR>
<TABLE BGCOLOR=3D"#ccccc0" CELLSPACING=3D"0" WIDTH=3D"80%">
<TR>
<TD>
<TABLE BGCOLOR=3D"#fffff0" CELLSPACING=3D"0" CELLPADDING=3D"3" WIDTH=3D"100=
%">
<TR>
<TD VALIGN=3D"top">
<BR>
</TD>
<TD WIDTH=3D"100%">
S&#230;valdur Gunnarsson: <FONT COLOR=3D"#ff0000">RHCE</FONT><BR>
Let justice be done; though the world perish
</TD>
</TR>
</TABLE>

</TD>
</TR>
</TABLE>

</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-jA2Uc8KRIkQTEDdDWL/G--

--=-U3Fq4VIKLBPWAeVQMIeF
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/n0Mz13DWV+6498URAr4LAKDUhY2uF0XfrFGBpnDhFgedMegdEQCeJXID
fCW39XbVBpAIKGhM0hFhew4=
=5472
-----END PGP SIGNATURE-----

--=-U3Fq4VIKLBPWAeVQMIeF--

