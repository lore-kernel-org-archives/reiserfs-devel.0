From: Oleg Drokin <green@namesys.com>
Subject: Re: Reiserfs oops
Date: Thu, 10 Apr 2003 22:09:29 +0400
Message-ID: <20030410220929.A11132@namesys.com>
References: <93F527C91A6ED411AFE10050040665D007AA83FC@CORPUSMX1>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13634-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <93F527C91A6ED411AFE10050040665D007AA83FC@CORPUSMX1>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: berthiaume_wayne@emc.com
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Apr 10, 2003 at 01:56:05PM -0400, berthiaume_wayne@emc.com wrote:

>         Oleg, I'm seeing the attached oops's when a hard drive failure is
> encountered. There are four drives in RAID 1. Is it normal for reiserfs to
> oops when a drive fails?

Hm, You mean that all four drives have a bad block in the same place?
I thought that the whole idea of RAID1 is that when
one hard drive fails, other will deliver necessary data.

reiserfs does not handle io errors (especially in journal area) very gracefully
and should just panic (not dereference something bad like in your case which
is something very suspicious). Jeff Mahoney of SuSE is working on having more
redundancy in such cases.

> Attached oops file...

Hm, this one is certainly looking very strange.
I will comment more on it tomorrow. Do you have any extra reiserfs patches
on top of your 2.4.19 kernel?

Bye,
    Oleg
