From: Oleg Drokin <green@namesys.com>
Subject: Re: Getopt improvements
Date: Fri, 28 Feb 2003 10:47:56 +0300
Message-ID: <20030228104756.B1234@namesys.com>
References: <3E5D26A2.7010804@suse.com> <20030227092551.C28643@namesys.com> <3E5E312C.50406@suse.com> <3E5E730C.7030804@namesys.com> <3E5E84B2.90708@suse.com> <3E5E92BA.4090307@namesys.com> <3E5EAA3A.8030203@suse.com> <448183093.20030228012237@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12967-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <448183093.20030228012237@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Feb 28, 2003 at 01:22:37AM +0100, Anders Widman wrote:
> >         Well, the more possible values a given multivalue option has, the more
> > values that need to be explicitly negated for a mutually exclusive
> > option. The descriptor lines get quite long with more than 2 options
> > when you need to specify every value you need to clear.
>   How  about  a 'clear' option that clears out previous options passed
>   when  the fs was mounted?

This is counter intuitive, I'd say.

Bye,
    Oleg
