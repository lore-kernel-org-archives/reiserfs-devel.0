From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Thu, 15 Aug 2002 22:27:21 +0400
Message-ID: <200208152227.21766.vitaly@namesys.com>
References: <200208152007.42370.degerrit@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11195-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200208152007.42370.degerrit@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gerrit Hannaert <degerrit@web.de>, reiserfs-list@namesys.com


Hi,

On Thursday 15 August 2002 22:07, Gerrit Hannaert wrote:
> Hello,
>
> I recently noticed some errors in my system log, and had already found a
> directory with a few files in it which could not be deleted. So I
> downloaded the newest reiserfs tools, compiled them and had a shot at
> reiserfsck --fix-fixable. Big mistake. My 60GB filesystem had gone from

why did you decided to run fix-fixable? You run --check just before it
and it said to run --fix-fixable or what?

> slightly corrupt to becoming completely unmountable by doing this.
>
> Some further analysis led me to the conclusion that *all* fields for nlink
> had become '0' (something I suppose shouldn't happen).

Did reiserfsck finish its work or (was)stopped/failed?

> reiserfsprogs 3.6.3
> filesystem version 3.6, created with something from 2.4.16 to .18
> gcc used to compile: version 3.1.1 20020722 (prerelease) (SuSE Linux)
> kernel 2.4.19 (compiled with same gcc)
>
> What went wrong here?
> Will reiserfsck --rebuild-tree fix this? Or is the error some compilation
> thing? What are my chances to recover the filesystem?

Chances are good. No data ware lost and I am checking how reiserfsck handle 
direcory nlinks now. 

-- 

Thanks,
Vitaly Fertman
