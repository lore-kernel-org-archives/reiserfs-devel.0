From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: vs-8115: get_num_ver: not directory item
Date: Thu, 6 May 2004 11:46:21 +0200
Message-ID: <20040506114621.1f2805b4@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18482-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ReiserFS Mailing List <reiserfs-list@namesys.com>


Hello,

Today after i dist-upgraded my Debian box, i rebuilt the Nvidia module and =
saw that on screen
right after:

May  6 10:23:38 kernel  kernel: vs-8115: get_num_ver: not directory item
May  6 10:23:38 kernel  kernel: vs-8115: get_num_ver: not directory item


Kernel is vanilla 2.6.6-rc3. HW is Dell workstation 530MT, SCSI disk, SMP

I already had that some weeks ago, with a previous 2.6.6rcX kernel but i di=
dn't pay too much attention
after the latest reiserfsck told me that my fs had 0 corruption. Now that i=
 think of this, it was also after the Nvidia
installer so maybe this is a good workload to trigger this. ( Nvidia instal=
ler version is 5336 )

Checking the archives, i only found a post on 12/26/2001 with reply from Ol=
eg saying that it looked like a race and
he posted a fix. Maybe this is different but hopefully, this isn't causing =
any corruption.

Thanks,

Philippe

--

Philippe Gramoull=E9
philippe.gramoulle@mmania.com
Senior System and Network Architect
Lycos Europe



