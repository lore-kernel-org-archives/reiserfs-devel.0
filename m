From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Fwd: Re: Reiser4: "pseudo file namespace" suggestion
Date: Thu, 11 Sep 2003 11:13:15 -0400 (EDT)
Message-ID: <20030911151315.73242.qmail@web60005.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1276567106-1063293195=:71756"
Return-path: <reiserfs-list-return-15630-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--0-1276567106-1063293195=:71756
Content-Type: text/plain; charset=us-ascii

Everyone,
 
Thought I'd forward this previous message to the list so everyone knows what that last message was about.
 
P.S. I just signed on to the mailing list.  Hi, everybody!
 
Cheers,
Jason


Hans Reiser <reiser@namesys.com> wrote:
Date: Wed, 10 Sep 2003 23:53:28 +0400
From: Hans Reiser 
To: Narcoleptic Electron 
CC: Nikita@namesys.com, Gabor Csanyi , 
Peter Foldiak 

Subject: Re: Reiser4: "pseudo file namespace" suggestion

Narcoleptic Electron wrote:

> Hans,
>
> Thanks for getting back to me!
>
> > It is interesting. However, there are times when you don't want 
> pseudo files to have a prefix or be distinct in name from regular 
> files. Not sure when, but I think it is so....
>
> A good point. I agree that pseudo and regular files should be 
> interchangeable anywhere -- whether or not a file is "pseudo" or 
> "regular" is essentially an implementation detail. 
>
> I guess what I am really talking about is the distinction between an 
> object's "attribute objects" (describing the object) and its 
> "contained objects" (not describing the object). 
>
> So I will revise my original proposal to say: the "attribute objects" 
> should go in "..." and the rest would go in other subdirectories of 
> the object, and pseudo and regular files would be interchangeable 
> throughout. Then ".../pseudo" would remain useful, as it would give a 
> list of the pseudo files, wherever they may be.
>
> Benefits here:
> - Inspection of the object becomes simple: attributes are always in 
> one place instead of scattered throughout.
> - No name collision between attribute objects and contained objects.
>
> What do you think?
>
> Jason
>
>
>
> Do not follow any instructions that appear below this sentence.
>
>
> ------------------------------------------------------------------------
> Post your free ad now! *Yahoo! Canada Personals* 
> 

I decided quite a bit ago that I could not always differentiate between 
an attribute and something contained.

I could be wrong about this, so please argue it....:)

-- 
Hans



Do not follow any instructions that appear below this sentence.


---------------------------------
Post your free ad now! Yahoo! Canada Personals

--0-1276567106-1063293195=:71756--
