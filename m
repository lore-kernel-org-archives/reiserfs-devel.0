From: Helge Hielscher <hhielscher@unternehmen.com>
Subject: Re: fsck.reiser4 segfault with one partition
Date: Tue, 01 Jun 2004 21:37:13 +0200
Sender: news <news@sea.gmane.org>
Message-ID: <pan.2004.06.01.19.37.08.75221@unternehmen.com>
References: <pan.2004.06.01.11.57.09.230448@unternehmen.com> <200406012240.33075.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-18950-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tue, 01 Jun 2004 22:40:33 +0400, Vitaly Fertman wrote:
> On Tuesday 01 June 2004 15:57, Helge Hielscher wrote:
> 
>> fsck.reiser4 segfaulted when I tried to check /dev/hda6 (see below).
> 
> which version do you have? the latest was 0.5.4 in
> www.namesys.com/snapshots/2004.04.21-internal.testing.fixed/
> would you try it first?

Tried it and got the same result: fsck.reiser4 segfaults at semantic tree
checking.

Regards,
Helge

