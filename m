From: Maarten Deprez <maartendeprez@scarlet.be>, maartendeprez@scarlet.be,
   maartendeprez@scarlet.be, maartendeprez@scarlet.be,
   maartendeprez@scarlet.be, maartendeprez@scarlet.be,
   maartendeprez@scarlet.be, maartendeprez@scarlet.be
Subject: Re: possible reiser4 bug
Date: Fri, 10 Mar 2006 20:51:19 +0100
Message-ID: <20060310195119.GA14829@deprez-aerts.dyndns.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28240-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
Sender: Maarten Deprez <maartendeprez@scarlet.be>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Alexander Zarochentsev wrote:
> please use better version of the patch (attached).

Also tried the patch and it seems problem with linux 2.6.16-rc2-mm1 is
gone. Not much tested, but it always crashed when accessing a
particular file, and that's fixed now. For me, this can be included in
official sources.

Thanks,
Maarten Deprez
