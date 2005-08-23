From: =?ISO-8859-1?Q?Konstantin_M=FCnning?= <konstantin@muenning.com>
Subject: Re: Strange problems/bugs with reiserfs and reiserfschk
Date: Tue, 23 Aug 2005 23:30:38 +0200
Message-ID: <430B957E.4020004@muenning.com>
References: <42F684EE.7010201@muenning.com> <b14e81f0050807152830555213@mail.gmail.com> <42FDE93B.30807@muenning.com> <200508151720.09411.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25629-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200508151720.09411.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Vitaly Fertman <vitaly@namesys.com>

Hi Vitaly!

Thank you for the reiserfsck 3.9.20. It in fact had different results on
 that drive. I had it run in gdb (as I did with 3.6.19 to see what/where
the trouble may be) and the result is:

(***snip***)
vpf-10680: The file [641222 641239] has the wrong block count in the
StatData (1528) - corrected to (1520)
vpf-10680: The file [641222 641241] has the wrong block count in the
StatData (47192) - corrected to (47168)
vpf-10680: The file [641222 641242] has the wrong block count in the
StatData (16624) - corrected to (16528)

are_file_items_correct: All bytes we look for must be first items byte
(position 0).

Program received signal SIGABRT, Aborted.
0xffffe410 in __kernel_vsyscall ()
(***snip***)

Hmm... Ugly ;-).

Vitaly Fertman wrote:

> if some file item offsets are corrupted, fsck can work for too long on 
> pass2. or it also can be a bug. I will send you a version of reiserfsprogs 
> that has an optimization fix for former. if it fails email me and provide 
> the metadata please:
> 	debugreiserfs -p <device> | bzip2 -c > <device>.bz2

Do you need the metadata or the full logfile or should I send you
something more/else for that?

Thanks and have a nice day,
Konstantin
