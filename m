From: "Barry, Christopher" <cbarry@infiniconsys.com>
Subject: OT:RE: kernel memory limits
Date: Wed, 26 Nov 2003 08:16:31 -0500
Message-ID: <08628CA53C6CBA4ABAFB9E808A5214CB01B5646B@mercury.infiniconsys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16170-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list <reiserfs-list@namesys.com>

A bit off-topic, but I am very interested in the use of mounting so many =
filesystems on a single machine? What does this get used for?

Thanks,
Christopher

-----Original Message-----
From: Nikita Danilov [mailto:Nikita@Namesys.COM]
Sent: Wednesday, November 26, 2003 8:07 AM
To: Nick Burrett
Cc: reiserfs-list; Chris Mason
Subject: Re: kernel memory limits


Nick Burrett writes:
 >=20
 >=20
 > Hi,
 >=20
 > I'm running standard 2.4.22 kernel, 2xP4 Xeon with 2Gb RAM.
 >=20
 > After reaching 127 filesystems on the server, all formatted as =
reiserfs,=20
 > I now find the following errors are occurring:
 >=20
 >=20
 > reiserfs: found format "3.6" with standard journal
 > reiserfs: using ordered data mode
 > loop(7,124):clm-2000, unable to allocate bitmaps for journal lists
 > Unable to handle kernel NULL pointer dereference at virtual address =
00000000
 >   printing eip:

Sorry, for delay.

Please try following patch:
----------------------------------------------------------------------

diff -puN fs/reiserfs/journal.c~jb_bitmaps-NULL-check =
fs/reiserfs/journal.c
--- i386/fs/reiserfs/journal.c~jb_bitmaps-NULL-check	Wed Nov 26 16:03:56 =
2003
+++ i386-god/fs/reiserfs/journal.c	Wed Nov 26 16:03:56 2003
@@ -193,6 +193,9 @@ static int set_bit_in_list_bitmap(struct
 static void cleanup_bitmap_list(struct super_block *p_s_sb,
                                 struct reiserfs_list_bitmap *jb) {
   int i;
+  if (jb->bitmaps =3D=3D NULL)
+    return;
+
   for (i =3D 0 ; i < SB_BMAP_NR(p_s_sb) ; i++) {
     if (jb->bitmaps[i]) {
       free_bitmap_node(p_s_sb, jb->bitmaps[i]) ;

_
----------------------------------------------------------------------

(It is against 2.6, but hopefully will apply.)

Chris what do you think?

 > c01d5397

[...]

 >=20
 > $ iptables -F
 > iptables: Memory allocation problem
 >=20
 > I was hoping to mount 254 filesystems on this server.  Another server =

 > running ext2 successfully runs with over 1000 filesystems and another =

 > with ext3 runs 220 filesystems.
 >=20
 > This is 100% reproducable. Is there anything I can do about this ?
 >=20

Patch should fix the oops, but not the memory exhaustion problem.

 >=20
 > Regards,
 >=20
 >=20
 > Nick.
 >=20

Nikita.

 >=20
 > --=20
 > Nick Burrett
 > Network Engineer, Designer Servers Ltd.   http://www.dsvr.co.uk
 >=20
