From: David Greaves <david@dgreaves.com>
Subject: Re: viewprinting: what format should views be stored in?
Date: Thu, 19 Aug 2004 12:21:39 +0100
Message-ID: <41248D43.3040905@dgreaves.com>
References: <20040819074027.8429715D94@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20398-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040819074027.8429715D94@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: Hans Reiser <reiser@namesys.com>, George Beshers <gbeshers@comcast.net>, reiserfs-list@namesys.com

Hi

I've been following and have an interest - I hope my comments and 
observations are valuable.

First, allow me to suggest some more terminology - like George, I always 
like to see this done early :)
Masklet : set of modifications to a filename's access authorisations
Mask: collection of Masklets (possibly only 1)

Most of the time one will use 'mask'; eg one can now traverse a mask (cf 
an image overlay) however one can use masklet to refer to a specific 
instance (a complex mask pixel)
I've used this terminology below and I think it's OK.

David Dabbs wrote:

>Fall-Through Point
>The point during some file operation at which it is determined that the 
>file is not filtered by the mask. The request [for operation X on the file]
>is passed on to the VFS/underlying filesystem. 
>  
>
This doesn't sound right.
(Basically I suspect there has been confusion over 'visibilty' and file 
attribute masking)

When did masks specify visibility of files? According to Hans :

> Hmm.  Yes, views should allow masking permissions.

mind you, he then said:

