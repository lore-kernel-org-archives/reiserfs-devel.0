From: wolfgang.glas@ev-i.at
Subject: kernel loop with lseek + LFS on reiser partition -- attachment pasted.
Date: Mon, 22 Apr 2002 10:57:45 +0200
Message-ID: <OF06243103.539AEE43-ONC1256BA3.0030EF24@ev-i.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10109-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

Hi all,

OK, My e-mail Program refuses to attach this file, so cut'n'paste seems=20
just fine.
(I'm using lotus Notesunder wine, :-( )

-----------------BOF: seek.c----------------------------------------
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <syslog.h>
#include <unistd.h>

/* compile under linux-2.4 using:

gcc -D=5FLARGEFILE64=5FSOURCE -D=5FFILE=5FOFFSET=5FBITS=3D64 -D=5FGNU=5FSOU=
RCE seek.c

*/

/* This is my personal strategy to keep the boredom from plain C code...)=20
*/
#define STRINGIFYIFY(i) #i
#define STRINGIFY(i) STRINGIFYIFY(i)

#define CHECK=5FC=5FERROR(call) if((call)=3D=3D-1) { \
syslog(LOG=5FERR, \
   =5F=5FFILE=5F=5F "(" STRINGIFY(=5F=5FLINE=5F=5F) "): " #call " failed: %=
m"); \
exit(2); \
}

#define CHECK=5FC=5FERROR64(call) if((call)=3D=3D(off=5Ft)-1) { \
syslog(LOG=5FERR, \
   =5F=5FFILE=5F=5F "(" STRINGIFY(=5F=5FLINE=5F=5F) "): " #call " failed: %=
m"); \
exit(2); \
}

int main()
{
  int fd;
  off=5Ft pos=3D128*1024*1024*(off=5Ft)1024; // 128 GB

  syslog(LOG=5FWARNING,
         =5F=5FFILE=5F=5F "(" STRINGIFY(=5F=5FLINE=5F=5F) "): sizeof(off=5F=
t)=3D%d",
         sizeof(off=5Ft));

  CHECK=5FC=5FERROR(close(0));
  CHECK=5FC=5FERROR(close(1));
  CHECK=5FC=5FERROR(close(2));

  CHECK=5FC=5FERROR(fd=3Dopen("seek.tmp",O=5FCREAT|O=5FTRUNC|O=5FWRONLY,064=
4));

  syslog(LOG=5FWARNING, \
         =5F=5FFILE=5F=5F "(" STRINGIFY(=5F=5FLINE=5F=5F) "): fd=3D%d, pos=
=3D%.0lf",
         fd,(double)pos);

  CHECK=5FC=5FERROR64(lseek(fd,pos,SEEK=5FSET));

  CHECK=5FC=5FERROR(write(fd,"Hello, world!",13));

  CHECK=5FC=5FERROR(close(fd));
}
----------------------EOF--------------------------------------------------=
-----

    Wolfgang

--
Dr. Wolfgang Glas                        EV-i Informationstechnologie=20
GmbH.
Gesch=E4ftsf=FChrer                          Sebastian-Kneipp-Weg 17
Wolfgang.Glas@ev-i.at                    A-6020 Innsbruck/Austria
phone: ++43-512-284883-2                 fax: ++43-512-281624-31

