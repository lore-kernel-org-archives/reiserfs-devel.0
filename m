From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsprogs-3.6.9 release
Date: Thu, 17 Jul 2003 12:14:55 +0400
Message-ID: <20030717081455.GA13974@namesys.com>
References: <200307162103.29531.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14955-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200307162103.29531.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Hello!

   BTW, it seems one other important change was omissed in the short summary below.
   The license on the reiserfsprogs package was changed from GPLv2 to
   GPLv2 with additional restriction that I quote below:
=======================
ReiserFSprogs is hereby licensed under the GNU General Public License
version 2 but with the following "Anti-Plagiarism" modification:
You may not remove any credits or brand marks, or cause them to not
display, unless you are an end user (that is, you are not
redistributing to others).  Yes, there really are people with the
nerve to remove credits from software they did not write, or only
wrote a small part of, and they are even frequently occurring sad to
say.  Credits are not ads, credits describe someone's contribution to
the project (e.g. labor or money) whereas an ad says something else.
=======================

Bye,
    Oleg
On Wed, Jul 16, 2003 at 09:03:29PM +0400, Vitaly Fertman wrote:
> 
> Hi all, 
> 
> the new reiserfsprogs release is available on our ftp site (ftp.namesys.com).
> 
> This release includes:
> - objectid handling was improved, significant speedup at pass0 and
> semantic/lost+found rebuild passes (was in last pre releases for some time);
> - improved leaves recovery on pass0 of rebuild-tree;
> - exit codes of reiserfsck were fixed;
> - reiserfsck --yes option was added
> - mkreiserfs --quiet option was added;
> - fsck check on boot avoids another bitmap reading on the following mount;
> - credits were fixed.
> 
> Some bugs were fixed:
> - fsck proceeds for the standard journal when wrong journal parameters in the 
>   journal header detected, fixing them with the warning;
> - a bug in journal replaying code when the only transaction exists was fixed;
> - a few not standard journal related bugs in mkreiserfs and reiserfstune were 
> fixed;
> - a pair of bugs in rebuild-sb were fixed;
> 
> -- 
> Thanks,
> Vitaly Fertman
