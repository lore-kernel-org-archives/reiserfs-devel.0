From: Oleg Drokin <green@namesys.com>
Subject: Re: running unpatched 2.2.19 on reiserFS-ed system
Date: Tue, 11 Jun 2002 09:04:59 +0400
Message-ID: <20020611090459.A5294@namesys.com>
References: <20020611045911.45570.qmail@web21410.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10716-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020611045911.45570.qmail@web21410.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antonie Nygma <darkenigma80@yahoo.com>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jun 10, 2002 at 09:59:11PM -0700, Antonie Nygma wrote:

> stuffs on (fresh) kernel-2.2.19 and could not
> succesfully boot after compilation and rebooting.
> the error: Unable to mount root fs (kernel panic).
> i suspect this is because all the partitions in the
> current HDD are reiser-FS.

Yes.

> can anybody help me point out what i need to do to get
> k-2.2.19 to run on the machine?


If your reiserfs partitions are of v3.5 format (see dmesg output,
2.4 kernels will output warning in case of v3.5 fs being mounted),
you must apply latest reiserfs patch (against 2.2.20, but should apply fine
to 2.2.19) from ftp://ftp.namesys.com/pub/reiserfs-for-2.2
then recompile kernel and it should boot.
If you have v3.6 filesystem format, then you cannot use it from 2.2 kernel.

(BTW we are recommending to use 2.4.18+ kernels from 2.4 series because of
mane bugfixes that went into it. Any earlier 2.4 kernels should not be used
for reiserfs, if you really want your data to be consistent.)

Bye,
    Oleg
