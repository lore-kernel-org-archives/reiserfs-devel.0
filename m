From: Hans Reiser <reiser@namesys.com>
Subject: Re: Will Reisefs have "undo"?
Date: Tue, 17 Jun 2003 14:35:12 +0400
Message-ID: <3EEEEEE0.2070408@namesys.com>
References: <1055615895.698.129.camel@localhost> <000d01c332ac$a94e23a0$0200a8c0@xpstation>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14576-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <000d01c332ac$a94e23a0$0200a8c0@xpstation>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fred -- Speed Up -- <speedup@free.fr>
Cc: ReiserFS ML <reiserfs-list@namesys.com>

Fred -- Speed Up -- wrote:

>This is not the filesystem's work, KDE for instance has a trashcan, and you
>can bind the rm command to a special mv one that moves files from the
>initial place to a backup folder, the files of which you can empty regulary
>with a cron script depending on the file's "age". It's simple to implement,
>and really not something Reiser4 should be capable of ... instead
>journalising works very well to protect data from being erased, that's the
>only purpose of a modern filesystem.
>
>Fred
>
>----- Original Message ----- 
>From: "Joachim Zobel" <nc-zobeljo@netcologne.de>
>To: "ReiserFS List" <reiserfs-list@namesys.com>
>Sent: Saturday, June 14, 2003 8:38 PM
>Subject: Will Reisefs have "undo"?
>
>
>  
>
>>Hi.
>>
>>Are there any plans to add undo capabilities to reiserfs? Most modern
>>desktops have a trash can. Am I the only one who has idea that this is a
>>crappy workaround for something that should be in the filesystem.
>>
>>I am aware that this is not easy, but nearly everybody has had moments
>>where he would have loved it. And disk space is cheap, there is rarely
>>the need to overwrite anything.
>>
>>Sincerely,
>>Joachim
>>
>>-- 
>>"... ein Geschlecht erfinderischer Zwerge, die fuer alles gemietet werden
>>koennen."                            - Bertolt Brecht - Leben des Galilei
>>
>>
>>    
>>
>
>
>
>  
>
I have never used the trashcan on Linux, and probably will always remove 
most objects using rm not click and drag.  Only the FS can monitor disk 
space usage and empty the trash in response to running low on space.

-- 
Hans


