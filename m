From: JPASTORM@esade.edu
Subject: New to reiserfs
Date: Mon, 13 May 2002 11:34:29 +0200
Message-ID: <OF69292CB8.96B5D3F9-ONC1256BB8.0033D851@esade.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10297-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi,

I'm new to this surprising file system. Currently I have a Linux Red Ha=
t
6.2 server for testing, with two partitions (/ and /boot). I'm running =
the
2.2.14-5.0 kernel and I have several questions about reiserfs:

1.- Do I necessarily have to update to the 2.2.20 kernel so as to use
2.2.20-reiserfs patch?
2.- Can I migrate from ext2 to reiserfs without loosing data (I know I
should always backup my data) or should I have to format my new reiserf=
s
partitions?
3.- Is there any partition in other servers (in production) where it is=

advisable to stay with the ext2 filesystem?
4.- I have a PIII 1 GHz, 512 MB RAM, SCSI server where I run sendmail, =
bind
and squid. Will I have problems with performance if I migrate to reiser=
fs?
What's the counterpart of dealing with a journaling filesystem?

Thanks in advance.

Juan Pastor
E-mail: jpastorm@esade.edu

Centro de Proceso de Datos
Fundaci=F3n ESADE
Av. Pedralbes, 60-62
08034 Barcelona

Tel  +34 932806162 ext. 2562
Fax  +34 932048105

=


