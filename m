From: Oleg Drokin <green@namesys.com>
Subject: Re: [PAID PRIORITY SUPPORT REQUEST] Quotas not fully working in 2.4.21-pre5
Date: Sat, 5 Apr 2003 15:22:15 +0400
Message-ID: <20030405152215.A2147@namesys.com>
References: <20030405024529.71d46842.philippe.gramoulle@mmania.com> <20030405114200.A984@namesys.com> <20030405131118.215367f2.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13588-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030405131118.215367f2.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philippe Gramoull? <philippe.gramoulle@mmania.com>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>, reiserfs-dev@namesys.com

Hello!

On Sat, Apr 05, 2003 at 01:11:18PM +0200, Philippe Gramoull? wrote:
>   | > Object: Can't set quotas with 2.4.21-pre5
>   | >  After we upgraded from 2.4.19-pre6 + quota patches , 2.4.21-pre5 + data-logging and quota
>   | > patches, we can't set quotas anymore.
>   | 
>   | Have you enabled all the compatibility stuff in kernel config? (show the relevant part of .config please).
> Well, i think so yes.
> You'll find attached the .config.

# CONFIG_QIFACE_COMPAT is not set
suggests that you do not have compatibility stuff enabled.
Please enable it and see if it cures the problem? 
At least that's how I forced my quotatools to work.
Well, mine are 3.03 and your are 3.07, help text says that this option is only required for quota
tools <= 3.04. But I still think you should try it.

Bye,
    Oleg
