From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: compatibility of 2.4.20-pre2/.19.pending & data-logging
 ?
Date: Thu, 15 Aug 2002 04:46:24 +0200
Message-ID: <3D5B1600.2020405@mb.tu-ilmenau.de>
References: <20020814184938.A12116@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11189-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: =?ISO-8859-15?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>, Chris Mason <mason@suse.com>, reiserfs-list <reiserfs-list@namesys.com>

On 08/14/2002 04:49 PM, Oleg Drokin wrote:
> Hello!
> 
>     After some time of development and internal testing, I am releasing
>     this in public (obviously before pushing it to Marcelo).
>     There are two patches at
>     ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.19.pending/testing
>     These implement reiserfs_file_write() support (patches are against
>     2.4.20-pre2) that should speedup writes for those applications
>     that actually care about st_blksize content of stat(2) output.
>     (including cp and dd of course)
>     Before submittig these to Marcelo we'd like to get more wide testing,
>     of course. So if you can try these and report any problems, that
>     would be very much appreciated.
>     Also first patch considerably speedups hole creation (I remember report
>     about creating 128G empty file was taking ages, this should fix this).
>     
>     Please note that these patches are not compatible with Chris Mason's
>     datalogging patches, though we will do a merge later of course.
> 
> Bye,
>     Oleg
> 

Sorry, Oleg, Dieter, Chris & others,

for "re-threading",

are the introduced patches in 2.4.20-pre2 and/or 2.4.19.pending 
compatible with Chris' patches? I didn't give them or 2.4.20-pre2 a try, 
so far.

Am I right to better wait until Chris is back and updates his 
data-logging stuff for the actual pre-kernel, namesys-patches and more - 
wait for the outstanding merge?? Anyone having experiences yet?

Thank you and best regards,


Manuel

