From: michael chang <thenewme91@gmail.com>
Subject: Re: reiser3.6 files inaccessable from rescue CD post reiserfsck --rebuild-tree
Date: Mon, 31 Oct 2005 21:41:53 +0000
Message-ID: <b14e81f00510311341q522dae68i9dc06fea1e71dc4@mail.gmail.com>
References: <b14e81f00510301555j24f63c43x6a1bbda08bd4e5d1@mail.gmail.com>
	 <4365D722.8010409@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26747-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4365D722.8010409@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On 10/31/05, Vladimir V. Saveliev <vs@namesys.com> wrote:
> Hello
>
> michael chang wrote:
> > If I boot my Ubuntu install cd and run the "rescue" system, and try
> > and select my reiserfs partition, it will fail, saying that it doesn't
> > have the permisisons to execute /bin/bash.
> >
>
> Please boot off install cd so that it does not mount problem reiserfs par=
tition
> (/dev/hda5) as root filesystem.
> Mount /dev/hda5 to /mnt and run ls /mnt/bin/ -l
> What do you get?

Other results that may be of relevance: (which explain why GRUB
complains, and note that for some reason, by default, ls is aliased to
"ls --color=3Dauto")

ubuntu@ubuntu:/mnt$ ls boot
ls: boot/grub: Permission denied
ls: boot/knoppix: Permission denied
ls: boot/vmlinuz-2.6.12-9-686: Permission denied
ls: boot/memtest86+.bin: Permission denied
ls: boot/System.map-2.6.10-5-386: Permission denied
ls: boot/abi-2.6.12-9-686: Permission denied
ls: boot/config-2.6.10-5-386: Permission denied
ls: boot/initrd.img-2.6.10-5-386: Permission denied
ls: boot/System.map-2.6.12-9-686: Permission denied
ls: boot/config-2.6.12-9-686: Permission denied
ls: boot/initrd.img-2.6.12-9-686: Permission denied
ls: boot/vmlinuz-2.6.10-5-386: Permission denied
ubuntu@ubuntu:/mnt$ ls boot -l
ls: boot/grub: Permission denied
ls: boot/knoppix: Permission denied
ls: boot/vmlinuz-2.6.12-9-686: Permission denied
ls: boot/memtest86+.bin: Permission denied
ls: boot/System.map-2.6.10-5-386: Permission denied
ls: boot/abi-2.6.12-9-686: Permission denied
ls: boot/config-2.6.10-5-386: Permission denied
ls: boot/initrd.img-2.6.10-5-386: Permission denied
ls: boot/System.map-2.6.12-9-686: Permission denied
ls: boot/config-2.6.12-9-686: Permission denied
ls: boot/initrd.img-2.6.12-9-686: Permission denied
ls: boot/vmlinuz-2.6.10-5-386: Permission denied
total 0
ubuntu@ubuntu:/mnt$ ls boot --color=3Dno
abi-2.6.12-9-686     initrd.img-2.6.10-5-386  System.map-2.6.10-5-386
config-2.6.10-5-386  initrd.img-2.6.12-9-686  System.map-2.6.12-9-686
config-2.6.12-9-686  knoppix                  vmlinuz-2.6.10-5-386
grub                 memtest86+.bin           vmlinuz-2.6.12-9-686

ubuntu@ubuntu:~$ ls /mnt -l
total 371
lrwxrwxrwx    1 root root     32 2005-10-09 00:24 Archive ->
/windows/Downloads/media/Archive
drwxr-xr-x    2 root root     48 2005-10-14 00:19 bin
drwxr-xr-x    3 root root     72 2005-10-30 14:12 boot
lrwxrwxrwx    1 root root     11 2005-10-05 21:38 cdrom -> media/cdrom
drwxr-xr-x   12 root root  21688 2005-10-07 04:08 dev
drwxr-xr-x  147 root root   7856 2005-10-30 14:36 etc
drwxr-xr-x    2 root root     48 2005-10-05 21:38 hda6
drwxr-xr-x    7 root root    176 2005-10-15 14:45 home
drwxr-xr-x    2 root root     48 2005-10-05 21:39 initrd
lrwxrwxrwx    1 root root     28 2005-10-14 00:20 initrd.img ->
boot/initrd.img-2.6.12-9-686
lrwxrwxrwx    1 root root     28 2005-10-05 22:10 initrd.img.old ->
boot/initrd.img-2.6.10-5-386
drwxr-xr-x   20 root root   4768 2005-10-14 00:19 lib
drwx------  794 root root 340208 2005-10-30 15:49 lost+found
drwxr-xr-x    4 root root    128 2005-10-30 14:10 media
drwxr-xr-x    2 root root     48 2005-03-31 19:09 mnt
drwxr-xr-x    2 root root     48 2005-10-09 03:12 opt
lrwxrwxrwx    1 root root     33 2005-10-09 00:24 Original ->
/windows/Downloads/media/Original
drwxr-xr-x    2 root root     48 2005-03-31 19:09 proc
drwxr-xr-x   13 root root    520 2005-10-29 23:54 root
drwxr-xr-x    2 root root   5120 2005-10-15 20:35 sbin
drwxr-xr-x    2 root root     48 2005-10-05 21:39 srv
drwxr-xr-x    2 root root     48 2005-10-23 04:26 swap
drwxr-xr-x    2 root root     48 2005-03-23 22:41 sys
drwxrwxrwt    7 root root    240 2005-10-30 14:36 tmp
drwxr-xr-x   15 root root    376 2005-10-20 23:29 usr
drwxr-xr-x   16 root root    384 2005-10-14 00:20 var
lrwxrwxrwx    1 root root     25 2005-10-14 00:20 vmlinuz ->
boot/vmlinuz-2.6.12-9-686
lrwxrwxrwx    1 root root     25 2005-10-05 22:10 vmlinuz.old ->
boot/vmlinuz-2.6.10-5-386
drwxr-xr-x    2 root root     48 2005-10-05 21:38 windows

ls /bin garners similar results (although I don't have an exact copy... sor=
ry)

Unfortuantely, I didn't think to thorughly read your e-mail (misread
the first line) before preceeding to run reiserfsck from a different,
newer live CD (that I had a friend burn), which ran just fine.  While
some files have "dissapeared" into lost+found (which means they need
to be recatagorized or something, including everything in /boot), the
remainder of the files (maybe 94% of them or so) are now readable.  I
have no idea whether or not this is considered "progress".  Probably
now have to go sort them by magic or something, with filenames like
"25740_124378" on them.  Anyways, thanks very much for your help,
you've done a great job with reiserfs.

--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
