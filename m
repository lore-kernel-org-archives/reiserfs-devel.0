From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Reiserfs Data Recovery
Date: Wed, 10 Mar 2004 14:41:11 +0300
Message-ID: <1078918871.9476.116.camel@tribesman.namesys.com>
References: <404E8665.7090305@nsanity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17156-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <404E8665.7090305@nsanity.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Vahalik <nick@nsanity.com>
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2004-03-10 at 06:07, Nick Vahalik wrote:
> 'lo All,
> 
> I've been doing some reading through some of the "hidden features" in 
> the source code...
> 
> Are these features tested?  

Most of these things were added quickly to solve certain user problems.
To use them one is to understand what they were created for.

> Is there any more documentation on them 
> besides just what's in the comments?

no.

>   Are there any good sites to read 
> up some more on reiserfs v3.6 internals? 

namesys.com had description of reiserfs internals. But now it does not.
read source code instead

>  I've become determined to get 
> this data back.  I've got a couple ideas that I'd like to try but look 
> at some of these commands I see that some of the things I'd like to 
> access may already be written.
> 
> If the problem is that there are sections of my tree missing, why can't 
> we just chop the bad sections off and salvage the data that is still 
> there?  Are there any tools that do this?
> 

did you try reiserfsck?

> Nick Vahalik
> 

