From: "Steve Pratt" <slpratt@us.ibm.com>
Subject: Re: EVMS Reiser FSIM
Date: Mon, 3 Jun 2002 18:34:03 -0500
Message-ID: <OF65D6803B.7198C562-ON85256BCD.007DD2AA@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10492-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Clausen <clausen@gnu.org>
Cc: Yury Umanets <umka@namesys.com>, reiserfs-list <reiserfs-list@namesys.com>


Andrew Clausen wrote:
>On Fri, May 31, 2002 at 12:40:19PM -0500, Steve Pratt wrote:
>> I agree that system architecture should be the driving force.  That
said,
>> how I or anyone else codes a particular FSIM does not mean that someone
>> else can't write one differently (read still using fork/exec) and get
>> around the GPL.

>FSF legal advice disagrees.  I imagine there would be courts that
>rule both ways.

Ok,

>> 1.portable to what?

>Vanilla Linux for a start!  Or Hurd, Windows, whatever...

Vanilla Linux?  Is that some distro from Australia?  Seriously, what do you
think we are coded for?  EVMS compiles on 12 architectures and the patches
we release are for standard kernel.org kernels.  What is the problem?

>> 2. No, not a result of 1.  A result of we didn't like the code. (and
>> apparently neither did the LVM guys since they re-wrote it as well in
>> LVM2).

>Fair enough, but if LVM2 was coming, why not use that?

It wasn't.  LVM2 didn't even start until 6 months after we started coding.

>> We did re-use the bulk of MD so it is not that we couldn't have.

>Ah, cool :)  However, you forked the code in the process.  Don't
>you want the MD community to maintain it?

Yes, we would like that.  However, the current block device request queue
interface did not provide the level of interlock required by EVMS.  I know
you want less interlock, but that just isn't going to happen.

>> Coupling is not always a bad thing.  It allows us to offer greater
>> functionality to the user.  fisk, lvm and MD all have the ability to
>> destroy each others data without knowing it because that are not
coupled.
>> In EVMS we can prevent these types of interaction problems.

>Agreed.  But you want to make coupling as weak as possible... and I
>think it's possible to have very weak coupling.

I think we have done as little coupling as possible without losing
function.  Your milage may vary.

>> 3. Yes, it is complicated, that is why no one has attempted this before.

>Well, libparted is a "first-attempt".  (Also, what you were doing
>in OS/2).

Yes, libparted is definitely more advanced in this than anything else I
have seen in Linux, except EVMS :-).   OS/2 LVM was a learning experience,
enough said.

>> As for sharing of code, you obviously haven't looked at any of it.  Just
>> because an FSIM and a Segment manager have a entry point with a similar
>> name, doesn't mean they do the same thing.  I challenge you to go into
an
>> FSIM and find code that is duplicated in any non-FSIM plugin.  FSIMs do
>> filesystems, other plugins do volumes, not the same thing.  Why does
parted
>> have ped_device_open and ped_file_system_open? Why not 1 API, they both
do
>> open, must be duplication of code.

>ped_device_open() and ped_file_system_open() are different.
>One is opening a volume, the other opening a user of volume(s).
>However, I think ped_disk_open() (disk means "partition table") and
>ped_file_system_open() should be 1 API function.  ped_consumer_open(), or
>something.

>BTW: you wouldn't expect code-inside-an-FSIM to be duplicated in
>a non-FSIM plugin.  I'm talking about FSIM-infrastructure and plugin
>infrastructure code, and high-level code that calls that.  (Eg: UIs)

>I get a headache looking at it, because you do things like:

>int evms_can_shrink(object_handle_t thing) {
 >...
 >translate_handle(thing, &object, &type);
 >...
 >switch (type) {
  >case DISK:
  >case SEGMENT:
  >case REGION:
  >case EVMS_OBJECT:
   >...

  >case VOLUME:
   >...

  >default:
   >...
 >}
>}

>Like, you are sharing a single entry point with lots of different
>types of objects...

I though you were arguing that we should do more of this, make everything
single entrypoint to eliminate duplicate code?

>like, why is a volume different to a segment,
>but a segment is the same as a disk?

Because you can put a filesystem on a disk, so when you shrink a disk (bad
example, how about a segment) you don't have to shrink a filesystem,
because there isn't one, but when you shrink a Volume you might have to
shrink a file system and a segment.

>Why is there a switch at all?

Because volumes (with file systems) are a special case.

>Why do you need translate_handle()?

So we can abstract EVMS Engine internal data structure away from the UIs
over which we (EVMS team) may have no control since we provide an external
API set.  Unlike in libparted we never return internal data structure
pointers to external callers, since you never know what the dumb
programmers might do to your internal data.  Kind of like when I wrote the
FSIM to use libparted and tried to call ped_get_fs_limits (can't recall
exact API) and the API would limit the max fs size to the current size of
the device (which was not what I was looking for) so I modified the device
geometry to say the device was bigger, and this got me past all of the
internal checks.  Poor programming I know, but I was in a hurry and I fixed
it up before actually calling expand.

translate_handle simply get us back to the real internal data that was
protected from the external world, kind of like file descriptors.


>> >Well, I think the above are major changes, and useful to make.
>> >That said, 'major' doesn't mean time-consuming.  It just means
>> >lots of change.  (But, in my experience, just lots of cut&paste)
>>
>> Other than having FSIMs use libraries, I'm not sure what changes you are
>> referring to.

>See above.  (And in several other emails)

Ok.

Perhaps any continuation of this should move over to evms-devel and let the
Reiser guys get back to their file system work.


Steve


