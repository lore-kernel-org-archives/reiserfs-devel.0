From: "David Dabbs" <david@dabbs.net>
Subject: Re: viewprinting: what format should views be stored in?
Date: Fri, 20 Aug 2004 07:23:24 -0000
Message-ID: <20040820072324.CA4DA15D92@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20425-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiser@namesys.com, reiserfs-list@namesys.com
Cc: david@dabbs.net

>>>
>>> When did masks specify visibility of files? According to Hans :
>>
>> This is clearcase functionality so everyone assumed it from the original
>> posting http://www.namesys.com/blackbox_security.html
>
>yes.
>
>Trying for clarity in the role of the mask interpreter layer.
>Does the mask act as a gatekeeper - passing things through to the fs 
>(possibly simpler to implement but _far_ less functional)
>Or (more likely) does the mask layer take over the role of authoriser(?) 
>in which case it delegates to the fs for the fs authorisation (attr) and 
>then bitwise ANDs that with it's own masklet (maybe shortcutting if the 
>mask determines the file is invisible)
>
>I think we all agree on the latter but I thought it best to be clear.

This clarity/specificity, at least re. your Phase I, is what I've been trying 
to get a handle on as well. Seems that in order to discuss /how/ to build this feature we should share an understanding of /what/ it is that it will do. This includes user inputs ('constraints' in mask[let] specifications) as well as
side effects or changes to 'normal' process/OS/filesystem operations.

From Hans's original post:

>It will however allow a useful subset of the needed security constraints 
>to be more compactly specified
>
Is there a proposed membership for the "useful subset," or better yet
what security constraints are not useful?

>[viewprinting] is also useful when you want to conveniently manage the 
>set of objects a particular executable is allowed to access without walking 
>the filesystem tree to do it.

"Without walking the filesystem to do it" implies that the view/mask
interpreter is the authorisor. The ultimate implementation may not need 
to walk the fs to determine whether process X can access object Y, but one 
cannot avoid doing so if you want to obtain dentries etc. needed by the VFS.

Hans and George, what did you find lacking in currently-available Linux security
module frameworks such as LIDS or LSM? They provide system function hooks
in which module writers may control object access. LSM-based work is on-going. See 
http://sic.iaik.tugraz.at/Best%20Paper%20Award/2004/LSM_quaritsch_winkler.pdf
for details of their addition of module stacking (multiple policies) and hooks into
the TCP layer. I'm going to read up on these frameworks.

