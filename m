From: Oleg Drokin <green@namesys.com>
Subject: Re: [PATCH] new data logging and quota patches available
Date: Wed, 12 Mar 2003 10:38:00 +0300
Message-ID: <20030312103800.A9291@namesys.com>
References: <1046439149.2163.21.camel@tiny.suse.com> <3E66B73D.6030008@mb.tu-ilmenau.de> <1046922372.2161.275.camel@tiny.suse.com> <3E66C88E.40207@mb.tu-ilmenau.de> <3E69FA70.5030601@mb.tu-ilmenau.de> <1047227975.8215.150.camel@tiny.suse.com> <3E6B74C0.5050702@mb.tu-ilmenau.de> <1047230647.8219.161.camel@tiny.suse.com> <3E6B7C61.9050405@mb.tu-ilmenau.de> <1047415578.8215.383.camel@tiny.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13210-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1047415578.8215.383.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Tue, Mar 11, 2003 at 03:46:18PM -0500, Chris Mason wrote:
> [ slow down between 2.419 data logging and 2.4.21-pre data logging ]
> Ok, could you please apply the search_reada-4 patch I sent and do your

> It's about 10% faster here, but my dataset is slightly different.

Hm. Last time we had conversation with you on this patch (a year ago?
may be even more), you said this patch makes no difference to you at all.
And we thought this is because your system is all-scsi, and scsi appears
to be more intelligent about caching/readahead.
Have you switched to IDE already? ;)

Bye,
    Oleg
