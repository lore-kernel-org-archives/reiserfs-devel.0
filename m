From: Hans Reiser <reiser@namesys.com>
Subject: Re: trouble with reiserfs on ppc vs-3050: wait_buffer_until_released
 ...
Date: Tue, 29 Apr 2003 00:14:28 +0400
Message-ID: <3EAD8BA4.2020000@namesys.com>
References: <1051258287.5564.1.camel@fortknox>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13882-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1051258287.5564.1.camel@fortknox>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Soeren Sonnenburg <kernel@nn7.de>
Cc: reiserfs-list@namesys.com, vs@namesys.com, Alexander Lyamin <flx@namesys.com>

Soeren Sonnenburg wrote:

>Hi...
>
>I suddenly have a file which when I access it using gvim gives
>
>vs-3050: wait_buffer_until_released: nobody releases buffer (dev 03:07,
>size 4096, blocknr 2031616, count 3, list 0, state 0x10019, page
>c0add66540, (UPTODATE, CLEAN, UNLOCKED)). Still waiting (570000000)
>JDIRTY !WAIT
>
>and makes the whole machine hang...
>
>
>Ideas what I could do about it ?
>
>Soeren.
>
>
>
>  
>
Let's ask Vladimir about this, I don't find it acceptable to leave a bug 
in ReiserFS.  Probably Soeren can let us login remotely, and probably 
flx can go ask IBM for some hardware for debugging this.

-- 
Hans


