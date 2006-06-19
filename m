From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: BUG: reiserfsck --check fails exit status=6
Date: Mon, 19 Jun 2006 16:43:03 +0400
Message-ID: <1150720984.6383.100.camel@tribesman.namesys.com>
References: <4EEB5A4713E61F49A759A504BECCBC0A027682F1@bgeexc01.asiapacific.cpqcorp.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28818-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4EEB5A4713E61F49A759A504BECCBC0A027682F1@bgeexc01.asiapacific.cpqcorp.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Masthan, Dudekula (STSD)" <dudekula.masthan@hp.com>
Cc: reiserfs-list@namesys.com

Hello

On Mon, 2006-06-19 at 14:50 +0530, Masthan, Dudekula (STSD) wrote:
> 
> Hi,
> 
> I am using SUSE 10 beta version. I ran reiserfsck command with the
> following options
> 
> 
>            reiserfsck --check -q -y -n /dev/sdb1  2>&1
>            
> O/p of the command look like this.
> 
>              reiserfsck 3.6.19 (2003 www.namesys.com)
>                        
>                 * If you are using the latest reiserfsprogs and  it
> fails **
>                 * please  email bug reports to
> reiserfs-list@namesys.com, **
>                 * providing  as  much  information  as  possible --
> your **
>                 * hardware,  kernel,  patches,  settings,  all
> reiserfsck **
>                 * messages  (including version),  the reiserfsck
> logfile, **
>                 * check  the  syslog file  for  any  related
> information. **
>                 * If you would like advice on using this program,
> support **
>                 * is available  for $25 at
> www.namesys.com/support.html. **
>  
> *************************************************************
>                 Will read-only check consistency of the filesystem on
> /dev/sdb1
>                 Will put log info to 'stdout'
>                 reiserfsck --check started at Mon May 29 13:16:40 2006
>                 Relaying journal..
>                 Reiserfs journal '/dev/sdb1' in blocks [18..8211]: 0
> transactions replayed
>                 checking internal tree..finished
>                 Comparing bitmaps..Checking Semantic tree:
>                 finished
>                 26 found corruptions can be fixed when running with
> --fix-fixable
>                 reiserfsck finished at Mon May 29 13:16:44 2006
>                      
>                        reiserfsck exit status = 6
> 
> 
> Can any one Explain this ..

reiserfsck has 3 major modes.
By default (or with --check) it checks filesystem and either says that
everything is ok, or reiserfsck has to be run with --fix-fixable (when
filesystem can be fixed without tree rebuiling) or with --rebuild-tree
when corruptions can be recovered only via complete tree rebuild.

> Why it happened ?
> 

Can you re-run reiserfsck --check without -n and with -l logfile and let
us see what you get in logfile?

> Your help is appreciated
> Regards,
> Masthan 
> 

