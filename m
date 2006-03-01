From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 default in Underground Dekstop distribution
Date: Wed, 01 Mar 2006 14:51:51 -0800
Message-ID: <44062587.9020005@namesys.com>
References: <200602251203.09958.Peter.Foldiak@st-andrews.ac.uk> <4401E68E.8060205@namesys.com> <200602261834.14571.Peter.Foldiak@st-andrews.ac.uk> <200603012325.54461.marcel@hilzinger.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28180-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200603012325.54461.marcel@hilzinger.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marcel Hilzinger <marcel@hilzinger.hu>
Cc: reiserfs-list@namesys.com, Vitaly Fertman <vetalf@inbox.ru>

Marcel Hilzinger wrote:

>Am Sonntag, 26. Februar 2006 19:34 schrieb Peter Foldiak:
>  
>
>>Marcel (Hilzinger),
>>
>>Did you write this Linux Magazine article? Could you give some details on
>>what the problem was?
>>    
>>
>Yes, I wrote the article. The version I tested suffered much from the fsync 
>problem. There were timeouts approx every 10 seconds, where the system didn't 
>respond for a very short time (_very_ disturbing when watching videos). I 
>then asked the creator of Underground Linux if he also had this problems and 
>I pointet him to this list. He denied then, but it seems that other users did 
>report problems with underground 022 as well. I didn't even know, that 
>Underground went back to ReiserFS.
>
>
>  
>
Interesting.  The reason it is interesting is because I can only
understand if it happened every 600 seconds due to an atom being
expired.  If it happens every 10 seconds, then my next guess as to the
culprit would be balance_dirty_pages, and perhaps entd doing too much
work at a time.  I need more data, and the exact kernel version.  Hmm. 
Maybe Vitaly can try installing it and trying to reproduce.

I assume a single cpu machine?  It would be interesting as a datapoint
to know if the problem goes away with a 2 cpu machine.
