From: Matthias Andree <matthias.andree@gmx.de>
Subject: e2fsck "unfixable" corruptions (was: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion)
Date: Sun, 6 Aug 2006 18:38:53 +0200
Message-ID: <20060806163853.GA31894@merlin.emma.line.org>
References: <6EHfR-8uS-33@gated-at.bofh.it> <6EIvf-29Z-33@gated-at.bofh.it> <6EIOE-2xY-7@gated-at.bofh.it> <6EJ7V-2Xa-7@gated-at.bofh.it> <6EJUk-4br-11@gated-at.bofh.it> <6EKx5-5dy-19@gated-at.bofh.it> <6EL03-5OU-1@gated-at.bofh.it> <6ELt2-6Eh-1@gated-at.bofh.it> <6ELCQ-6Rl-13@gated-at.bofh.it> <E1G9Rz1-0000ks-R7@be1.lrz>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29512-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <E1G9Rz1-0000ks-R7@be1.lrz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 7eggert@gmx.de
Cc: tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

(changing subject to catch Ted's attention)

Bodo Eggert schrieb am 2006-08-05:

> - I have an ext3 that can't be fixed by e2fsck (see below). fsck will fix
>   some errors, trash some files and leave a fs waiting to throw the same
>   error again. I'm fixing it using mkreiserfs now.

If such a bug persists with the latest released e2fsck version - you're
not showing e2fsck logs - I'm rather sure Ted Ts'o would like to have a
look at your file system meta data in order to teach e2fsck how to fix
this.

I've seen sufficient releases of reiserfsck that couldn't fix certain
bugs, too, so trying with the latest version of the respective tools is
a must.

-- 
Matthias Andree
