From: Bodo Eggert <7eggert@gmx.de>
Subject: Re: e2fsck "unfixable" corruptions (was: the " 'official' point of
 view" expressed by kernelnewbies.org regarding reiser4 inclusion)
Date: Sun, 6 Aug 2006 20:15:15 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0608062006400.2655@be1.lrz>
References: <6EHfR-8uS-33@gated-at.bofh.it> <6EIvf-29Z-33@gated-at.bofh.it>
 <6EIOE-2xY-7@gated-at.bofh.it> <6EJ7V-2Xa-7@gated-at.bofh.it>
 <6EJUk-4br-11@gated-at.bofh.it> <6EKx5-5dy-19@gated-at.bofh.it>
 <6EL03-5OU-1@gated-at.bofh.it> <6ELt2-6Eh-1@gated-at.bofh.it>
 <6ELCQ-6Rl-13@gated-at.bofh.it> <E1G9Rz1-0000ks-R7@be1.lrz>
 <20060806163853.GA31894@merlin.emma.line.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29514-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060806163853.GA31894@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Andree <matthias.andree@gmx.de>
Cc: 7eggert@gmx.de, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Sun, 6 Aug 2006, Matthias Andree wrote:
> (changing subject to catch Ted's attention)
> Bodo Eggert schrieb am 2006-08-05:

> > - I have an ext3 that can't be fixed by e2fsck (see below). fsck will fix
> >   some errors, trash some files and leave a fs waiting to throw the same
> >   error again. I'm fixing it using mkreiserfs now.
> 
> If such a bug persists with the latest released e2fsck version - you're
> not showing e2fsck logs - I'm rather sure Ted Ts'o would like to have a
> look at your file system meta data in order to teach e2fsck how to fix
> this.

Unfortunately I had no time to generate a fsck log before doing mkfs, nor
did I catch the fsck log before. The best thing I could do at that moment
was appending an except from thr log hoping it can be usefull.

My main intention was posting a differently biased view on fs robustness.

> I've seen sufficient releases of reiserfsck that couldn't fix certain
> bugs, too, so trying with the latest version of the respective tools is
> a must.

It was the latest version I found.
-- 
            A. Top posters
            Q. What's the most annoying thing on Usenet?
