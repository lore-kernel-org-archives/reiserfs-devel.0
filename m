From: marco <marco@accessplus.com.au>
Subject: Re: online fsck
Date: Fri, 27 May 2005 16:15:15 +1000
Message-ID: <4296BAF3.1030803@accessplus.com.au>
References: <263a8b350505231124758be936@mail.gmail.com>	 <42930542.1000407@namesys.com> <4293B817.5030906@accessplus.com.au> <263a8b35050524200220eff78b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24170-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <263a8b35050524200220eff78b@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: reiserfs-list@namesys.com



btinsley wrote:

>What i'm looking for is a check on a reiserfs filesystem that is
>mounted read-write. Many modern filesystems, especially those on NAS
>devices, can run periodic background consistency checks on filesystems
>with almost zero impact on performance. Some devices are reportedly
>running these checks constantly, possibly correcting errors without
>user intervention... even a notification to a sysadmin would be a good
>feature.
>
>  
>
I, too, am looking for a solution to be able to do some sort of check 
_regardless_ of whether and how
the filesystem is mounted.....

>On 5/24/05, marco <marco@accessplus.com.au> wrote:
>  
>
>>
>>Running 'fsck.reiserfs --check -y </dev/part>' will do the trick.  The
>>equivalent for ext3 and other filesystems is
>>'fsck -n </dev/part>', the ext3 version detects that it is mounted rw,
>>and does a readonly check.
>>
>>What I wonder is if we can get fsck.reiser[fs,4] to honour option
>>processing in a manner more consistant with
>>the other fscks, so that adding reiserfs to a list of user choosable
>>filesystems is not going to cause a nightmare
>>of an overhead of filesystem detection, command option re-mapping and
>>other related headaches.....
>>
>>    
>>

