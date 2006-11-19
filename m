From: "Clemens Eisserer" <linuxhippy@gmail.com>
Subject: Possible interference between reiser4 and usb-storage?
Date: Sun, 19 Nov 2006 21:52:20 +0100
Message-ID: <194f62550611191252l612ac827tc2f0e581d01be46a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30193-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello,

I know this is a strange question, but could it be that because of
reiser4 or the development I experience problems with usb-storage? I
am using cryptocompress with the 2.6.19rc4 kernel and after some time
df reports something like:

/dev/hda3             55068032  32996604  22071428  60% / (my reiser4
/ partition)
/dev/hda1               147764     14579    125556  11% /boot (ext3, boot)
tmpfs                   256988         0    256988   0% /dev/shm
/dev/sda1             55068032  32996604  22071428  60% /mnt (1GB flash storage)

however sda1 is a 1gb usb storage device!!

Could that be because I compiled the kernel with -O3? (any experiences
about compiling the kernel with this switch?).

Thank you in advance, lg Clemens