>> What if it [mask] changes between two processes starting?
>> Does the running processes mask change? (cf chmod a file - seems 
>>
>> George: I am disinclined to tackle changing masks on the fly 
>> until I have a compelling story to justify the work.
>
>ok - agreed.

No changes on the fly? How does that square with the following 
from the blackbox_security.html feature description?

>
>We will accomodate these scenarios by creating three special view
>specifications: 
>...
>2. Every access outside some view creates a dialogue with the 
>administrator, in which if he oks it the view specification is amended 
>to allow the access. The administrator is also allowed to ok the access 
>without amending the specification, for the case where close monitoring 
>of some accesses is desired, which will result in his being prompted for 
>every access of that kind until he chooses to amend the specification. 
>...


>>>>
>>>> Hans: Your statement is imprecise. The mask will be checked first, 
>>>> and then iff it falls through we do a normal filesystem traversal.
>>>>   
>>>
>>> It was imprecise because perhaps I had a different vprint concept 
>>> and implementation in mind. Using the creation tool, JAdmin creates 
>>> a mask for fooprocess. The mask would be a directory structure 
>>> rooted at /bin/fooprocess/metas/mask. All files (not dirs) in this 
>>> tree would be hard links to the "real" files specified in the mask. 
>>> Only dirs & files included in the spec are visible. When an instance 
>>> of fooprocess is started, /bin/fooprocess/metas/mask is 
>>> automagically mounted as the process's root filesystem. The mask 
>>> would be the filesystem. Other than the use of the metas reiserism 
>>> (and mask maintenance wizardry)
>>> this is not any different than chroot. Since the end result here is
>>> to be no more secure than chroot, but very much easier to deploy and 
>>> maintain, is there a reason why this cannot be the case?
>>>  
>>>
>> I think the 'thing' at /usr/bin/fooprocess/metas/mask
>> is a semantic expansion of the mask (ie it's like a directory tree 
>> but it doesn't point to files, it just contains lots of masklets).
>> It can be traversed in parallel to the real tree traversal and the 
>> masklets it returns will modify the real results. It is purely 
>> semantic. I've expanded this later.
>>
>> Call it a maskfs?

David, isn't what I described above a maskfs (just not called that?)
Anyway, I believe it [mask layer] should be a real filesystem that does 
(eventually) point to files. Yes, the maskfs would need to store the 
"compact representation of the security constraints." Isn't that stat data? 

Based upon the shorthand in use so far, we'll say a masklet specification 
consists of an object name and some permission flags. Why not build the 
maskfs (as before, a directory tree in an existing reiser4 fs) with an entry 
for each object referenced in the mask. So, starting with the (admittedly poor)
prior example mask; Note that since masks can only deny authorisation but not grant it, any flags in the mask are denials. The following are logical:

     /                    -w-      # default dir perms
     /**                 -wx      # default file perms
     /etc/config.file  --x       # only exec denied, rw depends on fs attrs
     <other dirs/files obtained from the admin's process viewprint>

you would then end up with something like:

# ls -l /usr/local/bin/fooprocess/metas

     mask/                 ?-? ?-? ?-?   #  perms from above ANDed with fs attrs
        metas/
            dirdefault     ??? ??? ???    # whatever was in the mask
            filedefault    ??? ??? ???
        etc/                ?-? ?-? ?-?    # writing prohibited
            config.file     ??- ??- ??-    # cannot execute
        ...

When this 'maskfs' tree is created every explicitly named object from 
the mask is associated/linked to the actual object's inode but the attr 
bits are the real ones ANDed with the masklet's. Processes would be 
chrooted to this dir. When the process wants to write to /etc/config.file 
it simply interacts with the chrooted fs with no changes required in the VFS
layer, yes? Now, say the process wants to read a file that is allowed by 
the masklet but not explicitly included in the mask e.g. /etc/foo.conf. 
The VFS will first resolve etc, then the file foo.conf. The dir plugins we 
configure for this tree will, upon not finding foo in this dir, search the 
real /etc for it. If it exists, it is created in the maskfs tree,
assigned the proper attrs, and finally linked to the real /etc/foo.conf. 
Subsequent requests for /etc/foo are processed directly from the maskfs. 
This is a 'lazy linking' of sorts. 

Changing a mask is as easy as chmod on the file, if it was explicitly
part of the mask when it was created. If it wasn't, simply touching it adds it.
The plugins will check that the file actually exists, read the real object's
attr and mask out anything denied by the default file attrs.

Updating the maskfs when the underlying fs has changed is an issue. 
This is only a concern for fs objects that have been instantiated in
maskfs. An enhanced dnotify might be the way to go, 
http://www.lambda-computing.com/~rudi/dnotify/

Is this feasible/workable?

>>
>> If it hits, what types are there in a masklet?
>> I think:
>> * doesn't exist (file not found)
>> * file attribute mask (eg: prevent any writing)
>> * acl 'mask' (an obvious extension of attr but no longer simple 'AND' 
>> logic)
>> * syscall mask (prevent hardlink and maybe chmod - although see below)
>> * 'umask' (chmod) mask (prevent setting suid or execute bit - but may 
>> allows setting +w and setgid on directories - may extend to acls too)
>
> For proof of concept the first 2 suffice.

If we want to specify permissions for a process irrespective of the uid/gid
executing it wouldn't we just specify explicit rights and ignore the ugo
fs attrs?

Regarding permitting/denying syscalls, chmod, etc. I think we should
look into using LSM modules for this (whenever there is funding for it, of course).

David D.

