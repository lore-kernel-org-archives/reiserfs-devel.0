From: hanasaki <hanasaki@hanaden.com>
Subject: Re: --rebuild-tree always finds errors --check is ok
Date: Fri, 07 Jan 2005 18:44:06 -0600
Message-ID: <41DF2CD6.7040800@hanaden.com>
References: <41D71C4E.6000209@hanaden.com> <1104849038.32178.54.camel@tribesman.namesys.com> <41DAD195.1080306@hanaden.com> <200501072343.08374.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23081-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200501072343.08374.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Could you outline exactly what takes place on a rebuild-tree?

I was under the incorrect assumption that if a rebuild-tree is 100% 
successful then the FS is ok and a subsequent rebuild-tree will have 
nothing to fix/report.  .....

Vitaly Fertman wrote:
> On Tuesday 04 January 2005 20:25, hanasaki wrote:
> 
>>Version of reiserfsk
>>======================
>>== From debian sarge
>>/sbin/reiserfsck -V
>>reiserfsck 3.6.19 (2003 www.namesys.com)
>>== also used the version in knoppix 3.7 with similar results
>>
>>the output of two consecutive runs of --rebuild-tree on the same
>>unmounted partition are attached.  Below is the diff
> 
> 
> rebuild-tree finds some blocks that looks like reiserfs formatted 
> blocks for the first sight whereas they are not and just belongs to 
> some file bodies. The consistency check reveals no valid metadata 
> in them, so they are considered as not valid reiserfs formatted blocks
> and left not modified on disk. This is why the second run of rebuild-tree
> finds them again and tries to do all the stuff again.
> 
