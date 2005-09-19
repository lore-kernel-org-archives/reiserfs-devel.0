From: Kristian =?iso-8859-1?q?K=F6hntopp?= <kris@koehntopp.de>
Subject: struct dirent *ent->d_type weirdness
Date: Mon, 19 Sep 2005 15:58:26 +0200
Message-ID: <200509191558.27362.kris@koehntopp.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26078-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com


I have a machine running under 2.6.13-SMP, using reiserfs 3.6. On=20
this machine, directories are flagged strangely and thus code=20
which operates properly under ext3 fails with reiserfs.

Why is this, and what am I doing wrong?

My goal is to walk a spool directory recursively and deal with=20
all files inside directories that I encounter. For that, I check=20
struct dirent *ent->d_type and get unexpected results.


mx15:/tmp # uname -a
Linux mx15 2.6.13web #4 SMP Fri Sep 16 16:03:39 CEST 2005 i686=20
unknown

mx15:/tmp # cat rtest.cpp
#include <stdio.h>
#include <dirent.h>

int main(int argc, char** argv)
{
struct dirent *ent =3D NULL;
DIR *dd =3D NULL;

dd =3D opendir(argv[1]);
if (dd !=3D NULL) {
         while ((ent =3D readdir(dd)) !=3D NULL) {
	 /* disable actual test and print ent->d_type */
	 /* ent->d_type=3D=3DDT_DIR && ent->d_name[1]=3D=3D0 && ent->d_name[0]>0=20
&& ent->d_name[0]!=3D'.'*/
		if (1) {
			printf("%s (%d) \n", ent->d_name, ent->d_type);
		}
         }
         closedir(dd);
}
}
mx15:/tmp # ./rtest /netsite/var/spool/wmail.reiser
=2E (0)
=2E. (0)
head (0)
dbclub02 (0)
mx15:/tmp # df -Th /netsite/var/spool/wmail.reiser
Dateisystem   Typ    Gr=F6=DFe Benut  Verf Ben% Eingeh=E4ngt auf
/reiserfile
           reiserfs    2.0G   33M  2.0G=20
2% /netsite/var/spool/wmail.reiser



Kristian
