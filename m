From: Yury Umanets <umka@namesys.com>
Subject: Re: Security issues in reiserfs ...
Date: Sat, 14 Jun 2003 01:12:00 +0400
Message-ID: <3EEA3E20.2040505@namesys.com>
References: <APEDJCPCMKKELJEIBBBEOEABCAAA.rnatani@platformlogic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14536-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <APEDJCPCMKKELJEIBBBEOEABCAAA.rnatani@platformlogic.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ripin Natani <rnatani@platformlogic.com>
Cc: reiserfs-list@namesys.com

Ripin Natani wrote:

>Hi,
>I am trying to choose between ext3 and reiserfs and my particular criteria
>is security. Can someone tell me the pros and cons ? Also is there any
>possible potential security threats in reiserfs ? Also, like in ext3 can the
>journal file be made visible and manipulated in any lethal way ?
>Thanks,
>-Ripin.
>
>
>
>
>  
>
Reiserfs has not a journal file. Journal lies on the same partition 
where filesystem data lies or on a stand alone device.

-- 
Yury Umanets
"We're flying high, we're watching the world passes by..."



