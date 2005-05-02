From: Radovan Garabik <garabik@melkor.dnp.fmph.uniba.sk>
Subject: quota, reiserfs v3, 2.6.11.7
Date: Mon, 2 May 2005 10:33:34 +0200
Message-ID: <20050502083334.GA19785@melkor.dnp.fmph.uniba.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23950-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi all,

To add something to previous quota-related discussion:
I have a server with 180GB reiserfs v3 filesystem on a software RAID-1,=20
30GB of which is used, exported via nfs.
Yesterday I turned quotas on (in order to calm down a new user eating
approx. 1GB/day). Today in the morning the server was hung, I rebooted,
worked for a few minutes before it hung again (with no message on the
console). I rebooted again, turned quotas off, run reiserfsck=20
and the server is happily running for about 3 hours now, with heavy=20
nfs usage.

Kernel is vanilla 2.6.11.7 + grsecurity patches (could this be
related?). Usually, the usage is rather heavy (/home nfs export to >15
workstations).

I found these mesasges in syslog:
May  2 07:36:30 palo kernel: ReiserFS: md0: warning: PAP-5660: reiserfs_do_=
truncate: wrong result -1 of search for [186288 279757 0xfffffffffffffff DI=
RECT]
May  2 07:36:30 palo kernel: ReiserFS: md0: warning: clm-2100: nesting info=
 a different FS
May  2 07:36:42 palo last message repeated 5 times

May  2 08:59:40 palo kernel: ReiserFS: md0: warning: PAP-5660: reiserfs_do_=
truncate: wrong result -1 of search for [221141 125166 0xfffffffffffffff DI=
RECT]
May  2 08:59:40 palo kernel: ReiserFS: md0: warning: clm-2100: nesting info=
 a different FS
May  2 08:59:47 palo last message repeated 274 times

these two mesasges seem to correspond to the two crashes=20

Unfortunately, since this is a production server, I cannot do many
experiments, but I might try to set up reiserfs+quotas on some test
computers if necessary.

Is anyone using similar setup? (reiserfs+quotas+2.6.11.7+nfs)


--=20
 -----------------------------------------------------------
| Radovan Garab=EDk http://kassiopeia.juls.savba.sk/~garabik/ |
| __..--^^^--..__    garabik @ kassiopeia.juls.savba.sk     |
 -----------------------------------------------------------
Antivirus alert: file .signature infected by signature virus.
Hi! I'm a signature virus! Copy me into your signature file to help me spre=
ad!
