From: "Steve Pratt" <slpratt@us.ibm.com>
Subject: Re: EVMS Reiser FSIM
Date: Fri, 31 May 2002 12:40:19 -0500
Message-ID: <OF9CB2A45A.30F7F73A-ON85256BCA.005DD6AD@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10473-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Clausen <clausen@gnu.org>
Cc: Yury Umanets <umka@namesys.com>, reiserfs-list <reiserfs-list@namesys.com>


Andrew Clausen wrote:

>On Thu, May 30, 2002 at 02:02:06PM -0500, Steve Pratt wrote:
>> >Me too.  Just the ext2 maintainer doesn't like this approach, so
>> >I'm going to need to push a bit harder (and I don't have time now)
>>
>> That is the major benefit of current EVMS implementation, I don't need
the
>> FS developers to actually do anything.

>Well, I prefer to leave a system broken than to patch over it.
>Leaving it broken encourages someone to fix it properly.  (And also,
>saves me time from doing work that won't be used long-term)

>I doubt a philosophy like that would go down to well in IBM, but
>I think it's one reason for GNU/Linux's success.  (It is a good
>philosophy if you don't have many resources... but IBM has different
>problems... like solving real-world problems to get $$$ ;)

Correct.

>> >I believe his point was: it would be possible to write non-GPL FSIMs.
>> >(The GPL is probably unenforceable for "plugins")
>>
>> Yes, this would allow a FSIM plugin(GPL or not) to invoke non-GPL
>> utilities.

>Yura and rms weren't too excited about this possibility.  I'm not
>either, but I think the system architecture is more important than
>the licence in this case (the practical difference the licence thing
>would make is sooo small...)

I agree that system architecture should be the driving force.  That said,
how I or anyone else codes a particular FSIM does not mean that someone
else can't write one differently (read still using fork/exec) and get
around the GPL.

>> >The obvious long-term solution is to get jfs people to make a decent
>> >library.  fork/pipe is Wrong.
>>
>> I agree that libraries have advantages.  When available, we can always
>> changes the FSIMs.  I could probably make all the necessary the changes
in
>> a couple of days.

>Right.

>> To have multiple components and libraries interact safely and correctly
>> there must be a structure for each to adhere to. As you point out, one
did
>> not exist in Linux.  EVMS created one.  Is it perfect, absolutely not,
but
>> I think it is pretty good.

>Well, it would be nice if it was more componentized, with less
>cross-dependencies, etc.  More minimalist.

Ideally yes, I just don't think that it is possible (reasonable).

>> For example we added a S/390 segment manager
>> and a GPT segment manager without having to change a single API or line
of
>> common code.  Must be pretty modular if we can accomplish that.

>No, it just means your abstraction for seg managers is, actually,
abstract.
>(libparted has the same properties... except perhaps for flags)
>I think it's good that you have those properties, but you lack some
others:
>(1) portability
>(2) you didn't reuse linux-lvm code... which is a result of (1), right?
>(The engine wants to talk to the EVMS engine, not the linux-lvm kernel
>implementation.  This enforces lots of coupling, making reuse of linux-lvm
>too hard)
>(3) it seems complicated.  Lots of ideas that look similar aren't
>actually grouped together to share code.  (FSIMs and plugins share
>a lot, for example)

1.portable to what?

2. No, not a result of 1.  A result of we didn't like the code. (and
apparently neither did the LVM guys since they re-wrote it as well in
LVM2).  We did re-use the bulk of MD so it is not that we couldn't have.

Coupling is not always a bad thing.  It allows us to offer greater
functionality to the user.  fisk, lvm and MD all have the ability to
destroy each others data without knowing it because that are not coupled.
In EVMS we can prevent these types of interaction problems.

3. Yes, it is complicated, that is why no one has attempted this before.

As for sharing of code, you obviously haven't looked at any of it.  Just
because an FSIM and a Segment manager have a entry point with a similar
name, doesn't mean they do the same thing.  I challenge you to go into an
FSIM and find code that is duplicated in any non-FSIM plugin.  FSIMs do
filesystems, other plugins do volumes, not the same thing.  Why does parted
have ped_device_open and ped_file_system_open? Why not 1 API, they both do
open, must be duplication of code.


><> 2 weeks
>> ago the support for Resiser was just an entry in a todo list, now it is
>> done, not bad since I spent less than half my time on it.

>I'm sure you could use libreiserfs in the same amount of time,
>and make something that integrates with EVMS much better ;)

True.

>> We will continue to look for ways to improve EVMS, but I think the time
has
>> passed for major architecture changes.

>Well, I think the above are major changes, and useful to make.
>That said, 'major' doesn't mean time-consuming.  It just means
>lots of change.  (But, in my experience, just lots of cut&paste)

Other than having FSIMs use libraries, I'm not sure what changes you are
refering to.

>I think it's adventurous to claim that any piece of software has
>"passed the time for major architecture changes".  Name one project
>that declared that 5 years ago, and hasn't made such changes.
>Bonus points if they were the first to implement that class of
>system.  (EVMS is basically in that boat!)

Point taken.  Time will tell.

Steve



