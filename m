From: Oleg Drokin <green@namesys.com>
Subject: Re: quota on 2.4.20
Date: Tue, 13 May 2003 14:54:47 +0400
Message-ID: <20030513105447.GA18413@namesys.com>
References: <Pine.LNX.4.52.0305131156320.30017@betty>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14086-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.52.0305131156320.30017@betty>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ricardo Reis <rreis@aero.ist.utl.pt>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, May 13, 2003 at 11:56:55AM +0100, Ricardo Reis wrote:

> >Have you enabled quota support in kernel?
> yes, that's why i don't get what is going on :(. I'm sending the config
> files for my kernel. I've also created the aquota.user in /var and /home,
> which are the root directories of the partitions involved...

I presume you created those with quotacheck -c

Anyway you have not enough quota options selected, I outlined ones that you need
to enable.

> CONFIG_QUOTA=y
> # CONFIG_QFMT_V1 is not set
> # CONFIG_QFMT_V2 is not set
> # CONFIG_QIFACE_COMPAT is not set

This one (CONFIG_QIFACE_COMPAT) is only needed if you use old quotatools (read help).
If you think you need it, it will add one more config entry and you need to select vfv0 there

Bye,
    Oleg
