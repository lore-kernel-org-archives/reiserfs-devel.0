From: George Beshers <gbeshers@comcast.net>
Subject: Re: viewprinting: what format should views be stored in?
Date: Thu, 19 Aug 2004 10:30:58 -0400
Message-ID: <4124B9A2.3000909@comcast.net>
References: <20040819074027.8429715D94@mail03.powweb.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------080409020004090303040902"
Return-path: <reiserfs-list-return-20402-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040819074027.8429715D94@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Dabbs <david@dabbs.net>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

--------------080409020004090303040902
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



David Dabbs wrote:

>
>
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
>
It needs further study which Hans and I have agreed to postpone
until after we have something working.

>  
>
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
The answer is yes... but the extent of the control is an open question.

 - We have agreed not to mess with UIDs and GIDs or the associated
    set-uid and set-gid bits for the moment.
 - We have agreed that a mask which limits the operations on a visible
   file is appropriate, e.g., read-only should be supported.

Beyond that we will be driven largely by the perceived utility of the
functionality within the context of usual software engineering concerns.

>
>  
>
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
Well, I had not planned on the hard links in particular---this is where 
the fall
through semantics seem to be correct.  Suppose there are 1000 masks and
a new file gets added are you planning to add 1000 links?

>  
>
>>you can insert a search of the mask tree. If the 
>>search fails, then it is not excluded and the request falls through 
>>to normal VFS handling. In the /etc/passwd case above, it would find 
>>/etc/passwd and so the file is excluded. Processing would stop there, 
>>returning some error. How does this sound? 
>>
>>I don't quite understand this paragraph above.
>>    
>>
>
>
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
>Otherwise, proceed with a normal fs tree search (fall-through). Basically,
>a dynamic, per-process (er, per mask) hidden attribute. The modified VFS 
>code to store the dentry of the root of the mask base dir, then use 
>normal namei(), etc. path resolution interfaces to see if the file exists 
>in the exception list? IOW, when fooprocess attempts to open /etc/passwd 
>when fooprocess is under the above mask, the following happens: VFS 
>identifies process as being undermask and so knows dentry of the base dir 
>of the exception list (fooprocess/metas/mask). Before doing 'normal' 
>handling, VFS treats this as a request to operate on 
>fooprocess/metas/mask/etc/passwd. If VFS finds the filename, then NOT 
>FOUND is returned. Otherwise, file processing proceeds normally.
>  
>
This is closer to my understanding.

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
>>point.  Hmmm, we need to accumulate a set of permissions that apply to 
>>something that are specific to how we got there.  That could be complex 
>>in the VFS details.  We can defer it to Phase II if necessary.  George, 
>>you should spend a day (not this week) figuring out how much work it 
>>would be to make that work.  It will be the details of it that will be 
>>dangerous....
>>    
>>
>
>I'll tackle scenario #2:
>* Executing chmod would be excluded because it would not be visible in the mask.
>  
>
    Note that, at some point, one would like to disallow chmod() and 
fchmod() in any
    child process---but this is beyond the scope or the current project.

>* "files created or modified can not have any execute bit set" 
>  Implicit in this statement is that, in addition to filtering object 
>  visibility, masks will preempt/proscribe certain fs operations -- in this 
>  case, the setting of certain attributes (i.e. exec bit). If this is correct
>  then what can masks allow/prohibit WRT operations/attributes performed
>  on objects. This is what I was trying to clarify with my earlier question.
>
>  
>
    Let us say that, as this example suggests, it would make the masking 
more
    powerful and more useful since allowing someone on the internee to 
store data
    on your disk is much less risky than allowing them to get a process 
running
    over which they have control.

    That a viable and scalable implementation of this can be developed 
is an open
     question---currently ;-)


--------------080409020004090303040902
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
<br>
<br>
David Dabbs wrote:<br>
<blockquote type="cite"
 cite="mid20040819074027.8429715D94@mail03.powweb.com">
  <pre wrap="">


Questions
----------------------------------------------------------------------
  </pre>
  <blockquote type="cite">
    <pre wrap="">All file types and access methods will be supported, yes? 
(mmap, AIO, DIRECT, pipes, hard/sym links, etc.)

Hans: Yes.
...except that they cannot create hard links (above)
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Is this restriction unequivocal (yes)? 
Any other forbidden Unix fs objects or fs operations?

  </pre>
</blockquote>
It needs further study which Hans and I have agreed to postpone<br>
until after we have something working.<br>
<blockquote type="cite"
 cite="mid20040819074027.8429715D94@mail03.powweb.com">
  <pre wrap="">
  </pre>
  <blockquote type="cite">
    <pre wrap="">Early on in the conversation, there was discussion about 
"permissible functionality." At a minimum, a mask, true to its name, 
will effect filesystem object _visibility_. It was not completely 
clear whether the mask will be proscriptive viz operations. IOW, will 
the mask say that fooprocess "is not permitted to [attempt to] RWX 
object bar?" I believe this is not something masks will do, but I 
wanted clarification.


I don't know why I don't understand your question, but I don't.....;-)
    </pre>
  </blockquote>
  <pre wrap=""><!---->

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
  </pre>
