From: Dark Shadow <shadowofdarkness@gmail.com>
Subject: Why is Reiser4 slower then ReiserFS v3
Date: Mon, 27 Dec 2004 13:38:12 -0700
Message-ID: <231dafb5041227123867a2c873@mail.gmail.com>
Reply-To: Dark Shadow <shadowofdarkness@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22914-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I am running a Linux from Scratch system and I just upgraded to Linux
kernel 2.6.10-cko1 (first time away from a vanilla kernel) in order to
try out Reiser4 but after formatting a drive I noticed it is slower
here is the best test I could run

I have three hard drives so I took a file from one and copied it to
the others and timed it
source drive /dev/hda Reiser3 Western Digital 40gb 7200rpm
target1 drive /dev/hdb Reiser4 Western Digital 80gb 7200rpm
target2 drive /dev/sda Reiser3 Seagate 160gb 7200rpm (SATA but still
same rpm as rest so it should be the same)



time cp ~/800mb.file /target1
real    0m41.409s
user    0m0.010s
sys     0m4.364s


time cp ~/800mb.file /target2
real    0m38.318s
user    0m0.017s
sys     0m5.627s


What formatting command would I use the get best speed for the
following situation
capturing raw uncompressed 720x480x29.97 video from my pci tv card.
The best I got with reiserfs v3 was 640x480x29.97 and it would end up
making a 50gb file in 64 minutes.
