From: Hans Reiser <reiser@namesys.com>
Subject: Re: viewprinting: what format should views be stored in?
Date: Wed, 18 Aug 2004 13:20:52 -0700
Message-ID: <4123BA24.2060001@namesys.com>
References: <20040818075216.B920D15DBC@mail03.powweb.com> <4123ABEE.9020001@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20386-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4123ABEE.9020001@comcast.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: George Beshers <gbeshers@comcast.net>
Cc: David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

George Beshers wrote:

>
> Thanks for joining the discussion.  I have answered your questions
> as best I can for the moment---which in fact has been to make some
> further points and encourage you and others to ask more questions
> and make more suggestions :-)
>
>
> David Dabbs wrote:
>
>>
>> Questions
>> ----------------------------------------------------------------------
>> Handwaving for a moment over view creation and storage particulars, it
>> is pretty clear that this new security feature will rely upon reiser4 
>> for masking. Does this mean that one will only be able to mask a 
>> reiser4 filesystem, or will any VFS fs be "maskable?"
>>  
>>
> As a proof of concept reiser4---although I think that the ability to 
> work with
> multiple reiser4 mounted filesystems is relevant and important.
>
>> All file types and access methods will be supported, yes? (mmap, AIO, 
>> DIRECT, pipes, hard/sym links, etc.)
>>  
>>
> That is the plot.  Again, we are taking the point of view that the 
> proof of concept
> does not need to be complete; links however are included.
>
>> In the original proposal posted to the list Hans (I think) referred 
>> to viewprinting as "chroot on steroids." Let's assume that the mask 
>> creation tools deliver on making viewprint creation and maintainance 
>> very easy/painless for admins. In what way will viewprinting be more 
>> secure than chroot?
>>  
>>
> Basically, chroot as I at least normally use it, has a lot of baggage 
> in terms of
> disk consumption that we are planning to avoid by creating a view 
> rather than
> a copy.

Chroot lacks fall through points.

> Second, users always interact with a system via executables so
> normally the executables have taken on the security attributes of the 
> user
> (set-UID being the major exception on Unix) but, to some extent, we are
> developing a new semantic.
>
> While views for DBMS, ClearCase, etc. have been around for a long time
> attaching access lists to process seems to be semi-virgin territory, at
> least for Unix systems.
>
> Any and all pointers to references to prove me wrong appreciated :-)
>
>> If I understand the ways admins use chroot, or would like to use it, 
>> then should the design include "stackable" or "inheritable" masks? 
>> This is not unlike stackable filesystems or filter pipelines. If, for 
>> instance, most processes need to see /usr/local/lib/* and 
>> /usr/local/bin/*, then this spec is in a 'base' mask and the mask for 
>> /usr/local/bin/fooprocess would inhert from and add to this base 
>> specification.
>>  
>>
> Something like this had occurred to me, but I think that for a proof 
> of concept
> having the tools that assist the user in creating the mask make it 
> easy to
> include these but have each actual mask on disk be a standalone entity is
> the way to go.
>
> I think that inherited masks from a parent process are a much stronger
> requirement---think about restricted shell.
>
> All questions which keep me from wasting time on an overly simplistic
> approach welcome :-)
>
>> Early on in the conversation, there was discussion about "permissible 
>> functionality." At a minimum, a mask, true to its name, will effect 
>> filesystem object _visibility_. It was not completely clear whether 
>> the mask will be proscriptive viz operations. IOW, will the mask say 
>> that fooprocess "is not permitted to [attempt to] RWX object bar?" I 
>> believe this is not something masks will do, but I wanted clarification.
>>  
>>
> The attempt will be blocked with a suitable error return from the 
> system call,
> it is the responsibility of the mask administrator to get this right.
>
> There are many interesting application correctness and/or mask 
> correctness
> questions which will need a lot more thought to bring to fruition.
>
>> Hans, in your preferred approach you referred to "a format that is as 
>> if it is a subdirectory of the masked executable." Did you have
>> in mind checking for something like /usr/bin/fooprocess/metas/mask 
>> when exec() loads the exe, and if this exists then the files rooted 
>> in this directory would be set as the process's root filesystem?
>>
>> Are masks capable of explicit exclusion as well as inclusion?
>> If the answer is 'Yes,' then what are your thoughts as to how this 
>> might be accommodated when your main tool is reiser4's semantic tree 
>> layer? Inclusion would be straightforward -- if the directory exists 
>> or the name exists within the directory then fall through. But 
>> exclusion? If you are limited to the semantic layer, then there's no 
>> stat node with which to play tricks.  
>>
> I think the correct answer is "anything not explicitly included is 
> excluded"
> or on the other side of the looking glass "anything not explicitly 
> excluded
> is included".
>
> As a user friendly interface both should be supported and the 
> "compilation"
> layer handle the conversion.
>
> Maybe I am not understanding the question.

clearcase has an exclude operation for its view specifications.

>
>> I wonder if it would be feasible if masks only specified exclusions? 
>> If, for instance, the mask wanted to exclude /foo/*, then the 
>> directory foo would exist (in the mask semantic tree). To exclude 
>> /etc/passwd, passwd would exist in the directory /etc. Since you're 
>> already going to need to preempt dcache searches (aren't you?) you 
>> can insert a search of the mask tree. If the search fails, then it is 
>> not excluded and the request falls through to normal VFS handling. In 
>> the /etc/passwd case above, it would find /etc/passwd and so the file 
>> is excluded. Processing would stop there, returning some error. How 
>> does this sound? I need to sleep on this, because it is very late here.
>>  
>>
> At this time I think feasible is true and useful is an open question.
>
> To address the useful I find that known/desirable use-case scenarios
> get the most discussion.
>
> To give a couple of examples:
>     1) A given process (say a restricted shell) can not exec() an
>         executable with the set-uid bit on.
>          - directly
>          - indirectly (e.g., via bash)
>     2) Apache can only create/write files in /var/web/incoming.
>          - files created or modified can not have any execute bit set 
> and executing chmod is excluded.

this protection happens while traversing the mask or at the fall through 
point.  Hmmm, we need to accumulate a set of permissions that apply to 
something that are specific to how we got there.  That could be complex 
in the VFS details.  We can defer it to Phase II if necessary.  George, 
you should spend a day (not this week) figuring out how much work it 
would be to make that work.  It will be the details of it that will be 
dangerous....

>
> This will be the topic of many future e-mails I am sure. ;-)
>
>>
>> David
>>
>>  
>>
>
>
>

