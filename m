From: Hans Reiser <reiser@namesys.com>
Subject: Re: Revised Question About Security ...
Date: Tue, 17 Jun 2003 14:19:46 +0400
Message-ID: <3EEEEB42.3010003@namesys.com>
References: <00d101c33422$92c60810$3b0aa8c0@yourn3ty7athd5>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14574-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <00d101c33422$92c60810$3b0aa8c0@yourn3ty7athd5>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ripin Natani <rnatani@platformlogic.com>
Cc: reiserfs <reiserfs-list@namesys.com>

Ripin Natani wrote:

>Hi, 
>    Regarding the question about security, What I really want is :
>1.  Are there any current security issues in reiserfs ?
>
No.

>2. Is there a listing or history of security issues that I can access and
>review?  Can you point me to them ?
>
We had one bug quite some time ago.  The guy who found it was of the "I 
want to shout my name rather than quietly tell the vendor variety" that 
so afflicts our industry.  It was fixed at the speed we fix all bugs 
(maybe sameday, maybe as much as 3 days, I forget now).  There was some 
discussion about whether it was really a security bug which I no longer 
remember.

Of course you should remember that lots of ordinary bugs can be 
considered security bugs if you look at them carefully.   This was the 
only one that was identified by the reporter as a security bug.

ReiserFS in general is committed to having a zero defect product, and to 
fixing 97%+ of reproducible bugs in 3 days or less.  The <3% usually 
consist of bugs that are hard to reproduce often enough to debug 
effectively.  Deep bugs requiring large amounts of code are fortunately 
very very rare.

>3. In your knowledge, how would reiserfs be less or more secure than say, ext2 ?
>
Ignoring release management issues, it would be the same, at least until 
V4 comes out.  For details on v4, read www.namesys.com/v4/v4.html.  In 
regards to release management, one perhaps significant advantage we 
might have is that ReiserFS V3 is changing less because we are all 
working on V4, and we don't allow people other than Chris (who is 
outside my management sphere) to submit patches that have not been read 
and tested  by two persons.

We are now able to go for months without a valid bug reported.

>
>Thanks,
>-Ripin.
>
>
>  
>


-- 
Hans


