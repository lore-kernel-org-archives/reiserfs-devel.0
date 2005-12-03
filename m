From: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Subject: Re: Two usage examples for attribute directories.
Date: Sat, 03 Dec 2005 00:25:26 +0000
Message-ID: <4390E5F6.704@st-andrews.ac.uk>
References: <200511201317.12598.pvh@uvic.ca> <43817B79.6010707@namesys.com> <200511230057.22520.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27174-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511230057.22520.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter van Hardenberg <pvh@uvic.ca>, Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Peter van Hardenberg wrote:
> On November 20, 2005 11:47 pm, Hans Reiser wrote:
>   
>> Peter van Hardenberg wrote:
>>     
>>> We have an implementation plan for the attribute plugin. We plan to base
>>> it around the plugin.c so that it can be available for all files,
>>> directory or otherwise.
>>>
>>> Every file which has a pseudo will gain a new user-attributes pseudofile.
>>> This pseudofile will essentially wrap a standard directory.
>>>       
>> Usage examples please.
>>
>>     
> ---------------------------------
> Simple moves first:
>
> $ echo "Matmos" >> track01.mp3/..@/artist
> $ echo "A Chance to Cut is a Chance to Cure" >> track01.mp3/..@/album
> $ grep Matmos track01.mp3/..@/*
> artist: Matmos
>
> ---------------------------------
> Some hypothetical pseudocode from a music player:
>
> playcount = open('track01.mp3/..@/amarok/playcount').read;
> playcount = playcount + 1;
> open('track01.mp3/..@/amarok/playcount', 'w').write(playcount);
>
> ---------------------------------
>   

PvH,

I am really worried about introducing this new concept of "attribute 
directory" and new syntax. Maybe I am just missing the point (in which 
case please explain), but is there anything you can do with this that 
there is no way you could do without it.
Hans' favourite topic (quite rightly) is namespace unification, which 
involves keeping the syntax as simple as possible, having only one type 
of expression for one kind of logical structure. If you could possibly 
do this without the "..@", do it without it.

So why not just do (to take your example):

$ echo "Matmos" >> track01.mp3/artist


  Peter F

