From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: programs hang
Date: Sat, 14 Aug 2004 20:33:43 +0300
Message-ID: <20040814173343.GN1284@nysv.org>
References: <20040814172321.70248.qmail@web50903.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20290-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040814172321.70248.qmail@web50903.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Job Bob <yzhang2004@yahoo.com>
Cc: reiserfs-list@namesys.com

On Sat, Aug 14, 2004 at 10:23:21AM -0700, Job Bob wrote:
>  Hi. I have recently started using reiser4 as the
>primary file system for my laptop. Everything has been
>fine so far except for the following problems:

Which snapshot?

>1. When using the rpm command with certain operations
>(I think with -i or -e), the program hangs
>indefinitly.
>This problem goes away when /var/lib/rpm is not on a
>reiser4 file system.

Do you have any debugging options turned on?
DEBUG and DEBUG_OUTPUT may be of assistance.

>2. Half Life also hangs indefinitly at the command
>line with the command wine hl.exe. It was working
>before
>when I had it on an ext3 file system.

Does the word indefinitely mean that it hangs forever
or does it actually return?

>Any ideas on what the problem is. If so, when might
>they be fixed?

I had issues like this ages ago and they were fixed.

-- 
mjt