> We need to be able to support specifying a mask that allows any file 
> within a given directory to be visible.  That is, we need to support 
> dirname/* but we don't yet need to support dirname/foo.* 

I think (see last paragraphs of this email) that we have a collection of 
masklet types.

>
>
>Features & Constraints
>----------------------------------------------------------------------
>Masks 
>- must support dirname/* 
>- do not [yet] need to support dirname/foo.*
>- should not allow symbolic link traversal unless the file pointed to 
>  is within the mask.
>  
>
simple question here:
does dirname/* go deep into the directory tree??

It doesn't in shell syntax

Maybe dirname/**
(which means the complete tree below dirname)

Important I think.
Also introduces the question of 'rule' interaction

dirname/bar/foo : maska
dirname/bar/*     : maskb
dirname**           : mask c

which mask?
options:
 AND?
 most specific? (definition)
 first to match?


>Masked Processes
>- May not create hard links.
>- Child processes [of a masked process] must inherit the parent's 
>  "mask bit" and mask definition.
>  
>
remind me - what is the mask tied to? UID/GID, EUID, PID, PGID? filesystem?
Hans actually says it's derived from the executable.
What if it changes between two processes starting?
Does the running processes mask change? (cf chmod a file - seems 
reasonable but...)
I'd think it needs to be pretty atomic...
In fact, maybe changing masks on a running (mounted?) system is a 
potential security hole and forbidden?
I think I could think of race examples.

aside: talking about reuse, maybe the recent lkml JOB patch is useful:
http://marc.theaimsgroup.com/?l=linux-kernel&m=109278360210574&w=2

+       A job is a group of related processes all descended from a
+       point of entry process and  identified  by  a  unique  job
+       identifier  (jid).   A  job  can	 contain multiple process
+       groups or sessions, and all processes in one of these sub-
+       groups can only be contained within a single job.
+
+       The  primary  purpose  for  having  jobs is to provide job
+       based resource limits.

Maybe exe's can have something _like_ setuid? setmid()?
mid being based on jid?

>Questions
>----------------------------------------------------------------------
>  
>
>>All file types and access methods will be supported, yes? 
>>(mmap, AIO, DIRECT, pipes, hard/sym links, etc.)
>>
>>Hans: Yes.
>>...except that they cannot create hard links (above)
>>    
>>
>
>Is this restriction unequivocal (yes)? 
>Any other forbidden Unix fs objects or fs operations?
>  
>
Obviously creating a hardlink _can_ circumvent semantically specified 
security.
But shouldn't that just be a masklet attribute? see below (end)

>>Early on in the conversation, there was discussion about 
>>"permissible functionality." At a minimum, a mask, true to its name, 
>>will effect filesystem object _visibility_. It was not completely 
>>clear whether the mask will be proscriptive viz operations. IOW, will 
>>the mask say that fooprocess "is not permitted to [attempt to] RWX 
>>object bar?" I believe this is not something masks will do, but I 
>>wanted clarification.
>>
>>
>>I don't know why I don't understand your question, but I don't.....;-)
>>    
>>
>
>
>Let me try again. At a mininmum, a mask specifies what objects are
>visible to a process, correct? If objext X is included in or not 
>explicitly excluded from the mask, then fooprocess is allowed to 
>_attempt_to_ operate on object X. I say "attempt to" because, at 
>that point (fall-through), the mask is finished wrt the operation, 
>yes? Permission to actually carry out an operation on object X is 
>determined by the user/object/permission mapping in the underlying
>filesystem.
>
>What was not clear to me was whether masks specified, proscribed, or
>in any way controlled filesystem operations (permissions) for objects
>that are visible when running under the mask. If so, what can be 
>specified and is it an "allow" a "deny" or either?
>  
>
So, you're saying that a mask can deny authorisation but not grant it.
(In which case 'mask' is a good word and the concept of AND goes into 
the foundations)

A process can read/write/execute according to FS permissions.
If the files 'acl/attr' doesn't allow writing then the mask _cannot_ 
override this and allow a masked process to write to the file.

This sounds sensible.

>>Hans, in your preferred approach you referred to "a format that 
>>is as if it is a subdirectory of the masked executable." Did you have
>>in mind checking for something like /usr/bin/fooprocess/metas/mask 
>>when exec() loads the exe,
>>
>>yes
>>
>>and if this exists then the files rooted in this directory 
>>would be set as the process's root filesystem?
>>
>>Your statement is imprecise. The mask will be checked first, and 
>>then iff it falls through we do a normal filesystem traversal.
>>    
>>
>
>It was imprecise because perhaps I had a different vprint concept 
>and implementation in mind. Using the creation tool, JAdmin creates 
>a mask for fooprocess. The mask would be a directory structure 
>rooted at /bin/fooprocess/metas/mask. All files (not dirs) in 
>this tree would be hard links to the "real" files specified in the mask. 
>Only dirs & files included in the spec are visible. When an instance of 
>fooprocess is started, /bin/fooprocess/metas/mask is automagically mounted 
>as the process's root filesystem. The mask would be the filesystem. 
>Other than the use of the metas reiserism (and mask maintenance wizardry)
>this is not any different than chroot. Since the end result here is
>to be no more secure than chroot, but very much easier to deploy and 
>maintain, is there a reason why this cannot be the case?
>  
>
I think the 'thing' at /usr/bin/fooprocess/metas/mask
is a semantic expansion of the mask (ie it's like a directory tree but 
it doesn't point to files, it just contains lots of masklets).
It can be traversed in parallel to the real tree traversal and the 
masklets it returns will modify the real results. It is purely semantic. 
I've expanded this later.

Call it a maskfs?
The email subject becomes:
Re: viewprinting: what format should maskfs use?
The answer of course is something very similar to reiserfs.

(BTW perhaps, eventually, /proc/<pid>/maskfs is a better place - and the 
mask checking moves to vfs - all of a sudden it's not reiser specific - 
although maskfs is reiserfs code)

>>If you are limited to the semantic layer, then there's 
>>no stat node with which to play tricks. 
>>
>>I wonder if it would be feasible if masks only specified 
>>exclusions? If, for instance, the mask wanted to exclude /foo/*, 
>>then the directory foo would exist (in the mask semantic tree). 
>>To exclude /etc/passwd, passwd would exist in the directory /etc. 
>>Since you're already going to need to preempt dcache searches 
>>(aren't you?)
>>
>>Sigh, yes, or we need to use dcache for the mask.
>>    
>>
>>you can insert a search of the mask tree. If the 
>>search fails, then it is not excluded and the request falls through 
>>to normal VFS handling. In the /etc/passwd case above, it would find 
>>/etc/passwd and so the file is excluded. Processing would stop there, 
>>returning some error. How does this sound? 
>>
>>I don't quite understand this paragraph above.
>>    
>>
>Probably because I'm not on the same page as you and George.
>Imagine a filesystem with two trees: one, the real
>root filesystem and two, the anti-root tree (exclusions). This
>fs would be the root fs for the process. Let's say fooprocess has 
>the following exclusions:
>
>	/etc/passwd
>	/etc/shadow
>	/var
>
>Above, when I said "insert a search of the mask tree" what I meant was
>"first search the exception [semantic] tree (anti-tree) associated with 
>this process. If you find the object there, then report it as NOT FOUND.
>Otherwise, proceed with a normal fs tree search (fall-through).
>

Here's how I see parallel traversal and using masklets could work 
(purely semantic)
I don't know if this is feasible as I don't know if you could intertwine 
the fs/maskfs traversals.

The mask just contains: /etc/config.file

1. open (/etc/passwd)
search the maskfs for the first traversal point / : default - fall 
through to fs
search the fs for / - normal behaviour
search the maskfs for the traversal point etc/ : default - fall through 
to fs
search the fs for etc/ - normal behaviour
search the maskfs for the object passwd : not there -> file not found

2. open(/etc/config.file)
search the maskfs for the first traversal point / : default - fall 
through to fs
search the fs for / - normal behaviour
search the maskfs for the traversal point etc/ : default - fall through 
to fs
search the fs for etc/ - normal behaviour
search the maskfs for the object config.file : read only - fall through 
to fs _with masklet_
search the fs for object - apply masklet and return.

Note that in specifying /etc/config.file you infer a mask on / & /etc/
so maybe directorys mentioned in passing such as /etc/config.file imply
/ : x only
/etc : x only
/etc/config.file : masklet

of course this needs to be aligned with the comment at the start

This mask is interesting:
/etc : doesn't exist
/etc/config.file : r only

>>George:
>>To give a couple of examples:
>>    1) A given process (say a restricted shell) can not exec() an
>>        executable with the set-uid bit on.
>>         - directly
>>         - indirectly (e.g., via bash)
>>    2) Apache can only create/write files in /var/web/incoming.
>>         - files created or modified can not have any execute bit set 
>>and executing chmod is excluded.
>>
>>Hans:
>>this protection happens while traversing the mask or at the fall through 
>>point.
>>
Don't you always fall through - but sometimes you 'hit' a masklet and 
sometimes you 'miss'

>>  Hmmm, we need to accumulate a set of permissions that apply to 
>>something that are specific to how we got there.
>>
In fs traversal the permision at a point in traversal (ie a directory on 
the way) doesn't affect the permission of the object when the fs has 
been traversed except insofar as it may not be reachable. So why do you 
need to do this?
(I agree you need to check each traversal point against the mask)

As I said above: This mask is interesting:
/etc : doesn't exist
/etc/config.file : r only

it will report file not found due to a traversal failure - isn't that 
what you'd want?

>>  That could be complex 
>>in the VFS details.  We can defer it to Phase II if necessary.  George, 
>>you should spend a day (not this week) figuring out how much work it 
>>would be to make that work.  It will be the details of it that will be 
>>dangerous....
>>    
>>
>
>I'll tackle scenario #2:
>* Executing chmod would be excluded because it would not be visible in the mask.
>* "files created or modified can not have any execute bit set" 
>  Implicit in this statement is that, in addition to filtering object 
>  visibility, masks will preempt/proscribe certain fs operations -- in this 
>  case, the setting of certain attributes (i.e. exec bit). If this is correct
>  then what can masks allow/prohibit WRT operations/attributes performed
>  on objects. This is what I was trying to clarify with my earlier question.
>
>  
>
If you have a maskfs then if you traverse it for a filename and get a 
hit then the results of the hit are the masklet to be applied.

If you get a miss then implicit exclude states:
* doesn't exist (shortcut the call - file not found)

If it hits, what types are there in a masklet?
I think:
* doesn't exist (file not found)
* file attribute mask (eg: prevent any writing)
* acl 'mask' (an obvious extension of attr but no longer simple 'AND' logic)
* syscall mask (prevent hardlink and maybe chmod - although see below)
* 'umask' (chmod) mask (prevent setting suid or execute bit - but may 
allows setting +w and setgid on directories - may extend to acls too)

David
