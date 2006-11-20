From: "Clemens Eisserer" <linuxhippy@gmail.com>
Subject: Re: Possible interference between reiser4 and usb-storage?
Date: Mon, 20 Nov 2006 12:23:56 +0100
Message-ID: <194f62550611200323p11538cb0l1f13606b4bb92d6c@mail.gmail.com>
References: <194f62550611191252l612ac827tc2f0e581d01be46a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30195-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <194f62550611191252l612ac827tc2f0e581d01be46a@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Sorry for bothering - it was due to a broken cable I used.
Somehow after an error the kernel mixed up free space statistics.

lg Clemens

2006/11/19, Clemens Eisserer <linuxhippy@gmail.com>:
> Hello,
>
> I know this is a strange question, but could it be that because of
> reiser4 or the development I experience problems with usb-storage? I
> am using cryptocompress with the 2.6.19rc4 kernel and after some time
> df reports something like:
>
> /dev/hda3             55068032  32996604  22071428  60% / (my reiser4
> / partition)
> /dev/hda1               147764     14579    125556  11% /boot (ext3, boot)
> tmpfs                   256988         0    256988   0% /dev/shm
> /dev/sda1             55068032  32996604  22071428  60% /mnt (1GB flash storage)
>
> however sda1 is a 1gb usb storage device!!
>
> Could that be because I compiled the kernel with -O3? (any experiences
> about compiling the kernel with this switch?).
>
> Thank you in advance, lg Clemens
>
