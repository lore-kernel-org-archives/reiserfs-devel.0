From: Hans Reiser <reiser@namesys.com>
Subject: Re: Horrible ftruncate performance
Date: Tue, 22 Jul 2003 20:43:24 +0400
Message-ID: <3F1D69AC.5040302@namesys.com>
References: <Pine.LNX.4.30.0307151407100.6563-100000@divine.city.tvnet.hu> <200307151848.59027.Dieter.Nuetzel@hamburg.de> <20030715170540.GA1213@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14988-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030715170540.GA1213@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>, Chris Mason <mason@suse.com>, Szakacsits Szabolcs <szaka@sienet.hu>, Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, reiserfs-list@namesys.com

The answer to the below is to use reiser4.  It uses extents, and two 64 
bit numbers are all that is needed to store the hole.  V4 will be ready 
for testing in a few days, and will ship for real users at the end of 
summer we hope.

Fixing V3 is  the wrong answer: this is one of its design flaws.

Hans

Oleg Drokin wrote:

>Hello!
>
>On Tue, Jul 15, 2003 at 06:48:58PM +0200, Dieter N?tzel wrote:
>
>  
>
>>!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
>>The 'right' questions are:
>>* Are the 204,804 MB really needed?
>>    
>>
>
>In reiserfs - yes.
>
>  
>
>>* How many space do XFS, JFS and ext3 'use'?
>>    
>>
>
>ext2 uses 16 kb for me (4k blocksize)
>
>  
>
>>* When the above three can do it a 1000 times faster why can't we?
>>    
>>
>
>We can, only in case of reiserfs we have nasty races if we do that.
>Or may be not. I have something to discuss around, I guess ;)
>
>  
>


-- 
Hans


