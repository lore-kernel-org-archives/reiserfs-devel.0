From: "David Dabbs" <david@dabbs.net>
Subject: Re: viewprinting: what format should views be stored in?
Date: Thu, 19 Aug 2004 07:40:27 -0000
Message-ID: <20040819074027.8429715D94@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20396-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, George Beshers <gbeshers@comcast.net>
Cc: reiserfs-list@namesys.com



Motivation
----------------------------------------------------------------------
See Hans's original post. In and of itself, viewprinting will not be 
more secure than chroot. Viewprinting should be less work than 
chroot. By virtue of its being easier to deploy and administer, the 
net effect should be increased security, assuming more admins deploy
viewprinting.


Later Phase Considerations
----------------------------------------------------------------------
- Explicit exclusion in masks. 
- Notions of mask inheritance


Definitions
---------------------------------------------------------------------
Process-Oriented
Specifications of filesystem object visibility are applied to processes 
regardless of the effective user rights with which the process runs.

Mask (or viewprint)
A specification as to which files are visible to process[es] 
"running under" the mask. The [file] security underlying the mask
remains a user/object/permission mapping applied by the underlying
filesystem. If a mask a) does not include a file or b) explicitly 
filters out acess, the file operation ceases and an error is returned. 
If the file upon which the process wants to operate is not filtered by 
the mask, then the operation request is passed on to the underlying 
filesystem. There, the requested file a) might not exist, b) might 
exist but not be visible/readable by the user running the process, etc. 
 
Fall-Through Point
The point during some file operation at which it is determined that the 
file is not filtered by the mask. The request [for operation X on the file]
is passed on to the VFS/underlying filesystem. 



