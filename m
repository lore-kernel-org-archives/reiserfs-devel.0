From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Subject: Re: journal-2018 trouble?
Date: Tue, 25 Mar 2003 13:08:27 -0300
Message-ID: <3E807EFB.4080105@zacarias.com.ar>
References: <200303242255.48998.gustavo@zacarias.com.ar> <20030325093230.A32093@namesys.com> <20030325172448.A8645@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13379-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030325172448.A8645@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com, grev@namesys.com

Oleg Drokin wrote:

> Ok, here's supposed fix.
> If you have not did rebuild-sb, you might want to try it.
> 
> (for those using data-logging patches, you do not need this patch as it does correct thing already).

Hi.
Yes, i haven't rebuilt it yet, i was hopeful a patch would arrive soon.
Life is beautiful, no more journal-2018's, it works :-)
I guess i should rebuild the journal anyway right?
BTW, it's reiserfsutils shipped with redhat 7.3 which was used to build 
the filesystem (3.x.0j).
Thanks, bye.


