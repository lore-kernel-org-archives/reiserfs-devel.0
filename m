From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Reiser questions on possible corruptions / sparc + scsi
Date: Thu, 17 Jun 2004 22:51:39 +0400
Message-ID: <200406172251.39615.vitaly@namesys.com>
References: <Pine.LNX.4.60.0406171212440.28356@surreal.mirage.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19239-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.60.0406171212440.28356@surreal.mirage.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: encieno@mirage.org, reiserfs-list@namesys.com
Cc: damp@mirage.org

Hello, 

On Thursday 17 June 2004 21:27, encieno@mirage.org wrote:
> Here's the question, hopefully I can explain it all and give enough
> details. I've got two Ultra 10's that are just recently having the same
> types of errors around the same time. The box currently in question is
> running Gentoo linux, kernel 2.6.7 now. I'm using a QLogic ISP1020 PCI
> scsi adapter card, with a 20gb drive on it<forgot the model, cheetah>.
> I've also
> got two IDE drives in the box. I am using ReiserFS 3.6 on all partitions
> except /boot. ReiserFS tools are 3.6.13 on the current machine. I've
> recently been getting 'corruptions' on the same partition, on the box
> listed above, as well as another 10. /var/tmp I have seperated since it
> tends to grow large at times. I first noticed an error trying to remove a
> directory, it was saying it wasnt empty. The  directory was empty. That
> being said, I thought there might be some corruptions, umount it, run
> reiserfsck and it start spewing madd errors out. Here's a quick snip of
> it.
> reiserfsck --check started at Thu Jun 17 12:16:58 2004
> ###########
> Replaying journal..
> 0 transactions replayed
> Checking internal tree../  1 (of  10)/  1 (of  93)bad_stat_data: The
> objectid (2) is marked free, but us
> ed by an object [1 2 0x0 SD (0)]
> bad_stat_data: The objectid (3) is marked free, but used by an object [2 3
> 0x0 SD (0)]
> /  4 (of  93)bad_stat_data: The objectid (4) is marked free, but used by
> an object [2 4 0x0 SD (0)]
> bad_stat_data: The objectid (97703) is marked free, but used by an object
> [2 97703 0x0 SD (0)]
> bad_stat_data: The objectid (113941) is marked free, but used by an object
> [2 113941 0x0 SD (0)]
> bad_stat_data: The objectid (453291) is marked free, but used by an object
> [2 453291 0x0 SD (0)]
> I've tried to rebuilt the tree and --fix-fixable with no luck.

what do you mean 'with no luck' ? I have just tested that fix-fixable can 
fix broken objectid map, reiserfsprogs-3.6.17. Do you run check just after 
--fix-fixable and get the same error messages? Or you mean that such 
errors appear again after using fs for a while?

> I've googled all over the place and can't really find anything useful for
> the bad_stat_data. I've seen many older posts but can't find anything
> recent. Heres more output from messages when I mount and/or run reiserfsck
> on the partition in question.
> Jun 17 12:16:49 gentoo sys32_ioctl(reiserfsck:2282): Unknown cmd fd(5)
> cmd(40081272) arg(effff680)
> Jun 17 12:16:58 gentoo sys32_ioctl(reiserfsck:2283): Unknown cmd fd(5)
> cmd(40081272) arg(effff680)
> I am sort of clueless at the moment.. I've been using reiser for probably
> the past 3-4 years and have never had any problems. However, this is the
> first time I've used it on any sparc based systems. The first box that
> started having issues, I just assumed the disk over heated and it started
> to write bad. Today the second box went, exact same partition, exact same
> problems. I've even mkreiserfs'd it a time than remounted it. It will run
> for a bit fine, if I actually get some data moving around on it, it
> eventually will start showing the same errors. The partition originally
> showed 25k corruptions, there were only 26k files on it =] I would have
> assumed it might have been a disk error, except it' the second box I've
> had this happen on now. Is there anything obvious I'm missing?
> Oh ya, just another weird part of it. I've currently moved the /var/tmp
> mount over to another IDE disk in the system, same reiser versions, and it
> works fine, no matter how hard I try to recreate it.. Sort of makes me
> think there's either something wrong with the
> kernel/scsi driver/something. The only thing common between both machines
> would be the arch. type, and the reiser versions. I did upgrade reiserfs 
> tools to .17, with nothing changed.
>
> <sorry the long post>
>
> Any ideas would be appreciated.
>
> Thanks.
>
> -dave

-- 
Thanks,
Vitaly Fertman

