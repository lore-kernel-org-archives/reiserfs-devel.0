From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: How to break a reiserfs on Linux 2.4.20
Date: 17 Jan 2003 15:13:56 -0500
Message-ID: <b09o64$o52$1@satsuki.furryterror.org>
References: <b01ff1$sp0$1@genki.hungrycats.org> <b06erb$j34$1@satsuki.furryterror.org> <b06erb$j34$1@satsuki.furryterror.org> <20030116182201.A28414@namesys.com>
Return-path: <reiserfs-list-return-12428-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <20030116182201.A28414@namesys.com>,
Oleg Drokin  <green@namesys.com> wrote:
>> The main difference between the two kernels (aside from whether various SCSI
>> and RAID drivers are built-in or modules) is the SMP flag and CPU type
>> (Pentium 3 uniprocessor vs. 586 SMP).  Neither one had the REISER_CHECK
>> option set.
>
>Was the kernel in SMP mode? (I do my tests on UP)

All my test machines have single processors.  My dual-processor machines
are few and all are in production.

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
