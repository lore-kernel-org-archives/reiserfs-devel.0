From: David Greaves <david@dgreaves.com>
Subject: Re: viewprinting: what format should views be stored in?
Date: Thu, 19 Aug 2004 18:31:52 +0100
Message-ID: <4124E408.3090405@dgreaves.com>
References: <20040819074027.8429715D94@mail03.powweb.com> <41248D43.3040905@dgreaves.com> <4124D09A.1060208@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20407-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4124D09A.1060208@comcast.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: George Beshers <gbeshers@comcast.net>
Cc: reiserfs-list@namesys.com, david@dabbs.net, reiser@namesys.com

George Beshers wrote:

>> This doesn't sound right.
>> (Basically I suspect there has been confusion over 'visibilty' and 
>> file attribute masking)
>>
>> When did masks specify visibility of files? According to Hans :
>
>
> This is clearcase functionality so everyone assumed it from the original
> posting http://www.namesys.com/blackbox_security.html

yes.

It was Hans' subsequent: "Hmm.  Yes, views should allow masking 
permissions. "
which implies that requirements are that the mask doesn't just have a 
binary value:
not there / see filesystem
but actually each masklet contains a bitmask (or similar) to be ANDed 
with the attr from the fs *and* a there/not-there bit.

Trying for clarity in the role of the mask interpreter layer.
Does the mask act as a gatekeeper - passing things through to the fs 
(possibly simpler to implement but _far_ less functional)
Or (more likely) does the mask layer take over the role of authoriser(?) 
in which case it delegates to the fs for the fs authorisation (attr) and 
then bitwise ANDs that with it's own masklet (maybe shortcutting if the 
mask determines the file is invisible)

I think we all agree on the latter but I thought it best to be clear.

>> remind me - what is the mask tied to? UID/GID, EUID, PID, PGID? 
>> filesystem?
>> Hans actually says it's derived from the executable.
>> What if it changes between two processes starting?
>> Does the running processes mask change? (cf chmod a file - seems 
>> reasonable but...)
>> I'd think it needs to be pretty atomic...
>> In fact, maybe changing masks on a running (mounted?) system is a 
>> potential security hole and forbidden?
>> I think I could think of race examples.
>
>
> I am disinclined to tackle changing masks on the fly until I have a 
> compelling story
> to justify the work.

