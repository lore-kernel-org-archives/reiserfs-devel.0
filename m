From: Daniele Palumbo <rocco@rimini.no-ip.com>
Subject: reiserfs df and du (not the reply in the faq)
Date: Sat, 09 Nov 2002 06:59:08 +0100
Message-ID: <5.1.1.6.0.20021109064856.01c2d540@rimini.no-ip.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11956-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

first of all, hi, it is my first message

from faq
--
du says ReiserFS makes space efficiency worse.
Use df not du, or use "raw" option for du if your du supports that. 
st_blocks summed up is less accurate than st_size for ReiserFS because we 
pack tails, and st_blocks rounds numbers up.
--
this means that du, with st_size, must give an higher value than df no?

anyway, i had updated reiserfsprogs to version 3.6.4, findutils to 4.1,
and i have this output

df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/ide/host0/bus0/target0/lun0/part1
                       478M  366M  113M  77% /
/dev/ide/host0/bus0/target0/lun0/part6
                        14G  1.8G   12G  13% /usr
/dev/ide/host0/bus0/target0/lun0/part7
                       4.5G   80M  4.4G   2% /home
---
(on /) du -hsx
102M    .

---
(always on /) du -hsx *
632k    System.map
4.5M    bin
4.7M    boot
512     cdrom
32k     chroot
4.5k    coda
0       dev
2.5M    etc
54M     home
4.5k    install
28M     lib
1.5k    mnt
du: `proc/11129/fd/3': No such file or directory
0       proc
39M     root
3.7M    sbin
0       spider
32k     tmp
1.9G    usr
20M     var
285k    vice
512     vicepa
---

i have also in proc kcore that is 202M, but i thnk that it is stored on ram
so, i have 260M of space that is null.

i also need to keep the server up, so i can't reboot with a read only fs 
and make reiserfsck on the partition

any suggestion?

bye
Daniele

