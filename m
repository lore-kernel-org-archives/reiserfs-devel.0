From: George Beshers <gbeshers@comcast.net>
Subject: Re: viewprinting: what format should views be stored in?
Date: Thu, 19 Aug 2004 12:16:21 -0400
Message-ID: <4124D255.2060401@comcast.net>
References: <20040819074027.8429715D94@mail03.powweb.com> <41248D43.3040905@dgreaves.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------070203040800010907010009"
Return-path: <reiserfs-list-return-20406-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41248D43.3040905@dgreaves.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>

--------------070203040800010907010009
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



David Greaves wrote:

> Hi
>
> I've been following and have an interest - I hope my comments and 
> observations are valuable.
>
> First, allow me to suggest some more terminology - like George, I 
> always like to see this done early
> Masklet : set of modifications to a filename's access authorisations
> Mask: collection of Masklets (possibly only 1)
>
> Most of the time one will use 'mask'; eg one can now traverse a mask 
> (cf an image overlay) however one can use masklet to refer to a 
> specific instance (a complex mask pixel)
> I've used this terminology below and I think it's OK.
>
> David Dabbs wrote:
>
>> Fall-Through Point
>> The point during some file operation at which it is determined that 
>> the file is not filtered by the mask. The request [for operation X on 
>> the file]
>> is passed on to the VFS/underlying filesystem. 
>
> This doesn't sound right.
> (Basically I suspect there has been confusion over 'visibilty' and 
> file attribute masking)
>
> When did masks specify visibility of files? According to Hans :


This is clearcase functionality so everyone assumed it from the original
posting http://www.namesys.com/blackbox_security.html

