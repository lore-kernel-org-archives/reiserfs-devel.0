From: Hans Reiser <reiser@namesys.com>
Subject: Re: viewprinting: what format should views be stored in?
Date: Sun, 15 Aug 2004 19:02:56 -0700
Message-ID: <412015D0.8030806@namesys.com>
References: <411FFCB4.2060400@namesys.com> <41201252.1080803@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20317-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41201252.1080803@comcast.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: George Beshers <gbeshers@comcast.net>
Cc: ReiserFS List <reiserfs-list@namesys.com>

George Beshers wrote:

>
> First a little (*/tentatively/*) suggested terminology---translation 
> of (/tentatively/) I stand
> behind it until I begin to suspect I've made a mistake and then I 
> change sides ;-) :
>
> 1) A *mask *consists of a set of *prescriptions *(trying to avoid 
> rule) which defines a
>    / subset/ of permissible functionality for a file system.
>
> 2) The *permissible functionality *of a file system is roughly 
> speaking, the ACLs
>     for all the objects in the file system.
>
>     Actually, I think this is a good place to start, because the type 
> "permissible
>     functionality" is in fact what the mask is applied to and what is 
> returned.
>    Grant you evaluation is done lazily as the execution of an 
> application requires it.
>
Yes.

> 3)  A user and group instantiated mask forms an *operational set of 
> functionality*.
>
>      What is important here is to recognize that a given executable 
> may have
>      different apparent functionality based on who is running it.

I think not in our particular niche.  We do process oriented security, 
and that is all for now.  Later we can make it more complex.

>
>      To make this concept clearer, consider the possibility that group 
> write access
>      to a file might be elided (masked away) by the some prescription 
> for a user
>      who otherwise might have add access---but the user's privileges 
> are limited
>      by the executable.
>
>
>
> Hans Reiser wrote:
>
>> It is very important that we have something simple that reuses code 
>> for this purpose, and it also needs to be scalable.  That is, we need 
>> to be able to determine in insignificant time whether a file passes 
>> through a mask consisting of a million files.
>
> A million files or a million rules

filenames actually.

>   A single rule may give access to a million files and
>     require only constant time to evaluate.
>
>> One approach would be to use a format similar to that for chroot, 
>> that is, to keep the format we use for directory trees now, and use 
>> it for storing the mask.  This raises the question: how would the 
>> format for the mask differ from that of the underlying filesystem.
>>
>> Another approach is to use stem compressed names, or some other 
>> unique within the fs format for the mask.
>
> Can you elaborate on this for a newbie

fired
fireman
fireplace
get stored as
fired
!4man
!4place
if we use classic stem compression, if we use a tree that branches where 
the names diverge (I forget, is that a radix tree or?) then we have 
another structure.

>>
>> We need to be able to support specifying a mask that allows any file 
>> within a given directory to be visible.  That is, we need to support 
>> dirname/* but we don't yet need to support dirname/foo.*
>
> NB.  Hans and I had discussed limiting access to 'hidden files' 
> informally:  '..' in particular needs some
> special attention although it would be best not to have a special case 
> if we can avoid it.

We can treat .. the same as we treat symboplic links.

>>
>> We probably don't want to allow symbolic links to be followed unless 
>> where they point to is within the mask.
>
> Agreed.
>
>> I want minimal code but I want it to be treelike in its performance 
>> scalability.
>>
>> Ideas?
>
> Well, for the moment only more questions:
>
> Suppose we have a file system and a mask.  If we were to create a 
> chroot by copying just
> the file system 

semantic tree (not files, just filenames)

> accessible through the mask and run the application in that environment
> would the semantics of running the application on the original file 
> system with the mask
> by equivalent.  By equivalent I mean no observable difference in the 
> instructions executed
> at the user level or the output generated.

No, because new files might be made visible through the mask without the 
new file creator even being aware that there was a mask.

>
> Does the question make sense?
>

