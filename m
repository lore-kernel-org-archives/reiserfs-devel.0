From: "Fabiano Reis" <silos.reis@ig.com.br>
Subject: Re: mount hang on kernel 2.6
Date: Mon, 8 Mar 2004 11:50:40 -0300
Message-ID: <014701c4051c$b9edd050$3f32a8c0@ds.ig.com.br>
References: <20040307_223203_003004.silos.reis@ig.com.br> <1078700846.25077.205.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17122-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Well Done! It worked with vanilla Kernel. (2.6.3 from www.kernel.org)

[root@host /]# dmesg -c
[root@host /]# mount /dev/sda8 /mnt
[root@host /]# dmesg
found reiserfs format "3.6" with standard journal
reiserfs:warning: CONFIG_REISERFS_CHECK is set ON
reiserfs:warning: - it is slow mode for debugging.
Reiserfs journal params: device sda8, size 8192, journal first block 18, max
trans len 1024, max batch 900, max commit age 30, max trans age 30
reiserfs: checking transaction log (sda8) for (sda8)
journal-1153: found in header: first_unflushed_offset 5161,
last_flushed_trans_id 2448052
journal-1206: Starting replay from offset 5161, trans_id 2448053
journal-1299: Setting newest_mount_id to 103
Using r5 hash to sort names
[root@host /]#

Thank you!

----- Original Message -----=20
From: "Chris Mason" <mason@suse.com>
To: "Fabiano Reis" <silos.reis@ig.com.br>
Cc: <reiserfs-list@namesys.com>
Sent: Sunday, March 07, 2004 8:07 PM
Subject: Re: mount hang on kernel 2.6


> On Sun, 2004-03-07 at 17:32, Fabiano Reis wrote:
> > Hi list,
> >
> > I=B4m having problems to mount a reiserfs filesystem using kernel 2.6.3=
 on
> > RedHat 9.
> >
> > The fs I=B4m trying to mount was formated using kernel 2.4.20-24.9 (the
latest
> > kernel for RH9) with ReiserFS version 3.6.25 (from dmesg) and
reiserfsprogs
> > 3.6.4 (from reiserfsck -v command)
> >
> > I upgraded to kernel 2.6.3 (rpm from
> > http://people.redhat.com/arjanv/2.6/RPMS.kernel/)
> >
> > The symptom: When I execute the command
> >
>
> Can you reproduce with a vanilla or -mm kernel?
>
> -chris
>
>
>

