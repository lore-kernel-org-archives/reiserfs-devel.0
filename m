From: Christian <evil@g-house.de>
Subject: Re: file corruption, advice needed
Date: Thu, 02 Oct 2003 14:36:17 +0200
Message-ID: <3F7C1BC1.5020009@g-house.de>
References: <3F7BF9EA.3090404@g-house.de> <200310021540.28479.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15769-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200310021540.28479.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Vitaly Fertman wrote:

> if reiserfsck does not find any corruption that means that reiserfs on-disk
> structures are consistent. no rebuild operation is needed.
> 

[....]

>>so, can you give me advice on this? should i still backup this parition?
>>(it's my root ( / ) partition, so it's not that important)
> 
> 
> reiserfsck is considered as stable now, but backups are always useful, 
> thus you would have this dozen of files backuped now.

hm, yes, that makes sense. i am already suspecting some application, but 
i'll watch out for further corruptions.

Thank you for the quick (!!) response,
Christian.

