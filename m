From: Nick Vahalik <nick@nsanity.com>
Subject: Re: Reiserfs Data Recovery
Date: Wed, 10 Mar 2004 09:08:01 -0600
Message-ID: <404F2F51.5000205@nsanity.com>
References: <404E8665.7090305@nsanity.com> <1078918871.9476.116.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17164-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1078918871.9476.116.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Vladimir Saveliev wrote:

>>Are these features tested?  
>>    
>>
>
>Most of these things were added quickly to solve certain user problems.
>To use them one is to understand what they were created for.
>
>  
>
And I guess that isn't documented....

>>Is there any more documentation on them 
>>besides just what's in the comments?
>>    
>>
>
>no.
>  
>

>>  Are there any good sites to read 
>>up some more on reiserfs v3.6 internals? 
>>    
>>
>
>namesys.com had description of reiserfs internals. But now it does not.
>read source code instead
>  
>
Is there a reason?  I grabbed a copy of the whitepaper from archive.org 
and started reading it last night.  Is that information out of date... 
or is it taken down pending the release of Reiserv4?

>> I've become determined to get 
>>this data back.  I've got a couple ideas that I'd like to try but look 
>>at some of these commands I see that some of the things I'd like to 
>>access may already be written.
>>
>>If the problem is that there are sections of my tree missing, why can't 
>>we just chop the bad sections off and salvage the data that is still 
>>there?  Are there any tools that do this?
>>    
>>
>did you try reiserfsck?
>  
>
Yes... with --rebuild-tree, and it aborts after Pass0 every time.  It 
fixes... maybe 10 leaves... and then it finds a bad pointer (or 
something) and dies every time it runs.

Nick Vahalik