ok - agreed.
Also here's a possible issue:
masklet is dirname/*
open dirname for reading
replace masklet with multiple masklets dirname/a;dirname/b;dirname/c;
someone creates file dirname/d
Can I see it from a read of still open dirname/ ?
I shouldn't be able to.

This is security stuff so I'd say that masks are set at mount-time and 
imutable thereafter?

(errm, sorry, I read your email and wrote this and then noticed it was 
the *next*section you asked for an example - anyway I'll leave this one in)


>> Obviously creating a hardlink _can_ circumvent semantically specified 
>> security.
>> But shouldn't that just be a masklet attribute? see below (end)
>
>
> Do you have an example in mind?
> I share your belief but in a few minutes of thinking about it didn't
> come up with a plausible example.

links are based on the filename
changing the filename changes the masklet applied.
maskspec:
/var/logs/* : readonly
/var/tmp/scratch/ : full access

a file in /var/log has 666 (by mistake)
ln it to /var/tmp/scratch and you can now edit it - breaking the mask.
(so, to be clear, I think they should  be allowed but only when the 
maskspec/interpreter allows them to be filtered - ie phase 1 disallows 
hardlinks, a future phase could handle them properly)

>>>> Hans, in your preferred approach you referred to "a format that is 
>>>> as if it is a subdirectory of the masked executable." Did you have
>>>> in mind checking for something like /usr/bin/fooprocess/metas/mask 
>>>> when exec() loads the exe,
>>>>
>>>> yes
>>>>
>>>> and if this exists then the files rooted in this directory would be 
>>>> set as the process's root filesystem?
>>>>
>>>> Your statement is imprecise. The mask will be checked first, and 
>>>> then iff it falls through we do a normal filesystem traversal.
>>>>   
>>>
>>>
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
>> The email subject becomes:
>> Re: viewprinting: what format should maskfs use?
>> The answer of course is something very similar to reiserfs.
>>
>> (BTW perhaps, eventually, /proc/<pid>/maskfs is a better place - and 
>> the mask checking moves to vfs - all of a sudden it's not reiser 
>> specific - although maskfs is reiserfs code)
>
>
> Hans and I discussed this briefly.  For proof-of-concept work we 
> agreed that having as much as possible
> in the file system layer was the way to go.  If it proves to be viable 
> then we can try to convince the rest
> of the community.

Sorry, the /proc bit was very much an aside.

What I was really interested in was the parallel/concurrent traversing 
of the fs tree and the maskfs idea.
ie check / in mask then fs, check dir1 in mask then fs, check dir2 in 
mask then fs, finally check filename in mask then fs (rinse and repeat 
for symlinks)
This would increase the directory traversal time but it would be a 
constant factor.

I was also interested in what would essentially be a read only reiser 
filesystem with only directories.
One issue is having directory entries that match dirname/**
I wondered about storing the masks in the directories in the 
inode/acl/attr space.
The issue is then mkfs'ing a maskfs from a set of masklets (rules?, 
presentation mask?)

>> Don't you always fall through - but sometimes you 'hit' a masklet and 
>> sometimes you 'miss'
>
>
> "Fall through" is to the original filesystem below the mask.  You 
> don't fall through if the mask
> rejects the operation.

Hmm I think this is a speech vs email kind of misunderstanding. I think 
we agree.
I'd argue that you always need the mask and the fs to perform an AND.
in the case where the mask says 'invisible' (by specification or 
implicitly) then there is an optimisation where you don't need to check 
the fs - but this isn't very interesting :)
Most of the time I'd expect to be doing attr ANDs
(unless the app was actually probing about the fs where it has no right to!)
In fact an implicit fallthrough is worthy of reporting.

At one point I assumed there is no difference between file-not-found and 
invisible.
There isn't to the app. But you musn't forget monitoring. If an attempt 
is made to access an invisible file (whether or not it exists), this 
should go to a security log.

Also someone asked if you could tell you were being masked. The answer 
may be yes if you look at indirects such as time taken to return a 
file-not-found or could see a log.

>
>>
>>>>  Hmmm, we need to accumulate a set of permissions that apply to 
>>>> something that are specific to how we got there.
>>>>
>> In fs traversal the permision at a point in traversal (ie a directory 
>> on the way) doesn't affect the permission of the object when the fs 
>> has been traversed except insofar as it may not be reachable. So why 
>> do you need to do this?
>> (I agree you need to check each traversal point against the mask)
>>
>> As I said above: This mask is interesting:
>> /etc : doesn't exist
>> /etc/config.file : r only
>>
>> it will report file not found due to a traversal failure - isn't that 
>> what you'd want?
>
>
> I suppose technically it is an optimization: but it makes sense that 
> for some process
> nothing in /etc is writable or nothing in /home/confidential is 
> available at all.
>
> I tend to think that in your example /etc/config.file is a useless 
> masklet, but perhaps
> if you change the order then the only file you see in /etc is 
> config.file.

yes indeed. It was supposed to be 'useless'
It was about showing the 'accumulation of permissions specific to how we 
got there'

>
> At the moment I need time to think about the mask interpreter layer 
> and put
> some "stakes in the ground" about what is actually practical to 
> implement.

see above about maskfs :)
How about mounting maskfs's?
mkfs -tmaskfs -ospec=/etc/presentation_mask.spec /etc/maskfs_file
loopback mount the /etc/maskfs_file to the appropriate location
Hijack the reiserfs(?) access/traversal functions (can you - I dunno!) 
check for jid and if it exists then use it to determine where to look 
for the maskfs /. Then use the parallel traversal technique to retrieve 
a masklet and overlay it on the attr.


>> If you have a maskfs then if you traverse it for a filename and get a 
>> hit then the results of the hit are the masklet to be applied.
>>
>> If you get a miss then implicit exclude states:
>> * doesn't exist (shortcut the call - file not found)
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
>
>
> For proof of concept the first 2 suffice.

That's why they were the first two :) I prioritised them at first but 
then thought I'd leave that 'til someone at the code said what was easy.

> After that we are likely to be driven by practical considerations 
> (e.g., what gets funded :-) )

yep - but I thought it worth identifying these for design purposes - and 
to maybe show how to tackle the other issues (acl, chmod, hardlinks, 
suid, umask etc)

Still worth prodding to see where the right place for such a thing is - 
it may be vfs - and designing in such a way as to make migration to 
there work in the future.

David
PS can I offer 'mask specification' (shortened to maskspec above) 
instead of 'presentation mask' for the glossary.
