From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiserfsck stops with Floating point exception
Date: Sun, 07 Dec 2003 20:47:57 +0300
Message-ID: <3FD367CD.1060802@namesys.com>
References: <oprztl7dujyycu5f@192.168.0.1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16281-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <oprztl7dujyycu5f@192.168.0.1>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralf Joswig <ralfjoswig@gmx.de>
Cc: reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>

Ralf Joswig wrote:

> After a systemcrash a can't access my root-partition. When I try to 
> mount it the system stops. fdisk can read the partitiontable and a 
> test with gpart and testdisk shows no errors.
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
>
> <---------------------------------------------------->
>
> Have someone an idea how I can get my data from this disc?
>
> Thanks
>
> Ralf
>
>
>
vitaly will fix this.

-- 
Hans


