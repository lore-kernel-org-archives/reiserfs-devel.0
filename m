From: Hans Reiser <reiser@namesys.com>
Subject: Re: viewprinting: what format should views be stored in?
Date: Wed, 18 Aug 2004 12:34:04 -0700
Message-ID: <4123AF2C.2060500@namesys.com>
References: <20040818075216.B920D15DBC@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20385-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040818075216.B920D15DBC@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: gbeshers@comcast.net, reiserfs-list@namesys.com

David Dabbs wrote:

>Hans and George,
>
>I've been lurking at the edge of this discussion and have not chimed in 
>mostly because I only have a dial-up connection here at my in-laws
>house (and I'm suposed to be on vacation). Since there was a request for 
>arguments for or against Hans's preferred approach, I thought I'd add 
>my $0.02.
>
>In order to put everything into perspective as well as to provide context
>for some questions, I attempted to distill concrete items or decisions from 
>the last several days' exchanges.
>
>As to arguments For or Against; 
>For
>If you only have three months to prove a concept and obtain continued 
>funding, then I agree with Hans's preference for reusing as much 
>existing work as possible. Adapting Hans's statement regarding 
>[in]compatibility, "...if we [write new code] we should do 
>so only if it is sufficiently worthwhile." 
>
>Against
>I can think of none at this point, given my understanding of 
>the features. 
>
>
>Project
>----------------------------------------------------------------------
>Demonstrate process-oriented filesystem viewprinting that scales to 
>filesystems (and masks) containing millions of files. Provide 
>exec-time mask application as well as tools for automating mask 
>creation and maintenance.
>
>
>Definitions
>---------------------------------------------------------------------
>Process-Oriented
>Specifications of filesystem object visibility are applied to processes 
>regardless of the effective user rights with which the process runs.
>
>Mask (or viewprint)
>A specification as to which files are visible to process[es] 
>"running under" the mask. The [file] security underlying the mask
>remains a user/object/permission mapping. If a mask a) does not 
>include a file or b) explicitly filters out acess, the file operation ceases
>and an error is returned. If the file upon which the process wants to 
>operate is not filtered by the mask, then the operation request is 
>passed on to the underlying filesystem. There, the requested file 
>a) might not exist, b) might exist but not be visible/readable by the 
>user running the process, etc. 
>
>Fall-Through Point
>The point during some file operation at which it is determined that the 
>file is not filtered by the mask. The request [for operation X on the file]
>is passed on to the VFS/underlying filesystem. 
>
>
>
>Features & Performance (Qualitative/Soft)
>----------------------------------------------------------------------
>It is...our task to ensure that creating a correct mask is well automated 
>and easy.
>
>We do process oriented security, and that is all for now. The underlying 
>[file] security remains a user/object/permission mapping.
>
>We need to be able to determine in insignificant time whether a file 
>"passes through" a mask consisting of a million filenames.
>
>..if we must break an existing program we should do so only with care 
>and only if it is sufficiently worthwhile to do so. 
>
>
>Features & Performance (Quantitative/Hard)
>----------------------------------------------------------------------
>Masks 
>- must support dirname/* 
>- do not [yet] need to support dirname/foo.*
>- should not allow symbolic link traversal unless the file pointed to 
>   is within the mask.
>  
>

>- (by extension) should not allow hard links unless the file 
>  pointed to is within the mask.
>  
>
^ should not allow hard links^ should not allow hard link to be created.

>
>
>Hans's Initial Considerations & Design Proposal
>----------------------------------------------------------------------
>[The solution] must be treelike in its performance scalability.
>
>It is very important that we have something simple that reuses code for 
>this purpose. The big issue to decide at the start is, should a view 
>specification be implemented with a format that is as if it is a 
>subdirectory of the masked executable, and which we then take the 
>filenames used by the executable and traverse the subdirectory as 
>though it was root, and if we reach a valid fall through point, then 
>allow [us to] traverse from the real filesystem root, and if not, 
>we issue a suitable error.
>
>This would let us use all the existing semantic tree traversal code.
>It would, however, require us to add such plugins as "fall through points", 
>and "prints", etc.  I think the answer is yes, we want to do it this way.  
>Please come up with arguments for and against it.
>
>
>
>Questions
>----------------------------------------------------------------------
>Handwaving for a moment over view creation and storage particulars, it
>is pretty clear that this new security feature will rely upon reiser4 
>for masking. Does this mean that one will only be able to mask a 
>reiser4 filesystem
>
yes

>, or will any VFS fs be "maskable?"
>  
>
Filesystems without support for plugins are a horror....;-)

The other filesystems will be encouraged to adopt the reiser4 plugin 
infrastructure.....

>All file types and access methods will be supported, yes? 
>(mmap, AIO, DIRECT, pipes, hard/sym links, etc.)
>  
>
Yes.

>In the original proposal posted to the list Hans (I think) referred to 
>viewprinting as "chroot on steroids." Let's assume that the mask 
>creation tools deliver on making viewprint creation and maintainance 
>very easy/painless for admins. In what way will viewprinting be more 
>secure than chroot? 
>  
>
It won't.  Security research is the art of security/effort.  Maximizing 
just security is a solved problem, and is called a turned off computer 
in a good safe.

Viewprinting is less work than chroot.

>If I understand the ways admins use chroot, or would like to use it, 
>then should the design include "stackable" or "inheritable" masks? 
>  
>
Sure, but not in 1.0.  Good point though.

>This is not unlike stackable filesystems or filter pipelines. If, 
>for instance, most processes need to see /usr/local/lib/* and 
>/usr/local/bin/*, then this spec is in a 'base' mask and the mask 
>for /usr/local/bin/fooprocess would inhert from and add to this 
>base specification.
>  
>
I dislike your example but agree with your argument.

>Early on in the conversation, there was discussion about 
>"permissible functionality." At a minimum, a mask, true to its name, 
>will effect filesystem object _visibility_. It was not completely 
>clear whether the mask will be proscriptive viz operations. IOW, will 
>the mask say that fooprocess "is not permitted to [attempt to] RWX 
>object bar?" I believe this is not something masks will do, but I 
>wanted clarification.
>  
>
I don't know why I don't understand your question, but I don't.....;-)

>Hans, in your preferred approach you referred to "a format that 
>is as if it is a subdirectory of the masked executable." Did you have
>in mind checking for something like /usr/bin/fooprocess/metas/mask 
>when exec() loads the exe,
>
yes

> and if this exists then the files rooted 
>in this directory would be set as the process's root filesystem?
>  
>
your statement is imprecise.

The mask will be checked first, and then iff it falls through we do a 
normal filesystem traversal.

>Are masks capable of explicit exclusion as well as inclusion?
>  
>
Not in version 1.0.

>If the answer is 'Yes,' then what are your thoughts as to how this 
>might be accommodated when your main tool is reiser4's semantic 
>tree layer? Inclusion would be straightforward -- if the directory 
>exists or the name exists within the directory then fall through. 
>But exclusion?
>
True, it might be an issue.  I must think about it.

> If you are limited to the semantic layer, then there's 
>no stat node with which to play tricks. 
>
>I wonder if it would be feasible if masks only specified 
>exclusions? If, for instance, the mask wanted to exclude /foo/*, 
>then the directory foo would exist (in the mask semantic tree). 
>To exclude /etc/passwd, passwd would exist in the directory /etc. 
>Since you're already going to need to preempt dcache searches 
>(aren't you?)
>
Sigh, yes, or we need to use dcache for the mask.

> you can insert a search of the mask tree. If the 
>search fails, then it is not excluded and the request falls through 
>to normal VFS handling. In the /etc/passwd case above, it would find 
>/etc/passwd and so the file is excluded. Processing would stop there, returning some error. How does this sound? I need to sleep on this, 
>because it is very late here.
>  
>
I don't quite understand this paragraph above.

>
>David
>
>
>  
>

