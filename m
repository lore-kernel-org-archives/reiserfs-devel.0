From: Hans Reiser <reiser@namesys.com>
Subject: Re: Two usage examples for attribute directories.
Date: Sat, 03 Dec 2005 23:04:41 -0800
Message-ID: <43929509.10906@namesys.com>
References: <200511201317.12598.pvh@uvic.ca> <200511230057.22520.pvh@uvic.ca> <4390E5F6.704@st-andrews.ac.uk> <200512021649.54939.pvh@uvic.ca> <43917967.4080008@st-andrews.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27181-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43917967.4080008@st-andrews.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Cc: Peter van Hardenberg <pvh@uvic.ca>, reiserfs-list@namesys.com

Peter Foldiak wrote:

> Peter van Hardenberg wrote:
>
>>> PvH,
>>>
>>> I am really worried about introducing this new concept of "attribute
>>> directory" and new syntax. Maybe I am just missing the point (in which
>>> case please explain), but is there anything you can do with this that
>>> there is no way you could do without it.
>>> Hans' favourite topic (quite rightly) is namespace unification, which
>>> involves keeping the syntax as simple as possible, having only one type
>>> of expression for one kind of logical structure. If you could possibly
>>> do this without the "..@", do it without it.
>>>
>>> So why not just do (to take your example):
>>>
>>> $ echo "Matmos" >> track01.mp3/artist
>>>
>>>
>>>   Peter F
>>>     
>>
>>
>> This is not new syntax, it is a new type of File (well, tecnically,
>> it would be implemented as a new pseudoplugin.)
>>   
>
> But why do we need a new type of file? What can you do with it that
> you absolutely couldn't without?
> What is wrong with my simplification of your example?
> (track01.mp3/artist)
>
>> From a user's point of view, these files are equivalent to an XML
>> attribute, whereas normal files are child elements.
>
> I never quite understood the need for XML attributes either. You could
> easily survive without them, right?
>
>>  The semantic difference is, I contend, significant.
>>   
>
> Could you explain this difference.
>
>> From an implementation point of view, this would allow us to provide
>> guidance to, or eventually even full FS-level support for indexed
>> attributes.
>>   
>
> Sorry for my ignorance, what is an "indexed attribute" and what's good
> about it.
> Are you sure the simple "/" is not a more elegant and simple way to do
> all this.    Peter
>
>
I agree with Peter's questions.