>
>> Hmm.  Yes, views should allow masking permissions.
>
>
>
> mind you, he then said:
>
>> We need to be able to support specifying a mask that allows any file 
>> within a given directory to be visible.  That is, we need to support 
>> dirname/* but we don't yet need to support dirname/foo.* 
>
>
>
> I think (see last paragraphs of this email) that we have a collection 
> of masklet types.
>
>>
>>
>> Features & Constraints
>> ----------------------------------------------------------------------
>> Masks - must support dirname/* - do not [yet] need to support 
>> dirname/foo.*
>> - should not allow symbolic link traversal unless the file pointed to 
>>  is within the mask.
>>  
>>
> simple question here:
> does dirname/* go deep into the directory tree??
>
> It doesn't in shell syntax
>
> Maybe dirname/**
> (which means the complete tree below dirname)
>
> Important I think.
> Also introduces the question of 'rule' interaction
>
> dirname/bar/foo : maska
> dirname/bar/*     : maskb
> dirname**           : mask c
>
> which mask?
> options:
> AND?
> most specific? (definition)
> first to match?


Probably first to match, just thinking in terms of lex.
Using every mask that applies is also potentially useful but raises more
performance concerns.

>
>
>> Masked Processes
>> - May not create hard links.
>> - Child processes [of a masked process] must inherit the parent's 
>>  "mask bit" and mask definition.
>>  
>>
> remind me - what is the mask tied to? UID/GID, EUID, PID, PGID? 
> filesystem?
> Hans actually says it's derived from the executable.
> What if it changes between two processes starting?
> Does the running processes mask change? (cf chmod a file - seems 
> reasonable but...)
> I'd think it needs to be pretty atomic...
> In fact, maybe changing masks on a running (mounted?) system is a 
> potential security hole and forbidden?
> I think I could think of race examples.


I am disinclined to tackle changing masks on the fly until I have a 
compelling story
to justify the work.

> aside: talking about reuse, maybe the recent lkml JOB patch is useful:
> http://marc.theaimsgroup.com/?l=linux-kernel&m=109278360210574&w=2
>
> +       A job is a group of related processes all descended from a
> +       point of entry process and  identified  by  a  unique  job
> +       identifier  (jid).   A  job  can     contain multiple process
> +       groups or sessions, and all processes in one of these sub-
> +       groups can only be contained within a single job.
> +
> +       The  primary  purpose  for  having  jobs is to provide job
> +       based resource limits.
>
> Maybe exe's can have something _like_ setuid? setmid()?
> mid being based on jid?


Thanks for the pointer.  I will take a look at this.

>
>> Questions
>> ----------------------------------------------------------------------
>>  
>>
>>> All file types and access methods will be supported, yes? (mmap, 
>>> AIO, DIRECT, pipes, hard/sym links, etc.)
>>>
>>> Hans: Yes.
>>> ...except that they cannot create hard links (above)
>>>   
>>
>>
>>
>> Is this restriction unequivocal (yes)? Any other forbidden Unix fs 
>> objects or fs operations?
>>  
>>
> Obviously creating a hardlink _can_ circumvent semantically specified 
> security.
> But shouldn't that just be a masklet attribute? see below (end)


Do you have an example in mind?
I share your belief but in a few minutes of thinking about it didn't
come up with a plausible example.

>>> Early on in the conversation, there was discussion about 
>>> "permissible functionality." At a minimum, a mask, true to its name, 
>>> will effect filesystem object _visibility_. It was not completely 
>>> clear whether the mask will be proscriptive viz operations. IOW, 
>>> will the mask say that fooprocess "is not permitted to [attempt to] 
>>> RWX object bar?" I believe this is not something masks will do, but 
>>> I wanted clarification.
>>>
>>>
>>> I don't know why I don't understand your question, but I don't.....;-)
>>>   
>>
>>
>>
>>
>> Let me try again. At a mininmum, a mask specifies what objects are
>> visible to a process, correct? If objext X is included in or not 
>> explicitly excluded from the mask, then fooprocess is allowed to 
>> _attempt_to_ operate on object X. I say "attempt to" because, at that 
>> point (fall-through), the mask is finished wrt the operation, yes? 
>> Permission to actually carry out an operation on object X is 
>> determined by the user/object/permission mapping in the underlying
>> filesystem.
>>
>> What was not clear to me was whether masks specified, proscribed, or
>> in any way controlled filesystem operations (permissions) for objects
>> that are visible when running under the mask. If so, what can be 
>> specified and is it an "allow" a "deny" or either?
>>  
>>
> So, you're saying that a mask can deny authorisation but not grant it.
> (In which case 'mask' is a good word and the concept of AND goes into 
> the foundations)


YES.

>
> A process can read/write/execute according to FS permissions.
> If the files 'acl/attr' doesn't allow writing then the mask _cannot_ 
> override this and allow a masked process to write to the file.
>
> This sounds sensible.


Glad everyone is on the same page with this

>
>>> Hans, in your preferred approach you referred to "a format that is 
>>> as if it is a subdirectory of the masked executable." Did you have
>>> in mind checking for something like /usr/bin/fooprocess/metas/mask 
>>> when exec() loads the exe,
>>>
>>> yes
>>>
>>> and if this exists then the files rooted in this directory would be 
>>> set as the process's root filesystem?
>>>
>>> Your statement is imprecise. The mask will be checked first, and 
>>> then iff it falls through we do a normal filesystem traversal.
>>>   
>>
>>
>>
>> It was imprecise because perhaps I had a different vprint concept and 
>> implementation in mind. Using the creation tool, JAdmin creates a 
>> mask for fooprocess. The mask would be a directory structure rooted 
>> at /bin/fooprocess/metas/mask. All files (not dirs) in this tree 
>> would be hard links to the "real" files specified in the mask. Only 
>> dirs & files included in the spec are visible. When an instance of 
>> fooprocess is started, /bin/fooprocess/metas/mask is automagically 
>> mounted as the process's root filesystem. The mask would be the 
>> filesystem. Other than the use of the metas reiserism (and mask 
>> maintenance wizardry)
>> this is not any different than chroot. Since the end result here is
>> to be no more secure than chroot, but very much easier to deploy and 
>> maintain, is there a reason why this cannot be the case?
>>  
>>
> I think the 'thing' at /usr/bin/fooprocess/metas/mask
> is a semantic expansion of the mask (ie it's like a directory tree but 
> it doesn't point to files, it just contains lots of masklets).
> It can be traversed in parallel to the real tree traversal and the 
> masklets it returns will modify the real results. It is purely 
> semantic. I've expanded this later.
>
> Call it a maskfs?
> The email subject becomes:
> Re: viewprinting: what format should maskfs use?
> The answer of course is something very similar to reiserfs.
>
> (BTW perhaps, eventually, /proc/<pid>/maskfs is a better place - and 
> the mask checking moves to vfs - all of a sudden it's not reiser 
> specific - although maskfs is reiserfs code)


Hans and I discussed this briefly.  For proof-of-concept work we agreed 
that having as much as possible
in the file system layer was the way to go.  If it proves to be viable 
then we can try to convince the rest
of the community.

>
>
>>> George:
>>> To give a couple of examples:
>>>    1) A given process (say a restricted shell) can not exec() an
>>>        executable with the set-uid bit on.
>>>         - directly
>>>         - indirectly (e.g., via bash)
>>>    2) Apache can only create/write files in /var/web/incoming.
>>>         - files created or modified can not have any execute bit set 
>>> and executing chmod is excluded.
>>>
>>> Hans:
>>> this protection happens while traversing the mask or at the fall 
>>> through point.
>>>
> Don't you always fall through - but sometimes you 'hit' a masklet and 
> sometimes you 'miss'


"Fall through" is to the original filesystem below the mask.  You don't 
fall through if the mask
rejects the operation.

>
>>>  Hmmm, we need to accumulate a set of permissions that apply to 
>>> something that are specific to how we got there.
>>>
> In fs traversal the permision at a point in traversal (ie a directory 
> on the way) doesn't affect the permission of the object when the fs 
> has been traversed except insofar as it may not be reachable. So why 
> do you need to do this?
> (I agree you need to check each traversal point against the mask)
>
> As I said above: This mask is interesting:
> /etc : doesn't exist
> /etc/config.file : r only
>
> it will report file not found due to a traversal failure - isn't that 
> what you'd want?


I suppose technically it is an optimization: but it makes sense that for 
some process
nothing in /etc is writable or nothing in /home/confidential is 
available at all.

I tend to think that in your example /etc/config.file is a useless 
masklet, but perhaps
if you change the order then the only file you see in /etc is config.file.

At the moment I need time to think about the mask interpreter layer and put
some "stakes in the ground" about what is actually practical to implement.

>
>>>  That could be complex in the VFS details.  We can defer it to Phase 
>>> II if necessary.  George, you should spend a day (not this week) 
>>> figuring out how much work it would be to make that work.  It will 
>>> be the details of it that will be dangerous....
>>>   
>>
>>
>>
>> I'll tackle scenario #2:
>> * Executing chmod would be excluded because it would not be visible 
>> in the mask.
>> * "files created or modified can not have any execute bit set" 
>>  Implicit in this statement is that, in addition to filtering object 
>>  visibility, masks will preempt/proscribe certain fs operations -- in 
>> this  case, the setting of certain attributes (i.e. exec bit). If 
>> this is correct
>>  then what can masks allow/prohibit WRT operations/attributes performed
>>  on objects. This is what I was trying to clarify with my earlier 
>> question.
>>
>>  
>>
> If you have a maskfs then if you traverse it for a filename and get a 
> hit then the results of the hit are the masklet to be applied.
>
> If you get a miss then implicit exclude states:
> * doesn't exist (shortcut the call - file not found)
>
> If it hits, what types are there in a masklet?
> I think:
> * doesn't exist (file not found)
> * file attribute mask (eg: prevent any writing)
> * acl 'mask' (an obvious extension of attr but no longer simple 'AND' 
> logic)
> * syscall mask (prevent hardlink and maybe chmod - although see below)
> * 'umask' (chmod) mask (prevent setting suid or execute bit - but may 
> allows setting +w and setgid on directories - may extend to acls too)


For proof of concept the first 2 suffice.
After that we are likely to be driven by practical considerations (e.g., 
what gets funded )



--------------070203040800010907010009
Content-Type: multipart/related;
 boundary="------------090702070305040408020009"


--------------090702070305040408020009
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
<div class="moz-text-flowed" style="font-size: 16px;" lang="x-western">
<br>
<br>
David Greaves wrote:
<br>
<br>
<blockquote type="cite">Hi
  <br>
  <br>
I've been following and have an interest - I hope my comments and
observations are valuable.
  <br>
  <br>
First, allow me to suggest some more terminology - like George, I
always like to see this done early <img
 src="cid:part1.03060903.06010203@comcast.net" alt=":)"
 class="moz-txt-smily" height="19" width="19" align="middle">
  <br>
Masklet : set of modifications to a filename's access authorisations
  <br>
Mask: collection of Masklets (possibly only 1)
  <br>
  <br>
Most of the time one will use 'mask'; eg one can now traverse a mask
(cf an image overlay) however one can use masklet to refer to a
specific instance (a complex mask pixel)
  <br>
I've used this terminology below and I think it's OK.
  <br>
  <br>
David Dabbs wrote:
  <br>
  <br>
  <blockquote type="cite">Fall-Through Point
    <br>
The point during some file operation at which it is determined that the
file is not filtered by the mask. The request [for operation X on the
file]
    <br>
is passed on to the VFS/underlying filesystem.&nbsp; <br>
  </blockquote>
This doesn't sound right.
  <br>
(Basically I suspect there has been confusion over 'visibilty' and file
attribute masking)
  <br>
  <br>
When did masks specify visibility of files? According to Hans :
  <br>
</blockquote>
<br>
This is clearcase functionality so everyone assumed it from the
original
<br>
posting <a class="moz-txt-link-freetext"
 href="http://www.namesys.com/blackbox_security.html">http://www.namesys.com/blackbox_security.html</a>
<br>
<br>
<blockquote type="cite"><br>
  <blockquote type="cite">Hmm.&nbsp; Yes, views should allow masking
permissions.
    <br>
  </blockquote>
  <br>
  <br>
mind you, he then said:
  <br>
  <br>
  <blockquote type="cite">We need to be able to support specifying a
mask that allows any file within a given directory to be visible.&nbsp; That
is, we need to support dirname/* but we don't yet need to support
dirname/foo.* </blockquote>
  <br>
  <br>
I think (see last paragraphs of this email) that we have a collection
of masklet types.
  <br>
  <br>
  <blockquote type="cite"><br>
    <br>
Features &amp; Constraints
    <br>
----------------------------------------------------------------------
    <br>
Masks - must support dirname/* - do not [yet] need to support
dirname/foo.*
    <br>
- should not allow symbolic link traversal unless the file pointed to
&nbsp;is within the mask.
    <br>
&nbsp;
    <br>
    <br>
  </blockquote>
simple question here:
  <br>
does dirname/* go deep into the directory tree??
  <br>
  <br>
It doesn't in shell syntax
  <br>
  <br>
Maybe dirname/**
  <br>
(which means the complete tree below dirname)
  <br>
  <br>
Important I think.
  <br>
Also introduces the question of 'rule' interaction
  <br>
  <br>
dirname/bar/foo : maska
  <br>
dirname/bar/*&nbsp;&nbsp;&nbsp;&nbsp; : maskb
  <br>
dirname**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : mask c
  <br>
  <br>
which mask?
  <br>
options:
  <br>
AND?
  <br>
most specific? (definition)
  <br>
first to match?
  <br>
</blockquote>
<br>
Probably first to match, just thinking in terms of lex.
<br>
Using every mask that applies is also potentially useful but raises
more
<br>
performance concerns.
<br>
<br>
<blockquote type="cite"><br>
  <br>
  <blockquote type="cite">Masked Processes
    <br>
- May not create hard links.
    <br>
- Child processes [of a masked process] must inherit the parent's
&nbsp;"mask bit" and mask definition.
    <br>
&nbsp;
    <br>
    <br>
  </blockquote>
remind me - what is the mask tied to? UID/GID, EUID, PID, PGID?
filesystem?
  <br>
Hans actually says it's derived from the executable.
  <br>
What if it changes between two processes starting?
  <br>
Does the running processes mask change? (cf chmod a file - seems
reasonable but...)
  <br>
I'd think it needs to be pretty atomic...
  <br>
In fact, maybe changing masks on a running (mounted?) system is a
potential security hole and forbidden?
  <br>
I think I could think of race examples.
  <br>
</blockquote>
<br>
I am disinclined to tackle changing masks on the fly until I have a
compelling story
<br>
to justify the work.
<br>
<br>
<blockquote type="cite">aside: talking about reuse, maybe the recent
lkml JOB patch is useful:
  <br>
  <a class="moz-txt-link-freetext"
 href="http://marc.theaimsgroup.com/?l=linux-kernel&amp;m=109278360210574&amp;w=2">http://marc.theaimsgroup.com/?l=linux-kernel&amp;m=109278360210574&amp;w=2</a>
  <br>
  <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A job is a group of related processes all descended from a
  <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; point of entry process and&nbsp; identified&nbsp; by&nbsp; a&nbsp; unique&nbsp; job
  <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; identifier&nbsp; (jid).&nbsp;&nbsp; A&nbsp; job&nbsp; can&nbsp;&nbsp;&nbsp;&nbsp; contain multiple process
  <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; groups or sessions, and all processes in one of these sub-
  <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; groups can only be contained within a single job.
  <br>
+
  <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The&nbsp; primary&nbsp; purpose&nbsp; for&nbsp; having&nbsp; jobs is to provide job
  <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; based resource limits.
  <br>
  <br>
Maybe exe's can have something <span class="moz-txt-underscore"><span
 class="moz-txt-tag">_</span>like<span class="moz-txt-tag">_</span></span>
setuid? setmid()?
  <br>
mid being based on jid?
  <br>
</blockquote>
<br>
Thanks for the pointer.&nbsp; I will take a look at this.
<br>
<br>
<blockquote type="cite"><br>
  <blockquote type="cite">Questions
    <br>
----------------------------------------------------------------------
    <br>
&nbsp;
    <br>
    <br>
    <blockquote type="cite">All file types and access methods will be
supported, yes? (mmap, AIO, DIRECT, pipes, hard/sym links, etc.)
      <br>
      <br>
Hans: Yes.
      <br>
...except that they cannot create hard links (above)
      <br>
&nbsp; </blockquote>
    <br>
    <br>
Is this restriction unequivocal (yes)? Any other forbidden Unix fs
objects or fs operations?
    <br>
&nbsp;
    <br>
    <br>
  </blockquote>
Obviously creating a hardlink <span class="moz-txt-underscore"><span
 class="moz-txt-tag">_</span>can<span class="moz-txt-tag">_</span></span>
circumvent semantically specified security.
  <br>
But shouldn't that just be a masklet attribute? see below (end)
  <br>
</blockquote>
<br>
Do you have an example in mind?
<br>
I share your belief but in a few minutes of thinking about it didn't
<br>
come up with a plausible example.
<br>
<br>
<blockquote type="cite">
  <blockquote type="cite">
    <blockquote type="cite">Early on in the conversation, there was
discussion about "permissible functionality." At a minimum, a mask,
true to its name, will effect filesystem object <span
 class="moz-txt-underscore"><span class="moz-txt-tag">_</span>visibility<span
 class="moz-txt-tag">_</span></span>. It was not completely clear
whether the mask will be proscriptive viz operations. IOW, will the
mask say that fooprocess "is not permitted to [attempt to] RWX object
bar?" I believe this is not something masks will do, but I wanted
clarification.
      <br>
      <br>
      <br>
I don't know why I don't understand your question, but I don't.....;-)
      <br>
&nbsp; </blockquote>
    <br>
    <br>
    <br>
Let me try again. At a mininmum, a mask specifies what objects are
    <br>
visible to a process, correct? If objext X is included in or not
explicitly excluded from the mask, then fooprocess is allowed to <span
 class="moz-txt-underscore"><span class="moz-txt-tag">_</span>attempt_to<span
 class="moz-txt-tag">_</span></span> operate on object X. I say
"attempt to" because, at that point (fall-through), the mask is
finished wrt the operation, yes? Permission to actually carry out an
operation on object X is determined by the user/object/permission
mapping in the underlying
    <br>
filesystem.
    <br>
    <br>
What was not clear to me was whether masks specified, proscribed, or
    <br>
in any way controlled filesystem operations (permissions) for objects
    <br>
that are visible when running under the mask. If so, what can be
specified and is it an "allow" a "deny" or either?
    <br>
&nbsp;
    <br>
    <br>
  </blockquote>
So, you're saying that a mask can deny authorisation but not grant it.
  <br>
(In which case 'mask' is a good word and the concept of AND goes into
the foundations)
  <br>
</blockquote>
<br>
YES.
<br>
<br>
<blockquote type="cite"><br>
A process can read/write/execute according to FS permissions.
  <br>
If the files 'acl/attr' doesn't allow writing then the mask <span
 class="moz-txt-underscore"><span class="moz-txt-tag">_</span>cannot<span
 class="moz-txt-tag">_</span></span> override this and allow a masked
process to write to the file.
  <br>
  <br>
This sounds sensible.
  <br>
</blockquote>
<br>
Glad everyone is on the same page with this <img
 src="cid:part1.03060903.06010203@comcast.net" alt=":-)"
 class="moz-txt-smily" height="19" width="19" align="middle">
<br>
<br>
<blockquote type="cite"><br>
  <blockquote type="cite">
    <blockquote type="cite">Hans, in your preferred approach you
referred to "a format that is as if it is a subdirectory of the masked
executable." Did you have
      <br>
in mind checking for something like /usr/bin/fooprocess/metas/mask when
exec() loads the exe,
      <br>
      <br>
yes
      <br>
      <br>
and if this exists then the files rooted in this directory would be set
as the process's root filesystem?
      <br>
      <br>
Your statement is imprecise. The mask will be checked first, and then
iff it falls through we do a normal filesystem traversal.
      <br>
&nbsp; </blockquote>
    <br>
    <br>
It was imprecise because perhaps I had a different vprint concept and
implementation in mind. Using the creation tool, JAdmin creates a mask
for fooprocess. The mask would be a directory structure rooted at
/bin/fooprocess/metas/mask. All files (not dirs) in this tree would be
hard links to the "real" files specified in the mask. Only dirs &amp;
files included in the spec are visible. When an instance of fooprocess
is started, /bin/fooprocess/metas/mask is automagically mounted as the
process's root filesystem. The mask would be the filesystem. Other than
the use of the metas reiserism (and mask maintenance wizardry)
    <br>
this is not any different than chroot. Since the end result here is
    <br>
to be no more secure than chroot, but very much easier to deploy and
maintain, is there a reason why this cannot be the case?
    <br>
&nbsp;
    <br>
    <br>
  </blockquote>
I think the 'thing' at /usr/bin/fooprocess/metas/mask
  <br>
is a semantic expansion of the mask (ie it's like a directory tree but
it doesn't point to files, it just contains lots of masklets).
  <br>
It can be traversed in parallel to the real tree traversal and the
masklets it returns will modify the real results. It is purely
semantic. I've expanded this later.
  <br>
  <br>
Call it a maskfs?
  <br>
The email subject becomes:
  <br>
Re: viewprinting: what format should maskfs use?
  <br>
The answer of course is something very similar to reiserfs.
  <br>
  <br>
(BTW perhaps, eventually, <i class="moz-txt-slash"><span
 class="moz-txt-tag">/</span>proc<span class="moz-txt-tag">/</span></i>&lt;pid&gt;/maskfs
is a better place - and the mask checking moves to vfs - all of a
sudden it's not reiser specific - although maskfs is reiserfs code)
  <br>
</blockquote>
<br>
Hans and I discussed this briefly.&nbsp; For proof-of-concept work we agreed
that having as much as possible
<br>
in the file system layer was the way to go.&nbsp; If it proves to be viable
then we can try to convince the rest
<br>
of the community.
<br>
<br>
<blockquote type="cite"><br>
  <br>
  <blockquote type="cite">
    <blockquote type="cite">George:
      <br>
To give a couple of examples:
      <br>
&nbsp;&nbsp; 1) A given process (say a restricted shell) can not exec() an
      <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; executable with the set-uid bit on.
      <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - directly
      <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - indirectly (e.g., via bash)
      <br>
&nbsp;&nbsp; 2) Apache can only create/write files in /var/web/incoming.
      <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - files created or modified can not have any execute bit set
and executing chmod is excluded.
      <br>
      <br>
Hans:
      <br>
this protection happens while traversing the mask or at the fall
through point.
      <br>
      <br>
    </blockquote>
  </blockquote>
Don't you always fall through - but sometimes you 'hit' a masklet and
sometimes you 'miss'
  <br>
</blockquote>
<br>
"Fall through" is to the original filesystem below the mask.&nbsp; You don't
fall through if the mask
<br>
rejects the operation.
<br>
<br>
<blockquote type="cite"><br>
  <blockquote type="cite">
    <blockquote type="cite">&nbsp;Hmmm, we need to accumulate a set of
permissions that apply to something that are specific to how we got
there.
      <br>
      <br>
    </blockquote>
  </blockquote>
In fs traversal the permision at a point in traversal (ie a directory
on the way) doesn't affect the permission of the object when the fs has
been traversed except insofar as it may not be reachable. So why do you
need to do this?
  <br>
(I agree you need to check each traversal point against the mask)
  <br>
  <br>
As I said above: This mask is interesting:
  <br>
/etc : doesn't exist
  <br>
/etc/config.file : r only
  <br>
  <br>
it will report file not found due to a traversal failure - isn't that
what you'd want?
  <br>
</blockquote>
<br>
I suppose technically it is an optimization: but it makes sense that
for some process
<br>
nothing in /etc is writable or nothing in /home/confidential is
available at all.
<br>
<br>
I tend to think that in your example /etc/config.file is a useless
masklet, but perhaps
<br>
if you change the order then the only file you see in /etc is
config.file.
<br>
<br>
At the moment I need time to think about the mask interpreter layer and
put
<br>
some "stakes in the ground" about what is actually practical to
implement.
<br>
<br>
<blockquote type="cite"><br>
  <blockquote type="cite">
    <blockquote type="cite">&nbsp;That could be complex in the VFS details.&nbsp;
We can defer it to Phase II if necessary.&nbsp; George, you should spend a
day (not this week) figuring out how much work it would be to make that
work.&nbsp; It will be the details of it that will be dangerous....
      <br>
&nbsp; </blockquote>
    <br>
    <br>
I'll tackle scenario #2:
    <br>
* Executing chmod would be excluded because it would not be visible in
the mask.
    <br>
* "files created or modified can not have any execute bit set"
&nbsp;Implicit in this statement is that, in addition to filtering object
&nbsp;visibility, masks will preempt/proscribe certain fs operations -- in
this&nbsp; case, the setting of certain attributes (i.e. exec bit). If this
is correct
    <br>
&nbsp;then what can masks allow/prohibit WRT operations/attributes performed
    <br>
&nbsp;on objects. This is what I was trying to clarify with my earlier
question.
    <br>
    <br>
&nbsp;
    <br>
    <br>
  </blockquote>
If you have a maskfs then if you traverse it for a filename and get a
hit then the results of the hit are the masklet to be applied.
  <br>
  <br>
If you get a miss then implicit exclude states:
  <br>
* doesn't exist (shortcut the call - file not found)
  <br>
  <br>
If it hits, what types are there in a masklet?
  <br>
I think:
  <br>
* doesn't exist (file not found)
  <br>
* file attribute mask (eg: prevent any writing)
  <br>
* acl 'mask' (an obvious extension of attr but no longer simple 'AND'
logic)
  <br>
* syscall mask (prevent hardlink and maybe chmod - although see below)
  <br>
* 'umask' (chmod) mask (prevent setting suid or execute bit - but may
allows setting +w and setgid on directories - may extend to acls too)
  <br>
</blockquote>
<br>
For proof of concept the first 2 suffice.
<br>
After that we are likely to be driven by practical considerations
(e.g., what gets funded <img
 src="cid:part1.03060903.06010203@comcast.net" alt=":-)"
 class="moz-txt-smily" height="19" width="19" align="middle"> )
<br>
<br>
<br>
</div>
</body>
</html>

--------------090702070305040408020009
Content-Type: image/gif;
 name="smile_n.gif"
Content-Transfer-Encoding: base64
Content-ID: <part1.03060903.06010203@comcast.net>
Content-Disposition: inline;
 filename="smile_n.gif"

R0lGODlhEwATAKIAAP//AMzMAGZmAP8zAAAAAP///wAAAAAAACH5BAEAAAUALAAAAAATABMA
AANVWLrUTisyEoC1oUlFr8dQRHykFRad+Y0gdzlv86KVKdsskOUAjHu312rFK5GCRWDMJDAC
BKxGrTcFXTIo4CPY41QJgzAP69IWT14nWSL97DaiLVqRAAA7
--------------090702070305040408020009--

--------------070203040800010907010009--