</blockquote>
The answer is yes... but the extent of the control is an open question.<br>
<br>
&nbsp;- We have agreed not to mess with UIDs and GIDs or the associated<br>
&nbsp;&nbsp;&nbsp; set-uid and set-gid bits for the moment.<br>
&nbsp;- We have agreed that a mask which limits the operations on a visible<br>
&nbsp;&nbsp; file is appropriate, e.g., read-only should be supported.<br>
<br>
Beyond that we will be driven largely by the perceived utility of the<br>
functionality within the context of usual software engineering concerns.<br>
<br>
<blockquote type="cite"
 cite="mid20040819074027.8429715D94@mail03.powweb.com">
  <pre wrap="">

  </pre>
  <blockquote type="cite">
    <pre wrap="">Hans, in your preferred approach you referred to "a format that 
is as if it is a subdirectory of the masked executable." Did you have
in mind checking for something like /usr/bin/fooprocess/metas/mask 
when exec() loads the exe,

yes

and if this exists then the files rooted in this directory 
would be set as the process's root filesystem?

Your statement is imprecise. The mask will be checked first, and 
then iff it falls through we do a normal filesystem traversal.
    </pre>
  </blockquote>
  <pre wrap=""><!---->
It was imprecise because perhaps I had a different vprint concept 
and implementation in mind. Using the creation tool, JAdmin creates 
a mask for fooprocess. The mask would be a directory structure 
rooted at /bin/fooprocess/metas/mask. All files (not dirs) in 
this tree would be hard links to the "real" files specified in the mask. 
Only dirs &amp; files included in the spec are visible. When an instance of 
fooprocess is started, /bin/fooprocess/metas/mask is automagically mounted 
as the process's root filesystem. The mask would be the filesystem. 
Other than the use of the metas reiserism (and mask maintenance wizardry)
this is not any different than chroot. Since the end result here is
to be no more secure than chroot, but very much easier to deploy and 
maintain, is there a reason why this cannot be the case?
  </pre>
</blockquote>
Well, I had not planned on the hard links in particular---this is where
the fall<br>
through semantics seem to be correct.&nbsp; Suppose there are 1000 masks and<br>
a new file gets added are you planning to add 1000 links?<br>
<br>
<blockquote type="cite"
 cite="mid20040819074027.8429715D94@mail03.powweb.com">
  <pre wrap="">
  </pre>
  <blockquote type="cite">
    <pre wrap="">you can insert a search of the mask tree. If the 
search fails, then it is not excluded and the request falls through 
to normal VFS handling. In the /etc/passwd case above, it would find 
/etc/passwd and so the file is excluded. Processing would stop there, 
returning some error. How does this sound? 

I don't quite understand this paragraph above.
    </pre>
  </blockquote>
  <pre wrap=""><!---->

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
  </pre>
</blockquote>
This is closer to my understanding.<br>
<blockquote type="cite"
 cite="mid20040819074027.8429715D94@mail03.powweb.com">
  <blockquote type="cite">
    <pre wrap="">George:
To give a couple of examples:
    1) A given process (say a restricted shell) can not exec() an
        executable with the set-uid bit on.
         - directly
         - indirectly (e.g., via bash)
    2) Apache can only create/write files in /var/web/incoming.
         - files created or modified can not have any execute bit set 
and executing chmod is excluded.

Hans:
this protection happens while traversing the mask or at the fall through 
point.  Hmmm, we need to accumulate a set of permissions that apply to 
something that are specific to how we got there.  That could be complex 
in the VFS details.  We can defer it to Phase II if necessary.  George, 
you should spend a day (not this week) figuring out how much work it 
would be to make that work.  It will be the details of it that will be 
dangerous....
    </pre>
  </blockquote>
  <pre wrap=""><!---->
I'll tackle scenario #2:
* Executing chmod would be excluded because it would not be visible in the mask.
  </pre>
</blockquote>
&nbsp;&nbsp;&nbsp; Note that, at some point, one would like to disallow chmod() and
fchmod() in any<br>
&nbsp;&nbsp;&nbsp; child process---but this is beyond the scope or the current project.<br>
<blockquote type="cite"
 cite="mid20040819074027.8429715D94@mail03.powweb.com">
  <pre wrap="">* "files created or modified can not have any execute bit set" 
  Implicit in this statement is that, in addition to filtering object 
  visibility, masks will preempt/proscribe certain fs operations -- in this 
  case, the setting of certain attributes (i.e. exec bit). If this is correct
  then what can masks allow/prohibit WRT operations/attributes performed
  on objects. This is what I was trying to clarify with my earlier question.

  </pre>
</blockquote>
&nbsp;&nbsp;&nbsp; Let us say that, as this example suggests, it would make the
masking more<br>
&nbsp;&nbsp;&nbsp; powerful and more useful since allowing someone on the internee to
store data<br>
&nbsp;&nbsp;&nbsp; on your disk is much less risky than allowing them to get a process
running<br>
&nbsp;&nbsp;&nbsp; over which they have control.<br>
<br>
&nbsp;&nbsp;&nbsp; That a viable and scalable implementation of this can be developed
is an open<br>
&nbsp;&nbsp;&nbsp;&nbsp; question---currently <span class="moz-smiley-s3"><span> ;-) </span></span><br>
<br>
</body>
</html>

--------------080409020004090303040902--

