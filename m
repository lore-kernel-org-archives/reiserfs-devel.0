From: Oleg Drokin <green@namesys.com>
Subject: Re: How to break a reiserfs on Linux 2.4.20
Date: Thu, 16 Jan 2003 18:22:01 +0300
Message-ID: <20030116182201.A28414@namesys.com>
References: <b01ff1$sp0$1@genki.hungrycats.org> <b04o8a$eah$1@satsuki.furryterror.org> <b04o8a$eah$1@satsuki.furryterror.org> <20030116104906.A7078@namesys.com> <b06erb$j34$1@satsuki.furryterror.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12397-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <b06erb$j34$1@satsuki.furryterror.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jan 16, 2003 at 09:16:11AM -0500, Zygo Blaxell wrote:
> Oleg Drokin  <green@namesys.com> wrote:
> >Yes, we were able to reproduce the problem and now we are trying to fix it.
> >Thanks a lot for your help and for the script.
> Excellent!  :-)
> Just on a whim, I ran the tests on a different kernel image yesterday
> and got some different results in the syslog:
> Jan 15 18:26:00 berkelium kernel: journal-569: flush_commit_list, block already dirty!

Hm, these are something new for me.

> Jan 15 18:26:00 berkelium kernel: vs-13060: reiserfs_update_sd: stat data of object [537145 537147 0x0 SD] (nlink == 6) not found (pos 2)

I've seen these too right from the beginning.

> Then the kernel panicked.  I'm going to try this again and try to capture the 

Same for me. And I saw more debugging messages in fact.

> The main difference between the two kernels (aside from whether various SCSI
> and RAID drivers are built-in or modules) is the SMP flag and CPU type
> (Pentium 3 uniprocessor vs. 586 SMP).  Neither one had the REISER_CHECK
> option set.

Was the kernel in SMP mode? (I do my tests on UP)

Bye,
    Oleg
