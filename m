From: Hans Reiser <reiser@namesys.com>
Subject: Re: http://www.namesys.com/snapshots/2004.08.03-internal.testing/
Date: Wed, 04 Aug 2004 01:44:42 -0700
Message-ID: <4110A1FA.2030803@namesys.com>
References: <200406150022.34578.vitaly@namesys.com>    <200407131427.58912.vitaly@namesys.com>    <200408031750.00291.vitaly@namesys.com> <55083.202.71.232.79.1091590413.squirrel@sml.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19962-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <55083.202.71.232.79.1091590413.squirrel@sml.dyndns.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Graham <lkthomas@sml.dyndns.org>
Cc: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

Thomas Graham wrote:

>how long does it take to build-fs for 200GB data HD ? and how many data am
>I going to lost ?
>
>I am just freak out, you guys are promised that disk format wouldn't be
>change anymore, but it still changing actually, pretty upset for that
>statement.
>
>  
>
>>Hello All,
>>
>>This snapshot contains updated reiser4progs-0.5.7 and the grub patch.
>>
>>It includes several bug fixes against the previous snapshot, and has a
>>disk
>>format change -- the layout of blocks that contain backuped fs metadata
>>are changed.
>>
>>No kernel patch is needed for the disk format change, however fsck may
>>report about some corruptions on an existent fs if a block was allocated
>>for some data and has become a backup one. Fsck.reiser4 --build-fs is
>>able to fix it of course, although the data in these blocks are lost then.
>>
>>--
>>Thanks,
>>Vitaly Fertman
>>
>>
>>    
>>
>
>
>  
>
Vitaly, your email is a marvel of unclarity that vaguely threatens of 
losing data in ways that cannot be understood by the reader.  Please 
revise and resend, and don't make disk format changes in the future 
without discussing them with the rest of the team first.  Perhaps you 
should start that discussion of this disk format change now....

Hans
