From: Oleg Drokin <green@namesys.com>
Subject: Re: un-long listable files
Date: Wed, 6 Aug 2003 21:03:46 +0400
Message-ID: <20030806170346.GB14719@namesys.com>
References: <200308061431.13695.Michael.James@csiro.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15180-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200308061431.13695.Michael.James@csiro.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael.James@csiro.au
Cc: reiserfs-list@namesys.com, jeffm@suse.com

Hello!

On Wed, Aug 06, 2003 at 02:31:39PM +1000, Michael.James@csiro.au wrote:

> getxattr("light_in_time_of_darkness__glad_to_see_you.wav",
>          "system.posix_acl_access"
> and there it sits waiting for heat-death-of-universe.

Hm, this code is by SuSE people (and it is only in suse kernels) and I have not
even looked at it closely yet.
Probably Jeff can comment on it.

> Looks like I'm falling foul of some strange ACLs.
> ls -l as root still hangs though.

Bye,
    Oleg
