From: "Steve Pratt" <slpratt@us.ibm.com>
Subject: Re: EVMS Reiser FSIM
Date: Thu, 30 May 2002 14:02:06 -0500
Message-ID: <OFE24E464F.6A5B179D-ON85256BC9.005EDDDD@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10458-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Clausen <clausen@gnu.org>
Cc: Yury Umanets <umka@namesys.com>, reiserfs-list <reiserfs-list@namesys.com>


Andrew Clausen wrote:
>On Wed, May 29, 2002 at 11:28:38AM -0500, Steve Pratt wrote:
>> Inadequate because it offers NO parameter passing to the file system
code.
>> How would you ever specify and external journal location or a journal
size,
>> Parted does not have the API support for this and I don't know when it
>> will.

>Agreed.  You could have sent a patch, though.

Changing the APIs seems a little extreme for a patch, Plus there is that
time thing. :-)

>> Unstable because each of the file system utilities may or may not be a
>> re-implementation of the utilities written by the file system
developers.

>s/may or may not/may not/ ?

>Anyway, I agree this is a problem.

Agreement is good.

>> I know this to be true for the ext2 code in Parted, which has segfaulted
on
>> me more than once while performing an expand.

>I don't recall you sending me a bug report.

Yes, my bad.  Was in the middle of other things when it happened and don't
have a that configuration any more.

>> I want to use the code approved by the owners of the file system.

>Me too.  Just the ext2 maintainer doesn't like this approach, so
>I'm going to need to push a bit harder (and I don't have time now)

That is the major benefit of current EVMS implementation, I don't need the
FS developers to actually do anything.

>> As I have stated previously, if the ReiserFS utilities package start
>> shipping this as part of their standard tool set, then I would consider
>> using it.  In fact if the file system community would come up with a
>> standard library interface I would be even happier.

>Me too.  I suspect that's very difficult, though.

Well, we can always hope.

>> >BTW, I have almost done smart resizing (from partition start) in
>> >libreiserfs. But you can't using the libraries of third pesons, so you
>> >will haven't smart resizing and other features in your FSIM :))
>>
>> Do you mean moving the start of the partition?  Not really interested.
But
>> I am confused about your comment of not being able to use libraries of
>> third persons.  EVMS is GPL and could link to any GPL code it wants.  If
>> the libreiserfs is the *right* set of code to use, than I will use it.

>I believe his point was: it would be possible to write non-GPL FSIMs.
>(The GPL is probably unenforceable for "plugins")

Yes, this would allow a FSIM plugin(GPL or not) to invoke non-GPL
utilities.

>> >Yet another issue. One man almost done JFS support for GNU Parted. Are
>> >you going to add it to EVMS too? I think yes. And probably you will do
>> >it in manner like ReiserFS (forking and piping).
>>
>> Already done.  And I have the added benefit of picking up fixes in
>> utilities whenever the file system developers make them.

>The obvious long-term solution is to get jfs people to make a decent
>library.  fork/pipe is Wrong.

I agree that libraries have advantages.  When available, we can always
changes the FSIMs.  I could probably make all the necessary the changes in
a couple of days.


>> Is this person
>> monitoring the JFS CVS tree to ensure that he does not miss an important
>> fix that might go into JFS?  Does he have the external journal support
in
>> the library yet?  Oh wait, there is no way to pass parameters to
filesystem
>> code in Parted, so he can't have support for it.

>I have encouraged him to try to create a libjfs (that would be maintained
>by the jfs community).  I don't know what he's doing with this.

Again, when it is available.....

>In any case, I'm not advocating (and haven't for several years) that
>libparted should implement file system functionality.

Agree.

>I personally think libparted should be split into:

 >(1) a low-level "device" system library.  This should include
 >identification facilities and error handling IMHO.
 >(2) a file system library
 >(3) a partition library

>And a (meta) LVM library could be added.

>I doubt I'll have time to see all of this through, but I'm certainly
>encouraging people who are working on parted FS support to structure
>their code to make (2) easier.  BTW: I don't care who writes each
>of these components, as long as they are in a highly modular/reusable
form.
>However, EVMS's infrastructure is very coupled together... for example,
>implementations are tied to a particular module structure, there is
>one libevms that contains all the infrastructure, and the userland
>is coupled to evms's linux implementation.  So far, EVMS isn't
>the solution... although perhaps it shouldn't be... perhaps it should
>just use the solution.  Before such a solution exists, I think the EVMS
>approach is reasonable... but I would be happy if EVMS people strived
>for a more modular architecture.

>Just to repeat: I think libparted is just as bad, but you seem
>to have the resources to solve the above problems... why don't you?

To have multiple components and libraries interact safely and correctly
there must be a structure for each to adhere to. As you point out, one did
not exist in Linux.  EVMS created one.  Is it perfect, absolutely not, but
I think it is pretty good.  For example we added a S/390 segment manager
and a GPT segment manager without having to change a single API or line of
common code.  Must be pretty modular if we can accomplish that.  2 weeks
ago the support for Resiser was just an entry in a todo list, now it is
done, not bad since I spent less than half my time on it.

We will continue to look for ways to improve EVMS, but I think the time has
passed for major architecture changes.

Steve




