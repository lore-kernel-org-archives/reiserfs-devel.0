From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@o2.pl>
Subject: reiser4 disc space usage
Date: Sun, 06 Feb 2005 11:43:32 +0100
Message-ID: <opslruquf4t3f2uk@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi,

I've just did a little testing of reiser4 vs reiserfs 3.6 space usage on my=
 spare 40GB hard drive, this is what I've got:

reiser4
/dev/hdd5              38016MB   20937MB   17080MB  56% /mnt/seagate

reiserfs
/dev/hdd5              40007MB   21015MB   18993MB  53% /mnt/seagate

I've put the same files, copied in the same order. Could You explain to me =
why partition formatted whit reiser4 has over 1GB less free space??
Those files take little less space on reiser4 but there is much less free s=
pace on the same partition when r4 is used.

=A3ukasz Mierzwa
