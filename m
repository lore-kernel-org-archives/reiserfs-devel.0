From: George Beshers <gbeshers@comcast.net>
Subject: Re: viewprinting: what format should views be stored in?
Date: Wed, 18 Aug 2004 22:01:40 -0400
Message-ID: <41240A04.7000502@comcast.net>
References: <20040818075216.B920D15DBC@mail03.powweb.com> <4123ABEE.9020001@comcast.net> <4123BA24.2060001@namesys.com> <4123CDB3.2010506@comcast.net> <4123CE91.4090007@namesys.com> <4123E3C9.90006@comcast.net> <4123F77C.6060703@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20394-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4123F77C.6060703@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com



Hans Reiser wrote:

> George Beshers wrote:
>
>>
>>
>>
>>
>> Sure.  I am trying to understand the advantages/disadvantages
>> of fall through points in your thinking.
>>
>>>> Are you thinking about multiple processes, with different views, but
>>>> sharing a few "resources", i.e., files of one form or another as 
>>>> part of
>>>> a long term vision?
>>>
>>>
>>>
>>>
>>> Yes, but chroot can also do that.
>>
>>
>>
>> Achieve it yes, document it in the specification no.
>
>
> I don't understand the difference between us doing ls -R in a view and 
> in a chrooted root, as far as documentation is concerned.
>
> What might be different is that two processes can share a common 
> directory (that they can create files in for the other process to see) 
> using a mask but not using chroot.  Am I right about that?

Unsure.  I will try nested chroot tomorrow.  What I do know is that 
files written by a chroot process
can be seen by a non-chroot process.  What I find attractive in the mask 
specification is that one
could understand that, e.g., lp was putting files in the spooling area 
and lpd or cupsd was actually
reading them and removing them.

Grant you it is beyond the current project, but would be nice to be able 
to isolate all the programs
with rights to manipulate files in /var/whatever or /etc/whatever.

>>>> I don't remember it being more than the boolean complement of
>>>> a (potentially much more complex) include operation.
>>>>
>>>> So good UI point but I don't think extends the semantics?
>>>
>>>
>>>
>>>
>>> exclude is a semantic feature.
>>
>>
>>
>> Can you elaborate please?  That is specifically why it is different
>> from "not included"?
>
>
> Not included is also a semantic feature.  Explicit rather than 
> implicit exclusion is a different semantic.  Lingustic expressions can 
> differ in their semantics while still  resolving to the same value.
>
> If A = 1 and B =1 and C = 2
>
> then A + B + C is semantically different from 2 * C, even if it is 
> numerically equal.
>
Ah... my language design background gets us into communication trouble :-)

Suppose for a moment that exclude actually added functionality (as for 
example
regular expressions over file names will) what terminology would you use?
You see, to me the exclude is, at some level, little more than syntactic 
sugar
for the specification tools because the expressive power is equivalent 
in theory
even if using exclusion is much more convenient in practice.

