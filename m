From: Oleg Drokin <green@namesys.com>
Subject: Re: quota on 2.4.20
Date: Mon, 12 May 2003 11:59:42 +0400
Message-ID: <20030512075941.GD21604@namesys.com>
References: <1052477804.4286.ezmlm@namesys.com> <Pine.LNX.4.52.0305091215480.18188@betty>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14075-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.52.0305091215480.18188@betty>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ricardo Reis <rreis@aero.ist.utl.pt>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, May 09, 2003 at 12:19:10PM +0100, Ricardo Reis wrote:
> I've patched a 2.4.20 kernel with the patchs provided in the site and all
> went ok. now i've turned quotaon but the following message arises:
> "quotaon: using /var/aquota.user on /dev/md1 [/var]: No such process
> quotaon: Quota format not supported in kernel.
> quotaon: using /home/aquota.user on /dev/md2 [/home]: No such process
> quotaon: Quota format not supported in kernel."
> were did I wen't wrong? if there's more info you need to help me, please
> let me know.

Have you enabled quota support in kernel?

Bye,
    Oleg
