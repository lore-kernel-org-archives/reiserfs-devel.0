From: Yury Umanets <umka@namesys.com>
Subject: Re: labels and uuids setting/showing
Date: Wed, 15 Oct 2003 13:03:00 +0400
Message-ID: <3F8D0D44.305@namesys.com>
References: <20031014200618.GA10022@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15839-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031014200618.GA10022@physik.fu-berlin.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tobias Burnus <tobias.burnus@physik.fu-berlin.de>
Cc: reiserfs-list@namesys.com

Tobias Burnus wrote:

>Hi,
>
Hello,

>
>I know that reiserfstune can set UUIDs and labels on a not-mounted
>reiser file system.
>
>But how can I (a) show the current UUID and label of a
>(mounted/not-mounted) reiser3? 
>
You can use debugreiserfs to show all the information you are interesed 
if a partition is not mounted.

>And how can I set the label and/or the
>UUID without u(n)mounting? reiserfstune currently complains that it
>cannot rebuild the tree on a mounted system.
>
And if it is mounted, probably mount will show something usefull.

>
>Tobias
>
>
>  
>


-- 
umka


