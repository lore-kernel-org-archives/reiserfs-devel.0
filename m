From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsprogs-3.6.12-pre1 release
Date: Sun, 2 Nov 2003 14:32:02 +0300
Message-ID: <200311021432.02261.vitaly@namesys.com>
References: <200311012049.19969.vitaly@namesys.com> <m3llqz7np7.fsf@merlin.emma.line.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15960-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3llqz7np7.fsf@merlin.emma.line.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Cc: reiserfs-list@namesys.com

On Sunday 02 November 2003 01:01, Matthias Andree wrote:
> Vitaly Fertman <vitaly@namesys.com> writes:
> > The new pre release is available for downloading on
> > ftp://ftp.namesys.com/pub/reiserfsprogs/pre/reiserfsprogs-3.6.12-pre1.tar
> >.gz
>
> ...
>
> > *reiserfsck can check ro mounted filesystems.
>
> Does this use the "reboot Linux" exit codes that (e2)fsck uses?

codes? do you mean the code "2    - File system errors corrected, 
system should be rebooted"? Good question. No, for now it just 
suggests to umount and mount again, I should probably add this 
code also.
-- 
Thanks,
Vitaly Fertman
