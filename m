From: Manuel Krause <manuelkrause@netscape.net>
Subject: Re: Data-logging and md as / fs bug
Date: Tue, 13 May 2003 16:15:30 +0200
Message-ID: <3EC0FE02.9030007@netscape.net>
References: <3EB30852.6090402@netscape.net> <200305062134.42520.christian.mayrhuber@gmx.net> <1052250298.14612.235.camel@tiny.suse.com> <200305062156.27595.Dieter.Nuetzel@hamburg.de> <1052400685.14617.489.camel@tiny.suse.com> <20030512072943.GA21604@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14089-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 05/12/2003 09:29 AM, Oleg Drokin wrote:
> Hello!
> 
> On Thu, May 08, 2003 at 09:31:25AM -0400, Chris Mason wrote:
> 
> 
>>>iget5_locked_for_2.4.21-pre5-datalogging.diff
>>
>>Not needed any more.
> 
> 
> How so?
> This one is still not fixed in Marcelo tree at least.
> And I hope to get at least the least-intrusive fix in before 2.4.22 is out.
> 
> Bye,
>     Oleg

Do you have something new to try? Does this original patch affect disk 
i/o perfomance (positive/negative)?

Always appreciated are less intrusive ones regarding i/o speed ;-))

(BTW, with small change (for non-quota people like me: a remove of 
dquot.o from the export-objs) this patch runs well on here ("desktop 
load") since you published it: On -pre5, -pre7 and now -rc2).


Bye and many thanks,

  Manuel


--
Currently running 2.4.21-rc2 +

patch-2.4.21-rc2.rfs01.m02-akpm-b_journal_head-1.diff
patch-2.4.21-rc2.rfs02.m03-relocation-8.diff
patch-2.4.21-rc2.rfs03.m04-reiserfs-sync_fs-4.diff
patch-2.4.21-rc2.rfs04.m05-data-logging-37.diff
patch-2.4.21-rc2.rfs05.m06-logging-export.diff
patch-2.4.21-rc2.rfs06.m06-write_times.diff
patch-2.4.21-rc2.rfs07.m09.kinoded-9.ML.diff
patch-2.4.21-rc2.rfs08.m11.inode-dirty-for-kinoded.ML.diff
patch-2.4.21-rc2.rfs09.m12.search_reada-4.diff
patch-2.4.21-rc2.rfs10.iget5_locked_for_datalogging.namesys.noquota.diff
preempt-kernel-rml-2.4.21-rc2-was-pre1-1.0.patch
patch.mk.01.Makefile.diff
patch.mk.02.r128_drv.diff
patch.mk.03.2.4.21-rc2-Config.in.diff

applied in this order.

-
rfs??=reiserfs, m??=Chris' patches, ML=posted to reiserfs-list only, 
mk=my own needed changes

