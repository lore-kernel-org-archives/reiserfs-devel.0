From: Soeren Sonnenburg <reiserfs@nn7.de>
Subject: Re: free space seems wrong...
Date: 06 Mar 2003 13:00:22 +0100
Message-ID: <1046952022.23752.55.camel@calculon>
References: <1046886804.23752.25.camel@calculon>
	 <20030306094705.A5417@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13121-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030306094705.A5417@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Thu, 2003-03-06 at 07:47, Oleg Drokin wrote:
> Hello!
> 
> On Wed, Mar 05, 2003 at 06:53:24PM +0100, Soeren Sonnenburg wrote:
> 
> > is_leaf: free space seems wrong: level=1, nr_items=7, free_space=3468 rdkey 
> > vs-5150: search_by_key: invalid format found in block 4792161. Fsck?
> > is_leaf: free space seems wrong: level=1, nr_items=7, free_space=3468 rdkey 
> > vs-5150: search_by_key: invalid format found in block 4792161. Fsck?
> > when accessing a certain directory using du and on the prompt
> > Input/output error.
[...]
> > The problem is, this filesystem is like 2-3 years old and was converted
> > to reiserfs 3.6 maybe a year ago...but as it is a production environment
> > I would not want to put it down at all...
> 
> You can run reiserfs --check even on readonly mounted fs just to get idea
> on how broken it is and then to plan what to do next.

Well... see below for the output of reiserfsck, which I just started on
the rw mounted fs (just to check whether the tool itself is the latest
version). The kernel now is 2.4.20 and it does correctly claim that the
fs is mounted on a different reiserfs partition (Partition /dev/sda6 is
mounted w/ write permissions, cannot check it)

I have no idea whether I should indeed do --rebuild-sb --rebuildtree ...

Regards,
Soeren.
<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.5-pre2

  *************************************************************
  ** If you are using the latest reiserfsprogs and  it fails **
  ** please  email bug reports to reiserfs-list@namesys.com, **
  ** providing  as  much  information  as  possible --  your **
  ** hardware,  kernel,  patches,  settings,  all  reiserfsk **
  ** messages  (including version),  the reiserfsck logfile, **
  ** check  the  syslog file  for  any  related information. **
  ** If you would like advice on using this program, support **
  ** is available  for $25 at  www.namesys.com/support.html. **
  *************************************************************

Will read-only check consistency of the filesystem on /dev/sdd1
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
reiserfs_open_journal: journal parameters from super block does not match to
journal parameters from journal.

Either make journal partition available or use --no-journal-available
If you have the standard journal or if your partition is available
and you specified it correctly, you must run rebuild-sb.

