From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 plugins
Date: Tue, 05 Jul 2005 18:00:56 -0500
Message-ID: <42CB1128.6000000@slaphack.com>
References: <hubert@uhoreg.ca>	<200506290509.j5T595I6010576@laptop11.inf.utfsm.cl>	<87hdfgvqvl.fsf@evinrude.uhoreg.ca>	<8783be6605062914341bcff7cb@mail.gmail.com>	<878y0svj1h.fsf@evinrude.uhoreg.ca> <42C4F97B.1080803@slaphack.com> <87ll4lynky.fsf@evinrude.uhoreg.ca> <42CB0328.3070706@namesys.com> <42CB07EB.4000605@slaphack.com> <42CB0ED7.8070501@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24972-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42CB0ED7.8070501@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Hubert Chan <hubert@uhoreg.ca>, Ross Biro <ross.biro@gmail.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Kyle Moffett <mrmacman_g4@mac.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Hans Reiser wrote:
> David Masover wrote:
> 
> 
>>Hans Reiser wrote:
>> 
>>
>>
>>>Hubert Chan wrote:
>>>
>>>
>>>   
>>>
>>>
>>>>On Fri, 01 Jul 2005 03:06:19 -0500, David Masover <ninja@slaphack.com> said:
>>>>
>>>>
>>>>
>>>>
>>>>     
>>>>
>>>>
>>>>>Hubert Chan wrote:
>>>>> 
>>>>>
>>>>>       
>>>>>
>>>>
>>>>
>>>>     
>>>>
>>>>
>>>>>>The main thing blocking file-as-dir is that there are some
>>>>>>locking(IIRC?) issues.  And, of course, some people wouldn't want it
>>>>>>to be merged into the mainline kernel.  (Of course, the latter
>>>>>>doesn't prevent Namesys from maintaining their own patches for people
>>>>>>to play around with.)
>>>>>>   
>>>>>>
>>>>>>         
>>>>>>
>>>>
>>>>
>>>>     
>>>>
>>>>
>>>>>What's the locking issue?  I think that was more about transactions...
>>>>> 
>>>>>
>>>>>       
>>>>>
>>>>
>>>>It was whatever was Al Viro's (technical) complaint about file-as-dir.
>>>>I don't remember exactly what it was.  The technical people know what it
>>>>is (and the Namesys guys are probably working on it), and the exact
>>>>issue doesn't concern us non-technical people that much, so I don't feel
>>>>like looking it up.  But if you want to, just look for Al Viro's message
>>>>in this thread.
>>>>
>>>>
>>>>
>>>>     
>>>>
>>>
>>>Cycle detection when hard links to directories are allowed.  There is a
>>>debate over whether cycle detection is feasible that can only be
>>>resolved by working code or a formal proof that it is not
>>>computationally feasible.
>>>   
>>>
>>
>>Ah.  But then, one solution was to avoid the issue at all, and have the
>>directory inside a file act as a mountpoint.  After all, mount --bind
>>doesn't cause problems...
>> 
>>
> 
> Can you explain this idea at greater length?

Just don't allow user-created hardlinks inside either metafs (/meta) or
the magical meta directory inside files.

In order to do that, one way would be to have "file/..." appear as a
mountpoint.  I don't know if this is feasable, performance-wise, but I
think it would work.

>>Hey!  This sounds like metafs (/meta) already!  I wonder if we can do
>>file-as-dir in /meta, and just not support user-created hardlinks there?
>>(other than creating brand-new files, of course...)

This is still my preferred solution, because it's not any harder or less
efficient to develop new apps based on metafs than on file-as-dir, but
it means that old apps will see something *entirely* POSIX-compliant,
and the strangeness will be confined to /meta.

Basically, you have to allow hardlinks in /meta, in case some plugin
wants to do that, but if you have files that are also directories, you
also have to make sure that users can't create hardlinks.  I don't think
this would be particularly hard, though.  Pretend it's a read-only
filesystem unless the user is doing something safe, like creating a
brand-new file, deleting an old one, or modifying the contents of an
existing one, all assuming that the plugin responsible for the
file/directory you're doing this in allows it.

But then, if we're doing metafs, I don't think you need
file-as-directory, and certain existing tools that we'd like to be able
to point at metafs might not like file-as-directory anyway.

Now, can anyone think of a situation where we want user-created
hardlinks inside metadata?  More importantly, what do we do about it?
