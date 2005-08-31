From: Bedros Hanounik <2bedros@gmail.com>
Subject: changing label of disk
Date: Wed, 31 Aug 2005 10:32:16 -0700
Message-ID: <f18a8d9805083110322ecca20@mail.gmail.com>
References: <e692861c0508292136543a02e1@mail.gmail.com>
	 <1125380557.9589.3.camel@gentoo> <4313FE21.8080709@namesys.com>
	 <019d01c5ad68$4d5fdfa0$d60310ac@homedom> <43147EFE.2020804@perkel.com>
	 <43150100.40304@namesys.com> <4315D455.1050100@suse.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_3883_12521173.1125509536047"
Return-path: <reiserfs-list-return-25759-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4315D455.1050100@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs List <reiserfs-list@namesys.com>

------=_Part_3883_12521173.1125509536047
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

here's a noob question. I have a usb HD using reiserfs 3.6=20

I want to change the label of the disk, so when it's automounted, the=20
mounting point has some meaning such as "backup" instead of "usbdisk"

fstab-sync seems to use the label of the disk to create a mounting point.

mkfs.reiserfs -l label will overwrite the old data; is there a way to edit=
=20
the old lable w/o reformating the disk, other than hexedit the disk?

Thanks,

-B

------=_Part_3883_12521173.1125509536047
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

here's a noob question. I have a usb HD using reiserfs 3.6 <br>
<br>
I want to change the label of the disk, so when it's automounted, the
mounting point has some meaning such as &quot;backup&quot; instead of &quot=
;usbdisk&quot;<br>
<br>
fstab-sync seems to use the label of the disk to create a mounting point.<b=
r>
<br>
mkfs.reiserfs -l label will overwrite the old data; is there a way to
edit the old lable w/o reformating the disk, other than hexedit the
disk?<br>
<br>
Thanks,<br>
<br>
-B<br>

------=_Part_3883_12521173.1125509536047--
