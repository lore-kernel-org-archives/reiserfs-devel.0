From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: 2.6.18-rc1-mm1: reiser4 panicked cowardly nikita-1936
Date: Thu, 13 Jul 2006 18:16:15 +0400
Message-ID: <1152800175.6353.141.camel@tribesman.namesys.com>
References: <44B5529A.7050601@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28987-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44B5529A.7050601@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Laurent Riffard <laurent.riffard@free.fr>
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2006-07-12 at 21:50 +0200, Laurent Riffard wrote:
> Hello reiser4 maintainers,
> 
> I've been hit a few times by a reiser4 panic, namely nikita-1936. 
> 
> The box was running 2.6.18-rc1-mm1 + hot-fixes + 
> reiser4-generic_file_read-fix.patch (from Edward Shishkin). 
> .config is attached.
> 
> What should I do ?
> - fsck ?

You should fsck from time to time. I do not think that this panic
indicates any corruptions in a filesystem, though.

> - send a debugfs.reiser4 -P output before fsck ?

no

> - comment out this assertion ?

no

> - wait for a fix ?
> 

can you reproduce the problem? How to do that, if yes?
can you please try to find whether previous kernel you used can also be
crashed that way? What is that kernel?

