From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck stops with Floating point exception
Date: Mon, 8 Dec 2003 12:36:16 +0300
Message-ID: <200312081236.16955.vitaly@namesys.com>
References: <oprztl7dujyycu5f@192.168.0.1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16285-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <oprztl7dujyycu5f@192.168.0.1>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Joswig <ralfjoswig@gmx.de>, reiserfs-list@namesys.com

Hello Ralf, 

On Sunday 07 December 2003 20:15, Ralf Joswig wrote:
> After a systemcrash a can't access my root-partition. When I try to mount
> it the system stops. fdisk can read the partitiontable and a test with
> gpart and testdisk shows no errors.
> When I start reiserfsck I get the follwing  output:
>
> <---------------------------------------------------->
>
> testkiste:~ # reiserfsck /dev/hdb3
> reiserfsck 3.6.11 (2003 www.namesys.com)
>
> *************************************************************
> ** If you are using the latest reiserfsprogs and  it fails **
> ** please  email bug reports to reiserfs-list@namesys.com, **
> ** providing  as  much  information  as  possible --  your **
> ** hardware,  kernel,  patches,  settings,  all reiserfsck **
> ** messages  (including version),  the reiserfsck logfile, **
> ** check  the  syslog file  for  any  related information. **
> ** If you would like advice on using this program, support **
> ** is available  for $25 at  www.namesys.com/support.html. **
> *************************************************************
>
> Will read-only check consistency of the filesystem on /dev/hdb3
> Will put log info to 'stdout'
>
> Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes
> Floating point exception

Hm, would you send me the core file? If it was not created, run
    ulimit -c unlimited
please and reiserfsck again.

-- 
Thanks,
Vitaly Fertman
