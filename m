From: wolfgang.glas@ev-i.at
Subject: kernel loop with lseek + LFS on reiser partition.
Date: Mon, 22 Apr 2002 10:28:05 +0200
Message-ID: <OF3FAEC010.18270BFB-ONC1256BA3.002DB214@ev-i.at>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_mixed 002E8431C1256BA3_="
Return-path: <reiserfs-list-return-10104-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=_mixed 002E8431C1256BA3_=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

I was just about to report a seek bug in samba-2.2.3a, when I wrote the=20
attached sample program seeking in a file to position 128GB from the=20
beginning and the ne writing "HEllo, world!" to that position. The prgram=20
closes fd's 0,1,2 before doing all that, because I tried to simulate the=20
fd numbers of the samba server. Hence, error reporting goes to syslog(2)=20
instead of stderr. (I recently read about sparse files and decided to give =

them a try...; Program compiled LFS support; see comment in C-file)

Running the program under SuSE7.3 with the folowing two kernels lets the=20
process starve in an infineite loop inside the kernel (99% kernel CPU):

linux-2.4.16 from SuSE
linux-2.4.18 with the speedup patches from this mailing list plus=20
lvm-1.0.3

glibc-2.2.4 (SuSE 7.3)

 No go with kill, kill -9...... Only reboot helps.

6GB Reiserfs partition on top of lvm, mount with -o conv.=20

  Best regards,

    Wolfgang



--
Dr. Wolfgang Glas                        EV-i Informationstechnologie=20
GmbH.
Gesch=E4ftsf=FChrer                          Sebastian-Kneipp-Weg 17
Wolfgang.Glas@ev-i.at                    A-6020 Innsbruck/Austria
phone: ++43-512-284883-2                 fax: ++43-512-281624-31

--=_mixed 002E8431C1256BA3_=--