Features & Constraints
----------------------------------------------------------------------
Masks 
- must support dirname/* 
- do not [yet] need to support dirname/foo.*
- should not allow symbolic link traversal unless the file pointed to 
  is within the mask.

Masked Processes
- May not create hard links.
- Child processes [of a masked process] must inherit the parent's 
  "mask bit" and mask definition.

Filesystem Support
- Reiser4 fs code will be required to implement viewprinting.
- Only Reiser4 filesystems may be "masked."

 

Questions
----------------------------------------------------------------------
>All file types and access methods will be supported, yes? 
>(mmap, AIO, DIRECT, pipes, hard/sym links, etc.)
>
>Hans: Yes.
>...except that they cannot create hard links (above)

Is this restriction unequivocal (yes)? 
Any other forbidden Unix fs objects or fs operations?


> Early on in the conversation, there was discussion about 
> "permissible functionality." At a minimum, a mask, true to its name, 
> will effect filesystem object _visibility_. It was not completely 
> clear whether the mask will be proscriptive viz operations. IOW, will 
> the mask say that fooprocess "is not permitted to [attempt to] RWX 
> object bar?" I believe this is not something masks will do, but I 
> wanted clarification.
> 
> 
>I don't know why I don't understand your question, but I don't.....;-)


Let me try again. At a mininmum, a mask specifies what objects are
visible to a process, correct? If objext X is included in or not 
explicitly excluded from the mask, then fooprocess is allowed to 
_attempt_to_ operate on object X. I say "attempt to" because, at 
that point (fall-through), the mask is finished wrt the operation, 
yes? Permission to actually carry out an operation on object X is 
determined by the user/object/permission mapping in the underlying
filesystem.

What was not clear to me was whether masks specified, proscribed, or
in any way controlled filesystem operations (permissions) for objects
that are visible when running under the mask. If so, what can be 
specified and is it an "allow" a "deny" or either?


> Hans, in your preferred approach you referred to "a format that 
> is as if it is a subdirectory of the masked executable." Did you have
> in mind checking for something like /usr/bin/fooprocess/metas/mask 
> when exec() loads the exe,
> 
> yes
>
> and if this exists then the files rooted in this directory 
> would be set as the process's root filesystem?
> 
>Your statement is imprecise. The mask will be checked first, and 
>then iff it falls through we do a normal filesystem traversal.

It was imprecise because perhaps I had a different vprint concept 
and implementation in mind. Using the creation tool, JAdmin creates 
a mask for fooprocess. The mask would be a directory structure 
rooted at /bin/fooprocess/metas/mask. All files (not dirs) in 
this tree would be hard links to the "real" files specified in the mask. 
Only dirs & files included in the spec are visible. When an instance of 
fooprocess is started, /bin/fooprocess/metas/mask is automagically mounted 
as the process's root filesystem. The mask would be the filesystem. 
Other than the use of the metas reiserism (and mask maintenance wizardry)
this is not any different than chroot. Since the end result here is
to be no more secure than chroot, but very much easier to deploy and 
maintain, is there a reason why this cannot be the case?


> If you are limited to the semantic layer, then there's 
> no stat node with which to play tricks. 
> 
> I wonder if it would be feasible if masks only specified 
> exclusions? If, for instance, the mask wanted to exclude /foo/*, 
> then the directory foo would exist (in the mask semantic tree). 
> To exclude /etc/passwd, passwd would exist in the directory /etc. 
> Since you're already going to need to preempt dcache searches 
> (aren't you?)
> 
>Sigh, yes, or we need to use dcache for the mask.

> you can insert a search of the mask tree. If the 
> search fails, then it is not excluded and the request falls through 
> to normal VFS handling. In the /etc/passwd case above, it would find 
> /etc/passwd and so the file is excluded. Processing would stop there, 
> returning some error. How does this sound? 
> 
>I don't quite understand this paragraph above.


Probably because I'm not on the same page as you and George.
Imagine a filesystem with two trees: one, the real
root filesystem and two, the anti-root tree (exclusions). This
fs would be the root fs for the process. Let's say fooprocess has 
the following exclusions:

	/etc/passwd
	/etc/shadow
	/var

Above, when I said "insert a search of the mask tree" what I meant was
"first search the exception [semantic] tree (anti-tree) associated with 
this process. If you find the object there, then report it as NOT FOUND.
Otherwise, proceed with a normal fs tree search (fall-through). Basically,
a dynamic, per-process (er, per mask) hidden attribute. The modified VFS 
code to store the dentry of the root of the mask base dir, then use 
normal namei(), etc. path resolution interfaces to see if the file exists 
in the exception list? IOW, when fooprocess attempts to open /etc/passwd 
when fooprocess is under the above mask, the following happens: VFS 
identifies process as being undermask and so knows dentry of the base dir 
of the exception list (fooprocess/metas/mask). Before doing 'normal' 
handling, VFS treats this as a request to operate on 
fooprocess/metas/mask/etc/passwd. If VFS finds the filename, then NOT 
FOUND is returned. Otherwise, file processing proceeds normally.

> George:
> To give a couple of examples:
>     1) A given process (say a restricted shell) can not exec() an
>         executable with the set-uid bit on.
>          - directly
>          - indirectly (e.g., via bash)
>     2) Apache can only create/write files in /var/web/incoming.
>          - files created or modified can not have any execute bit set 
> and executing chmod is excluded.
>
>Hans:
>this protection happens while traversing the mask or at the fall through 
>point.  Hmmm, we need to accumulate a set of permissions that apply to 
>something that are specific to how we got there.  That could be complex 
>in the VFS details.  We can defer it to Phase II if necessary.  George, 
>you should spend a day (not this week) figuring out how much work it 
>would be to make that work.  It will be the details of it that will be 
>dangerous....

I'll tackle scenario #2:
* Executing chmod would be excluded because it would not be visible in the mask.
* "files created or modified can not have any execute bit set" 
  Implicit in this statement is that, in addition to filtering object 
  visibility, masks will preempt/proscribe certain fs operations -- in this 
  case, the setting of certain attributes (i.e. exec bit). If this is correct
  then what can masks allow/prohibit WRT operations/attributes performed
  on objects. This is what I was trying to clarify with my earlier question.


David

