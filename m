From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: data-logging-20  BUG?!
Date: Mon, 29 Jul 2002 11:41:23 +0200
Message-ID: <3D450DC3.1010004@mb.tu-ilmenau.de>
References: <3D427179.2070401@mb.tu-ilmenau.de> <20020729091710.GA15313@mfa.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11091-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tamas Gergely <dice@mfa.kfki.hu>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hi!

On 07/29/2002 11:17 AM, Tamas Gergely wrote:
> Hi!
> 
> On Sat, Jul 27, 2002 at 12:10:01PM +0200, Manuel Krause wrote:
>  > Hi all!
>  > 
>  > I'm currently using:
>  > 2.4.19-rc3
>  > + reiserfs-pending: 01.change_help_wording.diff
>  >                     02.change_menu_wording.diff
>  >                     03.confusing_journal_replay_warning_removal.diff
>  >                     05.hash_on_empty_fs-1.diff
>  > + mason: 01-relocation-4.diff
>  >          02-commit_super-8-relocation.diff
>  >          03-beta-data-logging-20.diff
>  >          04-write_times.diff
>  >          05-search_reada-4.diff
>  > + rml: preempt-kernel-rml-2.4.19-rc3-1.patch
>           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Where did you get this one from? All I was able to find was one for
> -rc3-ac3-1?
> 
> Thanks in advance,
> Gergely
> 

Sorry, I was a bit inaccurate. Thanks, for pointing this out!

I took the patch preempt-kernel-rml-2.4.19-rc2-1.patch from 
ftp://ftp.kernel.org/pub/linux/kernel/people/rml/preempt-kernel/v2.4/
-- it applied and compiled cleanly.

I don't have the reported problems with 03-beta-data-logging-19.diff at all.


Best wishes,

Manuel

