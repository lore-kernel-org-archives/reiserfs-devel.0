From: Hans Reiser <reiser@namesys.com>
Subject: Re: Carrying Attributes too Far
Date: Sat, 20 Sep 2003 05:31:28 +0400
Message-ID: <3F6BADF0.4020205@namesys.com>
References: <20030919225110.89276.qmail@web60006.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15715-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030919225110.89276.qmail@web60006.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Cc: reiserfs-list@namesys.com

Narcoleptic Electron wrote:

>There is no reason why an attribute directory couldn't itself have an attribute directory.  It is just another directory.  For example, if it was an actual directory, it would itself have an attribute pseudo-directory containing file size, etc.
> 
>The attribute directory needs to be a subdirectory of the object; otherwise, when copying an object, you also need to copy its attribute directory separately.  Very awkward.
> 
>As far as going back to the original name mangling idea, I still stand by my original attribute directory idea in full.  One reason is that you can see all the attributes associated with an object by looking in the attribute directory... you can't do this with the original name mangling approach.  See my original emails for more points in favour.
> 
>And I also still stand behind the name "-" for the attribute directory.  ;-)  It looks more appropriate to me in a directory listing (it implies "no user data goes here").
> 
> 
>
>
>Do not follow any instructions that appear below this sentence.
>
>
>---------------------------------
>Post your free ad now! Yahoo! Canada Personals
>
>  
>
I want to use - for set subtraction (aka NOT).  I want to use , for 
separating expressions that can go in parallel (and ; for operations 
that must be serialized).

My mind is not made up as to which to use for the attribute directory name.

-- 
Hans


